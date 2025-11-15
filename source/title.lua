import 'packselect'
import 'options'
import 'credits'

-- Setting up consts
local pd <const> = playdate
local gfx <const> = pd.graphics
local smp <const> = pd.sound.sampleplayer
local text <const> = gfx.getLocalizedText
local black <const> = gfx.kColorBlack
local white <const> = gfx.kColorWhite
local bayer4 <const> = gfx.image.kDitherTypeBayer4x4
local center <const> = kTextAlignment.center
local right <const> = kTextAlignment.right

class('title').extends(gfx.sprite) -- Create the scene's class
function title:init(...)
	title.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	gfx.sprite.setAlwaysRedraw(true) -- Should this scene redraw the sprites constantly?

	-- TODO: add key repeat?

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new('fonts/discoteca'),
		logo = gfx.image.new('images/logo'),
		launch = gfx.image.new('images/system/launchImage'),
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
		launch = args[1] or false,
		selection = args[2] or 1,
		selections = {'select', 'shapes', 'speed', 'options', 'credits'},
		dir = false,
		bump = 0,
		gaming = pd.timer.new(0, 1, 1),
	}
	vars.titleHandlers = {
		upButtonDown = function()
			if vars.selection ~= 1 then
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
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
			end
		end,

		downButtonDown = function()
			if vars.selection < 4 then
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
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
			end
		end,

		leftButtonDown = function()
			if vars.selection == 3 or vars.selection == 5 then
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
			end
			vars.dir = false
			if vars.selection == 3 then
				vars.selection = 2
			elseif vars.selection == 5 then
				vars.selection = 4
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		rightButtonDown = function()
			vars['selectionoffset' .. vars.selection] = 0
			if vars.selection % 2 == 0 then
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
			end
			vars.dir = true
			if vars.selection == 2 then
				vars.selection = 3
			elseif vars.selection == 4 then
				vars.selection = 5
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		AButtonDown = function()
			randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
			if vars.selection == 1 then
				pack = packs
				scenemanager:transitionscene(packselect)
			elseif vars.selection == 2 then
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				--pd.inputHandlers.pop()
				--fademusic()
				--vars.gaming:resetnew(350, 1, -0.75)
				--vars.gaming.timerEndedCallback = function()
				--	scenemanager:switchscene(game, 'speed', 1, 0, nil, 0, {}, 1)
				--end
			elseif vars.selection == 3 then
				pack = bonus
				scenemanager:transitionscene(packselect)
			elseif vars.selection == 4 then
				scenemanager:transitionscene(options)
			elseif vars.selection == 5 then
				scenemanager:transitionscene(credits)
			end
		end,
	}
	if scenemanager.transitioning then
		vars.handlerdelay = pd.timer.performAfterDelay(scenemanager.transitiontime, function()
			pd.inputHandlers.push(vars.titleHandlers)
		end)
	else
		if vars.launch then
			vars.launchfade = pd.timer.new(200, 1, 0)
			vars.logopull = pd.timer.new(900, -100, 0, pd.easingFunctions.outElastic)
			vars.launchfade.timerEndedCallback = function()
				pd.inputHandlers.push(vars.titleHandlers)
			end
		end
	end

	vars.gaming.discardOnCompletion = false

	create_bg()

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		draw_bg()

		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRect(0, 0, 80, 240)
		gfx.fillRect(320, 0, 80, 240)

		assets.logo:draw(25, -18 + (vars.logopull ~= nil and vars.logopull.value or 0))

		gfx.setColor(white)
		gfx.setDitherPattern(0.15, bayer4)
		gfx.fillRoundRect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.fillRoundRect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.fillRoundRect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.fillRoundRect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.fillRoundRect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.setColor(black)
		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRoundRect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
		gfx.setColor(black)

		if vars.selection == 1 then gfx.setLineWidth(4) end
		gfx.drawRoundRect(100 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 110 - tonumber(vars.selection == 1 and 3 + vars.bump or 0), 200 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 50 + tonumber(vars.selection == 1 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 1 then gfx.setLineWidth(2) end
		if vars.selection == 2 then gfx.setLineWidth(4) end
		gfx.drawRoundRect(100 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 2 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 2 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 2 then gfx.setLineWidth(2) end
		if vars.selection == 3 then gfx.setLineWidth(4) end
		gfx.drawRoundRect(203 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 165 - tonumber(vars.selection == 3 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 3 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 3 then gfx.setLineWidth(2) end
		if vars.selection == 4 then gfx.setLineWidth(4) end
		gfx.drawRoundRect(100 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 4 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 4 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 4 then gfx.setLineWidth(2) end
		if vars.selection == 5 then gfx.setLineWidth(4) end
		gfx.drawRoundRect(203 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 200 - tonumber(vars.selection == 5 and 3 + vars.bump or 0), 97 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 30 + tonumber(vars.selection == 5 and ((3 + vars.bump) * 2) or 0), 5)
		if vars.selection == 5 then gfx.setLineWidth(2) end

		assets[vars.selection == 1 and 'disco' or 'discoteca']:drawTextAligned('Let\'s Play!\n(Word Puzzle Paks)', 200, 120, center)
		assets[vars.selection == 2 and 'disco' or 'discoteca']:drawTextAligned('Quik-Word', 148, 173, center)
		assets[vars.selection == 3 and 'disco' or 'discoteca']:drawTextAligned('Bonus Paks', 252, 173, center)
		assets[vars.selection == 4 and 'disco' or 'discoteca']:drawTextAligned('Options', 148, 208, center)
		assets[vars.selection == 5 and 'disco' or 'discoteca']:drawTextAligned('Credits', 252, 208, center)

		if vars.launch then
			assets.launch:drawFaded(0, 0, vars.launchfade.value, bayer4)
		end

		gfx.setColor(white)
		gfx.setDitherPattern(vars.gaming.value, bayer4)
		gfx.fillRect(0, 0, 400, 240)
	end)

	newmusic('audio/music/title', true)
	self:add()
end

function title:update()
	-- TODO: add crank scrolling (increment/decrement)
	vars.bump -= vars.bump * 0.4
end