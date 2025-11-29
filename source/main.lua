-- TODO: add achievements on peedee
-- TODO: daily seeded quik-word?
-- TODO: write manual
-- TODO: statistics menu
	-- Total words found (exclude shapes and math)
	-- Paks completed (how many times is "complete" found in the save table?)
	-- Quik-Word games played
	-- Highest Quik-Word round
	-- Quik-Words found
	-- Time spent playing
	-- Time spent in Quik-Word
	-- Time spent in paks
-- TODO: solver/optimum swaps finder function, that returns a number

-- Build target. 'peedee' or 'love'
platform = 'peedee'
local fps = 30

local pd
local gfx
local black
local white
local gamepad
local scale
local fullscreen

music = nil
quit = 0

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

	catalog = false
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

	packs, bonus, quikword = require 'packs'

	title = require 'title'

	gfx = love.graphics
	black = love.math.colorFromBytes(0, 0, 0, 1)
	white = love.math.colorFromBytes(1, 1, 1, 1)
	gamepad = false
	fullscreen = false

	version = '1.0.0b2'

	gfx.setLineStyle('rough')
	gfx.setLineJoin('miter')
	gfx.setDefaultFilter('nearest', 'nearest')
	love.keyboard.setKeyRepeat(false)

	icon = love.image.newImageData('images/system/icon.png')
end

pack = nil
redraw = false

gfx.setLineWidth(2)

bgblocks = {}
bgblock_large = newimagetable('bgblock_large', 'images/bgblock_large', 30, 30, 360)
bgblock_small = newimagetable('bgblock_small', 'images/bgblock_small', 18, 18, 360)

quikwordtimer(1, 60000, 60000, nil)
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

		save.up = save.up or 'up'
		save.down = save.down or 'down'
		save.left = save.left or 'left'
		save.right = save.right or 'right'
		save.primary = save.primary or 'z'
		save.secondary = save.secondary or 'x'

		if save.clean_scaling == nil then save.clean_scaling = true end
		if save.rumble == nil then save.rumble = true end
	end

	if save.music == nil then save.music = true end
	if save.sfx == nil then save.sfx = true end

	if save.time == nil then save.time = true end
	if save.menubg == nil then save.menubg = true end

	save.hours = save.hours or true

	-- Fix for old save.hours logic
	if tonumber(save.hours) == save.hours then save.hours = (save.hours == 1 and true or save.hours == 2 and false) or true end

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

			newsave.clean_scaling = save.clean_scaling
			newsave.rumble = save.rumble
		end

		newsave.music = save.music
		newsave.sfx = save.sfx

		newsave.time = save.time
		newsave.menubg = save.menubg
		newsave.hours = save.hours

		newsave.background = save.background
		newsave.darkmode = save.darkmode

		newsave.boldtext = save.boldtext
		newsave.autosubmit = save.autosubmit
		newsave.showcontrols = save.showcontrols
	else
		if platform == 'peedee' then
			newsave.crank = true
		elseif platform == 'love' then
			newsave.scale = 1
			newsave.gamepad = false

			save.up = 'up'
			save.down = 'down'
			save.left = 'left'
			save.right = 'right'
			save.primary = 'z'
			save.secondary = 'x'

			save.clean_scaling = true
			save.rumble = true
		end

		newsave.music = true
		newsave.sfx = true

		newsave.time = true
		newsave.menubg = true
		newsave.hours = true

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

	savegame()

	newmusic('audio/music/title', true)
	create_bg()
	setredraw(true)
	setinverted(isdarkmode())
	assets.discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca')
end

if platform == 'peedee' then
	savecheck()
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
		bgblocks[i].y = bgblocks[i].y + (bgblocks[i].fallspeed / 20)
		if bgblocks[i].y >= 260 then
			bgblocks[i].y = -40
		end
		bgblocks[i].rotation = bgblocks[i].rotation + bgblocks[i].rotspeed
		if bgblocks[i].rotation >= 360 then
			bgblocks[i].rotation = 1
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

function isdarkmode()
	local hour = gettime().hour
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

-- Shuffly code from https://gist.github.com/Uradamus/10323382
function shuffle(tbl)
  	for i = #tbl, 2, -1 do
		local j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
    end
  	return tbl
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

	scenemanager:switchscene(title, true)

	function pd.update()
		-- Catch-all stuff ...
		gfx.sprite.update()
		pd.timer.updateTimers()

		-- Automatic dark mode
		local hour = gettime().hour
		if save.darkmode == 2 then
			if lasthour < 18 and hour >= 18 then
				setinverted(true)
				lasthour = hour
			elseif lasthour < 6 and hour >= 6 then
				setinverted(false)
				lasthour = hour
			end
		else
			if lasthour ~= hour then
				lasthour = hour
			end
		end
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
		gamepad = false
		save.gamepad = gamepad
		if key == 'escape' and vars ~= nil then
			quit = quit + 1
			vars.quit_timer = timer.after(2, function() quit = 0 end)
			if quit == 2 then
				love.event.quit()
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
			save.gamepad = gamepad
			love.keypressed(key)
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
		gamestate.registerEvents()
		scenemanager:switchscene(title, true)
	end

	function love.update(dt)
		next_time = next_time + min_dt

		if vars ~= nil and not vars.paused then
			timer.update(dt)
			timer.update(dt, transition)
		end

		if music ~= nil then
			music:setVolume(volume[1])
			if not music:isPlaying() then music = nil end
		end
	end

	function love.draw()
		gfx.clear(0.5, 0.5, 0.5, 1)
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
		if vars.transition ~= nil and value('transition') > 0 then
			setcolor('white', (-value('transition') + 5))
			drawimage(loadingimages.loading4, 0, 0)
		end
		setcolor()

		gfx.setScissor()

		local cur_time = love.timer.getTime()
		if next_time <= cur_time then
			next_time = cur_time
			return
		end
		love.timer.sleep(next_time - cur_time)
	end
end