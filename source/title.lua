local pd
local gfx
local bayer4
local center
local right

if platform == 'peedee' then
	import 'packselect'
	import 'options'
	import 'credits'
	import 'game'

	pd = playdate
	gfx = pd.graphics
	bayer4 = gfx.image.kDitherTypeBayer4x4
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('title').extends(gfx.sprite)
	function title:init(...)
		title.super.init(self)
		local args = {...} -- Arguments passed in through the scene management will arrive here

		if save.menubg then setredraw(true) else setredraw(false) end

		function pd.gameWillPause()
			local menu = pd.getSystemMenu()
			menu:removeAllMenuItems()
		end

		self:initialize(args)
		gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
			self:draw()
		end)

		self:add()
	end
elseif platform == 'love' then
	packselect = require 'packselect'
	options = require 'options'
	credits = require 'credits'
	game = require 'game'

	gfx = love.graphics
	center = 'center'
	right = 'right'

	title = {}
	function title:enter(current, ...)
		love.window.setTitle('Labsylle')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function title:initialize(args)
	assets = {
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		logo = newimage('images/logo'),
		launch = newimage('images/system/launchImage'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		pop = newsound('audio/sfx/pop'),
	}

	if platform == 'peedee' then
		assets.launch:setInverted(isdarkmode())
	end

	vars = {
		launch = args[1] or false,
		selection = args[2] or 1,
		selections = {'select', 'shapes', 'speed', 'options', 'credits'},
		dir = false,
		bump = 0,
		handler = '',
	}
	if vars.launch then
		if platform == 'peedee' then newtimer('launchfade', 200, 1, 0) end
		newtimer('logopull', 900, -100, 0, 'outElastic', function()
			vars.handler = 'title'
		end)
	else
		vars.handler = 'title'
	end

	newtimer('gaming', 1, 1, 1)
	create_bg()

    newmusic('audio/music/title', true)
end

function title:update()
	if platform == 'peedee' then
		if pd.buttonJustPressed('up') then
			self:keypressed('up')
		elseif pd.buttonJustPressed('down') then
			self:keypressed('down')
		elseif pd.buttonJustPressed('left') then
			self:keypressed('left')
		elseif pd.buttonJustPressed('right') then
			self:keypressed('right')
		elseif pd.buttonJustPressed('a') then
			self:keypressed('a')
		end

		local ticks = pd.getCrankTicks(4)
		if ticks ~= 0 and not transitioning then
			vars.selection = vars.selection + ticks
			if vars.selection > #vars.selections then
				vars.selection = #vars.selections
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			elseif vars.selection < 1 then
				vars.selection = 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			else
				playsound(assets.swish)
				gfx.sprite.redrawBackground()
			end
		end
	end

	vars.bump = vars.bump - (vars.bump * 0.4)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	if platform == 'peedee' and not redraw then
		if (vars.launchfade ~= nil and vars.launchfade.timeLeft ~= 0) or (vars.logopull ~= nil and vars.logopull.timeLeft ~= 0) or vars.bump ~= 0 then
			gfx.sprite.redrawBackground()
		end
	end
end

function title:draw()
	draw_bg()

	setcolor('black', 0.75)
	fillrect(0, 0, 80, 240)
	fillrect(320, 0, 80, 240)

	if platform == 'love' then setcolor('white') end
	drawimage(assets.logo, 65, 6 + (vars.logopull ~= nil and value('logopull') or 0))

	setcolor('white', 0.15)
	fillrect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)

	setcolor()
	if vars.selection == 1 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 1 then gfx.setLineWidth(2) end
	if vars.selection == 2 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 2 then gfx.setLineWidth(2) end
	if vars.selection == 3 then gfx.setLineWidth(4) end
	drawrect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 3 then gfx.setLineWidth(2) end
	if vars.selection == 4 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 4 then gfx.setLineWidth(2) end
	if vars.selection == 5 then gfx.setLineWidth(4) end
	drawrect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 5 then gfx.setLineWidth(2) end

	setcolor('white')
	drawtext(assets[vars.selection == 1 and 'disco' or 'discoteca'], 'Let\'s Play!\n(Word Puzzle Paks)', 200, 120, center)
	drawtext(assets[vars.selection == 2 and 'disco' or 'discoteca'], 'Quik-Word', 148, 173, center)
	drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], 'Bonus Paks', 252, 173, center)
	drawtext(assets[vars.selection == 4 and 'disco' or 'discoteca'], 'Options', 148, 208, center)
	drawtext(assets[vars.selection == 5 and 'disco' or 'discoteca'], 'Credits', 252, 208, center)

	if platform == 'peedee' and vars.launch then
		assets.launch:drawFaded(0, 0, value('launchfade'), bayer4)
	end

	setcolor('white', value('gaming'))
	fillrect(0, 0, 400, 240)

	drawontop()
end

function title:keypressed(button)
	if vars.handler ~= 'title' then return end
	if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
		if vars.selection ~= 1 then
			playsound(assets.swish)
			rumble(0.3, 0.3, 0.025)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		end
		if vars.selection == 2 then
			vars.selection = 1
		elseif vars.selection == 3 then
			vars.selection = 1
		elseif vars.selection == 4 then
			vars.selection = 2
		elseif vars.selection == 5 then
			vars.selection = 3
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
		if vars.selection < 4 then
			playsound(assets.swish)
			rumble(0.3, 0.3, 0.025)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		end
		if vars.selection == 1 then
			if vars.dir then
				vars.selection = 3
			else
				vars.selection = 2
			end
		elseif vars.selection == 2 then
			vars.selection = 4
		elseif vars.selection == 3 then
			vars.selection = 5
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
		if vars.selection == 3 or vars.selection == 5 then
			playsound(assets.swish)
			rumble(0.3, 0.3, 0.025)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		end
		vars.dir = false
		if vars.selection == 3 then
			vars.selection = 2
		elseif vars.selection == 5 then
			vars.selection = 4
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
		vars['selectionoffset' .. vars.selection] = 0
		if vars.selection % 2 == 0 then
			playsound(assets.swish)
			rumble(0.3, 0.3, 0.025)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		end
		vars.dir = true
		if vars.selection == 2 then
			vars.selection = 3
		elseif vars.selection == 4 then
			vars.selection = 5
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
		playsound(assets.pop)
		rumble(0.3, 0.3, 0.025)
		vars.handler = ''
		if vars.selection == 1 then
			pack = packs
			scenemanager:transitionscene(packselect)
		elseif vars.selection == 2 then
			fademusic()
			resettimer('gaming', 350, 1, -0.75, 'linear', function()
				scenemanager:switchscene(game, 'speed', 1, 0, nil, 0, {}, 1)
			end)
			quikwords_completed = {'Quik-Words Seen:'}
		elseif vars.selection == 3 then
			pack = bonus
			scenemanager:transitionscene(packselect)
		elseif vars.selection == 4 then
			scenemanager:transitionscene(options)
		elseif vars.selection == 5 then
			scenemanager:transitionscene(credits)
		end
	end
end

if platform == 'love' then return title end