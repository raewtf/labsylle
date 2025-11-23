import 'results'

-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics
local geo <const> = pd.geometry
local smp <const> = pd.sound.sampleplayer
local text <const> = gfx.getLocalizedText
local sin <const> = math.sin
local cos <const> = math.cos
local rad <const> = math.rad
local black <const> = gfx.kColorBlack
local white <const> = gfx.kColorWhite
local bayer4 <const> = gfx.image.kDitherTypeBayer4x4
local center <const> = kTextAlignment.center
local right <const> = kTextAlignment.right
local ceil <const> = math.ceil

class('game').extends(gfx.sprite) -- Create the scene's class
function game:init(...)
	game.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	-- Should this scene redraw the sprites constantly?
	if save.background == 4 then
		gfx.sprite.setAlwaysRedraw(true)
		redraw = true
	else
		gfx.sprite.setAlwaysRedraw(false)
		redraw = false
	end

	-- TODO: smear as text leaves (maybe header too?)
	-- TODO: "Perfect!" label when pack ~= 'speed' and optimum route
	-- TOOD: add timer to quik-word timer when pack == 'speed' and optimum route
	-- TODO: add save packettes for 'perfect' bool in each puzzle
	-- TODO: hint after (optimal * 2.5) wrong swaps. find the first wrong one, and indicate its proper position

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
		if vars.pack == 'speed' then
			menu:addMenuItem('quit', function()
				stopmusic()
				assets.speedcountdown:stop()
				assets.speedcountin:stop()
				quikword:pause()
				vars.playing = false
				scenemanager:transitionscene(title, false, 2)
			end)
		else
			menu:addMenuItem('quit', function()
				stopmusic()
				save[vars.pack.id].puzzle = vars.puzzle
				save[vars.pack.id].puzzleswaps = nil
				save[vars.pack.id].heldpackswaps = vars.packswaps
				save[vars.pack.id].word = nil
				save[vars.pack.id].bombs = nil
				vars.playing = false
				scenemanager:transitionscene(packselect, vars.pack)
			end)
			menu:addMenuItem('suspend', function()
				stopmusic()
				save[vars.pack.id].puzzle = vars.puzzle
				save[vars.pack.id].puzzleswaps = vars.swaps
				save[vars.pack.id].heldpackswaps = vars.packswaps
				save[vars.pack.id].word = vars.word
				if vars.bombs[1] ~= nil then
					save[vars.pack.id].bombs = vars.bombs
				end
				vars.playing = false
				scenemanager:transitionscene(packselect, vars.pack)
			end)
			if not vars.finished and vars.playing then
				menu:addMenuItem('retry puzzle', function()
					game:restart()
				end)
			end
		end
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new(save.boldtext and 'fonts/disco' or 'fonts/discoteca'),
		swish = smp.new('audio/sfx/swish'),
		block1 = smp.new('audio/sfx/block1'),
		block2 = smp.new('audio/sfx/block2'),
		block3 = smp.new('audio/sfx/block3'),
		block4 = smp.new('audio/sfx/block4'),
		block5 = smp.new('audio/sfx/block5'),
		slide1 = smp.new('audio/sfx/slide1'),
		slide2 = smp.new('audio/sfx/slide2'),
		slide3 = smp.new('audio/sfx/slide3'),
		slide4 = smp.new('audio/sfx/slide4'),
		slide5 = smp.new('audio/sfx/slide5'),
		bubble1 = smp.new('audio/sfx/bubble1'),
		bubble2 = smp.new('audio/sfx/bubble2'),
		bubble3 = smp.new('audio/sfx/bubble3'),
		snap1 = smp.new('audio/sfx/snap1'),
		snap2 = smp.new('audio/sfx/snap2'),
		snap3 = smp.new('audio/sfx/snap3'),
		scribble = smp.new('audio/sfx/scribble'),
	}

	vars = {
		pack = args[1],
		puzzle = args[2] or 1,
		packswaps = args[3] or 0,
		word = args[4] or nil,
		swaps = args[5] or 0,
		bombs = args[6] or {},
		shouldanimate = args[7] or 1,
		finished = false,
		tilevis = {
			width = 55,
			height = 40,
			gap = 5,
			impostor_gap = 30,
			radius = 3,
			offset = 5,
			parallax = 5,
			font = 'disco',
		},
		headerx = pd.timer.new(1, 0, 0),
		rattle = pd.timer.new(50, -1, 1),
		texx = pd.timer.new(1, 0, 0),
		selection = 1,
		sellerp = 0,
		playing = false,
		cursor = pd.timer.new(1, 1, 1),
		crank = 0,
		boomp = 0,
	}
	vars.gameHandlers = {
		leftButtonDown = function()
			if vars.selection > 1 then
				vars['tileoffsety' .. vars.selection + 1]:resetnew(300, 0, vars.tilevis.offset, pd.easingFunctions.outCirc)
				vars.selection -= 1
				vars.crank = 0
				randomizesfx(assets.snap1, assets.snap2, assets.snap3)
			else
				vars.sellerp -= 0.5
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			end
		end,

		rightButtonDown = function()
			if vars.selection < vars.tiles - 1 then
				vars['tileoffsety' .. vars.selection]:resetnew(300, 0, vars.tilevis.offset, pd.easingFunctions.outCirc)
				vars.selection += 1
				vars.crank = 0
				randomizesfx(assets.snap1, assets.snap2, assets.snap3)
			else
				vars.sellerp += 0.5
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			end
		end,

		upButtonDown = function()
			if not save.autosubmit then
				if game:check() then
					playsound(assets.swish)
					game:endround()
					if vars.pack == 'speed' then vars.grace += 1 end
				else
					playsound(assets.scribble)
					for i = 1, vars.tiles do
						vars['tileoffsety' .. i]:resetnew(600, 0, vars['tileoffsety' .. i].value, pd.easingFunctions.outElastic)
					end
				end
			end
		end,

		BButtonDown = function()
			if not save.crank then
				vars.crank += 180
				game:swap()
			end
		end,

		AButtonDown = function()
			if not save.crank then
				vars.crank -= 180
				game:swap()
			end
		end,
	}

	if save.background == 1 then
		assets.background = gfx.image.new('images/forest')
	elseif save.background == 2 then
		assets.background = gfx.image.new('images/mountains')
	elseif save.background == 3 then
		assets.background = gfx.image.new('images/frame')
	elseif save.background == 5 then
		assets.background = gfx.image.new('images/city')
	end

	if vars.pack == 'speed' then
		assets.cal = gfx.font.new('fonts/cal')
		assets.caldown = gfx.font.new('fonts/caldown')
		assets.speedcountdown = smp.new('audio/sfx/speedcountdown')
		assets.speedcountin1 = smp.new('audio/sfx/speedcountin1')
		assets.speedcountin2 = smp.new('audio/sfx/speedcountin2')
		assets.speedcountin3 = smp.new('audio/sfx/speedcountin3')
		assets.speedcountin4 = smp.new('audio/sfx/speedcountin4')
		assets.speedcountin5 = smp.new('audio/sfx/speedcountin5')
		assets.speedcountin6 = smp.new('audio/sfx/speedcountin6')

		local random = math.random(1, #quikwords)

		vars.target = table.shallowcopy(quikwords[random])
		vars.word = table.shallowcopy(quikwords[random])
		vars.tiles = #vars.target

		vars.bigtext = ''

		local same = true
		while same do
			vars.word = shuffle(vars.word)
			for i = 1, vars.tiles do
				if vars.word[i] ~= vars.target[i] then
					same = false
					break
				end
			end
		end

		vars.grace = 0
	else
		assets.doubledisco = gfx.font.new('fonts/doubledisco')
		assets.complete = smp.new('audio/sfx/complete')

		if string.find(vars.pack.id, 'shapes_') then
			for i = 1, #vars.pack.shapes_used do
				assets[vars.pack.shapes_used[i] .. '_line'] = gfx.image.new('images/shapes/line/' .. vars.pack.shapes_used[i])
				assets[vars.pack.shapes_used[i] .. '_fill'] = gfx.image.new('images/shapes/fill/' .. vars.pack.shapes_used[i])
			end
			assets.stencil00 = gfx.image.new('images/stencil00')
			assets.stencil25 = gfx.image.new('images/stencil25')
			assets.stencil50 = gfx.image.new('images/stencil50')
			assets.stencil75 = gfx.image.new('images/stencil75')
			assets.stencil99 = gfx.image.new('images/stencil99')
		end

		vars.kerplode = pd.timer.new(1, 1, 1)
		vars.kerplode.discardOnCompletion = false

		if save[vars.pack.id] ~= nil then
			save[vars.pack.id].status = 'in_progress'
			save[vars.pack.id].puzzle = vars.puzzle
			save[vars.pack.id].heldpackswaps = vars.packswaps
		else
			save[vars.pack.id] = {
				status = 'in_progress',
			}
			save[vars.pack.id].puzzle = vars.puzzle
			save[vars.pack.id].heldpackswaps = vars.packswaps
		end

		vars.target = table.deepcopy(vars.pack.puzzles[vars.puzzle].target)
		vars.tiles = #vars.target[1]
		math.randomseed(#vars.target[1] * (vars.puzzle * 50))
		if vars.word == nil then
			vars.word = table.shallowcopy(vars.target[1])
			local same = true
			while same do
				vars.word = shuffle(vars.word)
				for i = 1, #vars.pack.puzzles[vars.puzzle].target do
					for n = 1, vars.tiles do
						if vars.word[n] ~= vars.target[i][n] then
							same = false
							break
						end
					end
				end
			end
		end
		vars.impostor = vars.pack.puzzles[vars.puzzle].impostor
		if vars.impostor then
			assets.mask = gfx.image.new('images/mask')
			assets.mask:setInverted(isdarkmode())
		end

		if vars.pack.puzzles[vars.puzzle].bombs ~= nil then
			if vars.bombs[1] == nil then
				vars.bombs = table.deepcopy(vars.pack.puzzles[vars.puzzle].bombs)
			end
			assets.bomb = gfx.image.new('images/bomb')
			assets.ash = gfx.image.new('images/ash')
			assets.fuse1 = smp.new('audio/sfx/fuse1')
			assets.fuse2 = smp.new('audio/sfx/fuse2')
			assets.fuse3 = smp.new('audio/sfx/fuse3')
			assets.kerplode = smp.new('audio/sfx/kerplode')
		end

		if vars.pack.puzzles[vars.puzzle].tilevis ~= nil then
			if vars.pack.puzzles[vars.puzzle].tilevis.width ~= nil then vars.tilevis.width = vars.pack.puzzles[vars.puzzle].tilevis.width end
			if vars.pack.puzzles[vars.puzzle].tilevis.height ~= nil then vars.tilevis.height = vars.pack.puzzles[vars.puzzle].tilevis.height end
			if vars.pack.puzzles[vars.puzzle].tilevis.gap ~= nil then vars.tilevis.gap = vars.pack.puzzles[vars.puzzle].tilevis.gap end
			if vars.pack.puzzles[vars.puzzle].tilevis.impostor_gap ~= nil then vars.tilevis.impostor_gap = vars.pack.puzzles[vars.puzzle].tilevis.impostor_gap end
			if vars.pack.puzzles[vars.puzzle].tilevis.radius ~= nil then vars.tilevis.radius = vars.pack.puzzles[vars.puzzle].tilevis.radius end
			if vars.pack.puzzles[vars.puzzle].tilevis.offset ~= nil then vars.tilevis.offset = vars.pack.puzzles[vars.puzzle].tilevis.offset end
			if vars.pack.puzzles[vars.puzzle].tilevis.parallax ~= nil then vars.tilevis.parallax = vars.pack.puzzles[vars.puzzle].tilevis.parallax end
			if vars.pack.puzzles[vars.puzzle].tilevis.font ~= nil then vars.tilevis.font = vars.pack.puzzles[vars.puzzle].tilevis.font end
		end
	end

	assets.header_base = gfx.image.new(400, 40 + (save.showcontrols and 20 or 0))
	gfx.lockFocus(assets.header_base)
		gfx.setColor(white)
		gfx.fillRect(0, 0, 400, 38 + (save.showcontrols and 20 or 0))
		gfx.setColor(black)
		if vars.pack == 'speed' then
			assets.disco:drawTextAligned('Quik-Word — Round ' .. commalize(vars.puzzle), 390, 5, right)
			if not save.time then
				assets.discoteca:drawTextAligned('Best score: ' .. commalize((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest)) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' round' or ' rounds'), 390, 18, right)
			end
		else
			assets.disco:drawText(vars.pack.name, 10, 5)
			assets.discoteca:drawText(vars.pack.subtitle .. ' — ' .. commalize(vars.puzzle) .. ' of ' .. commalize(#vars.pack.puzzles), 10, 18)
		end
		gfx.drawLine(0, 38 + (save.showcontrols and 20 or 0), 400, 38 + (save.showcontrols and 20 or 0))
		if save.showcontrols then
			gfx.setDitherPattern(0.5, bayer4)
			gfx.setLineWidth(1)
			gfx.drawLine(30, 34, 370, 34)
			gfx.setColor(black)
			gfx.setLineWidth(2)
			assets.disco:drawText('↔️ Move  ' .. tostring(save.crank and '🎣' or 'Ⓐ/Ⓑ') .. ' Swap  ' .. tostring(save.autosubmit and '' or '⬆️ Submit'), 10, 38)
		end
	gfx.unlockFocus()

	assets.header = gfx.image.new(400, 40 + (save.showcontrols and 20 or 0))
	game:updateheader(pd.getTime())

	if vars.pack ~= 'speed' and vars.pack.puzzles[vars.puzzle].text ~= nil then
		assets.text = gfx.image.new(400, 120)
		gfx.lockFocus(assets.text)
			assets.disco:drawTextAligned(vars.pack.puzzles[vars.puzzle].text, 200, 0, center)
		gfx.unlockFocus()
	end

	if vars.shouldanimate > 0 then
		vars.headerx.discardOnCompletion = false
		if vars.puzzle == 1 or vars.shouldanimate == 2 then
			vars.headerx:resetnew(500, -90, 0, pd.easingFunctions.outBack)
		end

		if vars.pack ~= 'speed' then
			vars.texx.discardOnCompletion = false
			if vars.puzzle - 1 == 0 or vars.pack.puzzles[vars.puzzle - 1].text == nil or vars.shouldanimate == 2 then
				vars.texx:resetnew(500, 120, 0, pd.easingFunctions.outBack)
			end
		end
	end

	vars.rattle.repeats = true
	vars.cursor.discardOnCompletion = false

	for i = 1, vars.tiles do
		vars['tileoffsetx' .. i] = pd.timer.new(500, 550, 0, pd.easingFunctions.outBack)
		vars['tileoffsetx' .. i].discardOnCompletion = false
		vars['tileoffsetx' .. i].delay = 25 * (i - 1)
		vars['tileoffsety' .. i] = pd.timer.new(1, vars.tilevis.offset, vars.tilevis.offset)
		vars['tileoffsety' .. i].discardOnCompletion = false
	end

	if vars.pack == 'speed' then
		vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
			if vars.puzzle == 1 then
				vars.countdown3 = pd.timer.performAfterDelay(1000, function()
					playsound(assets.speedcountdown)
					vars.bigtext = '3'
					gfx.sprite.redrawBackground()
				end)
				vars.countdown2 = pd.timer.performAfterDelay(2000, function()
					vars.bigtext = '2'
					gfx.sprite.redrawBackground()
				end)
				vars.countdown1 = pd.timer.performAfterDelay(3000, function()
					vars.bigtext = '1'
					gfx.sprite.redrawBackground()
				end)
				vars.countdownafter = pd.timer.performAfterDelay(5000, function()
					vars.bigtext = ''
					gfx.sprite.redrawBackground()
				end)
			end
			vars.countdowngo = pd.timer.performAfterDelay(0 + tonumber(vars.puzzle == 1 and 4000 or 0), function()
				if not vars.finished then
					if vars.puzzle == 1 then
						vars.bigtext = 'GO!'
						gfx.sprite.redrawBackground()
						quikword:resetnew(60000, 60000, 0)
						quikword.timerEndedCallback = function()
							vars.headerx:resetnew(500, 0, -90, pd.easingFunctions.inBack)
							game:endround()
						end
						newmusic('audio/music/quikword', true)
					else
						quikword:start()
						game:updateheader(pd.getTime())
					end
					vars.playing = true
					pd.inputHandlers.push(vars.gameHandlers)
					vars.cursor:resetnew(300, 1, 0.5, pd.easingFunctions.inOutSine)
				end
			end)
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = nil
		end
	else
		vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
			newmusic('audio/music/game', true)
			vars.playing = true
			pd.inputHandlers.push(vars.gameHandlers)
			vars.cursor:resetnew(300, 1, 0.5, pd.easingFunctions.inOutSine)
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = nil
			for n = 1, #vars.bombs do
				if vars.bombs[n].intensity == 4 then
					game:kerplode()
				end
			end
		end
	end

	local combi = vars.tilevis.width + vars.tilevis.gap
	local comma = (combi * vars.tiles) - vars.tilevis.gap
	if vars.impostor then comma += vars.tilevis.impostor_gap + 5 end
	local ccenter = (400 - comma) / 2
	local tiley = 120 - (vars.tilevis.height / 2)
	if assets.text ~= nil then tiley -= 14 else tiley += 20 end
	if save.showcontrols then tiley += 7 end

	if save.background == 4 then create_bg(true) end

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		-- Background drawing
		if assets.background ~= nil then assets.background:draw(0, 39 + (save.showcontrols and 10 or 0)) end
		if save.background == 4 then draw_bg(true) end

		-- Fade in from start and end of scene
		gfx.setColor(white)
		gfx.setDitherPattern(((vars.headerx.value / 50) + 1) / (assets.background ~= nil and 4 or 1), bayer4)
		gfx.fillRect(0, 0, 400, 240)

		-- Top bar
		assets.header:draw(0, 0 + vars.headerx.value)

		local time = pd.getTime()
		if vars.lasttime ~= nil and vars.lasttime.minute ~= time.minute then
			game:updateheader(time)
		end
		vars.lasttime = time

		local parallax = (((vars.tiles / 2) - vars.sellerp) * vars.tilevis.parallax)

		gfx.setLineWidth(11 + vars.boomp)
		gfx.setDitherPattern(vars.cursor.value, bayer4)
		gfx.drawCircleAtPoint(ccenter + (combi * vars.sellerp - 1) - 2 + parallax + tonumber((vars.impostor and (vars.selection + 1 == vars.tiles)) and (vars.tilevis.impostor_gap / 2) or 0), tiley + (vars.tilevis.height / 2) - 2, (combi / 1.5) + vars.boomp)
		gfx.setColor(black)
		gfx.setLineWidth(2)

		gfx.setDitherPattern(0.75, bayer4)
		if vars.impostor then
			local tilex = ccenter + (combi * (vars.tiles - 1)) + vars['tileoffsetx' .. vars.tiles].value + parallax + vars.tilevis.impostor_gap
			gfx.fillRoundRect(tilex - 5, tiley - 30, vars.tilevis.width + 10, vars.tilevis.height + 40, 5)
			assets.mask:drawAnchored(tilex + (vars.tilevis.width / 2) + 1, tiley - 20, 0.5, 0)
		end

		for i = 1, (vars.impostor and vars.tiles - 1 or vars.tiles) do
			local tilex = ccenter + (combi * (i - 1)) + vars['tileoffsetx' .. i].value + parallax
			gfx.fillRoundRect(tilex, tiley, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
		end
		gfx.setColor(black)

		for i = 1, vars.tiles do
			local tileoffsety = tiley - vars['tileoffsety' .. i].value
			if not ((i == vars.selection or i == vars.selection + 1) and (vars['tileoffsetx' .. vars.tiles].timeLeft == 0 and (not vars.finished or vars.crank ~= 0))) then
				local tilex = ccenter + (combi * (i - 1)) + vars['tileoffsetx' .. i].value + parallax
				if i == vars.tiles and vars.impostor then tilex += vars.tilevis.impostor_gap end
				game:drawblock(i, tilex, tiley, tileoffsety, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
			else
				local int = combi / 2
				local sinc = sin(rad(vars.crank)) * int
				local cosc = cos(rad(vars.crank)) * ((i == vars.tiles and vars.impostor) and int + vars.tilevis.impostor_gap or int)
				if i == vars.selection then
					sinc = -sinc
					cosc = -cosc
				end
				local pivot = (ccenter + (combi * vars.selection - 1) - 1)
				local pivotx = pivot - vars.tilevis.width / 2 + parallax
				game:drawblock(i, pivotx + cosc, tiley + (vars.cursor.value * 10) - 10 + sinc, tileoffsety + (vars.cursor.value * 10) - 10 + sinc, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
			end
		end

		if vars.pack == 'speed' then
			-- Quik-word countdown
			assets.caldown:drawTextAligned(vars.bigtext, 200, 150, center)
		else
			-- Puzzle text
			if assets.text ~= nil then
				gfx.setColor(white)
				gfx.setDitherPattern(0.10, bayer4)
				gfx.fillRect(0, 160 + vars.texx.value, 400, 200)
				gfx.setColor(black)
				gfx.drawLine(0, 160 + vars.texx.value, 400, 160 + vars.texx.value)
				assets.text:draw(0, 170 + vars.texx.value)
			end
			-- Explosion
			if vars.kerplode.timeLeft ~= 0 then
				gfx.setColor(white)
				gfx.setDitherPattern(vars.kerplode.value, bayer4)
				gfx.fillRect(0, 0, 400, 240)
				gfx.setColor(black)
				gfx.setDitherPattern((vars.kerplode.value / 2) + 0.5, bayer4)
				gfx.fillRect(0, 0, 400, 240)
				gfx.setColor(black)
			end
		end
	end)

	self:add()
	randomizesfx(assets.bubble1, assets.bubble2, assets.bubble3)
end

function game:updateheader(time)
	gfx.lockFocus(assets.header)
		assets.header_base:draw(0, 0)

		if vars.pack == 'speed' then
			assets.cal:drawText(ceil(quikword.value / 1000), 10, -1)
			if quikword.paused or quikword.timeLeft == 0 then
				gfx.setColor(white)
				gfx.setDitherPattern(0.25, bayer4)
				gfx.fillRect(0, 0, 65, 36)
				gfx.setColor(black)
			end
		else
			assets.disco:drawTextAligned(commalize(vars.swaps) .. (vars.swaps == 1 and ' swap' or ' swaps'), 390, 5, right)
		end

		if save.time then
			if vars.pack == 'speed' then
				assets.discoteca:drawTextAligned('Best score: ' .. commalize((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest)) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' round' or ' rounds') .. ' — ' .. (is24hourtime() and (string.format("%02d:%02d", time.hour, time.minute)) or (string.format("%01d:%02d", ((time.hour % 12) == 0 and 12 or (time.hour % 12)), time.minute))), 390, 18, right)
			else
				assets.discoteca:drawTextAligned(commalize(vars.packswaps + vars.swaps) .. (vars.packswaps + vars.swaps == 1 and ' pack swap' or ' pack swaps') .. ' — ' .. (is24hourtime() and (string.format("%02d:%02d", time.hour, time.minute)) or (string.format("%01d:%02d", ((time.hour % 12) == 0 and 12 or (time.hour % 12)), time.minute))), 390, 18, right)
			end
		else
			if vars.pack ~= 'speed' then
				assets.discoteca:drawTextAligned(commalize(vars.packswaps + vars.swaps) .. (vars.packswaps + vars.swaps == 1 and ' pack swap' or ' pack swaps') .. ' — ' .. (is24hourtime() and (string.format("%02d:%02d", time.hour, time.minute)) or (string.format("%01d:%02d", ((time.hour % 12) == 0 and 12 or (time.hour % 12)), time.minute))), 390, 18, right)
			end
		end
	gfx.unlockFocus()
	gfx.sprite.addDirtyRect(0, 0, 400, 38 + vars.headerx.value)
end

function game:drawblock(i, x, y, offsety, width, height, radius)
	local darkwhite = (isdarkmode() and black or white)
	local darkblack = (isdarkmode() and white or black)
	local bomb = 0
	for n = 1, #vars.bombs do
		if vars.word[i] == vars.bombs[n].key then
			bomb = n
		end
	end
	if bomb > 0 then
		if vars.bombs[bomb].intensity == 4 and vars.kerplode.timerEndedCallback ~= nil then
			assets.ash:draw(x, y + vars.tilevis.height - 17)
			gfx.setDitherPattern(vars.kerplode.value / 2, bayer4)
			gfx.fillCircleAtPoint(x + (vars.tilevis.width / 2), y + (vars.tilevis.height / 3), (vars.tilevis.height / 2) + (vars.kerplode.value * 15))
			gfx.setColor(darkblack)
			return
		else
			x += vars.rattle.value * vars.bombs[bomb].intensity
		end
	end
	if isdarkmode() then gfx.setImageDrawMode(gfx.kDrawModeInverted) end
	gfx.setColor(darkblack)
	gfx.fillRoundRect(x, y, width, height, radius)
	gfx.setColor(darkwhite)
	gfx.fillRoundRect(x, offsety, width, height, radius)
	gfx.setColor(darkblack)
	gfx.drawRoundRect(x, offsety, width, height, radius)
	if i == vars.tiles and vars.impostor then
		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRoundRect(x, offsety, width, height, radius)
	end
	if bomb > 0 then
		gfx.setColor(darkblack)
		gfx.setDitherPattern(1 - (vars.bombs[bomb].intensity / 12), bayer4)
		gfx.fillRoundRect(x, offsety, width, height, radius)
	end
	gfx.setColor(black)
	if bomb > 0 then
		x -= vars.rattle.value * (vars.bombs[bomb].intensity / 3)
		assets.bomb:draw(x + 5, offsety + 5)
		assets.disco:drawText(commalize(vars.bombs[bomb].swaps), x + 19, offsety + 3)
	end
	if vars.pack ~= 'speed' and string.find(vars.pack.id, 'shapes_') then
		local shape1 = string.sub(vars.word[i], 1, 4)
		local color1 = string.sub(vars.word[i], 5, 6)
		local shape2 = string.sub(vars.word[i], 8, 11)
		local color2 = string.sub(vars.word[i], 12, 13)
		if shape1 ~= 'none' then
			if color1 ~= '00' then
				gfx.setStencilImage(assets['stencil'] .. color1)
				assets[shape1 .. '_fill']:draw(x + 2, offsety + 2)
				gfx.clearStencil()
			end
			assets[shape1 .. '_line']:draw(x + 2, offsety + 2)
		end
		if shape2 ~= 'none' then
			if color2 ~= '00' then
				gfx.setStencilImage(assets['stencil'] .. color2)
				assets[shape2 .. '_fill']:draw(x + vars.tilevis.width - 27, offsety + 2, gfx.kImageFlippedX)
				gfx.clearStencil()
			end
			assets[shape2 .. '_line']:draw(x + vars.tilevis.width - 27, offsety + 2, gfx.kImageFlippedX)
		end
	else
		assets[vars.tilevis.font]:drawTextAligned(vars.word[i], x + (width / 2), offsety + (height / 2) + (bomb > 0 and 0 or -(assets[vars.tilevis.font]:getHeight() / 2.3)), center)
	end
	if isdarkmode() then gfx.setImageDrawMode(gfx.kDrawModeCopy) end
end

function game:swap(dir)
	local kerploded = false
	if vars.pack ~= 'speed' then
		for n = 1, #vars.bombs do
			if vars.word[vars.selection] == vars.bombs[n].key or vars.word[vars.selection + 1] == vars.bombs[n].key then
				vars.bombs[n].swaps -= 1
				if vars.bombs[n].swaps == 3 then
					vars.bombs[n].intensity = 1
					playsound(assets.fuse1)
				elseif vars.bombs[n].swaps == 2 then
					vars.bombs[n].intensity = 2
					playsound(assets.fuse2)
				elseif vars.bombs[n].swaps == 1 then
					vars.bombs[n].intensity = 3
					playsound(assets.fuse3)
				elseif vars.bombs[n].swaps == 0 then
					vars.bombs[n].intensity = 4
					game:kerplode()
					kerploded = true
				end
			end
		end
		if vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
		end
	end
	if not kerploded then
		playsound(assets.swish)
		vars.swaps += 1
		vars.boomp = 5
		local hold = vars.word[vars.selection]
		vars.word[vars.selection] = vars.word[vars.selection + 1]
		vars.word[vars.selection + 1] = hold
		if vars.pack ~= 'speed' then
			save[vars.pack.id].puzzleswaps = vars.swaps
			save[vars.pack.id].word = vars.word
			game:updateheader(pd.getTime())
		end
	end
end

function game:kerplode()
	if not vars.finished and vars.playing then
		playsound(assets.kerplode)
		vars.playing = false
		pd.inputHandlers.pop()
		vars.cursor:resetnew(300, vars.cursor.value, 1, pd.easingFunctions.inOutSine)
		vars.crank = 0
		vars.kerplode:resetnew(3500, 0, 2, pd.easingFunctions.outSine)
		vars.kerplode.timerEndedCallback = function()
			for i = 1, vars.tiles do
				vars['tileoffsetx' .. i].delay = (30 * (i - 1))
				vars['tileoffsetx' .. i]:resetnew(500, 0, -550, pd.easingFunctions.inBack)
			end
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
				scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps, nil, 0, {}, 0)
			end
		end
	end
end

function game:endround()
	if not vars.finished then
		vars.finished = true
		pd.inputHandlers.pop()
		if vars.pack == 'speed' then
			if quikword.timeLeft ~= 0 then
				quikword:pause()
				game:updateheader(pd.getTime())
			end
		else
			if vars.puzzle == #vars.pack.puzzles then
				fademusic()
			end
			if vars.puzzle == #vars.pack.puzzles then
				vars.headerx:resetnew(500, 0, -90, pd.easingFunctions.inBack)
			end
			if vars.puzzle + 1 > #vars.pack.puzzles or vars.pack.puzzles[vars.puzzle + 1].text == nil then
				vars.texx:resetnew(500, 0, 120, pd.easingFunctions.inBack)
			end
		end
		vars.cursor:resetnew(300, vars.cursor.value, 1, pd.easingFunctions.inOutSine)
		vars.playing = false
		for i = 1, vars.tiles do
			vars.slidetimer = pd.timer.performAfterDelay(350 + (150 * (i - 1)), function()
				randomizesfx(assets.slide1, assets.slide2, assets.slide3, assets.slide4, assets.slide5)
			end)
			vars['tileoffsety' .. i].delay = 150 + (150 * (i - 1))
			vars['tileoffsety' .. i]:resetnew(400, vars.tilevis.offset, 0, pd.easingFunctions.inCirc)
			vars['tileoffsety' .. i].timerEndedCallback = function()
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5, 0.8 + (0.2 * i))
			end
		end
		vars['tileoffsety' .. vars.tiles].timerEndedCallback = function()
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5, 0.8 + (0.2 * vars.tiles))
			if vars.pack ~= 'speed' then
				playsound(assets.complete)
			end
			for i = 1, vars.tiles do
				vars['tileoffsetx' .. i].delay = (vars.pack == 'speed' and 50 or 900) + (30 * (i - 1))
				vars['tileoffsetx' .. i]:resetnew(500, 0, -550, pd.easingFunctions.inBack)
			end
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
				if vars.pack == 'speed' then
					if quikword.value == 0 then
						scenemanager:switchscene(results, vars.pack, vars.puzzle + vars.grace)
					else
						scenemanager:switchscene(game, 'speed', vars.puzzle + 1, 0, nil, 0, {}, 1)
					end
				else
					if vars.puzzle == #vars.pack.puzzles then
						save[vars.pack.id].status = 'complete'
						vars.packswaps += vars.swaps
						if save[vars.pack.id].packswaps ~= nil then
							if vars.packswaps < save[vars.pack.id].packswaps then
								save[vars.pack.id].packswaps = vars.packswaps
							end
						else
							save[vars.pack.id].packswaps = vars.packswaps
						end
						save[vars.pack.id].puzzle = nil
						save[vars.pack.id].puzzleswaps = nil
						save[vars.pack.id].word = nil
						save[vars.pack.id].bombs = nil
						scenemanager:switchscene(results, vars.pack, vars.packswaps + vars.swaps)
					else
						scenemanager:switchscene(game, vars.pack, vars.puzzle + 1, vars.packswaps + vars.swaps)
					end
				end
			end
		end
	end
end

function game:restart()
	if not vars.finished and vars.playing then
		pd.inputHandlers.pop()
		vars.cursor:resetnew(300, 0.5, 1, pd.easingFunctions.inOutSine)
		playsound(assets.scribble)
		vars.playing = false
		for i = 1, vars.tiles do
			vars['tileoffsetx' .. i].delay = 500 + (30 * (i - 1))
			vars['tileoffsetx' .. i]:resetnew(500, 0, -450, pd.easingFunctions.inBack)
		end
		vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
			scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps, nil, 0, {}, 0)
		end
	end
