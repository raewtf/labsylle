import 'game'

-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics
local smp <const> = pd.sound.sampleplayer
local text <const> = gfx.getLocalizedText
local black <const> = gfx.kColorBlack
local white <const> = gfx.kColorWhite
local clear <const> = gfx.kColorClear
local bayer4 <const> = gfx.image.kDitherTypeBayer4x4
local center <const> = kTextAlignment.center
local right <const> = kTextAlignment.right

class('packselect').extends(gfx.sprite) -- Create the scene's class
function packselect:init(...)
	packselect.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	-- Should this scene redraw the sprites constantly?
	if save.menubg then
		gfx.sprite.setAlwaysRedraw(true)
		redraw = true
	else
		gfx.sprite.setAlwaysRedraw(false)
		redraw = false
	end

	-- TODO: add key repeat
	-- TODO: make scroll bar hanger larger

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
				-- TODO: leaderboard popup for given pack
			end)
		end
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new('fonts/discoteca'),
		mask = gfx.image.new('images/mask'),
		bomb = gfx.image.new('images/bomb'),
		swish1 = smp.new('audio/sfx/swish1'),
		swish2 = smp.new('audio/sfx/swish2'),
		swish3 = smp.new('audio/sfx/swish3'),
		block1 = smp.new('audio/sfx/block1'),
		block2 = smp.new('audio/sfx/block2'),
		block3 = smp.new('audio/sfx/block3'),
		block4 = smp.new('audio/sfx/block4'),
		block5 = smp.new('audio/sfx/block5'),
		pop1 = smp.new('audio/sfx/pop1'),
		pop2 = smp.new('audio/sfx/pop2'),
		pop3 = smp.new('audio/sfx/pop3'),
		pop4 = smp.new('audio/sfx/pop4'),
		pop5 = smp.new('audio/sfx/pop5'),
	}

	vars = {
		return_pack = args[1],
		selection = 1,
		sellerp = 1,
		scroll = 0,
		scroll_target = 0,
		bump = 0,
		gaming = pd.timer.new(0, 1, 1),
		reset = false,
	}
	vars.packselectHandlers = {
		upButtonDown = function()
			if vars.selection > 1 then
				vars.selection -= 1
				packselect:scroll(true)
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
				gfx.sprite.redrawBackground()
			else
				vars.scroll += 10
				vars.sellerp -= 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			end
		end,

		downButtonDown = function()
			if vars.selection < #pack then
				vars.selection += 1
				packselect:scroll(true)
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
				gfx.sprite.redrawBackground()
			else
				vars.scroll -= 10
				vars.sellerp += 1
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			end
		end,

		BButtonDown = function()
			if pack == packs then
				scenemanager:transitionscene(title, false, 1)
			else
				scenemanager:transitionscene(title, false, 3)
			end
			randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
		end,

		AButtonDown = function()
			if pack[vars.selection].puzzles ~= nil and #pack[vars.selection].puzzles > 0 then
				fademusic()
				randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
				pd.inputHandlers.pop()
				vars.gaming:resetnew(350, 1, -0.75)
				vars.gaming.timerEndedCallback = function()
					if save[pack[vars.selection].id] ~= nil then
						if save[pack[vars.selection].id].status == 'in_progress' then
							scenemanager:switchscene(game, pack[vars.selection], save[pack[vars.selection].id].puzzle, save[pack[vars.selection].id].heldpackswaps, save[pack[vars.selection].id].word, save[pack[vars.selection].id].puzzleswaps, save[pack[vars.selection].id].bombs, 2)
						else
							scenemanager:switchscene(game, pack[vars.selection], 1, 0, nil, 0, {}, 1)
						end
					else
						scenemanager:switchscene(game, pack[vars.selection], 1)
					end
				end
			else
				vars.bump = -3
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			end
		end,
	}
	if scenemanager.transitioning then
		vars.handlerdelay = pd.timer.performAfterDelay(scenemanager.transitiontime, function()
			pd.inputHandlers.push(vars.packselectHandlers)
		end)
	else
		pd.inputHandlers.push(vars.packselectHandlers)
	end

	for i = 1, #pack do
		if vars.return_pack == pack[i] then
			vars.selection = i
		end
		assets['packtext' .. i] = gfx.image.new(360, 50)
		gfx.lockFocus(assets['packtext' .. i])
			packselect:drawpacktext(i)
		gfx.unlockFocus()
	end

	packselect:scroll(false)

	vars.gaming.discardOnCompletion = false

	create_bg()

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		draw_bg()

		local holderheight = 200
		local center = (240 - holderheight) / 2
		local barheight = holderheight / #pack

		gfx.setDitherPattern(0.75,  bayer4)
		gfx.fillRect(378, 0, 22, 240)
		gfx.setDitherPattern(0.25, bayer4)
		gfx.fillRect(384, center, 10, holderheight)
		gfx.setColor(black)
		gfx.drawRect(384, center, 10, holderheight)
		gfx.setColor(white)
		gfx.fillRoundRect(381, (holderheight + center + 1) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight - 2, 3)
		gfx.setColor(black)
		gfx.drawRoundRect(381, (holderheight + center) - barheight - ((#pack - vars.sellerp)/#pack) * holderheight, 16, barheight, 3)

		gfx.setDrawOffset(0, vars.scroll)

		for i = 1, #pack do
			local y = -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0)
			if (y + 50 > -vars.scroll and y < -vars.scroll + 240) then
				packselect:drawpack(i)
			end
		end

		gfx.setDrawOffset(0, 0)

		gfx.setColor(white)
		gfx.setDitherPattern(vars.gaming.value, bayer4)
		gfx.fillRect(0, 0, 400, 240)
	end)

	newmusic('audio/music/title', true)
	self:add()
end

function packselect:drawpack(i)
	if vars.selection == i then gfx.setLineWidth(4) end
	gfx.setColor(white)
	gfx.setDitherPattern(0.15, bayer4)
	gfx.fillRoundRect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0), -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0), 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	gfx.setColor(black)
	gfx.drawRoundRect(10 - tonumber(vars.selection == i and 3 + vars.bump or 0), -45 + (55 * i) - tonumber(vars.selection == i and 3 + vars.bump or 0), 360 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == i and ((3 + vars.bump) * 2) or 0), 5)
	if vars.selection == i then gfx.setLineWidth(2) end
	assets['packtext' .. i]:draw(0, -55 + (55 * i))
