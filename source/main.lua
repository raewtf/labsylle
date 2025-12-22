-- NOTE: solver/optimum swaps finder function, that returns a number
-- TODO: randomization that remains consistent between love/peedee
-- TODO: optimize a biiit on peedee

-- Build target. 'peedee' or 'love'
platform = 'love'
local fps = 30

local pd
local gfx
local black
local white
local gamepad
local scale
local fullscreen
local disco
local center

music = nil
volume = 1
quit = 0
catalog = false

local random = math.random
local floor = math.floor
local ceil = math.ceil

if platform == 'peedee' then
	import 'CoreLibs/math'
	import 'CoreLibs/timer'
	import 'CoreLibs/crank'
	import 'CoreLibs/object'
	import 'CoreLibs/sprites'
	import 'CoreLibs/graphics'
	import 'CoreLibs/animation'
	import 'wrappers_peedee'

	import 'scenemanager'
	scenemanager = scenemanager()

	import 'packs' -- Puzzle paks

	import 'title'

	pd = playdate
	gfx = pd.graphics
	black = gfx.kColorBlack
	white = gfx.kColorWhite

	version = pd.metadata.version

	pd.display.setRefreshRate(fps)
	gfx.setBackgroundColor(gfx.kColorWhite)
	gfx.setStrokeLocation(gfx.kStrokeInside)

	if pd.metadata.bundleID == 'wtf.rae.labsylle' then
		catalog = true
	end
elseif platform == 'love' then
	json = require 'libraries/json'
	timer = require 'libraries/timer'
	easings = require 'libraries/easing'
	gamestate = require 'libraries/gamestate'
	require 'wrappers_love'

	scenemanager = require 'scenemanager'

	packs, bonus, quikword = require 'packs' ()

	title = require 'title'

	gfx = love.graphics
	black = love.math.colorFromBytes(0, 0, 0, 1)
	white = love.math.colorFromBytes(1, 1, 1, 1)
	fullscreen = false

	version = '1.0.0'

	gfx.setLineStyle('rough')
	gfx.setLineJoin('miter')
	gfx.setDefaultFilter('nearest', 'nearest')
	love.keyboard.setKeyRepeat(false)

	icon = love.image.newImageData('images/system/icon.png')
	disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-')
	center = 'center'
end

pack = nil
redraw = false

-- loading images for scene transitions
loadingimages = {
	loading4 = newimage('images/loading/loading4'),
	loading3 = newimage('images/loading/loading3'),
	loading2 = newimage('images/loading/loading2'),
	loading1 = newimage('images/loading/loading1'),
	loading0 = newimage('images/loading/loading0'),
}

gfx.setLineWidth(2)

bgblocks = {}
bgblock_large = newimagetable('bgblock_large', 'images/bgblock_large', 30, 30, 360)
bgblock_small = newimagetable('bgblock_small', 'images/bgblock_small', 18, 18, 360)

quikwordtimer(1, 60000, 60000, nil)
quikwordgroup = {}
quikwordpaused = true
quikwords_completed = {'Quik-Words Seen:'}