end

function game:check()
	local sameword = (#vars.target ~= nil and #vars.target or 1)
	if vars.pack == 'speed' then
		for i = 1, #vars.word do
			if vars.word[i] ~= vars.target[i] then
				sameword -= 1
				break
			end
		end
	else
		for i = 1, #vars.target do
			for n = 1, #vars.word do
				if vars.word[n] ~= vars.target[i][n] then
					sameword -= 1
					break
				end
			end
		end
	end

	return (sameword > 0 and true or false)
end

function game:update()
	vars.boomp -= vars.boomp * 0.3
	if vars.playing then
		vars.sellerp += (vars.selection - vars.sellerp) * 0.6
		if vars.sellerp <= vars.selection + 0.01 and vars.sellerp >= vars.selection - 0.01 and vars.sellerp ~= vars.selection then
			vars.sellerp = vars.selection
		end
		if save.crank then
			vars.crank += pd.getCrankChange()
			if pd.getCrankChange() == 0 then
				vars.crank -= vars.crank * 0.3
				if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
					vars.crank = 0
				end
			end
			if vars.crank > 90 then
				game:swap()
				vars.crank = -90
			end
			if vars.crank < -90 then
				game:swap()
				vars.crank = 90
			end
		else
			vars.crank -= vars.crank * 0.3
			if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
				vars.crank = 0
			end
		end

		if save.autosubmit and game:check() then
			game:endround()
			if vars.pack == 'speed' then vars.grace += 1 end
		end
	else
		vars.sellerp += ((vars.tiles / 2) - vars.sellerp) * 0.6
		if vars.sellerp <= (vars.tiles / 2) + 0.01 and vars.sellerp >= (vars.tiles / 2) - 0.01 and vars.sellerp ~= (vars.tiles / 2) then
			vars.sellerp = (vars.tiles / 2)
		end
		vars.crank -= vars.crank * 0.3
		if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
			vars.crank = 0
		end
	end

	if vars.pack == 'speed' then
		if vars.quikwold ~= nil then
			for i = 1, 60 do
				if vars.quikwold >= (i * 1000) and quikword.value < (i * 1000) then
					game:updateheader(pd.getTime())
				end
			end
			if vars.quikwold >= 15000 and quikword.value < 15000 then
				fademusic(9000)
			end
			if vars.quikwold >= 10000 and quikword.value < 10000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 9000 and quikword.value < 9000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 8000 and quikword.value < 8000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 7000 and quikword.value < 7000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 6000 and quikword.value < 6000 then
				playsound(assets.speedcountin2)
			end
			if vars.quikwold >= 5000 and quikword.value < 5000 then
				playsound(assets.speedcountin2)
			end
			if vars.quikwold >= 4000 and quikword.value < 4000 then
				playsound(assets.speedcountin3)
			end
			if vars.quikwold >= 3000 and quikword.value < 3000 then
				playsound(assets.speedcountin3)
			end
			if vars.quikwold >= 2000 and quikword.value < 2000 then
				playsound(assets.speedcountin4)
			end
			if vars.quikwold >= 1000 and quikword.value < 1000 then
				playsound(assets.speedcountin5)
			end
			if vars.quikwold > 0 and quikword.value <= 0 then
				playsound(assets.speedcountin6)
			end
		end
		vars.quikwold = quikword.value
	end

	if save.background ~= 4 then
		if vars.headerx.timeLeft ~= 0 or (vars.kerplode ~= nil and vars.kerplode.timeLeft ~= 0) then
			gfx.sprite.redrawBackground()
			return
		end
		if assets.text ~= nil and vars.texx.timeLeft ~= 0 then
			gfx.sprite.addDirtyRect(0, 120, 400, 120)
		end
		local xdone = false
		local ydone = false
		for i = 1, vars.tiles do
			if vars['tileoffsetx' .. i].timeLeft ~= 0 then xdone = true end
			if vars['tileoffsety' .. i].timeLeft ~= 0 then ydone = true end
		end
		if xdone or ydone or vars['tileoffsetx' .. vars.tiles].timeLeft ~= 0 or vars.cursor.timeLeft ~= 0 or vars.sellerp ~= vars.selection or vars.crank ~= 0 then
			gfx.sprite.addDirtyRect(0, 60 + (assets.text ~= nil and -14 or 20) + (save.showcontrols and 7 or 0), 400, 110)
		end
	end
end