end

function packselect:drawpacktext(i)
	assets.disco:drawText(pack[i].name or '', 20, 21)
	local len = assets.disco:getTextWidth(pack[i].name or '')
	assets.discoteca:drawText((pack[i].subtitle ~= nil and '(' .. pack[i].subtitle .. ')' or ''), 25 + len, 21)
	assets.discoteca:drawText((pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. (pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' puzzle' or ' puzzles'), 20, 35)
	local len = assets.discoteca:getTextWidth((pack[i].difficulty ~= nil and pack[i].difficulty .. ' — ' or '') .. (pack[i].puzzles ~= nil and #pack[i].puzzles or '0') .. ((pack[i].puzzles ~= nil and #pack[i].puzzles == 1) and ' puzzle' or ' puzzles'))
	if pack[i].contains_impostors then
		assets.mask:draw(22 + len, 37)
	end
	if pack[i].contains_bombs then
		assets.bomb:draw(23 + (pack[i].contains_impostors and 38 or 0) + len, 37)
	end
	if save[pack[i].id] ~= nil then
		if save[pack[i].id].status ~= nil then
			if save[pack[i].id].status == 'in_progress' then
				assets.discoteca:drawTextAligned('In Progress', 361, 21, right)
			elseif save[pack[i].id].status == 'complete' then
				assets.discoteca:drawTextAligned('Complete!', 361, 21, right)
			end
		end
		if save[pack[i].id].packswaps ~= nil then
			assets.discoteca:drawTextAligned('Best: ' .. save[pack[i].id].packswaps .. (save[pack[i].id].packswaps == 1 and ' pack swap' or ' pack swaps'), 361, 35, right)
		else
			assets.discoteca:drawTextAligned(save[pack[i].id].puzzle - 1 .. ' of ' .. (pack[i].puzzles ~= nil and #pack[i].puzzles or 0) .. ' completed', 361, 35, right)
		end
	else
		assets.discoteca:drawTextAligned('Unplayed', 361, 28, right)
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
	-- TODO: add crank scrolling
	vars.bump -= vars.bump * 0.6
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	vars.sellerp += (vars.selection - vars.sellerp) * 0.6
	if vars.sellerp <= vars.selection + 0.1 and vars.sellerp >= vars.selection - 0.1 and vars.sellerp ~= vars.selection then
		vars.sellerp = vars.selection
	end

	vars.scroll += (vars.scroll_target - vars.scroll) * 0.6
	if vars.scroll > vars.scroll_target - 0.1 and vars.scroll < vars.scroll_target + 0.1 and vars.scroll ~= vars.scroll_target then
		vars.scroll = vars.scroll_target
	end

	if not redraw then
		if vars.bump ~= 0 or vars.scroll ~= vars.scroll_target or vars.gaming.timeLeft ~= 0 then
			gfx.sprite.redrawBackground()
		end
		if vars.sellerp ~= vars.selection then
			gfx.sprite.addDirtyRect(378, 0, 22, 240)
		end
	end
	if vars.reset then
		gfx.sprite.redrawBackground()
		vars.reset = false
	end
end