-- Save check
function savecheck()
	if platform == 'peedee' then
    	save = pd.datastore.read()
	elseif platform == 'love' then
		if love.filesystem.read('data.json') ~= nil then
			save = json.decode(love.filesystem.read('data.json'))
		end
	end

    if save == nil then save = {} end

	if platform == 'peedee' then
		if save.crank == nil then save.crank = true end
	elseif platform == 'love' then
		save.scale = save.scale or 1
		if save.gamepad == nil then save.gamepad = false end
		gamepad = save.gamepad

		save.up = save.up or 'up'
		save.down = save.down or 'down'
		save.left = save.left or 'left'
		save.right = save.right or 'right'
		save.primary = save.primary or 'z'
		save.secondary = save.secondary or 'x'

		save.color = save.color or 1

		if save.clean_scaling == nil then save.clean_scaling = true end
		if save.rumble == nil then save.rumble = true end
	end

	if save.music == nil then save.music = true end
	if save.sfx == nil then save.sfx = true end

	if save.time == nil then save.time = true end
	if save.menubg == nil then save.menubg = true end
	if save.flip == nil then save.flip = (platform == 'peedee' and false or platform == 'love' and true) end
	save.hours = save.hours or true

	-- Fix for old save.hours logic
	if tonumber(save.hours) == save.hours then save.hours = (save.hours == 1 and true or save.hours == 2 and false) or true end

	save.background = save.background or 0

	if save.boldtext == nil then save.boldtext = false end
	if save.autosubmit == nil then save.autosubmit = false end
	if save.showcontrols == nil then save.showcontrols = true end

	save.wordsfound = save.wordsfound or 0
	save.brainfreezes = save.brainfreezes or 0
	save.kerplosions = save.kerplosions or 0
	save.quikwordsplayed = save.quikwordsplayed or 0
	save.quikwordbest = save.quikwordbest or 0
	save.quikwordsfound = save.quikwordsfound or 0
	save.playtime = save.playtime or 0
	save.paktime = save.paktime or 0
	save.quiktime = save.quiktime or 0
end

function resetsave(what)
	if what == 'quikword' then
		save.quiktime = 0
		save.quikwordbest = 0
		save.quikwordsfound = 0
		save.quikwordsplayed = 0
	elseif what == 'paks' then
		newsave = {}
		if platform == 'peedee' then
			newsave.crank = save.crank
		elseif platform == 'love' then
			newsave.scale = save.scale
			newsave.gamepad = save.gamepad

			newsave.up = save.up
			newsave.down = save.down
			newsave.left = save.left
			newsave.right = save.right
			newsave.primary = save.primary
			newsave.secondary = save.secondary

			newsave.color = save.color

			newsave.clean_scaling = save.clean_scaling
			newsave.rumble = save.rumble
		end

		newsave.music = save.music
		newsave.sfx = save.sfx

		newsave.time = save.time
		newsave.menubg = save.menubg
		newsave.flip = save.flip
		newsave.hours = save.hours

		newsave.background = save.background

		newsave.boldtext = save.boldtext
		newsave.autosubmit = save.autosubmit
		newsave.showcontrols = save.showcontrols

		newsave.wordsfound = save.wordsfound
		newsave.brainfreezes = save.brainfreezes
		newsave.quikwordsplayed = save.quikwordsplayed
		newsave.quikwordbest = save.quikwordbest
		newsave.quikwordsfound = save.quikwordsfound
		newsave.playtime = save.playtime
		newsave.quiktime = save.quiktime

		save = newsave
		newsave = nil
	elseif what == 'everything' then
		save = {}
		savegame()
		savecheck()
		newmusic('audio/music/title', true)
		create_bg()
		setredraw(true)
		assets.discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓')
	end
	savegame()
end

if platform == 'peedee' then
	savecheck()

	achievements.initialize(achievementData, true)
	function updatecheevos()
		if save.tutorial.status == 'complete' then achievements.grant('welcome') end
		achievements.advanceTo('words25', save.wordsfound)
		achievements.advanceTo('words50', save.wordsfound)
		achievements.advanceTo('words100', save.wordsfound)
		achievements.advanceTo('words250', save.wordsfound)
		achievements.advanceTo('words500', save.wordsfound)
		achievements.advanceTo('words1000', save.wordsfound)
		achievements.advanceTo('brainfreeze', save.brainfreezes)
		achievements.advanceTo('kerplode', save.kerplosions)
		achievements.advanceTo('quikword', save.quikwordsplayed)
		achievements.advanceTo('quikwords25', save.quikwordsfound)
		achievements.advanceTo('quikwords50', save.quikwordsfound)
		achievements.advanceTo('quikwords100', save.quikwordsfound)
		achievements.advanceTo('quikwords250', save.quikwordsfound)
		achievements.advanceTo('quikwordbest5', save.quikwordbest)
		achievements.advanceTo('quikwordbest15', save.quikwordbest)
		achievements.advanceTo('quikwordbest30', save.quikwordbest)
		achievements.save()
	end
	updatecheevos()
