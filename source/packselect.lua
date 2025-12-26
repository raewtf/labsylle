local pd
local gfx
local center
local right

if platform == 'peedee' then
	import 'game'

	pd = playdate
	gfx = pd.graphics
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
			if catalog then
				menu:addMenuItem('pack boards', function()
					vars.handler = 'leaderboards'
					self:refreshboards()
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
	game = require 'game'

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
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		mask = newimage('images/mask'),
		bomb = newimage('images/bomb'),
		trash = newimage('images/trash'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		bubble1 = newsound('audio/sfx/bubble1'),
		bubble2 = newsound('audio/sfx/bubble2'),
		bubble3 = newsound('audio/sfx/bubble3'),
		scribble = newsound('audio/sfx/scribble'),
		pop = newsound('audio/sfx/pop'),
	}

	vars = {
		return_pack = args[1],
		selection = 1,
		sellerp = 1,
		scroll = 0,
		scroll_target = 0,
		bump = 0,
		lbbump = 0,
		reset = false,
		handler = 'packselect',
		lbloading = false,
		result = {},
		reset_armed = 0,
		reset_lerp = 0,
	}

	newtimer('gaming', 0, 1, 1)

	for i = 1, #pack do
		if vars.return_pack == pack[i] then
			vars.selection = i
		end
		self:packtextprep(i)
	end

	packselect:scroll(false)

	create_bg()

	newmusic('audio/music/title', true)
end

function packselect:resetpack(i)
	for i = 1, #save[pack[i].id] do
		table.remove(save[pack[i].id], 1)
	end
	save[pack[i].id] = nil
	self:packtextprep(i)
	vars.reset = true
end

function packselect:packtextprep(i)
	if platform == 'peedee' then
		if assets['packtext' .. i] == nil then
			assets['packtext' .. i] = newimage(360, 50)
		else
			assets['packtext' .. i]:clear(gfx.kColorClear)
		end
		gfx.lockFocus(assets['packtext' .. i])
		packselect:drawpacktext(i)
		gfx.unlockFocus()
	elseif platform == 'love' then
		assets['packtext' .. i] = gfx.newCanvas(360, 50)
		gfx.setCanvas(assets['packtext' .. i])
			gfx.push()
			local sx, sy, sw, sh = gfx.getScissor()
			gfx.setScissor()
			gfx.origin()
			gfx.clear()
			packselect:drawpacktext(i)
			gfx.setScissor(sx, sy, sw, sh)
			gfx.pop()
		gfx.setCanvas()
	end
end

function packselect:drawpacktext(i)
	drawtext(assets.disco, pack[i].name or '', 20, 21)
	local len = textwidth(assets.disco, pack[i].name or '')
	if pack == packs and i > 1 then
		drawtext(assets.discoteca, '(Standard Pak #' .. i .. ')', 25 + len, 21)
	else
		drawtext(assets.discoteca, (pack[i].subtitle ~= nil and '(' .. pack[i].subtitle .. ')' or ''), 25 + len, 21)
	end
	drawtext(assets.discoteca, (pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' Puzzle' or ' Puzzles'), 20, 35)
	local len = textwidth(assets.discoteca, (pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' Puzzle' or ' Puzzles'))
	setcolor('white')
	if pack[i].contains_impostors then
		drawimage(assets.mask, 22 + len, 37)
	end
	if pack[i].contains_bombs then
		drawimage(assets.bomb, 23 + (pack[i].contains_impostors and 38 or 0) + len, 37)
	end
	setcolor()
	if save[pack[i].id] ~= nil then
		if save[pack[i].id].status ~= nil then
			if save[pack[i].id].status == 'in_progress' then
				drawtext(assets.discoteca, 'In Progress', 361, 21, right)
			elseif save[pack[i].id].status == 'complete' then
				drawtext(assets.discoteca, 'Complete!', 361, 21, right)
			end
		end
		if save[pack[i].id].packswaps ~= nil then
			drawtext(assets.discoteca, 'Best: ' .. commalize(save[pack[i].id].packswaps) .. (save[pack[i].id].packswaps == 1 and ' Pack Swap' or ' Pack Swaps'), 361, 35, right)
		else
			drawtext(assets.discoteca, commalize(save[pack[i].id].puzzle - 1) .. ' of ' .. commalize(pack[i].puzzles ~= nil and #pack[i].puzzles or 0) .. ' Completed', 361, 35, right)
		end
	else
		drawtext(assets.discoteca, 'Unplayed', 361, 28, right)
	end
end

function packselect:drawpack(i)
	local offset = 0
	if i == vars.selection then
		offset = -vars.reset_lerp
		setcolor(black, -(vars.reset_lerp / 60) + 1)
		fillrect(340 + (offset / 3), -45 + (55 * i) + vars.scroll, 50, 50, 5)
		if vars.reset_lerp > 30 then
			setcolor('white')
			drawimage(assets.trash, 364 + (offset / 2), -34 + (55 * i) + vars.scroll)
		end
		setcolor()
	end
	if vars.selection == i then gfx.setLineWidth(4) end
	setcolor('white', 0.15)
	fillrect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0) + offset, -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0) + vars.scroll, 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	setcolor()
	drawrect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0) + offset, -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0) + vars.scroll, 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == i then gfx.setLineWidth(2) end
	setcolor('white')
	drawimage(assets['packtext' .. i], 0 + offset, -55 + (55 * i) + vars.scroll)
	setcolor()
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

