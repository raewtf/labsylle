local sin = math.sin
local cos = math.cos
local rad = math.rad
local ceil = math.ceil
local pd
local gfx
local center
local right

-- NOTE: "Perfect!" label when pack ~= 'speed' and optimum route
-- NOTE: add time to quik-word timer when pack == 'speed' and optimum route
-- NOTE: add save packettes for 'perfect' bool in each puzzle
-- NOTE: hint after (optimal * 2.5) wrong swaps. find the first wrong one, and indicate its proper position

if platform == 'peedee' then
	import 'results'

	pd = playdate
	gfx = pd.graphics
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('game').extends(gfx.sprite) -- Create the scene's class
	function game:init(...)
		game.super.init(self)
		local args = {...} -- Arguments passed in through the scene management will arrive here

		if save.background == 4 then setredraw(true) else setredraw(false) end

		function pd.gameWillPause()
			local menu = pd.getSystemMenu()
			menu:removeAllMenuItems()
			if vars.pack == 'speed' then
				menu:addMenuItem('quit', function()
					self:quit()
				end)
			else
				menu:addMenuItem('quit', function()
					self:quit(false)
				end)
				menu:addMenuItem('suspend', function()
					self:quit(true)
				end)
				if not vars.finished and vars.playing then
					menu:addMenuItem('retry', function()
						self:restart()
					end)
				end
			end
		end

		self:initialize(args)
		gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
			self:draw()
		end)

		self:add()
	end
elseif platform == 'love' then
	results = require 'results'

	gfx = love.graphics
	center = 'center'
	right = 'right'

	game = {}
	function game:enter(current, ...)
		love.window.setTitle('Labsylle')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end
