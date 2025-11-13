import 'results'

-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics
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
	gfx.sprite.setAlwaysRedraw(true) -- Should this scene redraw the sprites constantly?

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
		if vars.pack == 'speed' then
			menu:addMenuItem('quit round', function()
				quikword:pause()
				vars.playing = false
				scenemanager:transitionscene(title, false, 2)
			end)
		else
			menu:addMenuItem('suspend', function()
				save[vars.pack.id].puzzle = vars.puzzle
				save[vars.pack.id].puzzleswaps = vars.swaps
				save[vars.pack.id].heldpackswaps = vars.packswaps
				save[vars.pack.id].word = vars.word
				if vars.bombs[1] ~= nil then
					save[vars.pack.id].bombs = vars.bombs
				end
				vars.playing = false
				scenemanager:transitionscene(packselect)
			end)
			menu:addMenuItem('retry puzzle', function()
				game:restart()
			end)
		end
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new('fonts/discoteca'),
		swish1 = smp.new('audio/sfx/swish1'),
		swish2 = smp.new('audio/sfx/swish2'),
		swish3 = smp.new('audio/sfx/swish3'),
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
		bubble4 = smp.new('audio/sfx/bubble4'),
		bubble5 = smp.new('audio/sfx/bubble5'),
		snap1 = smp.new('audio/sfx/snap1'),
		snap2 = smp.new('audio/sfx/snap2'),
		snap3 = smp.new('audio/sfx/snap3'),
		snap4 = smp.new('audio/sfx/snap4'),
		snap5 = smp.new('audio/sfx/snap5'),
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
				randomizesfx(assets.snap1, assets.snap2, assets.snap3, assets.snap4, assets.snap5)
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
				randomizesfx(assets.snap1, assets.snap2, assets.snap3, assets.snap4, assets.snap5)
			else
				vars.sellerp += 0.5
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
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

	if vars.pack == 'speed' then
		assets.cal = gfx.font.new('fonts/cal')
		assets.caldown = gfx.font.new('fonts/caldown')
		assets.speedcountdown = smp.new('audio/sfx/speedcountdown')
		assets.speedcountin = smp.new('audio/sfx/speedcountin')

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
		assets.mask = gfx.image.new('images/mask')
		assets.bomb = gfx.image.new('images/bomb')
		assets.fuse1 = smp.new('audio/sfx/fuse1')
		assets.fuse2 = smp.new('audio/sfx/fuse2')
		assets.fuse3 = smp.new('audio/sfx/fuse3')
		assets.kerplode = smp.new('audio/sfx/kerplode')
		assets.scribble1 = smp.new('audio/sfx/scribble1')
		assets.scribble2 = smp.new('audio/sfx/scribble2')
		assets.scribble3 = smp.new('audio/sfx/scribble3')
		assets.scribble4 = smp.new('audio/sfx/scribble4')
		assets.scribble5 = smp.new('audio/sfx/scribble5')
		assets.complete = smp.new('audio/sfx/complete')

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

		vars.target = vars.pack.puzzles[vars.puzzle].target
		vars.tiles = #vars.target
		if vars.word == nil then
			vars.word = table.shallowcopy(vars.pack.puzzles[vars.puzzle].start)
		end
		vars.impostor = vars.pack.puzzles[vars.puzzle].impostor

		if vars.pack.puzzles[vars.puzzle].bombs ~= nil and vars.bombs[1] == nil then
			vars.bombs = table.deepcopy(vars.pack.puzzles[vars.puzzle].bombs)
		end

		if vars.pack.puzzles[vars.puzzle].tilevis ~= nil then
			if vars.pack.puzzles[vars.puzzle].tilevis.width ~= nil then vars.tilevis.width = vars.pack.puzzles[vars.puzzle].tilevis.width end
			if vars.pack.puzzles[vars.puzzle].tilevis.height ~= nil then vars.tilevis.height = vars.pack.puzzles[vars.puzzle].tilevis.height end
			if vars.pack.puzzles[vars.puzzle].tilevis.gap ~= nil then vars.tilevis.gap = vars.pack.puzzles[vars.puzzle].tilevis.gap end
			if vars.pack.puzzles[vars.puzzle].tilevis.impostor_gap ~= nil then vars.tilevis.impostor_gap = vars.pack.puzzles[vars.puzzle].tilevis.impostor_gap end
			if vars.pack.puzzles[vars.puzzle].tilevis.radius ~= nil then vars.tilevis.radius = vars.pack.puzzles[vars.puzzle].tilevis.radius end
			if vars.pack.puzzles[vars.puzzle].tilevis.offset ~= nil then vars.tilevis.offset = vars.pack.puzzles[vars.puzzle].tilevis.offset end
			if vars.pack.puzzles[vars.puzzle].tilevis.parallax ~= nil then vars.tilevis.parallax = vars.pack.puzzles[vars.puzzle].tilevis.parallax end
		end
	end

	if vars.shouldanimate > 0 then
		vars.headerx.discardOnCompletion = false
		if vars.puzzle == 1 or vars.shouldanimate == 2 then
			vars.headerx:resetnew(500, -50, 0, pd.easingFunctions.outBack)
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
				end)
				vars.countdown2 = pd.timer.performAfterDelay(2000, function()
					vars.bigtext = '2'
				end)
				vars.countdown1 = pd.timer.performAfterDelay(3000, function()
					vars.bigtext = '1'
				end)
				vars.countdownafter = pd.timer.performAfterDelay(5000, function()
					vars.bigtext = ''
				end)
			end
			vars.countdowngo = pd.timer.performAfterDelay(0 + tonumber(vars.puzzle == 1 and 4000 or 0), function()
				if not vars.finished then
					if vars.puzzle == 1 then
						vars.bigtext = 'GO!'
						quikword:resetnew(60000, 60000, 0)
						quikword.timerEndedCallback = function()
							game:endround()
						end
					end
					-- TODO: add music
					vars.playing = true
					pd.inputHandlers.push(vars.gameHandlers)
					vars.cursor:resetnew(300, 1, 0.5, pd.easingFunctions.inOutSine)
				end
			end)
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = nil
		end
	else
		vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
			-- TODO: add music
			vars.playing = true
			pd.inputHandlers.push(vars.gameHandlers)
			vars.cursor:resetnew(300, 1, 0.5, pd.easingFunctions.inOutSine)
			vars['tileoffsetx' .. vars.tiles].timerEndedCallback = nil
		end
	end

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		-- Top bar
		if vars.pack == 'speed' then
			assets.cal:drawText(ceil(quikword.value / 1000), 10, 0 + vars.headerx.value)
			assets.disco:drawTextAligned('Quik-Word — Round ' .. vars.puzzle, 390, 5 + vars.headerx.value, right)
			local time = pd.getTime()
			if is24hourtime() then
				assets.discoteca:drawTextAligned('Best score: ' .. (vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' round' or ' rounds') .. tostring(save.time and (' — ' .. string.format("%02d:%02d", time.hour, time.minute)) or ''), 390, 18 + (vars.headerx.value * 1.25), right)
			else
				assets.discoteca:drawTextAligned('Best score: ' .. (vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' round' or ' rounds') .. tostring(save.time and (' — ' .. string.format("%01d:%02d", ((time.hour % 12) == 0 and 12 or (time.hour % 12)), time.minute)) or ''), 390, 18 + (vars.headerx.value * 1.5), right)
			end
		else
			assets.disco:drawText(vars.pack.name, 10, 5 + vars.headerx.value)
			assets.discoteca:drawText(vars.pack.subtitle .. ' — ' .. vars.puzzle .. ' of ' .. #vars.pack.puzzles, 10, 18 + vars.headerx.value)
			assets.disco:drawTextAligned(vars.swaps .. (vars.swaps == 1 and ' swap' or ' swaps'), 390, 5 + vars.headerx.value, right)
			local time = pd.getTime()
			if is24hourtime() then
				assets.discoteca:drawTextAligned(vars.packswaps + vars.swaps .. (vars.packswaps + vars.swaps == 1 and ' pack swap' or ' pack swaps') .. tostring(save.time and (' — ' .. string.format("%02d:%02d", time.hour, time.minute)) or ''), 390, 18 + (vars.headerx.value * 1.25), right)
			else
				assets.discoteca:drawTextAligned(vars.packswaps + vars.swaps .. (vars.packswaps + vars.swaps == 1 and ' pack swap' or ' pack swaps') .. tostring(save.time and (' — ' .. string.format("%01d:%02d", ((time.hour % 12) == 0 and 12 or (time.hour % 12)), time.minute)) or ''), 390, 18 + (vars.headerx.value * 1.5), right)
			end
		end
		gfx.drawLine(0, 38 + (vars.headerx.value * 1.5), 400, 38 + (vars.headerx.value * 2))

		if vars.pack ~= 'speed' then
			-- Puzzle text
			if vars.pack.puzzles[vars.puzzle].text ~= nil then
				assets.disco:drawTextAligned(vars.pack.puzzles[vars.puzzle].text, 200, 170 + vars.texx.value, center)
			end
		end

		local combi = vars.tilevis.width + vars.tilevis.gap
		local comma = (combi * vars.tiles) - vars.tilevis.gap
		if vars.impostor then comma += vars.tilevis.impostor_gap + 5 end
		local ccenter = (400 - comma) / 2
		local tiley = 120 - (vars.tilevis.height / 2)
		local parallax = (((vars.tiles / 2) - vars.sellerp) * vars.tilevis.parallax)

		gfx.setLineWidth(11 + vars.boomp)
		gfx.setDitherPattern(vars.cursor.value, bayer4)
		gfx.drawCircleAtPoint(ccenter + (combi * vars.sellerp - 1) - 2 + parallax + tonumber((vars.impostor and (vars.selection + 1 == vars.tiles)) and (vars.tilevis.impostor_gap / 2) or 0), 118, (combi / 1.5) + vars.boomp)
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
			assets.caldown:drawTextAligned(vars.bigtext, 200, 150, center)
		end
	end)

	self:add()
	randomizesfx(assets.bubble1, assets.bubble2, assets.bubble3, assets.bubble4, assets.bubble5)
