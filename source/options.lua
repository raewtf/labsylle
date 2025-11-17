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

	function pd.gameWillPause()
		local menu = pd.getSystemMenu()
		menu:removeAllMenuItems()
	end

	assets = {
		disco = gfx.font.new('fonts/disco'),
		discoteca = gfx.font.new(save.boldtext and 'fonts/disco' or 'fonts/discoteca'),
		forest_preview = gfx.image.new('images/forest_preview'),
		mountains_preview = gfx.image.new('images/mountains_preview'),
		frame_preview = gfx.image.new('images/frame_preview'),
		blocks_preview = gfx.image.new('images/blocks_preview'),
		city_preview = gfx.image.new('images/city_preview'),
		cal = gfx.font.new('fonts/cal'),
		swish = smp.new('audio/sfx/swish'),
		block1 = smp.new('audio/sfx/block1'),
		block2 = smp.new('audio/sfx/block2'),
		block3 = smp.new('audio/sfx/block3'),
		block4 = smp.new('audio/sfx/block4'),
		block5 = smp.new('audio/sfx/block5'),
		pop = smp.new('audio/sfx/pop'),
	}

	vars = {
		selections1 = {'music', 'sfx', 'crank', 'time', 'hours', 'menubg', 'background', 'darkmode'},
		selections2 = {'boldtext', 'autosubmit', 'showcontrols', 'clearquikword', 'clearpak', 'clearall'},
		selection = 1,
		page = 1,
		bump = 0,
		clearquikword = 1,
		clearpak = 1,
		clearall = 1,
	}
	vars.optionsHandlers = {
		upButtonDown = function()
			if vars.keytimer ~= nil then vars.keytimer:remove() end
			local function keytimercallback()
				if vars.selection > 1 then
					vars.selection -= 1
					playsound(assets.swish)
					gfx.sprite.redrawBackground()
					vars.clearquikword = 1
					vars.clearpak = 1
					vars.clearall = 1
				else
					randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
					vars.bump = -3
				end
			end
			vars.keytimer = pd.timer.keyRepeatTimer(keytimercallback)
		end,

		upButtonUp = function()
			if vars.keytimer ~= nil then vars.keytimer:remove() end
		end,

		downButtonDown = function()
			if vars.keytimer ~= nil then vars.keytimer:remove() end
			local function keytimercallback()
				if vars.selection < #vars['selections' .. vars.page] then
					vars.selection += 1
					playsound(assets.swish)
					gfx.sprite.redrawBackground()
					vars.clearquikword = 1
					vars.clearpak = 1
					vars.clearall = 1
				else
					randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
					vars.bump = -3
				end
			end
			vars.keytimer = pd.timer.keyRepeatTimer(keytimercallback)
		end,

		downButtonUp = function()
			if vars.keytimer ~= nil then vars.keytimer:remove() end
		end,

		leftButtonDown = function()
			if vars.page > 1 then
				vars.page -= 1
				playsound(assets.swish)
				vars.selection = 1
				gfx.sprite.redrawBackground()
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		rightButtonDown = function()
			if vars.page < 2 then
				vars.page += 1
				playsound(assets.swish)
				vars.selection = 1
				gfx.sprite.redrawBackground()
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
			end
		end,

		BButtonDown = function()
			playsound(assets.pop)
			scenemanager:transitionscene(title, false, 4)
		end,

		AButtonDown = function()
			if vars['selections' .. vars.page][vars.selection] == 'music' then
				save.music = not save.music
				if save.music then
					newmusic('audio/music/title', true)
				else
					stopmusic()
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'sfx' then
				save.sfx = not save.sfx
			elseif vars['selections' .. vars.page][vars.selection] == 'crank' then
				save.crank = not save.crank
			elseif vars['selections' .. vars.page][vars.selection] == 'time' then
				save.time = not save.time
			elseif vars['selections' .. vars.page][vars.selection] == 'hours' then
				save.hours += 1
				if save.hours > 2 then
					save.hours = 0
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'menubg' then
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
			elseif vars['selections' .. vars.page][vars.selection] == 'background' then
				save.background += 1
				if save.background > 5 then
					save.background = 0
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'darkmode' then
				save.darkmode += 1
				if save.darkmode > 2 then
					save.darkmode = 0
				end
				pd.display.setInverted(isdarkmode())
			elseif vars['selections' .. vars.page][vars.selection] == 'boldtext' then
				save.boldtext = not save.boldtext
				assets.discoteca = gfx.font.new(save.boldtext and 'fonts/disco' or 'fonts/discoteca')
			elseif vars['selections' .. vars.page][vars.selection] == 'autosubmit' then
				save.autosubmit = not save.autosubmit
			elseif vars['selections' .. vars.page][vars.selection] == 'showcontrols' then
				save.showcontrols = not save.showcontrols
			elseif vars['selections' .. vars.page][vars.selection] == 'clearquikword' then
				if vars.clearquikword < 4 then
					vars.clearquikword += 1
				end
				if vars.clearquikword == 4 then
					save.quikwordbest = 0
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'clearpak' then
				if vars.clearpak < 4 then
					vars.clearpak += 1
				end
				if vars.clearpak == 4 then
					resetsave(true, true)
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'clearall' then
				if vars.clearall < 4 then
					vars.clearall += 1
				end
				if vars.clearall == 4 then
					resetsave()
				end
			end
			playsound(assets.pop)
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
		gfx.drawRoundRect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
		if vars.page == 1 then
			assets[vars.selection == 1 and 'disco' or 'discoteca']:drawTextAligned('Music: ' .. tostring(save.music and 'Enabled' or 'Disabled'), 200, 55, center)
			assets[vars.selection == 2 and 'disco' or 'discoteca']:drawTextAligned('SFX: ' .. tostring(save.sfx and 'Enabled' or 'Disabled'), 200, 69, center)
			assets[vars.selection == 3 and 'disco' or 'discoteca']:drawTextAligned('Control Scheme: ' .. tostring(save.crank and 'Crank' or 'Buttons'), 200, 83, center)
			assets[vars.selection == 4 and 'disco' or 'discoteca']:drawTextAligned('In-Game Clock: ' .. tostring(save.time and 'Enabled' or 'Disabled'), 200, 107, center)
			assets[vars.selection == 5 and 'disco' or 'discoteca']:drawTextAligned('Clock Display: ' .. tostring(save.hours == 0 and 'System' or save.hours == 1 and '12-Hour' or save.hours == 2 and '24-Hour'), 200, 121, center)
			assets[vars.selection == 6 and 'disco' or 'discoteca']:drawTextAligned('Menu BG: ' .. tostring(save.menubg and 'Falling Blocks' or 'Disabled'), 200, 135, center)
			assets[vars.selection == 7 and 'disco' or 'discoteca']:drawTextAligned('In-Game BG: ' .. tostring(save.background == 0 and 'Disabled' or save.background == 1 and 'Forest' or save.background == 2 and 'Mountains' or save.background == 3 and 'Ornate Frame' or save.background == 4 and 'Falling Blocks' or save.background == 5 and 'City Nights'), 200, 149, center)
			if vars.selection == 7 then
				gfx.setColor(white)
				gfx.fillRect(146, 90, 108, 59)
				gfx.setColor(black)
				gfx.fillRect(148, 92, 104, 55)
				gfx.setColor(white)
				gfx.fillRect(150, 94, 100, 51)
				gfx.setColor(black)
				if save.background == 1 then
					assets.forest_preview:draw(150, 94)
				elseif save.background == 2 then
					assets.mountains_preview:draw(150, 94)
				elseif save.background == 3 then
					assets.frame_preview:draw(150, 94)
				elseif save.background == 4 then
					assets.blocks_preview:draw(150, 94)
				elseif save.background == 5 then
					assets.city_preview:draw(150, 94)
				end
			end
			assets[vars.selection == 8 and 'disco' or 'discoteca']:drawTextAligned('Dark Mode: ' .. tostring(save.darkmode == 0 and 'Disabled' or save.darkmode == 1 and 'Enabled' or save.darkmode == 2 and 'Auto ' ..  (is24hourtime() and '(06:00/18:00)' or '(6a/6p)')), 200, 163, center)
		elseif vars.page == 2 then
			assets[vars.selection == 1 and 'disco' or 'discoteca']:drawTextAligned('Bold Text: ' .. tostring(save.boldtext and 'Enabled' or 'Disabled'), 200, 55, center)
			assets[vars.selection == 2 and 'disco' or 'discoteca']:drawTextAligned('Submit Words: ' .. tostring(save.autosubmit and 'Automatically' or 'Press Up'), 200, 69, center)
			assets[vars.selection == 3 and 'disco' or 'discoteca']:drawTextAligned('In-Game Control Hints: ' .. tostring(save.showcontrols and 'Enabled' or 'Disabled'), 200, 83, center)
			assets[vars.selection == 4 and 'disco' or 'discoteca']:drawTextAligned((vars.clearquikword == 1 and 'Clear Quik-Word' or vars.clearquikword == 2 and 'Are you sure?' or vars.clearquikword == 3 and 'Once more! Clear Quik-Word!?' or vars.clearquikword == 4 and 'Quik-Word cleared.'), 200, 107, center)
			assets[vars.selection == 5 and 'disco' or 'discoteca']:drawTextAligned((vars.clearpak == 1 and 'Clear Puzzle Paks' or vars.clearpak == 2 and 'Are you sure?' or vars.clearpak == 3 and 'Once more! Clear Puzzle Paks!?' or vars.clearpak == 4 and 'Puzzle Paks cleared.'), 200, 121, center)
			assets[vars.selection == 6 and 'disco' or 'discoteca']:drawTextAligned((vars.clearall == 1 and 'Clear ALL Data' or vars.clearall == 2 and 'Are you sure?' or vars.clearall == 3 and 'Once more! Clear ALL data!?' or vars.clearall == 4 and 'Data cleared.'), 200, 135, center)
		end
		gfx.drawRoundRect(80, 200, 240, 30, 5)
		assets.disco:drawTextAligned('➕ Move  Ⓐ Toggle  Ⓑ Back', 200, 208, center)
		assets.discoteca:drawText('v' .. pd.metadata.version, 65, 5)
		assets.discoteca:drawTextAligned(commalize(pd.metadata.buildNumber), 335, 5, right)
	end)

	self:add()
end

function options:update()
	local ticks = pd.getCrankTicks(4)
	if ticks ~= 0 and not scenemanager.transitioning then
		vars.selection += ticks
		if vars.selection > #vars['selections' .. vars.page] then
			vars.selection = #vars['selections' .. vars.page]
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
		elseif vars.selection < 1 then
			vars.selection = 1
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
		else
			playsound(assets.swish)
			gfx.sprite.redrawBackground()
		end
	end

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