function game:initialize(args)
	assets = {
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		slide1 = newsound('audio/sfx/slide1'),
		slide2 = newsound('audio/sfx/slide2'),
		slide3 = newsound('audio/sfx/slide3'),
		slide4 = newsound('audio/sfx/slide4'),
		slide5 = newsound('audio/sfx/slide5'),
		snap1 = newsound('audio/sfx/snap1'),
		snap2 = newsound('audio/sfx/snap2'),
		snap3 = newsound('audio/sfx/snap3'),
		bubble1 = newsound('audio/sfx/bubble1'),
		bubble2 = newsound('audio/sfx/bubble2'),
		bubble3 = newsound('audio/sfx/bubble3'),
		scribble = newsound('audio/sfx/scribble'),
		pop = newsound('audio/sfx/pop'),
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
		selection = 1,
		sellerp = 0,
		playing = false,
		crank = 0,
		boomp = 0,
		handler = '',
		paused = false,
		pauseselection = 1,
		pauseselections = {},
		bump = 0,
		brainfreezeprime = false,
	}

	loopingtimer('rattle', 100, -1, 1, 'inOutElastic')
	newtimer('cursor', 1, 1, 1)

	if save.background == 1 then
		assets.background = newimage('images/forest' .. (platform == 'love' and '_full' or ''))
	elseif save.background == 2 then
		assets.background = newimage('images/mountains' .. (platform == 'love' and '_full' or ''))
	elseif save.background == 3 then
		assets.background = newimage('images/frame' .. (platform == 'love' and '_full' or ''))
	elseif save.background == 5 then
		assets.background = newimage('images/city' .. (platform == 'love' and '_full' or ''))
	end

	if vars.pack == 'speed' then
		assets.cal = newfont('fonts/cal', '0123456789 !ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz❓')
		assets.caldown = newfont('fonts/caldown', '123!GO❓')
		assets.speedcountdown1 = newsound('audio/sfx/speedcountdown1')
		assets.speedcountdown2 = newsound('audio/sfx/speedcountdown2')
		assets.speedcountin1 = newsound('audio/sfx/speedcountin1')
		assets.speedcountin2 = newsound('audio/sfx/speedcountin2')
		assets.speedcountin3 = newsound('audio/sfx/speedcountin3')
		assets.speedcountin4 = newsound('audio/sfx/speedcountin4')
		assets.speedcountin5 = newsound('audio/sfx/speedcountin5')
		assets.speedcountin6 = newsound('audio/sfx/speedcountin6')

		local random = math.random(1, #quikwords)

		vars.target = self:deepcopy(quikwords[random])
		vars.word = self:deepcopy(quikwords[random])
		vars.tiles = #vars.target

		local word = ''
		for i = 1, vars.tiles do
			word = word .. vars.target[i]
		end
		table.insert(quikwords_completed, word)

		vars.bigtext = ''

		local same = true
		while same do
			vars.word = game:shuffle(vars.word)
			for i = 1, vars.tiles do
				if vars.word[i] ~= vars.target[i] then
					same = false
					break
				end
			end
		end

		vars.grace = 0
	else
		assets.doubledisco = newfont('fonts/doubledisco', '0123456789 %+-<=>x❓')
		assets.complete = newsound('audio/sfx/complete')

		if string.find(vars.pack.id, 'shapes') then
			for i = 1, #vars.pack.shapes_used do
				assets[vars.pack.shapes_used[i] .. '_line'] = newimage('images/shapes/line/' .. vars.pack.shapes_used[i])
				assets[vars.pack.shapes_used[i] .. '_fill'] = newimage('images/shapes/fill/' .. vars.pack.shapes_used[i])
			end
			assets.stencil00 = newimage('images/stencil00')
			assets.stencil25 = newimage('images/stencil25')
			assets.stencil50 = newimage('images/stencil50')
			assets.stencil75 = newimage('images/stencil75')
			assets.stencil99 = newimage('images/stencil99')
			if platform == 'love' then
				-- from https://love2d.org/wiki/love.graphics.stencil
				assets.stencilshader = gfx.newShader[[
					vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
						if (Texel(texture, texture_coords).rgb == vec3(0.0)) {
							// a discarded pixel wont be applied as the stencil.
							discard;
						}
						return vec4(1.0);
					}
				]]
			end
		end

		newtimer('kerplode', 1, 1, 1)

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

		vars.target = self:deepcopy(vars.pack.puzzles[vars.puzzle].target)
		vars.tiles = #vars.target[1]
		math.randomseed(#vars.target[1] * (vars.puzzle * 50))
		if vars.word == nil then
			vars.word = self:deepcopy(vars.target[1])
			local same = true
			while same do
				vars.word = game:shuffle(vars.word)
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
			assets.mask = newimage('images/mask')
		end

		if vars.pack.puzzles[vars.puzzle].bombs ~= nil then
			if vars.bombs[1] == nil then
				vars.bombs = self:deepcopy(vars.pack.puzzles[vars.puzzle].bombs)
			end
			assets.bomb = newimage('images/bomb')
			assets.ash = newimage('images/ash')
			assets.fuse1 = newsound('audio/sfx/fuse1')
			assets.fuse2 = newsound('audio/sfx/fuse2')
			assets.fuse3 = newsound('audio/sfx/fuse3')
			assets.kerplode = newsound('audio/sfx/kerplode')
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

	if platform == 'peedee' then
		assets.header_base = newimage(400, 40 + (save.showcontrols and 20 or 0))
		gfx.lockFocus(assets.header_base)
	elseif platform == 'love' then
		assets.header_base = gfx.newCanvas(400, 40 + (save.showcontrols and 20 or 0))
		gfx.setCanvas(assets.header_base)
		gfx.push()
		sx, sy, sw, sh = gfx.getScissor()
		gfx.setScissor()
		gfx.origin()
		gfx.clear()
	end
		setcolor('white')
		fillrect(0, 0, 400, 38 + (save.showcontrols and 20 or 0))
		setcolor()
		if vars.pack == 'speed' then
			drawtext(assets.disco, 'Quik-Word — Round ' .. commalize(vars.puzzle), 390, 5, right)
			if not save.time then
				drawtext(assets.discoteca, 'Best Score: ' .. commalize((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest)) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' Round' or ' Rounds'), 390, 18, right)
			end
		else
			drawtext(assets.disco, vars.pack.name, 10, 5)
			drawtext(assets.discoteca, vars.pack.subtitle .. ' — ' .. commalize(vars.puzzle) .. ' of ' .. commalize(#vars.pack.puzzles), 10, 18)
		end
		drawline(0, 38 + (save.showcontrols and 20 or 0), 400, 38 + (save.showcontrols and 20 or 0))
		if save.showcontrols then
			setcolor('black', 0.5)
			gfx.setLineWidth(1)
			drawline(30, 34, 370, 34)
			setcolor('white')
			gfx.setLineWidth(2)
			drawtext(assets.disco, '➖ Move  ' .. tostring(save.crank and '🐟' or ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. '/' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary))) .. ' Swap  ' .. tostring(save.autosubmit and '' or '⬆ Submit'), 10, 38)
			setcolor()
		end
	if platform == 'peedee' then
		gfx.unlockFocus()

		assets.header = newimage(400, 40 + (save.showcontrols and 20 or 0))
	elseif platform == 'love' then
		gfx.setScissor(sx, sy, sw, sh)
		gfx.pop()
		gfx.setCanvas()

		assets.header = gfx.newCanvas(400, 40 + (save.showcontrols and 20 or 0))
	end

	self:updateheader(gettime())

	if vars.pack ~= 'speed' and vars.pack.puzzles[vars.puzzle].text ~= nil then
		setcolor()
		if platform == 'peedee' then
			assets.text = newimage(400, 120)
			gfx.lockFocus(assets.text)
				drawtext(assets.disco, vars.pack.puzzles[vars.puzzle].text, 200, 0, center)
			gfx.unlockFocus()
		elseif platform == 'love' then
			assets.text = gfx.newCanvas(400, 120)
			gfx.setCanvas(assets.text)
				gfx.push()
				sx, sy, sw, sh = gfx.getScissor()
				gfx.setScissor()
				gfx.origin()
				gfx.clear()
				drawtext(assets.disco, vars.pack.puzzles[vars.puzzle].text, 200, 0, center)
				gfx.setScissor(sx, sy, sw, sh)
				gfx.pop()
			gfx.setCanvas()
		end
	end

	if vars.shouldanimate > 0 then
		if vars.puzzle == 1 or vars.shouldanimate == 2 then
			newtimer('headerx', 500, -90, 0, 'outBack')
		else
			newtimer('headerx', 1, 0, 0)
		end

		if vars.pack ~= 'speed' then
			if vars.puzzle - 1 == 0 or vars.pack.puzzles[vars.puzzle - 1].text == nil or vars.shouldanimate == 2 then
				newtimer('texx', 500, 120, 0, 'outBack')
			else
				newtimer('texx', 1, 0, 0)
			end
		end
	end

	for i = 1, vars.tiles do
		delaytimer('tileoffsetx' .. i, (25 * i), 500, 550, 0, 'outBack', function()
			if i ~= vars.tiles then return end
			if vars.pack == 'speed' then
				if vars.puzzle == 1 then
					afterdelay('countdown3', 1000, function()
						playsound(assets.speedcountdown1)
						vars.bigtext = '3'
						if platform == 'peedee' then gfx.sprite.redrawBackground() end
					end)
					afterdelay('countdown2', 2000, function()
						playsound(assets.speedcountdown1)
						vars.bigtext = '2'
						if platform == 'peedee' then gfx.sprite.redrawBackground() end
					end)
					afterdelay('countdown1', 3000, function()
						playsound(assets.speedcountdown1)
						vars.bigtext = '1'
						if platform == 'peedee' then gfx.sprite.redrawBackground() end
					end)
					afterdelay('countdownafter', 5000, function()
						vars.bigtext = ''
						if platform == 'peedee' then gfx.sprite.redrawBackground() end
					end)
				end
				afterdelay('countdowngo', tonumber(vars.puzzle == 1 and 4000 or 0), function()
					if not vars.finished then
						if vars.puzzle == 1 then
							playsound(assets.speedcountdown2)
							vars.bigtext = 'GO!'
							if platform == 'peedee' then gfx.sprite.redrawBackground() end
							resetquikword(60000, 60000, 0, function()
								resettimer('headerx', 500, 0, -90, 'inBack')
								self:endround()
							end)
							newmusic('audio/music/quikword', true)
						else
							startquikword()
							self:updateheader(gettime())
						end
						vars.playing = true
						vars.handler = 'game'
						resettimer('cursor', 300, 1, 0.5, 'inOutSine')
					end
				end)
				timerendedcallback('tileoffsetx' .. vars.tiles, nil)
			else
				newmusic('audio/music/game', true)
				vars.playing = true
				vars.handler = 'game'
				resettimer('cursor', 300, 1, 0.5, 'inOutSine')
				timerendedcallback('tileoffsetx' .. vars.tiles, nil)
				for n = 1, #vars.bombs do
					if vars.bombs[n].intensity == 4 then
						self:kerplode()
					end
				end
			end
		end)
		newtimer('tileoffsety' .. i, 1, vars.tilevis.offset, vars.tilevis.offset)
	end

	if save.background == 4 then create_bg(true) end

	randomizesfx(assets.bubble1, assets.bubble2, assets.bubble3)