end

function game:drawblock(i, x, y, offsety, width, height, radius)
	local bomb = 0
	for n = 1, #vars.bombs do
		if vars.word[i] == vars.bombs[n].key then
			bomb = n
		end
	end
	if bomb > 0 then x += vars.rattle.value * vars.bombs[bomb].intensity end
	gfx.setColor(black)
	gfx.fillRoundRect(x, y, width, height, radius)
	gfx.setColor(white)
	gfx.fillRoundRect(x, offsety, width, height, radius)
	gfx.setColor(black)
	gfx.drawRoundRect(x, offsety, width, height, radius)
	if i == vars.tiles and vars.impostor then
		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRoundRect(x, offsety, width, height, radius)
	end
	if bomb > 0 then
		gfx.setDitherPattern(1 - (vars.bombs[bomb].intensity / 12), bayer4)
		gfx.fillRoundRect(x, offsety, width, height, radius)
	end
	gfx.setColor(black)
	if bomb > 0 then
		x -= vars.rattle.value * (vars.bombs[bomb].intensity / 3)
		assets.bomb:draw(x + 5, offsety + 5)
		assets.disco:drawText(vars.bombs[bomb].swaps, x + 19, offsety + 3)
	end
	assets.disco:drawTextAligned(vars.word[i], x + (width / 2), offsety + (height / 2) + (bomb > 0 and 0 or -8), center)
