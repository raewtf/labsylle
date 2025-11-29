local pd
local gfx
local bayer4
local center
local right

if platform == 'peedee' then
	import 'game'

	pd = playdate
	gfx = pd.graphics
	bayer4 = gfx.image.kDitherTypeBayer4x4
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('packselect').extends(gfx.sprite)
	function packselect:init(...)
		packselect.super.init(self)
		local args = {...} -- Arguments passed in through the scene management will arrive here

		if save.menubg then setredraw(true) else setredraw(false) end

		function pd.gameWillPause()
			local menu = pd.getSystemMenu()
			menu:removeAllMenuItems()
			menu:addMenuItem('reset pack', function()
				for i = 1, #save[pack[vars.selection].id] do
					table.remove(save[pack[vars.selection].id], 1)
				end
				save[pack[vars.selection].id] = nil
				assets['packtext' .. vars.selection]:clear(clear)
				gfx.lockFocus(assets['packtext' .. vars.selection])
					packselect:drawpacktext(vars.selection)
				gfx.unlockFocus()
				vars.reset = true
			end)
			if catalog then
				menu:addMenuItem('pack boards', function()
					-- NOTE: catalog leaderboard popup for given pack
				end)
			end
		end

		self:initialize(args)
		gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
			self:draw()
		end)

		self:add()
	end
elseif platform == 'love' then
	-- game = require 'game'

	gfx = love.graphics
	center = 'center'
	right = 'right'

	packselect = {}
	function packselect:enter(current, ...)
		love.window.setTitle('Labsylle — Pack Select')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function packselect:initialize(args)
	assets = {
		disco = newfont('fonts/disco'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca'),
		mask = newimage('images/mask'),
		bomb = newimage('images/bomb'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		pop = newsound('audio/sfx/pop'),
	}

	vars = {
		return_pack = args[1],
		selection = 1,
		sellerp = 1,
		scroll = 0,
		scroll_target = 0,
		bump = 0,
		reset = false,
		handler = 'packselect'
	}

	newtimer('gaming', 0, 1, 1)

	for i = 1, #pack do
		if vars.return_pack == pack[i] then
			vars.selection = i
		end
		if platform == 'peedee' then
			assets['packtext' .. i] = gfx.image.new(360, 50)
			gfx.lockFocus(assets['packtext' .. i])
				packselect:drawpacktext(i)
			gfx.unlockFocus()
		elseif platform == 'love' then
			assets['packtext' .. i] = gfx.newCanvas(360, 50)
			gfx.setCanvas(assets['packtext' .. i])
				packselect:drawpacktext(i)
			gfx.setCanvas()
		end
	end

	packselect:scroll(false)

	create_bg()

	newmusic('audio/music/title', true)
end

function packselect:drawpack(i)
	if vars.selection == i then gfx.setLineWidth(4) end
	setcolor('white', 0.15)
	fillrect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0), -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0) + vars.scroll, 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	setcolor()
	drawrect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0), -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0) + vars.scroll, 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == i then gfx.setLineWidth(2) end
	setcolor('white')
	drawimage(assets['packtext' .. i], 0, -55 + (55 * i) + vars.scroll)
end

function packselect:drawpacktext(i)
	drawtext(assets.disco, pack[i].name or '', 20, 21)
	local len = textwidth(assets.disco, pack[i].name or '')
	if pack == packs and i > 1 then
		drawtext(assets.discoteca, '(Standard Pak #' .. i .. ')', 25 + len, 21)
	else
		drawtext(assets.discoteca, (pack[i].subtitle ~= nil and '(' .. pack[i].subtitle .. ')' or ''), 25 + len, 21)
	end
	drawtext(assets.discoteca, (pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' puzzle' or ' puzzles'), 20, 35)
	local len = textwidth(assets.discoteca, (pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' puzzle' or ' puzzles'))
	if pack[i].contains_impostors then
		drawimage(assets.mask, 22 + len, 37)
	end
	if pack[i].contains_bombs then
		drawimage(assets.bomb, 23 + (pack[i].contains_impostors and 38 or 0) + len, 37)
	end
	if save[pack[i].id] ~= nil then
		if save[pack[i].id].status ~= nil then
			if save[pack[i].id].status == 'in_progress' then
				drawtext(assets.discoteca, 'In Progress', 361, 21, right)
			elseif save[pack[i].id].status == 'complete' then
				drawtext(assets.discoteca, 'Complete!', 361, 21, right)
			end
		end
		if save[pack[i].id].packswaps ~= nil then
			drawtext(assets.discoteca, 'Best: ' .. commalize(save[pack[i].id].packswaps) .. (save[pack[i].id].packswaps == 1 and ' pack swap' or ' pack swaps'), 361, 35, right)
		else
			drawtext(assets.discoteca, commalize(save[pack[i].id].puzzle - 1) .. ' of ' .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or 0) .. ' completed', 361, 35, right)
		end
	else
		drawtext(assets.discoteca, 'Unplayed', 361, 28, right)
	end
end