end

function game:pause()
	if not vars.paused then
		setmusicvolume(0.5)
		vars.paused = true
		vars.oldhandler = vars.handler
		vars.handler = 'paused'
	end
	if vars.pack == 'speed' then
		vars.pauseselections = {'resume', 'quit'}
	else
		vars.pauseselections = {'resume'}
		if not vars.finished and vars.playing then
			table.insert(vars.pauseselections, 'retry')
		end
		table.insert(vars.pauseselections, 'suspend')
		table.insert(vars.pauseselections, 'quit')
	end
	vars.pauseselection = 1
end

function game:unpause()
	if vars.paused then
		vars.paused = false
		vars.handler = vars.oldhandler
		vars.oldhandler = nil
	end
end

function game:quit(suspend)
	self:unpause()
	if vars.pack == 'speed' then
		stopmusic()
		pausequikword()
		vars.playing = false
		scenemanager:transitionscene(title, false, 2)
	else
		if suspend then
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
		else
			stopmusic()
			save[vars.pack.id].puzzle = vars.puzzle
			save[vars.pack.id].puzzleswaps = nil
			save[vars.pack.id].heldpackswaps = vars.packswaps
			save[vars.pack.id].word = nil
			save[vars.pack.id].bombs = nil
			vars.playing = false
			scenemanager:transitionscene(packselect, vars.pack)
		end
	end
end