end

function game:swap(dir)
	randomizesfx(assets.swish1, assets.swish2, assets.swish3)
	vars.swaps += 1
	vars.boomp = 5
	local hold = vars.word[vars.selection]
	vars.word[vars.selection] = vars.word[vars.selection + 1]
	vars.word[vars.selection + 1] = hold
	if vars.pack ~= 'speed' then
		save[vars.pack.id].puzzleswaps = vars.swaps
		save[vars.pack.id].word = vars.word
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
					game:kerplode()
				end
			end
		end
		if vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
		end
	end
end

function game:kerplode()
	playsound(assets.kerplode)
	-- TODO: KERLPODE!! animation
	scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps + vars.swaps, nil, 0, {}, 0)
end

function game:endround()
	if not vars.finished then
		vars.finished = true
		pd.inputHandlers.pop()
		if vars.pack ~= 'speed' then
			if vars.puzzle == #vars.pack.puzzles then
				fademusic()
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
				if vars.puzzle == #vars.pack.puzzles then
					vars.headerx:resetnew(500, 0, -50, pd.easingFunctions.inBack)
				end
				if vars.puzzle + 1 > #vars.pack.puzzles or vars.pack.puzzles[vars.puzzle + 1].text == nil then
					vars.texx:resetnew(500, 0, 120, pd.easingFunctions.inBack)
				end
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
	if not vars.finished then
		pd.inputHandlers.pop()
		vars.cursor:resetnew(300, 0.5, 1, pd.easingFunctions.inOutSine)
		randomizesfx(assets.scribble1, assets.scribble2, assets.scribble3, assets.scribble4, assets.scribble5, 1.5)
		vars.playing = false
		for i = 1, vars.tiles do
			vars['tileoffsetx' .. i].delay = 500 + 25 * (i - 1)
			vars['tileoffsetx' .. i]:resetnew(500, 0, -450, pd.easingFunctions.inBack)
		end
		vars['tileoffsetx' .. vars.tiles].timerEndedCallback = function()
			scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps, nil, 0, {}, 0)
		end
	end
end

function game:update()
	if vars.pack == 'speed' then
		if vars.quikwold ~= nil and vars.quikwold >= 10000 and quikword.value < 10000 then
			fademusic(5000)
			playsound(assets.speedcountin)
		end
		vars.quikwold = quikword.value
	end
	vars.boomp -= vars.boomp * 0.3
	if vars.playing then
		vars.sellerp += (vars.selection - vars.sellerp) * 0.6
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

		local sameword = true
		for i = 1, #vars.word do
			if vars.word[i] ~= vars.target[i] then
				sameword = false
			end
		end
		if sameword then
			game:endround()
			if vars.pack == 'speed' then vars.grace += 1 end
		end
	else
		vars.sellerp += ((vars.tiles / 2) - vars.sellerp) * 0.6
		vars.crank -= vars.crank * 0.3
		if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
			vars.crank = 0
		end
	end
end