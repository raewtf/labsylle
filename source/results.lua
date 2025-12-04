local pd
local gfx
local center
local right

if platform == 'peedee' then
	pd = playdate
	gfx = pd.graphics
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('results').extends(gfx.sprite)
	function results:init(...)
		results.super.init(self)
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
	gfx = love.graphics
	center = 'center'
	right = 'right'

	results = {}
	function results:enter(current, ...)
		love.window.setTitle('Labsylle — Results')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function results:initialize(args)
	assets = {
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		cal = newfont('fonts/cal', '0123456789 !ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz❓'),
		pop = newsound('audio/sfx/pop'),
	}

	vars = {
		pack = args[1],
		variable = args[2],
		leaving = false,
		handler = ''
	}

	newtimer('fade', 300, 1, 0.75)
	newtimer('bump', 750, 50, 0, 'outBounce', function()
		vars.handler = 'results'
	end)

	if vars.pack == 'speed' then
		vars.variable = vars.variable - 1
		vars.best = false
		if vars.variable > save.quikwordbest then
			save.quikwordbest = vars.variable
			vars.best = true
		end
		if platform == 'peedee' and catalog then
			pd.scoreboards.addScore('speed', vars.variable)
		end
		vars.scroll = 0
		vars.scroll_max = -(25 + (14 * #quikwords_completed))
	else
		assets.packcomplete = newsound('audio/sfx/packcomplete')
		playsound(assets.packcomplete)
		vars.sayings = {'Great work!', 'Good job!', 'Nice work!', 'Nice job!', 'You did it!', 'Yahoo!', 'Yippee!', 'Have a good day!', 'No sweat!'}
		vars.randsaying = math.random(1, #vars.sayings)
		if platform == 'peedee' and catalog then
			pd.scoreboards.addScore(vars.pack.id, vars.variable)
		end
	end

	create_bg()
end

function results:update()
	if platform == 'peedee' then
		if pd.buttonIsPressed('up') then
			self:keypressed('up')
		elseif pd.buttonIsPressed('down') then
			self:keypressed('down')
		elseif pd.buttonJustPressed('b') then
			self:keypressed('b')
		elseif pd.buttonJustPressed('a') then
			self:keypressed('a')
		end

		if vars.bump.timeLeft ~= 0 or vars.fade.timeLeft ~= 0 then
			gfx.sprite.redrawBackground()
		elseif vars.scroll ~= nil and vars.variable ~= 0 then
			vars.scroll = vars.scroll + pd.getCrankChange()
			if vars.scroll > 0 then vars.scroll = 0 end
			if vars.scroll < vars.scroll_max then vars.scroll = vars.scroll_max end
			if vars.lastscroll ~= vars.scroll then
				gfx.sprite.addDirtyRect(80, 63 + (vars.bump.value * 4), 240, 106)
			end
			vars.lastscroll = vars.scroll
		end
	elseif platform == 'love' then
		if vars.scroll ~= nil and vars.variable ~= 0 then
			if vars.scroll > 0 then vars.scroll = 0 end
			if vars.scroll < vars.scroll_max then vars.scroll = vars.scroll_max end
		end
	end
end

function results:draw()
	local scroll = false
	if vars.pack == 'speed' and vars.variable ~= 0 then scroll = true end

	draw_bg()

	setcolor('white', -((value('fade') - 0.75) * 4) + 1)
	fillrect(0, 0, 400, 240)
	setcolor('white', 0.15)
	fillrect(80, 63 + (value('bump') * 4), 240, 106, 5)
	fillrect(scroll and 80 or 100, 190 + (value('bump') * 2), scroll and 240 or 200, 30, 5)
	setcolor('black', value('fade'))
	fillrect(0, 0, 45, 240)
	fillrect(355, 0, 45, 240)
	setcolor()
	if vars.pack == 'speed' then
		drawtext(assets.cal, 'Time Up!', 200, 11 - (value('bump') * 1.5), center)
		if platform == 'peedee' then
			gfx.setClipRect(80, 63 + (vars.bump.value * 4), 240, 106)
		elseif platform == 'love' then
			-- TODO: love equivalent for cliprect
		end
		if vars.variable == 0 then
			drawtext(assets.discoteca, 'You didn\'t beat any rounds.', 200, 75 + (value('bump') * 4) + vars.scroll, center)
			drawtext(assets.discoteca, 'Did you forget to\npause your game...?', 200, 101 + (value('bump') * 4) + vars.scroll, center)
		else
			drawtext(assets.discoteca, 'You made it up past Round...', 200, 77 + (value('bump') * 4) + vars.scroll, center)
			drawtext(assets.cal, commalize(vars.variable) .. '!', 200, 94 + (value('bump') * 4) + vars.scroll, center)
		end
		drawtext(assets.discoteca, tostring(vars.best and 'That\'s a new best!' or 'Your best is ' .. save.quikwordbest .. tostring(save.quikwordbest == 1 and ' round.' or ' rounds.')), 200, 143 + (value('bump') * 4) + vars.scroll, center)
		drawline(140, 168 + (value('bump') * 4) + vars.scroll, 260, 168 + (value('bump') * 4) + vars.scroll)
		for i = 1, #quikwords_completed do
			drawtext(assets[i == 1 and 'disco' or 'discoteca'], quikwords_completed[i], 200, 166 + (14 * i) + (value('bump') * 4) + vars.scroll, center)
		end
		if platform == 'peedee' then
			gfx.clearClipRect()
		elseif platform == 'love' then
		end
	else
		drawtext(assets.cal, 'Pack Complete!', 200, 11 - (value('bump') * 1.5), center)
		drawtext(assets.disco, vars.pack.name or '', 200, 75 + (value('bump') * 4), center)
		drawtext(assets.discoteca, (vars.pack.subtitle ~= nil and '(' .. vars.pack.subtitle .. ')' or ''), 200, 89 + (value('bump') * 4), center)
		drawtext(assets.discoteca, (vars.pack.difficulty ~= nil and vars.pack.difficulty .. ' — ' or '') .. commalize(vars.pack.puzzles ~= nil and #vars.pack.puzzles or '0') .. ((vars.pack.puzzles ~= nil and #vars.pack.puzzles == 1) and ' puzzle' or ' puzzles'), 200, 103 + (value('bump') * 4), center)
		drawtext(assets.discoteca, 'You finished in ' .. commalize(vars.variable) .. ' swaps.', 200, 129 + (value('bump') * 4), center)
		drawtext(assets.discoteca, vars.sayings[vars.randsaying], 200, 143 + (value('bump') * 4), center)
	end
	drawrect(80, 63 + (value('bump') * 4), 240, 106, 5)
	drawrect(scroll and 80 or 100, 190 + (value('bump') * 2), scroll and 240 or 200, 30, 5)
	setcolor('white')
	if scroll then
		drawtext(assets.disco, '|' .. (platform == 'peedee' and '/🐟' or '') .. ' Scroll  ' .. ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. ' Back  ' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary)) .. ' Retry', 200, 198 + (value('bump') * 2), center)
	else
		drawtext(assets.disco, ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. ' Back     ' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary)) .. ' Retry', 200, 198 + (value('bump') * 2), center)
	end
	setcolor()

	drawontop()
end

function results:keypressed(button)
	if vars.handler ~= 'results' then return end
	-- TODO: hold logic for scrolling
	if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
		if vars.scroll ~= nil and vars.variable ~= 0 then
			vars.scroll = vars.scroll + 2
		end
	elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
		if vars.scroll ~= nil and vars.variable ~= 0 then
			vars.scroll = vars.scroll - 2
		end
	elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
		playsound(assets.pop)
		if vars.pack == 'speed' then
			scenemanager:transitionscene(title, false, 2)
		else
			scenemanager:transitionscene(packselect, vars.pack)
		end
		rumble(0.3, 0.3, 0.025)
	elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
		if not vars.leaving then
			playsound(assets.pop)
			vars.leaving = true
			vars.handler = ''
			resettimer('fade', 300, 0.75, 1)
			resettimer('bump', 500, 0, 50, 'inBack', function()
				if vars.pack == 'speed' then
					scenemanager:switchscene(game, 'speed', 1, 0, nil, 0, {}, 1)
				else
					scenemanager:switchscene(game, vars.pack, 1)
				end
			end)
			rumble(0.3, 0.3, 0.025)
		end
	end
end

if platform == 'love' then return results end