function game:updateheader(time)
	local hour = time.hour
	local minute = platform == 'peedee' and time.minute or time.min

	if platform == 'peedee' then
		gfx.lockFocus(assets.header)
	elseif platform == 'love' then
		gfx.setCanvas(assets.header)
		gfx.push()
		sx, sy, sw, sh = gfx.getScissor()
		gfx.setScissor()
		gfx.origin()
		gfx.clear()
	end
		setcolor('white')
		drawimage(assets.header_base, 0, 0)

		if vars.pack == 'speed' then
			drawtext(assets.cal, ceil(quikwordvalue() / 1000), 10, -1)
			if quikwordpaused or quikwordtimeleft() == 0 then
				setcolor('white', 0.25)
				fillrect(0, 0, 65, 32)
				setcolor()
			end
		else
			drawtext(assets.disco, commalize(vars.swaps) .. (vars.swaps == 1 and ' swap' or ' swaps'), 390, 5, right)
		end

		if save.time then
			if vars.pack == 'speed' then
				drawtext(assets.discoteca, 'Best Score: ' .. commalize((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest)) .. ((vars.puzzle - 1 > save.quikwordbest and vars.puzzle - 1 or save.quikwordbest) == 1 and ' Round' or ' Rounds') .. ' — ' .. (save.hours and (string.format("%01d:%02d", ((hour % 12) == 0 and 12 or (hour % 12)), minute)) or (string.format("%02d:%02d", hour, minute))), 390, 18, right)
			else
				drawtext(assets.discoteca, commalize(vars.packswaps + vars.swaps) .. (vars.packswaps + vars.swaps == 1 and ' Pack Swap' or ' Pack Swaps') .. ' — ' .. (save.hours and (string.format("%01d:%02d", ((hour % 12) == 0 and 12 or (hour % 12)), minute)) or (string.format("%02d:%02d", hour, minute))), 390, 18, right)
			end
		else
			if vars.pack ~= 'speed' then
				drawtext(assets.discoteca, commalize(vars.packswaps + vars.swaps) .. (vars.packswaps + vars.swaps == 1 and ' Pack Swap' or ' Pack Swaps') .. ' — ' .. (save.hours and (string.format("%01d:%02d", ((hour % 12) == 0 and 12 or (hour % 12)), minute)) or (string.format("%02d:%02d", hour, minute))), 390, 18, right)
			end
		end
	if platform == 'peedee' then
		gfx.unlockFocus()
		gfx.sprite.addDirtyRect(0, 0, 400, 38 + value('headerx'))
	elseif platform == 'love' then
		gfx.setScissor(sx, sy, sw, sh)
		gfx.pop()
		gfx.setCanvas()
	end
end

function game:drawblock(i, x, y, offsety, width, height, radius)
	local bomb = 0
	for n = 1, #vars.bombs do
		if vars.word[i] == vars.bombs[n].key then
			bomb = n
		end
	end
	if bomb > 0 then
		if vars.bombs[bomb].intensity == 4 and vars.kerplode.timerEndedCallback ~= nil then
			drawimage(assets.ash, x, y + vars.tilevis.height - 17)
			setcolor('black', value('kerplode') / 2)
			fillcircle(x + (vars.tilevis.width / 2), y + (vars.tilevis.height / 3), (vars.tilevis.height / 2) + (value('kerplode') * 15))
			setcolor()
			return
		else
			x = x + (value('rattle') * vars.bombs[bomb].intensity)
		end
	end
	setcolor()
	fillrect(x, y, width, height, radius)
	setcolor('white')
	fillrect(x, offsety, width, height - 1, radius + 2)
	setcolor()
	drawrect(x, offsety, width, height, radius)
	if i == vars.tiles and vars.impostor then
		setcolor('black', 0.75)
		fillrect(x, offsety, width, height, radius)
	end
	if bomb > 0 then
		setcolor('black', 1 - (vars.bombs[bomb].intensity / 12))
		fillrect(x, offsety, width, height, radius)
	end
	if bomb > 0 then
		x = x - (value('rattle') * vars.bombs[bomb].intensity)
		setcolor('white')
		drawimage(assets.bomb, x + 5, offsety + 5)
		drawtext(assets.disco, commalize(vars.bombs[bomb].swaps), x + 19, offsety + 3)
	end
	setcolor()
	if vars.pack ~= 'speed' and string.find(vars.pack.id, 'shapes') then
		local shape1 = string.sub(vars.word[i], 1, 4)
		local color1 = string.sub(vars.word[i], 5, 6)
		local shape2 = string.sub(vars.word[i], 8, 11)
		local color2 = string.sub(vars.word[i], 12, 13)
		if shape1 ~= 'none' then
			if platform == 'peedee' and color1 ~= '00' then
				gfx.setStencilImage(assets['stencil' .. color1])
				drawimage(assets[shape1 .. '_fill'], x + 2, offsety + 2)
				gfx.clearStencil()
			elseif platform == 'love' and color1 ~= '00' then
				gfx.stencil(function()
					gfx.setShader(assets.stencilshader)
					drawimage(assets['stencil' .. color1], 0, 0)
					gfx.setShader()
				end, 'replace', 1)
				gfx.setStencilTest('greater', 0)
				drawimage(assets[shape1 .. '_fill'], x + 2, offsety + 2)
				gfx.setStencilTest()
			end
			drawimage(assets[shape1 .. '_line'], x + 2, offsety + 2)
		end
		if shape2 ~= 'none' then
			if platform == 'peedee' and color2 ~= '00' then
				gfx.setStencilImage(assets['stencil' .. color2])
				drawimage(assets[shape2 .. '_fill'], x + vars.tilevis.width - 27, offsety + 2, 'flipx')
				gfx.clearStencil()
			elseif platform == 'love' and color2 ~= '00' then
				gfx.stencil(function()
					gfx.setShader(assets.stencilshader)
					drawimage(assets['stencil' .. color2], 0, 0)
					gfx.setShader()
				end, 'replace', 1)
				gfx.setStencilTest('greater', 0)
				drawimage(assets[shape2 .. '_fill'], x + vars.tilevis.width - 27, offsety + 2, 'flipx')
				gfx.setStencilTest()
			end
			drawimage(assets[shape2 .. '_line'], x + vars.tilevis.width - 27, offsety + 2, 'flipx')
		end
	else
		drawtext(assets[vars.tilevis.font], vars.word[i], x + (width / 2), offsety + (height / 2) + (bomb > 0 and 0 or -(assets[vars.tilevis.font]:getHeight() / 2.3)), center)
	end