function packselect:scroll(lerp)
	if #pack > 4 then
		if vars.selection <= 3 then
			vars[lerp and 'scroll_target' or 'scroll'] = 0
		elseif vars.selection == #pack or vars.selection >= #pack - 2 then
			vars[lerp and 'scroll_target' or 'scroll'] = 224 - (55 * #pack)
		else
			vars[lerp and 'scroll_target' or 'scroll'] = 140 - (55 * vars.selection)
		end
	else
		vars.scroll_target = 0
		vars.scroll = 0
	end
end

function packselect:update()
	if platform == 'peedee' then
		if pd.buttonJustPressed('up') then
			self:keypressed('up')
		elseif pd.buttonJustPressed('down') then
			self:keypressed('down')
		elseif pd.buttonJustPressed('b') then
			self:keypressed('b')
		elseif pd.buttonJustPressed('a') then
			self:keypressed('a')
		end

		local ticks = pd.getCrankTicks(6)
		if ticks ~= 0 and not scenemanager.transitioning then
			vars.selection = vars.selection + ticks
			if vars.selection > #pack then
				vars.selection = #pack
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.scroll = vars.scroll - 10
				vars.sellerp = vars.sellerp + 1
			elseif vars.selection < 1 then
				vars.selection = 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.scroll = vars.scroll - 10
				vars.sellerp = vars.sellerp + 1
			else
				packselect:scroll(true)
				playsound(assets.swish)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
			end
		end
	end

	vars.bump = vars.bump - (vars.bump * 0.6)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	vars.sellerp = vars.sellerp + ((vars.selection - vars.sellerp) * 0.6)
	if vars.sellerp <= vars.selection + 0.1 and vars.sellerp >= vars.selection - 0.1 and vars.sellerp ~= vars.selection then
		vars.sellerp = vars.selection
	end

	vars.scroll = vars.scroll + ((vars.scroll_target - vars.scroll) * 0.6)
	if vars.scroll > vars.scroll_target - 0.1 and vars.scroll < vars.scroll_target + 0.1 and vars.scroll ~= vars.scroll_target then
		vars.scroll = vars.scroll_target
	end

	if platform == 'peedee' and not redraw then
		if vars.bump ~= 0 or vars.scroll ~= vars.scroll_target or vars.gaming.timeLeft ~= 0 then
			gfx.sprite.redrawBackground()
		end
		if vars.sellerp ~= vars.selection then
			gfx.sprite.addDirtyRect(378, 0, 22, 240)
		end
	end
	if vars.reset then
		if platform == 'peedee' then gfx.sprite.redrawBackground() end
		vars.reset = false
	end
end

function packselect:draw()
	draw_bg()

	local holderheight = 200
	local center = (240 - holderheight) / 2
	local barheight = holderheight / #pack

	setcolor('black', 0.75)
	fillrect(378, 0, 22, 240)
	setcolor('black', 0.25)
	fillrect(384, center, 10, holderheight)
	setcolor()
	drawrect(384, center, 10, holderheight)
	setcolor('white')
	fillrect(381, (holderheight + center + 1) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight - 2, 3)
	setcolor()
	drawrect(381, (holderheight + center) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight, 3)

	for i = 1, #pack do
		local y = -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0)
		if (y + 50 > -vars.scroll and y < -vars.scroll + 240) then
			packselect:drawpack(i)
		end
	end

	setcolor('white', value('gaming'))
	fillrect(0, 0, 400, 240)

	drawontop()
end

function packselect:keypressed(button)
	if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
		if vars.selection > 1 then
			vars.selection = vars.selection - 1
			packselect:scroll(true)
			playsound(assets.swish)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		else
			vars.scroll = vars.scroll + 10
			vars.sellerp = vars.sellerp - 1
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
		end
	elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
		if vars.selection < #pack then
			vars.selection = vars.selection + 1
			packselect:scroll(true)
			playsound(assets.swish)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		else
			vars.scroll = vars.scroll - 10
			vars.sellerp = vars.sellerp + 1
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
		end
	elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
		if pack[1] == packs[1] then
			scenemanager:transitionscene(title, false, 1)
		else
			scenemanager:transitionscene(title, false, 3)
		end
		playsound(assets.pop)
	elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
		if pack[vars.selection].puzzles ~= nil and #pack[vars.selection].puzzles > 0 then
			fademusic()
			playsound(assets.pop)
			vars.handler = ''
			resettimer('gaming', 350, 1, -0.75, 'linear', function()
				if save[pack[vars.selection].id] ~= nil then
					if save[pack[vars.selection].id].status == 'in_progress' then
						scenemanager:switchscene(game, pack[vars.selection], save[pack[vars.selection].id].puzzle, save[pack[vars.selection].id].heldpackswaps, save[pack[vars.selection].id].word, save[pack[vars.selection].id].puzzleswaps, save[pack[vars.selection].id].bombs, 2)
					else
						scenemanager:switchscene(game, pack[vars.selection], 1, 0, nil, 0, {}, 1)
					end
				else
					scenemanager:switchscene(game, pack[vars.selection], 1)
				end
			end)
		else
			vars.bump = -3
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
		end
	end
end

if platform == 'love' then return packselect end