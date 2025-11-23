-- Importing things
import 'CoreLibs/math'
import 'CoreLibs/timer'
import 'CoreLibs/crank'
import 'CoreLibs/object'
import 'CoreLibs/sprites'
import 'CoreLibs/graphics'
import 'CoreLibs/animation'
import 'scenemanager'
import 'packs'
scenemanager = scenemanager()

-- Setting up basic SDK params
local pd <const> = playdate
local gfx <const> = pd.graphics
local smp <const> = pd.sound.sampleplayer
local fle <const> = pd.sound.fileplayer
local text <const> = gfx.getLocalizedText
local random <const> = math.random
local floor <const> = math.floor
local ceil <const> = math.ceil

pd.display.setRefreshRate(30)
gfx.setBackgroundColor(gfx.kColorWhite)
gfx.setLineWidth(2)
gfx.setStrokeLocation(gfx.kStrokeInside)

-- NOTE: add achievements
-- NOTE: daily seeded quik-word?
-- TODO: solver/optimum swaps finder function, that returns a number
-- TODO: submit to catalog

pack = nil
redraw = false

catalog = false
-- NOTE: vvv uncomment vvv
--if pd.metadata.bundleID == 'wtf.rae.labsylle' then
--	catalog = true
--end

bgblocks = {}
bgblock_large = gfx.imagetable.new('images/bgblock_large')
bgblock_small = gfx.imagetable.new('images/bgblock_small')

quikword = pd.timer.new(1, 60000, 60000)
quikword.discardOnCompletion = false

-- Save check
function savecheck()
    save = pd.datastore.read()
    if save == nil then save = {} end

	if save.music == nil then save.music = true end
	if save.sfx == nil then save.sfx = true end

	if save.crank == nil then save.crank = true end

	if save.time == nil then save.time = true end
	if save.menubg == nil then save.menubg = true end
	save.hours = save.hours or 0

	save.quikwordbest = save.quikwordbest or 0

	save.background = save.background or 0
	save.darkmode = save.darkmode or 0

	if save.boldtext == nil then save.boldtext = false end
	if save.autosubmit == nil then save.autosubmit = false end
	if save.showcontrols == nil then save.showcontrols = true end
end

function resetsave(keepoptions, keepquikword)
	newsave = {}

	if keepoptions then
		newsave.music = save.music
		newsave.sfx = save.sfx

		newsave.crank = save.crank

		newsave.time = save.time
		newsave.menubg = save.menubg
		newsave.hours = save.hours

		newsave.background = save.background
		newsave.darkmode = save.darkmode

		newsave.boldtext = save.boldtext
		newsave.autosubmit = save.autosubmit
		newsave.showcontrols = save.showcontrols
	else
		newsave.music = true
		newsave.sfx = true

		newsave.crank = true

		newsave.time = true
		newsave.menubg = true
		newsave.hours = 0

		newsave.background = 0
		newsave.darkmode = 0

		newsave.boldtext = false
		newsave.autosubmit = false
		newsave.showcontrols = true
	end

	if keepquikword then
		newsave.quikwordbest = save.quikwordbest
	else
		newsave.quikwordbest = 0
	end

	save = newsave
	newsave = nil

	newmusic('audio/music/title', true)
	create_bg()
	gfx.sprite.setAlwaysRedraw(true)
	redraw = true
	pd.display.setInverted(isdarkmode())
	assets.discoteca = gfx.font.new(save.boldtext and 'fonts/disco' or 'fonts/discoteca')
end

-- ... now we run that!
savecheck()

local lasthour = pd.getTime().hour

-- When the game closes...
function pd.gameWillTerminate()
	if vars.pack ~= nil and vars.pack ~= 'speed' then
		save[vars.pack.id].puzzle = vars.puzzle
		save[vars.pack.id].puzzleswaps = vars.swaps
		save[vars.pack.id].heldpackswaps = vars.packswaps
		save[vars.pack.id].word = vars.word
		if vars.bombs ~= nil and vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
		end
	end
    pd.datastore.write(save)
end

function pd.deviceWillSleep()
	if vars.pack ~= nil and vars.pack ~= 'speed' then
		save[vars.pack.id].puzzle = vars.puzzle
		save[vars.pack.id].puzzleswaps = vars.swaps
		save[vars.pack.id].heldpackswaps = vars.packswaps
		save[vars.pack.id].word = vars.word
		if vars.bombs ~= nil and vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
		end
	end
    pd.datastore.write(save)
end

-- Setting up music
music = nil

-- Fades the music out, and trashes it when finished. Should be called alongside a scene change, only if the music is expected to change. Delay can set the delay (in seconds) of the fade
function fademusic(delay)
    delay = delay or 400
    if music ~= nil then
        music:setVolume(0, 0, delay/1000, function()
            music:stop()
            music = nil
        end)
    end
end

function stopmusic()
    if music ~= nil then
        music:stop()
        music = nil
    end
end

-- New music track. This should be called in a scene's init, only if there's no track leading into it. File is a path to an audio file in the PDX. Loop, if true, will loop the audio file. Range will set the loop's starting range.
function newmusic(file, loop, range)
    if save.music and music == nil then -- If a music file isn't actively playing...then go ahead and set a new one.
        music = fle.new(file)
        if loop then -- If set to loop, then ... loop it!
            music:setLoopRange(range or 0)
            music:play(0)
        else
            music:play()
            music:setFinishCallback(function()
                music = nil
            end)
        end
    end
end