end

function game:swap(dir)
	local kerploded = false
	if vars.pack ~= 'speed' then
		for n = 1, #vars.bombs do
			if vars.word[vars.selection] == vars.bombs[n].key or vars.word[vars.selection + 1] == vars.bombs[n].key then
				vars.bombs[n].swaps = vars.bombs[n].swaps - 1
				if vars.bombs[n].swaps == 3 then
					vars.bombs[n].intensity = 1
					rumble(0.1, 0.1, 1)
					playsound(assets.fuse1)
				elseif vars.bombs[n].swaps == 2 then
					vars.bombs[n].intensity = 2
					rumble(0.3, 0.3, 1)
					playsound(assets.fuse2)
				elseif vars.bombs[n].swaps == 1 then
					vars.bombs[n].intensity = 3
					rumble(0.5, 0.5, 1)
					playsound(assets.fuse3)
				elseif vars.bombs[n].swaps == 0 then
					vars.bombs[n].intensity = 4
					game:kerplode()
					kerploded = true
				else
					rumble(0.3, 0.3, 0.05)
				end
			else
				rumble(0.3, 0.3, 0.05)
			end
		end
		if vars.bombs[1] ~= nil then
			save[vars.pack.id].bombs = vars.bombs
		else
			rumble(0.3, 0.3, 0.05)
		end
	end
	if not kerploded then
		if vars.brainfreezeprime then
			vars.brainfreezeprime = false
			save.brainfreezes = save.brainfreezes + 1
			updatecheevos()
		else
			vars.brainfreezeprime = true
		end
		playsound(assets.swish)
		vars.swaps = vars.swaps + 1
		vars.boomp = 5
		local hold = vars.word[vars.selection]
		vars.word[vars.selection] = vars.word[vars.selection + 1]
		vars.word[vars.selection + 1] = hold
		if vars.pack ~= 'speed' then
			save[vars.pack.id].puzzleswaps = vars.swaps
			save[vars.pack.id].word = vars.word
			self:updateheader(gettime())
		end
	end
end

function game:check()
	local sameword = (vars.pack == 'speed' and 1 or #vars.target)
	if vars.pack == 'speed' then
		for i = 1, #vars.word do
			if vars.word[i] ~= vars.target[i] then
				sameword = sameword - 1
				break
			end
		end
	else
		for i = 1, #vars.target do
			for n = 1, #vars.word do
				if vars.word[n] ~= vars.target[i][n] then
					sameword = sameword - 1
					break
				end
			end
		end
	end
	return (sameword > 0 and true or false)
end

function game:kerplode()
	if not vars.finished and vars.playing then
		playsound(assets.kerplode)
		save.kerplosions = save.kerplosions + 1
		updatecheevos()
		rumble(1, 1, 1.5)
		vars.playing = false
		vars.handler = ''
		resettimer('cursor', 300, value('cursor'), 1, 'inOutSine')
		vars.crank = 0
		resettimer('kerplode', 3500, 0, 2, 'outSine', function()
			for i = 1, vars.tiles do
				delaytimer('tileoffsetx' .. i, 30 * (i - 1), 500, 0, -550, 'inBack', function()
					if i ~= vars.tiles then return end
					scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps, nil, 0, {}, 0)
				end)
			end
		end)
	end
end

