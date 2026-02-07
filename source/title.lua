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
	import 'statistics'

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
	statistics = require 'statistics'

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

	vars = {
		launch = args[1] or false,
		selection = args[2] or 1,
		dir = false,
		bump = 0,
		lbbump = 0,
		handler = '',
		offset = 0,
		offsettarget = 0,
		lbloading = false,
		lbdaily = false,
		result = {},
	}
	if vars.launch then
		if platform == 'peedee' then newtimer('launchfade', 200, 1, 0) end
		newtimer('logopull', 900, -100, 0, 'outElastic', function()
			vars.handler = 'title'
		end)
	else
		vars.handler = 'title'
	end

	if vars.selection > 1 then
		vars.offset = -40
		vars.offsettarget = -40
	end

	newtimer('gaming', 1, 1, 1)
	create_bg()

    newmusic('audio/music/title', true)
end

function title:refreshboards(daily)
	if vars.lbloading then return end
	vars.lbloading = true
	vars.result = {}
	vars.best = {}
	if platform == 'peedee' then gfx.sprite.redrawBackground() end
	pd.scoreboards.getScores(daily and 'speeddaily' or 'speed', function(status, result)
		if status.code == 'OK' then
			vars.result = result
		else
			vars.result = 'fail'
		end
		vars.lbloading = false
		if platform == 'peedee' then gfx.sprite.redrawBackground() end
	end)
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
		elseif pd.buttonJustPressed('b') then
			self:keypressed('b')
		elseif pd.buttonJustPressed('a') then
			self:keypressed('a')
		end

		local ticks = pd.getCrankTicks(4)
		if ticks ~= 0 and not transitioning and vars.handler == 'title' then
			vars.selection = vars.selection + ticks
			if vars.selection > 7 then
				vars.selection = 7
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

	vars.lbbump = vars.lbbump - (vars.lbbump * 0.4)
	if vars.lbbump <= 0.1 and vars.lbbump >= -0.1 and vars.lbbump ~= 0 then
		vars.lbbump = 0
	end

	vars.offset = vars.offset + ((vars.offsettarget - vars.offset) * 0.4)
	if vars.offset <= vars.offsettarget + 0.1 and vars.offset >= vars.offsettarget - 0.1 and vars.offset ~= vars.offsettarget then
		vars.offset = vars.offsettarget
	end

	if vars.selection > 1 then
		vars.offsettarget = -40
	else
		vars.offsettarget = 0
	end

	if platform == 'peedee' and not redraw then
		if (vars.launchfade ~= nil and vars.launchfade.timeLeft ~= 0) or (vars.logopull ~= nil and vars.logopull.timeLeft ~= 0) or vars.bump ~= 0 or vars.lbbump ~= 0 then
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
	drawimage(assets.logo, 65, 6 + (vars.logopull ~= nil and value('logopull') or 0) + (vars.offset / 1.5))

	setcolor('white', 0.15)
	fillrect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0) + vars.offset, 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 235 - tonumber(vars.selection == 4 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
	fillrect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 235 - tonumber(vars.selection == 5 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)


	setcolor()
	if vars.selection == 1 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0) + vars.offset, 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 1 then gfx.setLineWidth(2) end
	if vars.selection == 2 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0) + vars.offset, (catalog and 97 or 200) + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 2 then gfx.setLineWidth(2) end
	if catalog then
		if vars.selection == 3 then gfx.setLineWidth(4) end
		drawrect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 3 then gfx.setLineWidth(2) end
	end
	if vars.selection == 4 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 4 then gfx.setLineWidth(2) end
	if vars.selection == 5 then gfx.setLineWidth(4) end
	drawrect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 5 then gfx.setLineWidth(2) end
	if vars.selection == 6 then gfx.setLineWidth(4) end
	drawrect(100 - tonumber(vars.selection == 6 and 3 + vars.bump or 0), 235 - tonumber(vars.selection == 6 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 6 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 6 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 6 then gfx.setLineWidth(2) end
	if vars.selection == 7 then gfx.setLineWidth(4) end
	drawrect(203 - tonumber(vars.selection == 7 and 3 + vars.bump or 0), 235 - tonumber(vars.selection == 7 and 3 + vars.bump or 0) + vars.offset, 97 + tonumber(vars.selection == 7 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 7 and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == 7 then gfx.setLineWidth(2) end

	setcolor('white')
	drawtext(assets[vars.selection == 1 and 'disco' or 'discoteca'], 'Let\'s Play!\n(Word Puzzle Paks)', 200, 120 + vars.offset, center)
	drawtext(assets[vars.selection == 2 and 'disco' or 'discoteca'], 'Quik-Word', catalog and 148 or 200, 173 + vars.offset, center)
	if catalog then
		drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], 'Best Scores', 252, 173 + vars.offset, center)
	end
	drawtext(assets[vars.selection == 4 and 'disco' or 'discoteca'], 'Statistics', 148, 208 + vars.offset, center)
	drawtext(assets[vars.selection == 5 and 'disco' or 'discoteca'], 'Bonus Paks', 252, 208 + vars.offset, center)
	drawtext(assets[vars.selection == 6 and 'disco' or 'discoteca'], 'Options', 148, 243 + vars.offset, center)
	drawtext(assets[vars.selection == 7 and 'disco' or 'discoteca'], 'Credits', 252, 243 + vars.offset, center)

	if platform == 'peedee' and vars.launch then
		assets.launch:drawFaded(0, 0, value('launchfade'), bayer4)
	end

	setcolor('white', value('gaming'))
	fillrect(0, 0, 400, 240)

	if vars.handler == 'leaderboards' then
		setcolor('black', 0.5)
		fillrect(0, 0, 400, 240)

		setcolor('white')
		fillrect(10 - vars.lbbump, 10 - vars.lbbump, 380 + (vars.lbbump * 2), 215 + (vars.lbbump * 2), 10)
		setcolor()
		drawrect(10 - vars.lbbump, 10 - vars.lbbump, 380 + (vars.lbbump * 2), 215 + (vars.lbbump * 2), 8)

		setcolor('white')
		fillrect(70, 200, 260, 30, 5)
		setcolor()
		drawrect(70, 200, 260, 30, 5)

		drawtext(assets.disco, 'Quik-Word', 20, 20)
		drawtext(assets.discoteca, vars.lbdaily and 'Today\'s Best Scores' or 'All-Time Best Scores', 380, 20, right)

		if vars.lbloading then
			drawtext(assets.disco, ('Ⓑ' or string.upper(save.secondary)) .. ' Back', 200, 208, center)
		else
			drawtext(assets.disco, (vars.lbdaily and '⬅ All-Time  ' or '➡ Daily  ') .. ('Ⓑ' or string.upper(save.secondary)) .. ' Back  ' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary)) .. ' Refresh', 200, 208, center)
		end

		if vars.result.scores ~= nil and next(vars.result.scores) ~= nil then
			for _, v in ipairs(vars.result.scores) do
				if v.rank <= 10 then
					local lefttext = v.rank .. '. ' .. v.player
					local righttext = v.value

					drawtext(assets.disco, lefttext, 20, 25 + (15 * v.rank))
					drawtext(assets.discoteca, commalize(righttext), 380, 25 + (15 * v.rank), right)

					local leftlen = textwidth(assets.disco, lefttext)
					local rightlen = textwidth(assets.discoteca, commalize(righttext))

					setcolor('black', 0.5)
					drawline(30 + leftlen, 36 + (15 * v.rank), 370 - (rightlen), 36 + (15 * v.rank))
					setcolor()
				end
			end
		elseif vars.result == 'fail' then
			drawtext(assets.disco, 'Score loading failed. Try again?', 200, 115, center)
		else
			if vars.lbloading then
				drawtext(assets.disco, 'Loading scores, please wait...', 200, 115, center)
			else
				drawtext(assets.disco, 'This scoreboard\'s empty. Get swapping!', 200, 115, center)
			end
		end
	end

	drawontop()
