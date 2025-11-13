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

class('credits').extends(gfx.sprite) -- Create the scene's class
function credits:init(...)
	credits.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	gfx.sprite.setAlwaysRedraw(true) -- Should this scene redraw the sprites constantly?

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new('fonts/discoteca'),
		cal = gfx.font.new('fonts/cal'),
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
		page = 1,
		bump = 0,
		credits1 = {{thing = 'Graphics and design', name = 'Rae'}, {thing = 'Programming', name = 'Rae'}, {thing = 'Music', name = 'Rae'}, {thing = 'SFX', name = 'Rae\'s mouth & hands'}, {thing = '', name = ''}, {thing = 'Pack Writing', name = 'Rae, Toad, Voxy'}, {thing = '', name = ''}, {thing = '"Digital Disco" font', name = 'Font End Dev'}, {thing = '"Cal Sans" font', name = 'Mark Davis'}},
		credits2 = {{thing = 'Playtesters', name = '???'}, {thing = '', name = ''}, {thing = '', name = ''}, {thing = '', name = ''}, {thing = '', name = ''}, {thing = 'Thank you!', name = 'Voxy, Toad, Robbo,'}, {thing = '', name = 'Scenic Route, Orchid, Winter,'}, {thing = '', name = 'Devon, The Rhythm League, the'}, {thing = '', name = 'PeeDee Dev Server, and Panic!'}},
	}
	vars.creditsHandlers = {
		leftButtonDown = function()
			if vars.page > 1 then
				vars.page -= 1
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		rightButtonDown = function()
			if vars.page < 2 then
				vars.page += 1
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		BButtonDown = function()
			randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
			scenemanager:transitionscene(title, false, 5)
		end,
	}
	if scenemanager.transitioning then
		vars.handlerdelay = pd.timer.performAfterDelay(scenemanager.transitiontime, function()
			pd.inputHandlers.push(vars.creditsHandlers)
		end)
	else
		pd.inputHandlers.push(vars.creditsHandlers)
	end

	create_bg()

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		draw_bg()
		gfx.setColor(white)
		gfx.setDitherPattern(0.15, bayer4)
		gfx.fillRoundRect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
		gfx.fillRoundRect(100, 200, 200, 30, 5)
		gfx.setColor(black)
		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRect(0, 0, 60, 240)
		gfx.fillRect(340, 0, 60, 240)
		gfx.setColor(black)
		assets.cal:drawTextAligned('Credits', 200, 3, center)
		for i = 1, #vars['credits' .. vars.page] do
			assets.discoteca:drawText(vars['credits' .. vars.page][i].thing, 90, 39 + (14 * i))
			assets.disco:drawTextAligned(vars['credits' .. vars.page][i].name, 310, 39 + (14 * i), right)
		end
		gfx.drawRoundRect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
		gfx.drawRoundRect(100, 200, 200, 30, 5)
		assets.disco:drawTextAligned('↔️ Move     Ⓑ Back', 200, 208, center)
	end)

	self:add()
end

function credits:update()
	vars.bump -= vars.bump * 0.4
end