function game:endround()
	if not vars.finished then
		vars.finished = true
		vars.handler = ''
		save.wordsfound = save.wordsfound + 1
		if vars.pack == 'speed' then
			if quikwordtimeleft() ~= 0 then
				pausequikword()
				game:updateheader(gettime())
			end
			save.quikwordsfound = save.quikwordsfound + 1
		else
			if vars.puzzle == #vars.pack.puzzles then
				fademusic()
			end
			if vars.puzzle == #vars.pack.puzzles then
				newtimer('headerx', 500, 0, -90, 'inBack')
			else
				newtimer('headerx', 1, 0, 0)
			end
			if vars.puzzle + 1 > #vars.pack.puzzles or vars.pack.puzzles[vars.puzzle + 1].text == nil then
				newtimer('texx', 500, 0, 120, 'inBack')
			else
				newtimer('texx', 1, 0, 0)
			end
		end
		updatecheevos()
		resettimer('cursor', 300, value('cursor'), 1, 'inOutSine')
		vars.playing = false
		for i = 1, vars.tiles do
			afterdelay('slidetimer', 350 + (150 * (i - 1)), function()
				randomizesfx(assets.slide1, assets.slide2, assets.slide3, assets.slide4, assets.slide5)
			end)
			delaytimer('tileoffsety' .. i, 150 + (150 * (i - 1)), 400, vars.tilevis.offset, 0, 'inCirc', function()
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5, 0.8 + (0.2 * i))
				rumble(0.3, 0.3, 0.025)
				if i ~= vars.tiles then return end
				if vars.pack ~= 'speed' then playsound(assets.complete) end
				for n = 1, vars.tiles do
					delaytimer('tileoffsetx' .. n, (vars.pack == 'speed' and 50 or 900) + (30 * (n - 1)), 500, 0, -550, 'inBack', function()
						if n ~= vars.tiles then return end
						if vars.pack == 'speed' then
							if quikwordvalue() == 0 then
								scenemanager:switchscene(results, vars.pack, vars.puzzle + vars.grace)
							else
								scenemanager:switchscene(game, 'speed', vars.puzzle + 1, 0, nil, 0, {}, 1)
							end
						else
							if vars.puzzle == #vars.pack.puzzles then
								save[vars.pack.id].status = 'complete'
								vars.packswaps = vars.packswaps + vars.swaps
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
					end)
				end
			end)
		end
	end
end

function game:restart()
	if not vars.finished and vars.playing then
		self:unpause()
		vars.handler = ''
		resettimer('cursor', 300, value('cursor'), 1, 'inOutSine')
		playsound(assets.scribble)
		vars.playing = false
		for i = 1, vars.tiles do
			delaytimer('tileoffsetx' .. i, 500 + (30 * (i - 1)), 500, 0, -450, 'inBack', function()
				if i ~= vars.tiles then return end
				scenemanager:switchscene(game, vars.pack, vars.puzzle, vars.packswaps, nil, 0, {}, 0)
			end)
		end
	end
end

-- http://lua-users.org/wiki/CopyTable
-- Save copied tables in `copies`, indexed by original table.
function game:deepcopy(orig, copies)
	copies = copies or {}
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		if copies[orig] then
			copy = copies[orig]
		else
			copy = {}
			copies[orig] = copy
			for orig_key, orig_value in next, orig, nil do
				copy[self:deepcopy(orig_key, copies)] = self:deepcopy(orig_value, copies)
			end
			setmetatable(copy, self:deepcopy(getmetatable(orig), copies))
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

-- Shuffly code from https://gist.github.com/Uradamus/10323382
function game:shuffle(tbl)
	  for i = #tbl, 2, -1 do
		local j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
	end
	  return tbl
end

function game:update()
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
	end

	if not vars.paused then
		vars.boomp = vars.boomp - (vars.boomp * 0.3)
		if vars.playing then
			vars.sellerp = vars.sellerp + ((vars.selection - vars.sellerp) * 0.6)
			if vars.sellerp <= vars.selection + 0.01 and vars.sellerp >= vars.selection - 0.01 and vars.sellerp ~= vars.selection then
				vars.sellerp = vars.selection
			end
			if platform == 'peedee' and save.crank then
				vars.crank = (vars.crank + pd.getCrankChange())
				if pd.getCrankChange() == 0 then
					vars.crank = vars.crank - (vars.crank * 0.3)
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
				vars.crank = vars.crank - (vars.crank * 0.3)
				if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
					vars.crank = 0
				end
			end

			if save.autosubmit and game:check() then
				game:endround()
				if vars.pack == 'speed' then vars.grace = vars.grace + 1 end
			end
		else
			vars.sellerp = vars.sellerp + (((vars.tiles / 2) - vars.sellerp) * 0.6)
			if vars.sellerp <= (vars.tiles / 2) + 0.01 and vars.sellerp >= (vars.tiles / 2) - 0.01 and vars.sellerp ~= (vars.tiles / 2) then
				vars.sellerp = (vars.tiles / 2)
			end
			vars.crank = vars.crank - (vars.crank * 0.3)
			if vars.crank > -0.1 and vars.crank < 0.1 and vars.crank ~= 0 then
				vars.crank = 0
			end
		end
	end

	if vars.pack == 'speed' then
		if vars.quikwold ~= nil then
			for i = 1, 60 do
				if vars.quikwold >= (i * 1000) and quikwordvalue() < (i * 1000) then
					game:updateheader(gettime())
				end
			end
			if vars.quikwold >= 15000 and quikwordvalue() < 15000 then
				fademusic(9000)
			end
			if vars.quikwold >= 10000 and quikwordvalue() < 10000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 9000 and quikwordvalue() < 9000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 8000 and quikwordvalue() < 8000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 7000 and quikwordvalue() < 7000 then
				playsound(assets.speedcountin1)
			end
			if vars.quikwold >= 6000 and quikwordvalue() < 6000 then
				playsound(assets.speedcountin2)
			end
			if vars.quikwold >= 5000 and quikwordvalue() < 5000 then
				playsound(assets.speedcountin2)
			end
			if vars.quikwold >= 4000 and quikwordvalue() < 4000 then
				playsound(assets.speedcountin3)
			end
			if vars.quikwold >= 3000 and quikwordvalue() < 3000 then
				playsound(assets.speedcountin3)
			end
			if vars.quikwold >= 2000 and quikwordvalue() < 2000 then
				playsound(assets.speedcountin4)
			end
			if vars.quikwold >= 1000 and quikwordvalue() < 1000 then
				playsound(assets.speedcountin5)
			end
			if vars.quikwold > 0 and quikwordvalue() <= 0 then
				playsound(assets.speedcountin6)
			end
		end
		vars.quikwold = quikwordvalue()
		save.quiktime = save.quiktime + 1
	else
		save.paktime = save.paktime + 1
	end

	vars.bump = vars.bump - (vars.bump * 0.4)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	if platform == 'peedee' and save.background ~= 4 then
		if timeleft('headerx') ~= 0 or (vars.kerplode ~= nil and timeleft('kerplode') ~= 0) then
			gfx.sprite.redrawBackground()
			return
		end
		if assets.text ~= nil and timeleft('texx') ~= 0 then
			gfx.sprite.addDirtyRect(0, 120, 400, 120)
		end
		local xdone = false
		local ydone = false
		for i = 1, vars.tiles do
			if timeleft('tileoffsetx' .. i) ~= 0 then xdone = true end
			if timeleft('tileoffsety' .. i) ~= 0 then ydone = true end
		end
		local bomb = false
		for n = 1, #vars.bombs do
			if vars.bombs[n].intensity > 0 then
				bomb = true
			end
		end
		if xdone or ydone or timeleft('tileoffsetx' .. vars.tiles) ~= 0 or timeleft('cursor') ~= 0 or vars.sellerp ~= vars.selection or vars.crank ~= 0 or bomb then
			gfx.sprite.addDirtyRect(0, 60 + (assets.text ~= nil and -14 or 20) + (save.showcontrols and 7 or 0), 400, 110)
		end
	end