elseif platform == 'love' then
	function updatecheevos()
		-- noop
	end
end

local lasthour = gettime().hour

function suspend()
	if vars.pack ~= nil and vars.pack ~= 'speed' then
		save[vars.pack.id].puzzle = vars.puzzle
		save[vars.pack.id].puzzleswaps = vars.swaps
		save[vars.pack.id].heldpackswaps = vars.packswaps
		save[vars.pack.id].word = vars.word
		if vars.bombs ~= nil and vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
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
		if not vars.paused then
			bgblocks[i].y = bgblocks[i].y + (bgblocks[i].fallspeed / 20)
			if bgblocks[i].y >= 260 then
				bgblocks[i].y = -40
			end
			bgblocks[i].rotation = bgblocks[i].rotation + bgblocks[i].rotspeed
			if bgblocks[i].rotation >= 360 then
				bgblocks[i].rotation = 1
			end
		end
		drawimagetable('bgblock_' .. bgblocks[i].size, floor(bgblocks[i].rotation), bgblocks[i].x, bgblocks[i].y)
	end
	setcolor('white')
	if game then
		setcolor('white', 0.25)
	else
		setcolor('white', 0.5)
	end
	fillrect(0, 0, 400, 240)
	setcolor()
end

function remove_bg()
	if bgblocks ~= nil then
		for i = 1, #bgblocks do
			bgblocks[i] = nil
		end
	end
	bgblocks = {}
end

if platform == 'peedee' then
	function pd.gameWillTerminate()
		suspend()
		savegame()
	end

	function pd.deviceWillSleep()
		suspend()
		savegame()
	end

	function rumble()
		-- noop
	end

	scenemanager:switchscene(title, true)

	function pd.update()
		-- Catch-all stuff ...
		gfx.sprite.update()
		pd.timer.updateTimers()

		save.playtime = save.playtime + 1

		-- TODO: remove drawFPS
		pd.drawFPS(0, 0)
	end

	function drawontop()
		--noop
	end
