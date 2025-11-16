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

class('options').extends(gfx.sprite) -- Create the scene's class
function options:init(...)
	options.super.init(self)
	local args = {...} -- Arguments passed in through the scene management will arrive here
	-- Should this scene redraw the sprites constantly?
	if save.menubg then
		gfx.sprite.setAlwaysRedraw(true)
		redraw = true
	else
		gfx.sprite.setAlwaysRedraw(false)
		redraw = false
	end

	-- TODO: show game version and build number
	-- TODO: add key repeat

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
		selections = {'music', 'sfx', 'crank', 'time', 'hours', 'menubg', 'background', 'darkmode'},
		selection = 1,
		bump = 0,
	}
	vars.optionsHandlers = {
		upButtonDown = function()
			if vars.selection > 1 then
				vars.selection -= 1
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
				gfx.sprite.redrawBackground()
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		downButtonDown = function()
			if vars.selection < #vars.selections then
				vars.selection += 1
				randomizesfx(assets.swish1, assets.swish2, assets.swish3)
				gfx.sprite.redrawBackground()
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		BButtonDown = function()
			randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
			scenemanager:transitionscene(title, false, 4)
		end,

		AButtonDown = function()
			if vars.selections[vars.selection] == 'music' then
				save.music = not save.music
				if save.music then
					newmusic('audio/music/title', true)
				else
					stopmusic()
				end
			elseif vars.selections[vars.selection] == 'sfx' then
				save.sfx = not save.sfx
			elseif vars.selections[vars.selection] == 'crank' then
				save.crank = not save.crank
			elseif vars.selections[vars.selection] == 'time' then
				save.time = not save.time
			elseif vars.selections[vars.selection] == 'hours' then
				save.hours += 1
				if save.hours > 2 then
					save.hours = 0
				end
			elseif vars.selections[vars.selection] == 'menubg' then
				save.menubg = not save.menubg
				if save.menubg then
					create_bg()
					gfx.sprite.setAlwaysRedraw(true)
					redraw = true
				else
					remove_bg()
					gfx.sprite.setAlwaysRedraw(false)
					redraw = false
				end
			elseif vars.selections[vars.selection] == 'background' then
				save.background += 1
				if save.background > 5 then
					save.background = 0
				end
			elseif vars.selections[vars.selection] == 'darkmode' then
				save.darkmode += 1
				if save.darkmode > 2 then
					save.darkmode = 0
				end
				pd.display.setInverted(isdarkmode())
			end
			randomizesfx(assets.pop1, assets.pop2, assets.pop3, assets.pop4, assets.pop5)
			gfx.sprite.redrawBackground()
		end,
	}
	if scenemanager.transitioning then
		vars.handlerdelay = pd.timer.performAfterDelay(scenemanager.transitiontime, function()
			pd.inputHandlers.push(vars.optionsHandlers)
		end)
	else
		pd.inputHandlers.push(vars.optionsHandlers)
	end

	create_bg()

	gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
		draw_bg()
		gfx.setColor(white)
		gfx.setDitherPattern(0.15, bayer4)
		gfx.fillRoundRect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
		gfx.fillRoundRect(80, 200, 240, 30, 5)
		gfx.setColor(black)
		gfx.setDitherPattern(0.75, bayer4)
		gfx.fillRect(0, 0, 60, 240)
		gfx.fillRect(340, 0, 60, 240)
		gfx.setColor(black)
		assets.cal:drawTextAligned('Options', 200, 3, center)
		assets[vars.selection == 1 and 'disco' or 'discoteca']:drawTextAligned('Music: ' .. tostring(save.music and 'Enabled' or 'Disabled'), 200, 54, center)
		assets[vars.selection == 2 and 'disco' or 'discoteca']:drawTextAligned('SFX: ' .. tostring(save.sfx and 'Enabled' or 'Disabled'), 200, 68, center)
		assets[vars.selection == 3 and 'disco' or 'discoteca']:drawTextAligned('Control Scheme: ' .. tostring(save.crank and 'Crank' or 'Buttons'), 200, 82, center)
		assets[vars.selection == 4 and 'disco' or 'discoteca']:drawTextAligned('In-Game Clock: ' .. tostring(save.time and 'Enabled' or 'Disabled'), 200, 106, center)
		assets[vars.selection == 5 and 'disco' or 'discoteca']:drawTextAligned('Clock Display: ' .. tostring(save.hours == 0 and 'System' or save.hours == 1 and '12-Hour' or save.hours == 2 and '24-Hour'), 200, 120, center)
		assets[vars.selection == 6 and 'disco' or 'discoteca']:drawTextAligned('Menu BG: ' .. tostring(save.menubg and 'Falling Blocks' or 'Disabled'), 200, 134, center)
		assets[vars.selection == 7 and 'disco' or 'discoteca']:drawTextAligned('In-Game BG: ' .. tostring(save.background == 0 and 'Disabled' or save.background == 1 and 'Forest' or save.background == 2 and 'Mountains' or save.background == 3 and 'Ornate Frame' or save.background == 4 and 'Falling Blocks' or save.background == 5 and 'City Nights'), 200, 148, center)
		assets[vars.selection == 8 and 'disco' or 'discoteca']:drawTextAligned('Dark Mode: ' .. tostring(save.darkmode == 0 and 'Disabled' or save.darkmode == 1 and 'Enabled' or save.darkmode == 2 and 'Auto ' ..  (is24hourtime() and '(06:00/18:00)' or '(6a/6p)')), 200, 162, center)
		gfx.drawRoundRect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
		gfx.drawRoundRect(80, 200, 240, 30, 5)
		assets.disco:drawTextAligned('↕️ Move  Ⓐ Toggle  Ⓑ Back', 200, 208, center)
	end)

	self:add()
end

function options:update()
	-- TODO: add crank scrolling
	vars.bump -= vars.bump * 0.4
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	if not redraw then
		if vars.bump ~= 0 then
			gfx.sprite.redrawBackground()
		end
	end
end