end

function title:keypressed(button)
	if vars.handler == 'title' then
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
				if catalog then
					vars.selection = 3
				else
					vars.selection = 2
				end
			elseif vars.selection == 6 then
				vars.selection = 4
			elseif vars.selection == 7 then
				vars.selection = 5
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
			if vars.selection < 6 then
				playsound(assets.swish)
				rumble(0.3, 0.3, 0.025)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
			end
			if vars.selection == 1 then
				if vars.dir and catalog then
					vars.selection = 3
				else
					vars.selection = 2
				end
			elseif vars.selection == 2 then
				if vars.dir then
					vars.selection = 5
				else
					vars.selection = 4
				end
			elseif vars.selection == 3 then
				vars.selection = 5
			elseif vars.selection == 4 then
				vars.selection = 6
			elseif vars.selection == 5 then
				vars.selection = 7
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
			if vars.selection % 2 == 1 and vars.selection ~= 1 then
				playsound(assets.swish)
				rumble(0.3, 0.3, 0.025)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
			end
			vars.dir = false
			if vars.selection == 3 then
				vars.selection = 2
			elseif vars.selection == 5 then
				vars.selection = 4
			elseif vars.selection == 7 then
				vars.selection = 6
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
			vars['selectionoffset' .. vars.selection] = 0
			if (vars.selection % 2 == 0 and vars.selection ~= 2) or (vars.selection == 2 and catalog) then
				playsound(assets.swish)
				rumble(0.3, 0.3, 0.025)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
			end
			vars.dir = true
			if vars.selection == 2 and catalog then
				vars.selection = 3
			elseif vars.selection == 4 then
				vars.selection = 5
			elseif vars.selection == 6 then
				vars.selection = 7
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
				vars.handler = 'leaderboards'
				setmusicvolume(0.5)
				self:refreshboards(vars.lbdaily)
			elseif vars.selection == 4 then
				scenemanager:transitionscene(statistics)
			elseif vars.selection == 5 then
				pack = bonus
				scenemanager:transitionscene(packselect)
			elseif vars.selection == 6 then
				scenemanager:transitionscene(options)
			elseif vars.selection == 7 then
				scenemanager:transitionscene(credits)
			end
		end
	elseif vars.handler == 'leaderboards' then
		if button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
			if vars.lbloading or not vars.lbdaily then
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
				vars.lbbump = -3
			else
				vars.lbdaily = false
				self:refreshboards(vars.lbdaily)
				playsound(assets.pop)
				rumble(0.3, 0.3, 0.025)
			end
		elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
			if vars.lbloading or vars.lbdaily then
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
				vars.lbbump = -3
			else
				vars.lbdaily = true
				self:refreshboards(vars.lbdaily)
				playsound(assets.pop)
				rumble(0.3, 0.3, 0.025)
			end
		elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			vars.handler = 'title'
			setmusicvolume(1)
			playsound(assets.pop)
			rumble(0.3, 0.3, 0.025)
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
			if vars.lbloading then
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
				vars.lbbump = -3
			else
				self:refreshboards(vars.lbdaily)
				playsound(assets.pop)
				rumble(0.3, 0.3, 0.025)
			end
		end
	end
end

if platform == 'love' then return title end