elseif platform == 'love' then
	function love.quit()
		suspend()
		savegame()
	end

	function rescale(newscale)
		scale = newscale
		love.window.setMode(400 * newscale, 240 * newscale, {resizable = true, minwidth = 400 * newscale, minheight = 240 * newscale})
	end

	function love.keypressed(key)
		save.gamepad = gamepad
		gamepad = false
		if key == 'escape' and vars ~= nil then
			if vars.playing ~= nil then
				if vars.paused then
					game:unpause()
				else
					game:pause()
				end
			elseif vars.handler == 'remap' then
				options:restorebuttons()
				playsound(assets.pop)
				vars.remap_step = 1
				setmusicvolume(1)
				vars.handler = 'options'
				savegame()
			else
				quit = quit + 1
				afterdelay('quittimer', 2000, function()
					quit = 0
				end)
				if quit == 2 then
					love.event.quit()
				end
			end
		end
		if key == 'f11' then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen)
		end
	end

	function love.gamepadpressed(joystick, button)
		if vars.handler ~= "remap" then
			current_joystick = joystick
			local key
			if button == 'start' then
				key = 'escape'
			elseif button == 'dpup' then
				key = save.up
			elseif button == 'dpdown' then
				key = save.down
			elseif button == 'dpleft' then
				key = save.left
			elseif button == 'dpright' then
				key = save.right
			elseif button == 'a' then
				key = save.primary
			elseif button == 'b' then
				key = save.secondary
			end
			gamepad = true
			love.keypressed(key)
		end
	end

	function rumble(left, right, duration)
		if save.rumble and save.gamepad and current_joystick:isVibrationSupported() then
			current_joystick:setVibration(left, right, duration)
		end
	end

	function love.focus(f)
		if f then
			love.mouse.setVisible(false)
		else
			love.mouse.setVisible(true)
		end
	end

	function love.resize(w, h)
		local fw
		local fh
		if save.clean_scaling then
			fw = floor(w / 400)
			fh = floor(h / 240)
		else
			fw = w / 400
			fh = h / 240
		end
		if fw < fh and fw >= save.scale then
			scale = fw
		elseif fh < fw and fh >= save.scale then
			scale = fh
		elseif fw == fh and fw >= save.scale then
			scale = fw
		end
	end

	function love.load()
		savecheck()
		love.window.setIcon(icon)

		min_dt = 1 / fps
		next_time = love.timer.getTime()

		rescale(save.scale)
		scenemanager:switchscene(title, true)
		gamestate.registerEvents()
	end

	function love.update(dt)
		next_time = next_time + min_dt

		save.playtime = save.playtime + 1

		if vars ~= nil and not vars.paused then
			timer.update(dt, transition)
			timer.update(dt)
			timer.update(dt, quikwordgroup)
		end

		if music ~= nil then
			music:setVolume(volume)
			if not music:isPlaying() then music = nil end
		end
	end

	function love.draw()
		gfx.clear(0, 0, 0, 1)
		gfx.setColor(1, 1, 1, 1)

		local lbw = false
		local lbh = false

		local ww, wh, flags = love.window.getMode()
		if ww > 400 * scale then lbw = true end
		if wh > 240 * scale then lbh = true end

		if lbw then gfx.translate(((floor(ww / 2) * 2) - (400 * scale)) / 2, 0) end
		if lbh then gfx.translate(0, ((floor(wh / 2) * 2) - (240 * scale)) / 2) end

		gfx.setScissor(((lbw and (((floor(ww / 2) * 2) - (400 * scale)) / 2)) or 0), ((lbh and (((floor(wh / 2) * 2) - (240 * scale)) / 2)) or 0), 400 * scale, 240 * scale)

		gfx.clear(1, 1, 1, 1)

		gfx.scale(scale)
	end

	function drawontop()
		if quit > 0 then
			setcolor('white')
			fillrect(0, 0, 400, 25)
			setcolor()
			drawline(0, 25, 400, 25)
			drawtext(disco, save.gamepad and 'Press Start again to quit. See ya later!' or 'Press ESC again to quit. See ya later!', 200, 5, 'center')
		end

		if vars.transition ~= nil and value('transition') > 0 then
			setcolor('white', (-value('transition') + 5))
			drawimage(loadingimages.loading4, 0, 0)
		end
		setcolor()

		gfx.setScissor()

		if save.color == 2 then
			gfx.setColor(0.53, 0.5, 0.48, 0.5)
			fillrect(0, 0, 400, 240)
			setcolor()
		elseif save.color == 3 then
			gfx.setColor(0.2, 0.5, 0.1, 1)
			gfx.setBlendMode('screen', 'premultiplied')
			fillrect(0, 0, 400, 240)
			gfx.setColor(0.5, 0.85, 0.2, 1)
			gfx.setBlendMode('multiply', 'premultiplied')
			fillrect(0, 0, 400, 240)
			gfx.setBlendMode('alpha', 'alphamultiply')
			setcolor()
		elseif save.color == 4 then
			gfx.setColor(0.9, 0.5, 0, 1)
			gfx.setBlendMode('screen', 'premultiplied')
			fillrect(0, 0, 400, 240)
			gfx.setBlendMode('alpha', 'alphamultiply')
			setcolor()
		end

		local cur_time = love.timer.getTime()
		if next_time <= cur_time then
			next_time = cur_time
			return
		end
		love.timer.sleep(next_time - cur_time)
	end
end