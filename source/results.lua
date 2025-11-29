-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics
local smp <const> = pd.sound.sampleplayer
local black <const> = gfx.kColorBlack
local white <const> = gfx.kColorWhite
local bayer4 <const> = gfx.image.kDitherTypeBayer4x4
local center <const> = kTextAlignment.center
local right <const> = kTextAlignment.right

class('results').extends(gfx.sprite) -- Create the scene's class
function results:init(...)
	results.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	-- Should this scene redraw the sprites constantly?
	if save.menubg then
		gfx.sprite.setAlwaysRedraw(true)
		redraw = true
	else
		gfx.sprite.setAlwaysRedraw(false)
		redraw = false
	end

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new(save.boldtext and 'fonts/disco' or 'fonts/discoteca'),
		cal = gfx.font.new('fonts/cal'),
		pop = smp.new('audio/sfx/pop'),
	}

	vars = {
		pack = args[1],
		variable = args[2],
		fade = pd.timer.new(300, 1, 0.75),
		bump = pd.timer.new(750, 50, 0, pd.easingFunctions.outBounce),
		leaving = false,
	}
	vars.resultsHandlers = {
		BButtonDown = function()
			playsound(assets.pop)
			if vars.pack == 'speed' then
				scenemanager:transitionscene(title, false, 2)
			else
				scenemanager:transitionscene(packselect, vars.pack)
			end
		end,

		AButtonDown = function()
			if not vars.leaving then
				playsound(assets.pop)
				vars.leaving = true
				vars.fade:resetnew(300, 0.75, 1)
				vars.bump:resetnew(500, 0, 50, pd.easingFunctions.inBack)
				vars.bump.timerEndedCallback = function()
					if vars.pack == 'speed' then
						scenemanager:switchscene(game, 'speed', 1, 0, nil, 0, {}, 1)
					else
						scenemanager:switchscene(game, vars.pack, 1)
					end
				end
			end
		end,
	}

	if vars.pack == 'speed' then
		vars.variable -= 1
		vars.best = false
		if vars.variable > save.quikwordbest then
			save.quikwordbest = vars.variable
			vars.best = true
		end
		if catalog then
			pd.scoreboards.addScore('speed', vars.variable)
		end
		vars.scroll = 0
		vars.scroll_max = -(25 + (14 * #quikwords_completed))
	else
		assets.packcomplete = smp.new('audio/sfx/packcomplete')
		playsound(assets.packcomplete)
		vars.sayings = {'Great work!', 'Good job!', 'Nice work!', 'Nice job!', 'You did it!', 'Yahoo!', 'Yippee!', 'Have a good day!', 'No sweat!'}
		vars.randsaying = math.random(1, #vars.sayings)
		if catalog then
			pd.scoreboards.addScore(vars.pack.id, vars.variable)
		end
	end


	vars.fade.discardOnCompletion = false
	vars.bump.discardOnCompletion = false
	vars.bump.timerEndedCallback = function()
		pd.inputHandlers.push(vars.resultsHandlers)
	end

	create_bg()

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		local scroll = false
		if vars.pack == 'speed' and vars.variable ~= 0 then scroll = true end
		draw_bg()
		gfx.setColor(white)
		gfx.setDitherPattern(-((vars.fade.value - 0.75) * 4) + 1, bayer4)
		gfx.fillRect(0, 0, 400, 240)
		gfx.setColor(white)
		gfx.setDitherPattern(0.15, bayer4)
		gfx.fillRoundRect(80, 63 + (vars.bump.value * 4), 240, 106, 5)
		gfx.fillRoundRect(scroll and 80 or 100, 190 + (vars.bump.value * 2), scroll and 240 or 200, 30, 5)
		gfx.setColor(black)
		gfx.setDitherPattern(vars.fade.value, bayer4)
		gfx.fillRect(0, 0, 45, 240)
		gfx.fillRect(355, 0, 45, 240)
		gfx.setColor(black)
		if vars.pack == 'speed' then
			assets.cal:drawTextAligned('Time\'s Up!', 200, 11 - (vars.bump.value * 1.5), center)
			gfx.setClipRect(80, 63 + (vars.bump.value * 4), 240, 106)
			if vars.variable == 0 then
				assets.discoteca:drawTextAligned('You didn\'t beat any rounds.', 200, 75 + (vars.bump.value * 4) + vars.scroll, center)
				assets.discoteca:drawTextAligned('Did you forget to turn\nyour console off...?', 200, 101 + (vars.bump.value * 4) + vars.scroll, center)
			else
				assets.discoteca:drawTextAligned('You made it up past Round...', 200, 77 + (vars.bump.value * 4) + vars.scroll, center)
				assets.cal:drawTextAligned(commalize(vars.variable) .. '!', 200, 94 + (vars.bump.value * 4) + vars.scroll, center)
			end
			assets.discoteca:drawTextAligned(tostring(vars.best and 'That\'s a new best!' or 'Your best is ' .. save.quikwordbest .. tostring(save.quikwordbest == 1 and ' round.' or ' rounds.')), 200, 143 + (vars.bump.value * 4) + vars.scroll, center)
			gfx.drawLine(140, 168 + (vars.bump.value * 4) + vars.scroll, 260, 168 + (vars.bump.value * 4) + vars.scroll)
			for i = 1, #quikwords_completed do
				assets[i == 1 and 'disco' or 'discoteca']:drawTextAligned(quikwords_completed[i], 200, 166 + (14 * i) + (vars.bump.value * 4) + vars.scroll, center)
			end
			gfx.clearClipRect()
		else
			assets.cal:drawTextAligned('Pack Complete!', 200, 11 - (vars.bump.value * 1.5), center)
			assets.disco:drawTextAligned(vars.pack.name or '', 200, 75 + (vars.bump.value * 4), center)
			assets.discoteca:drawTextAligned((vars.pack.subtitle ~= nil and '(' .. vars.pack.subtitle .. ')' or ''), 200, 89 + (vars.bump.value * 4), center)
			assets.discoteca:drawTextAligned((vars.pack.difficulty ~= nil and vars.pack.difficulty .. ' — ' or '') .. commalize(vars.pack.puzzles ~= nil and #vars.pack.puzzles or '0') .. ((vars.pack.puzzles ~= nil and #vars.pack.puzzles == 1) and ' puzzle' or ' puzzles'), 200, 103 + (vars.bump.value * 4), center)
			assets.discoteca:drawTextAligned('You finished in ' .. commalize(vars.variable) .. ' swaps.', 200, 129 + (vars.bump.value * 4), center)
			assets.discoteca:drawTextAligned(vars.sayings[vars.randsaying], 200, 143 + (vars.bump.value * 4), center)
		end
		gfx.drawRoundRect(80, 63 + (vars.bump.value * 4), 240, 106, 5)
		gfx.drawRoundRect(scroll and 80 or 100, 190 + (vars.bump.value * 2), scroll and 240 or 200, 30, 5)
		if scroll then
			assets.disco:drawTextAligned('↕️/🎣 Scroll  Ⓑ Back  Ⓐ Retry', 200, 198 + (vars.bump.value * 2), center)
		else
			assets.disco:drawTextAligned('Ⓑ Back     Ⓐ Retry', 200, 198 + (vars.bump.value * 2), center)
		end
	end)

	self:add()
end

function results:update()
	if vars.bump.timeLeft ~= 0 or vars.fade.timeLeft ~= 0 then
		gfx.sprite.redrawBackground()
	elseif vars.scroll ~= nil and vars.variable ~= 0 then
		if pd.buttonIsPressed('up') then
			vars.scroll += 2
		end
		if pd.buttonIsPressed('down') then
			vars.scroll -= 2
		end
		vars.scroll += pd.getCrankChange()
		if vars.scroll > 0 then vars.scroll = 0 end
		if vars.scroll < vars.scroll_max then vars.scroll = vars.scroll_max end
		if vars.lastscroll ~= vars.scroll then
			gfx.sprite.addDirtyRect(80, 63 + (vars.bump.value * 4), 240, 106)
		end
		vars.lastscroll = vars.scroll
	end
end