function packselect:refreshboards()
	if vars.lbloading then return end
	vars.lbloading = true
	vars.result = {}
	vars.best = {}
	if platform == 'peedee' then gfx.sprite.redrawBackground() end
	pd.scoreboards.getScores(pack[vars.selection].id, function(status, result)
		if status.code == 'OK' then
			vars.result = result
		else
			vars.result = 'fail'
		end
		vars.lbloading = false
		if platform == 'peedee' then gfx.sprite.redrawBackground() end
	end)
end

function packselect:update()
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

		local ticks = pd.getCrankTicks(6)
		if ticks ~= 0 and not scenemanager.transitioning and vars.handler == 'packselect' then
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

	vars.bump = vars.bump - (vars.bump * 0.4)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	vars.lbbump = vars.lbbump - (vars.lbbump * 0.4)
	if vars.lbbump <= 0.1 and vars.lbbump >= -0.1 and vars.lbbump ~= 0 then
		vars.lbbump = 0
	end

	vars.sellerp = vars.sellerp + ((vars.selection - vars.sellerp) * 0.6)
	if vars.sellerp <= vars.selection + 0.1 and vars.sellerp >= vars.selection - 0.1 and vars.sellerp ~= vars.selection then
		vars.sellerp = vars.selection
	end

	vars.scroll = vars.scroll + ((vars.scroll_target - vars.scroll) * 0.6)
	if vars.scroll > vars.scroll_target - 0.1 and vars.scroll < vars.scroll_target + 0.1 and vars.scroll ~= vars.scroll_target then
		vars.scroll = vars.scroll_target
	end

	vars.reset_lerp = vars.reset_lerp + ((vars.reset_armed - vars.reset_lerp) * 0.6)

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
	local ccenter = (240 - holderheight) / 2
	local barheight = holderheight / #pack

	setcolor('black', 0.75)
	fillrect(378, 0, 22, 240)
	setcolor('black', 0.25)
	fillrect(384, ccenter, 10, holderheight)
	setcolor()
	drawrect(384, ccenter, 10, holderheight)
	setcolor('white')
	fillrect(381, (holderheight + ccenter + 1) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight - 2, 3)
	setcolor()
	drawrect(381, (holderheight + ccenter) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight, 3)

	for i = 1, #pack do
		local y = -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0)
		if (y + 50 > -vars.scroll and y < -vars.scroll + 240) then
			packselect:drawpack(i)
		end
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
		fillrect(80, 200, 240, 30, 5)
		setcolor()
		drawrect(80, 200, 240, 30, 5)

		drawtext(assets.disco, pack[vars.selection].name, 20, 20)
		drawtext(assets.discoteca, 'Fewest Pack Swaps', 380, 20, right)

		if vars.lbloading then
			drawtext(assets.disco, ('Ⓑ' or string.upper(save.secondary)) .. ' Back', 200, 208, center)
		else
			drawtext(assets.disco, ('Ⓑ' or string.upper(save.secondary)) .. ' Back     ' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary)) .. ' Refresh', 200, 208, center)
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

function packselect:keypressed(button)
	if vars.handler == 'packselect' then
		if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
			if vars.selection > 1 then
				vars.selection = vars.selection - 1
				packselect:scroll(true)
				playsound(assets.swish)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				rumble(0.3, 0.3, 0.025)
			else
				vars.scroll = vars.scroll + 10
				vars.sellerp = vars.sellerp - 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
			end
			vars.reset_armed = 0
			vars.reset_lerp = 0
		elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
			if vars.selection < #pack then
				vars.selection = vars.selection + 1
				packselect:scroll(true)
				playsound(assets.swish)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				rumble(0.3, 0.3, 0.025)
			else
				vars.scroll = vars.scroll - 10
				vars.sellerp = vars.sellerp + 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
			end
			vars.reset_armed = 0
			vars.reset_lerp = 0
		elseif button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
			if vars.reset_armed < 5 and save[pack[vars.selection].id] ~= nil then
				vars.reset_armed = 60
				randomizesfx(assets.bubble1, assets.bubble2, assets.bubble3)
			end
		elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
			if vars.reset_armed > 5 then
				vars.reset_armed = 0
				playsound(assets.pop)
			end
		elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			if pack[1] == packs[1] then
				scenemanager:transitionscene(title, false, 1)
			else
				scenemanager:transitionscene(title, false, 5)
			end
			playsound(assets.pop)
			rumble(0.3, 0.3, 0.025)
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
			if vars.reset_armed > 5 then
				self:resetpack(vars.selection)
				playsound(assets.scribble)
				vars.reset_armed = 0
			else
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
					rumble(0.3, 0.3, 0.025)
				else
					vars.bump = -3
					randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
					rumble(0.1, 0.1, 0.025)
				end
			end
		end
	elseif vars.handler == 'leaderboards' then
		if button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			vars.handler = 'packselect'
			playsound(assets.pop)
			rumble(0.3, 0.3, 0.025)
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
			if vars.lbloading then
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
				vars.lbbump = -3
			else
				self:refreshboards()
				playsound(assets.pop)
				rumble(0.3, 0.3, 0.025)
			end
		end
	end
end

if platform == 'love' then return packselect end