-- This function returns the inputted number, with the ordinal suffix tacked on at the end (as a string)
function ordinal(num)
	local m10 = num % 10 -- This is the number, modulo'd by 10.
	local m100 = num % 100 -- This is the number, modulo'd by 100.
	if m10 == 1 and m100 ~= 11 then -- If the number ends in 1 but NOT 11...
		return tostring(num) .. getLocalizedText("st") -- add "st" on.
	elseif m10 == 2 and m100 ~= 12 then -- If the number ends in 2 but NOT 12...
		return tostring(num) .. getLocalizedText("nd") -- add "nd" on,
	elseif m10 == 3 and m100 ~= 13 then -- and if the number ends in 3 but NOT 13...
		return tostring(num) .. getLocalizedText("rd") -- add "rd" on.
	else -- If all those checks passed us by,
		return tostring(num) .. getLocalizedText("th") -- then it ends in "th".
	end
end

-- http://lua-users.org/wiki/FormattingNumbers
function commalize(amount)
  	local formatted = amount
  	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
	  		break
	  	end
    end
  	return formatted
end

function create_bg(game)
	if not game and not save.menubg then return end
	for i = 1, 10 do
		local x = random(-20, 420)
		local y = random(-190, -20)
		local fallspeed = random(25, 50)
		local delay = random(500, 9000)
		local rotspeed = random()
		local size
		if i <= 5 then
			size = 'small'
		else
			size = 'large'
		end
		table.insert(bgblocks, {x = x, y = y, fallspeed = fallspeed, size = size, rotation = 1, rotspeed = rotspeed})
	end
end

function draw_bg(game)
	if bgblocks[1] == nil or (not game and not save.menubg) then return end
	for i = 1, 10 do
		bgblocks[i].y += (bgblocks[i].fallspeed / 20)
		if bgblocks[i].y >= 260 then
			bgblocks[i].y = -40
		end
		bgblocks[i].rotation += bgblocks[i].rotspeed
		if bgblocks[i].rotation >= 360 then
			bgblocks[i].rotation = 1
		end
		_G['bgblock_' .. bgblocks[i].size][math.floor(bgblocks[i].rotation)]:draw(bgblocks[i].x, bgblocks[i].y)
	end
	gfx.setColor(gfx.kColorWhite)
	if game then
		gfx.setDitherPattern(0.25, gfx.image.kDitherTypeBayer2x2)
	else
		gfx.setDitherPattern(0.5, gfx.image.kDitherTypeBayer2x2)
	end
	gfx.fillRect(0, 0, 400, 240)
	gfx.setColor(gfx.kColorBlack)
end

function remove_bg()
	if bgblocks ~= nil then
		for i = 1, #bgblocks do
			bgblocks[i] = nil
		end
	end
	bgblocks = {}
end

function isdarkmode()
	local hour = pd.getTime().hour
	if save.darkmode == 0 then
		return false
	elseif save.darkmode == 1 then
		return true
	elseif save.darkmode == 2 and not (hour >= 6 and hour <= 18) then
		return true
	else
		return false
	end
end

pd.display.setInverted(isdarkmode())

function playsound(sound)
	if save.sfx then
		sound:stop()
		sound:play()
	end
end

-- Create a pool of up to five sound effects, randomly playing one of 'em. Import PD sound objects
function randomizesfx(sfx1, sfx2, sfx3, sfx4, sfx5, rate)
	if save.sfx then
		local sfc = 0
		if sfx1 ~= nil then sfc += 1 end
		if sfx2 ~= nil then sfc += 1 end
		if sfx3 ~= nil then sfc += 1 end
		if sfx4 ~= nil then sfc += 1 end
		if sfx5 ~= nil then sfc += 1 end
		local rand = math.random(1, sfc)
		if rand == 1 then
			sfx1:setRate(rate or 1)
			playsound(sfx1)
		elseif rand == 2 then
			sfx2:setRate(rate or 1)
			playsound(sfx2)
		elseif rand == 3 then
			sfx3:setRate(rate or 1)
			playsound(sfx3)
		elseif rand == 4 then
			sfx4:setRate(rate or 1)
			playsound(sfx4)
		elseif rand == 5 then
			sfx5:setRate(rate or 1)
			playsound(sfx5)
		end
	else
		return
	end
end

-- Shuffly code from https://gist.github.com/Uradamus/10323382
function shuffle(tbl)
  	for i = #tbl, 2, -1 do
		local j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
    end
  	return tbl
end

function is24hourtime()
	if save.hours == 0 then
		return pd.shouldDisplay24HourTime()
	elseif save.hours == 1 then
		return false
	elseif save.hours == 2 then
		return true
	end
end

function pd.timer:resetnew(duration, startValue, endValue, easingFunction)
    self.duration = duration
    if startValue ~= nil then
        self._startValue = startValue
        self.originalValues.startValue = startValue
        self._endValue = endValue or 0
        self.originalValues.endValue = endValue or 0
        self._easingFunction = easingFunction or pd.easingFunctions.linear
        self.originalValues.easingFunction = easingFunction or pd.easingFunctions.linear
        self._currentTime = 0
        self.value = self._startValue
    end
    self._lastTime = nil
    self.active = true
    self.hasReversed = false
    self.reverses = false
    self.repeats = false
    self.remainingDelay = self.delay
    self._calledOnRepeat = nil
    self.discardOnCompletion = false
    self.paused = false
    self.timerEndedCallback = self.timerEndedCallback
end

import 'title'
scenemanager:switchscene(title, true)

function pd.update()
    -- Catch-all stuff ...
    gfx.sprite.update()
    pd.timer.updateTimers()

	-- Automatic dark mode
	local hour = pd.getTime().hour
	if save.darkmode == 2 then
		if lasthour < 18 and hour >= 18 then
			pd.display.setInverted(true)
			lasthour = hour
		elseif lasthour < 6 and hour >= 6 then
			pd.display.setInverted(false)
			lasthour = hour
		end
	else
		if lasthour ~= hour then
			lasthour = hour
		end
	end
end