end

function game:draw()
	local combi = vars.tilevis.width + vars.tilevis.gap
	local comma = (combi * vars.tiles) - vars.tilevis.gap
	if vars.impostor then comma = comma + vars.tilevis.impostor_gap + 5 end
	local ccenter = (400 - comma) / 2
	local tiley = 120 - (vars.tilevis.height / 2)
	if assets.text ~= nil then tiley = tiley - 14 else tiley = tiley + 20 end
	if save.showcontrols then tiley = tiley + 7 end

	-- Background drawing
	if assets.background ~= nil then
		drawimage(assets.background, 0, 39 + (save.showcontrols and 10 or 0))
		setcolor('white', 0.25)
		fillrect(0, 0, 400, 240)
	end
	if save.background == 4 then draw_bg(true) end

	-- Fade in from start and end of scene
	setcolor('white', ((value('headerx') / 50) + 1) / (assets.background ~= nil and 4 or 1))
	fillrect(0, 0, 400, 240)

	-- Top bar
	setcolor(platform == 'peedee' and 'black' or 'white')
	drawimage(assets.header, 0, 0 + value('headerx'))

	local time = gettime()
	local minute = platform == 'peedee' and time.minute or time.min
	if vars.lasttime ~= nil and vars.lasttime.minute ~= minute then
		game:updateheader(time)
	end
	vars.lasttime = time

	local parallax = (((vars.tiles / 2) - vars.sellerp) * vars.tilevis.parallax)

	gfx.setLineWidth(11 + vars.boomp)
	setcolor('black', value('cursor'))
	drawcircle(ccenter + (combi * vars.sellerp - 1) - 2 + parallax + tonumber((vars.impostor and (vars.selection + 1 == vars.tiles)) and (vars.tilevis.impostor_gap / 2) or 0), tiley + (vars.tilevis.height / 2) - 2, (combi / 1.5) + vars.boomp)
	gfx.setLineWidth(2)

	setcolor('black', 0.75)
	if vars.impostor then
		local tilex = ccenter + (combi * (vars.tiles - 1)) + value('tileoffsetx' .. vars.tiles) + parallax + vars.tilevis.impostor_gap
		fillrect(tilex - 5, tiley - 30, vars.tilevis.width + 10, vars.tilevis.height + 40, 5)
		setcolor('white')
		drawimage(assets.mask, (tilex + (vars.tilevis.width / 2) + 1) - 19, (tiley - 20) - 2)
	end

	setcolor('black', 0.75)
	for i = 1, (vars.impostor and vars.tiles - 1 or vars.tiles) do
		local tilex = ccenter + (combi * (i - 1)) + value('tileoffsetx' .. i) + parallax
		fillrect(tilex, tiley, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
	end
	setcolor()

	for i = 1, vars.tiles do
		local tileoffsety = tiley - value('tileoffsety' .. i)
		if not ((i == vars.selection or i == vars.selection + 1) and (timeleft('tileoffsetx' .. vars.tiles) == 0 and (not vars.finished or vars.crank ~= 0))) then
			local tilex = ccenter + (combi * (i - 1)) + value('tileoffsetx' .. i) + parallax
			if i == vars.tiles and vars.impostor then tilex = tilex + vars.tilevis.impostor_gap end
			self:drawblock(i, tilex, tiley, tileoffsety, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
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
			self:drawblock(i, pivotx + cosc, tiley + (value('cursor') * 10) - 10 + sinc, tileoffsety + (value('cursor') * 10) - 10 + sinc, vars.tilevis.width, vars.tilevis.height, vars.tilevis.radius)
		end
	end

	if vars.pack == 'speed' then
		-- Quik-word countdown
		setcolor('white')
		drawtext(assets.caldown, vars.bigtext, 200, 150, center)
	else
		-- Puzzle text
		if assets.text ~= nil then
			setcolor('white', 0.10)
			fillrect(0, 160 + value('texx'), 400, 200)
			setcolor()
			drawline(0, 160 + value('texx'), 400, 160 + value('texx'))
			drawimage(assets.text, 0, 170 + value('texx'))
		end
		-- Explosion
		if timeleft('kerplode') ~= 0 then
			setcolor('white', value('kerplode'))
			fillrect(0, 0, 400, 240)
			setcolor('black', (value('kerplode') / 2) + 0.5)
			fillrect(0, 0, 400, 240)
			setcolor()
		end
	end

	if vars.paused then
		setcolor('black', 0.5)
		fillrect(0, 0, 400, 240)
		setcolor('white')
		fillrect(75 - vars.bump, 50 - vars.bump, 250 + (vars.bump * 2), 140 + (vars.bump * 2), 10)
		setcolor()
		drawrect(75 - vars.bump, 50 - vars.bump, 250 + (vars.bump * 2), 140 + (vars.bump * 2), 8)

		for i = 1, #vars.pauseselections do
			local text = ''
			if vars.pauseselections[i] == 'resume' then
				text = 'Resume'
			elseif vars.pauseselections[i] == 'suspend' then
				text = 'Suspend'
			elseif vars.pauseselections[i] == 'retry' then
				text = 'Retry'
			elseif vars.pauseselections[i] == 'quit' then
				text = 'Quit'
			end
			drawtext(assets[vars.pauseselection == i and 'disco' or 'discoteca'], text, 200, 90 - (10 * (#vars.pauseselections - 1)) + (20 * i), center)
		end
	end

	drawontop()
end

function game:keypressed(button)
	if vars.handler == 'game' then
		if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
			if not save.autosubmit then
				if game:check() then
					playsound(assets.swish)
					game:endround()
					if vars.pack == 'speed' then vars.grace = vars.grace + 1 end
				else
					playsound(assets.scribble)
					rumble(0.1, 0.1, 0.025)
					for i = 1, vars.tiles do
						resettimer('tileoffsety' .. i, 600, 0, value('tileoffsety' .. i), 'outElastic')
					end
				end
			end
		elseif button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
			if vars.selection > 1 then
				resettimer('tileoffsety' .. vars.selection + 1, 300, 0, vars.tilevis.offset, 'outCirc')
				vars.selection = vars.selection - 1
				vars.crank = 0
				randomizesfx(assets.snap1, assets.snap2, assets.snap3)
				rumble(0.3, 0.3, 0.025)
				vars.brainfreezeprime = false
			else
				vars.sellerp = vars.sellerp - 0.5
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
			if vars.selection < vars.tiles - 1 then
				resettimer('tileoffsety' .. vars.selection, 300, 0, vars.tilevis.offset, 'outCirc')
				vars.selection = vars.selection + 1
				vars.crank = 0
				randomizesfx(assets.snap1, assets.snap2, assets.snap3)
				rumble(0.3, 0.3, 0.025)
				vars.brainfreezeprime = false
			else
				vars.sellerp = vars.sellerp + 0.5
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			if not save.crank then
				if save.flip then
					vars.crank = vars.crank - 180
				else
					vars.crank = vars.crank + 180
				end
				game:swap()
			end
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
			if not save.crank then
				if save.flip then
					vars.crank = vars.crank + 180
				else
					vars.crank = vars.crank - 180
				end
				game:swap()
			end
		end
	elseif vars.handler == 'paused' then
		if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
			if vars.pauseselection > 1 then
				vars.pauseselection = vars.pauseselection - 1
				playsound(assets.swish)
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
			if vars.pauseselection < #vars.pauseselections then
				vars.pauseselection = vars.pauseselection + 1
				playsound(assets.swish)
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			rumble(0.3, 0.3, 0.025)
			self:unpause()
			playsound(assets.pop)
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
			rumble(0.3, 0.3, 0.025)
			playsound(assets.pop)
			if vars.pauseselections[vars.pauseselection] == 'resume' then
				self:unpause()
				setmusicvolume(1)
			elseif vars.pauseselections[vars.pauseselection] == 'suspend' then
				self:quit(true)
			elseif vars.pauseselections[vars.pauseselection] == 'retry' then
				self:restart()
				setmusicvolume(1)
			elseif vars.pauseselections[vars.pauseselection] == 'quit' then
				self:quit(false)
			end
		end
	end
end

if platform == 'love' then return game end