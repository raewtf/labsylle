local pd
local gfx
local bayer4
local center
local right

if platform == 'peedee' then
	pd = playdate
	gfx = pd.graphics
	bayer4 = gfx.image.kDitherTypeBayer4x4
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('options').extends(gfx.sprite)
	function options:init(...)
		options.super.init(self)
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

	options = {}
	function options:enter(current, ...)
		love.window.setTitle('Labsylle — Options')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function options:initialize(args)
	assets = {
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		cal = newfont('fonts/cal', '0123456789 !ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz❓'),
		forest_preview = newimage('images/forest_preview'),
		mountains_preview = newimage('images/mountains_preview'),
		frame_preview = newimage('images/frame_preview'),
		blocks_preview = newimage('images/blocks_preview'),
		city_preview = newimage('images/city_preview'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		pop = newsound('audio/sfx/pop'),
	}

	vars = {
		selections1 = {'music', 'sfx', 'crank', 'flip', 'time', 'hours', 'menubg', 'background', 'boldtext'},
		selection = 1,
		page = 1,
		bump = 0,
		remapbump = 0,
		clearquikword = 1,
		clearpak = 1,
		clearall = 1,
		remap_step = 1,
		handler = 'options'
	}

	if platform == 'peedee' then
		vars.selections2 = {'autosubmit', 'showcontrols', 'clearquikword', 'clearpak', 'clearall'}
	elseif platform == 'love' then
		vars.selections2 = {'autosubmit', 'showcontrols', 'scale', 'clean_scaling', 'rumble', 'color', 'clearquikword', 'clearpak', 'clearall'}
	end

	self:holdbuttons()

	create_bg()
end

function options:holdbuttons()
	vars.heldup = save.up
	vars.helddown = save.down
	vars.heldleft = save.left
	vars.heldright = save.right
	vars.heldprimary = save.primary
	vars.heldsecondary = save.secondary
end

function options:restorebuttons()
	save.up = vars.heldup
	save.down = vars.helddown
	save.left = vars.heldleft
	save.right = vars.heldright
	save.primary = vars.heldprimary
	save.secondary = vars.heldsecondary
end

function options:update()
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

		local ticks = pd.getCrankTicks(4)
		if ticks ~= 0 and not transitioning and vars.handler == 'options' then
			vars.selection = vars.selection + ticks
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
	end

	vars.bump = vars.bump - (vars.bump * 0.4)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	vars.remapbump = vars.remapbump - (vars.remapbump * 0.4)
	if vars.remapbump <= 0.1 and vars.remapbump >= -0.1 and vars.remapbump ~= 0 then
		vars.remapbump = 0
	end

	if platform == 'peedee' and not redraw then
		if vars.bump ~= 0 or vars.remapbump ~= 0 then
			gfx.sprite.redrawBackground()
		end
	end
end

function options:draw()
	draw_bg()

	setcolor('white', 0.15)
	fillrect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
	fillrect(80, 200, 240, 30, 5)
	setcolor('black', 0.75)
	fillrect(0, 0, 60, 240)
	fillrect(340, 0, 60, 240)
	setcolor()
	drawtext(assets.cal, 'Options', 200, 3, center)
	drawrect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
	if vars.page == 1 then
		drawtext(assets[vars.selection == 1 and 'disco' or 'discoteca'], 'Music: ' .. tostring(save.music and 'Enabled' or 'Disabled'), 200, 54, center)
		drawtext(assets[vars.selection == 2 and 'disco' or 'discoteca'], 'SFX: ' .. tostring(save.sfx and 'Enabled' or 'Disabled'), 200, 68, center)
		if platform == 'peedee' then
			drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], 'Control Scheme: ' .. tostring(save.crank and 'Crank' or 'Buttons'), 200, 82, center)
		elseif platform == 'love' then
			drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], 'Remap Keyboard', 200, 82, center)
		end
		drawtext(assets[vars.selection == 4 and 'disco' or 'discoteca'], 'Flip Rotation: ' .. tostring(save.flip and 'Enabled' or 'Disabled'), 200, 96, center)
		drawtext(assets[vars.selection == 5 and 'disco' or 'discoteca'], 'In-Game Clock: ' .. tostring(save.time and 'Enabled' or 'Disabled'), 200, 110, center)
		drawtext(assets[vars.selection == 6 and 'disco' or 'discoteca'], 'Clock Display: ' .. tostring(save.hours and '12-Hour' or '24-Hour'), 200, 124, center)
		drawtext(assets[vars.selection == 7 and 'disco' or 'discoteca'], 'Menu BG: ' .. tostring(save.menubg and 'Falling Blocks' or 'Disabled'), 200, 138, center)
		drawtext(assets[vars.selection == 8 and 'disco' or 'discoteca'], 'In-Game BG: ' .. tostring(save.background == 0 and 'Disabled' or save.background == 1 and 'Forest' or save.background == 2 and 'Mountains' or save.background == 3 and 'Ornate Frame' or save.background == 4 and 'Falling Blocks' or save.background == 5 and 'City Nights'), 200, 152, center)
		if vars.selection == 8 then
			setcolor('white')
			fillrect(146, 93, 108, 59)
			setcolor()
			fillrect(148, 95, 104, 55)
			setcolor('white')
			fillrect(150, 97, 100, 51)
			if save.background == 1 then
				drawimage(assets.forest_preview, 150, 97)
			elseif save.background == 2 then
				drawimage(assets.mountains_preview, 150, 97)
			elseif save.background == 3 then
				drawimage(assets.frame_preview, 150, 97)
			elseif save.background == 4 then
				drawimage(assets.blocks_preview, 150, 97)
			elseif save.background == 5 then
				drawimage(assets.city_preview, 150, 97)
			end
			setcolor()
		end
		drawtext(assets[vars.selection == 9 and 'disco' or 'discoteca'], 'Bold Text: ' .. tostring(save.boldtext and 'Enabled' or 'Disabled'), 200, 166, center)
		setcolor('black', 0.5)
		if vars.selection == 1 then drawrect(85 - vars.bump, 52, 230 + (vars.bump * 2), 18) end
		if vars.selection == 2 then drawrect(85 - vars.bump, 66, 230 + (vars.bump * 2), 18) end
		if vars.selection == 3 then drawrect(85 - vars.bump, 80, 230 + (vars.bump * 2), 18) end
		if vars.selection == 4 then drawrect(85 - vars.bump, 94, 230 + (vars.bump * 2), 18) end
		if vars.selection == 5 then drawrect(85 - vars.bump, 108, 230 + (vars.bump * 2), 18) end
		if vars.selection == 6 then drawrect(85 - vars.bump, 122, 230 + (vars.bump * 2), 18) end
		if vars.selection == 7 then drawrect(85 - vars.bump, 136, 230 + (vars.bump * 2), 18) end
		if vars.selection == 8 then drawrect(85 - vars.bump, 150, 230 + (vars.bump * 2), 18) end
		if vars.selection == 9 then drawrect(85 - vars.bump, 164, 230 + (vars.bump * 2), 18) end
		setcolor()
	elseif vars.page == 2 then
		if platform == 'peedee' then
			drawtext(assets[vars.selection == 1 and 'disco' or 'discoteca'], 'Submit Words: ' .. tostring(save.autosubmit and 'Automatically' or 'Press Up'), 200, 69, center)
			drawtext(assets[vars.selection == 2 and 'disco' or 'discoteca'], 'In-Game Controls: ' .. tostring(save.showcontrols and 'Enabled' or 'Disabled'), 200, 83, center)
			drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], (vars.clearquikword == 1 and 'Clear Quik-Word' or vars.clearquikword == 2 and 'Are you sure?' or vars.clearquikword == 3 and 'Once more! Clear Quik-Word!?' or vars.clearquikword == 4 and 'Quik-Word cleared.'), 200, 112, center)
			drawtext(assets[vars.selection == 4 and 'disco' or 'discoteca'], (vars.clearpak == 1 and 'Clear Puzzle Paks' or vars.clearpak == 2 and 'Are you sure?' or vars.clearpak == 3 and 'Once more! Clear Puzzle Paks!?' or vars.clearpak == 4 and 'Puzzle Paks cleared.'), 200, 126, center)
			drawtext(assets[vars.selection == 5 and 'disco' or 'discoteca'], (vars.clearall == 1 and 'Clear ALL Data' or vars.clearall == 2 and 'Are you sure?' or vars.clearall == 3 and 'Once more! Clear ALL data!?' or vars.clearall == 4 and 'Data cleared.'), 200, 140, center)
			setcolor('black', 0.5)
			if vars.selection == 1 then drawrect(85 - vars.bump, 67, 230 + (vars.bump * 2), 18) end
			if vars.selection == 2 then drawrect(85 - vars.bump, 81, 230 + (vars.bump * 2), 18) end
			if vars.selection == 3 then drawrect(85 - vars.bump, 110, 230 + (vars.bump * 2), 18) end
			if vars.selection == 4 then drawrect(85 - vars.bump, 124, 230 + (vars.bump * 2), 18) end
			if vars.selection == 5 then drawrect(85 - vars.bump, 138, 230 + (vars.bump * 2), 18) end
		elseif platform == 'love' then
			drawtext(assets[vars.selection == 1 and 'disco' or 'discoteca'], 'Submit Words: ' .. tostring(save.autosubmit and 'Automatically' or 'Press Up'), 200, 54, center)
			drawtext(assets[vars.selection == 2 and 'disco' or 'discoteca'], 'In-Game Controls: ' .. tostring(save.showcontrols and 'Enabled' or 'Disabled'), 200, 68, center)
			drawtext(assets[vars.selection == 3 and 'disco' or 'discoteca'], 'Display Scale: ' .. tostring(save.scale), 200, 82, center)
			drawtext(assets[vars.selection == 4 and 'disco' or 'discoteca'], 'Scaling Mode: ' .. tostring(save.clean_scaling and 'Integer' or 'Wonky Pixels'), 200, 96, center)
			drawtext(assets[vars.selection == 5 and 'disco' or 'discoteca'], 'Rumble: ' .. tostring(save.rumble and 'Enabled' or 'Disabled'), 200, 110, center)
			drawtext(assets[vars.selection == 6 and 'disco' or 'discoteca'], 'Color: ' .. tostring(save.color == 1 and 'Black & White' or save.color == 2 and 'Cranky' or save.color == 3 and 'DMG' or save.color == 4 and 'Creamsicle'), 200, 124, center)
			drawtext(assets[vars.selection == 7 and 'disco' or 'discoteca'], (vars.clearquikword == 1 and 'Clear Quik-Word' or vars.clearquikword == 2 and 'Are you sure?' or vars.clearquikword == 3 and 'Once more! Clear Quik-Word!?' or vars.clearquikword == 4 and 'Quik-Word cleared.'), 200, 138, center)
			drawtext(assets[vars.selection == 8 and 'disco' or 'discoteca'], (vars.clearpak == 1 and 'Clear Puzzle Paks' or vars.clearpak == 2 and 'Are you sure?' or vars.clearpak == 3 and 'Once more! Clear Puzzle Paks!?' or vars.clearpak == 4 and 'Puzzle Paks cleared.'), 200, 152, center)
			drawtext(assets[vars.selection == 9 and 'disco' or 'discoteca'], (vars.clearall == 1 and 'Clear ALL Data' or vars.clearall == 2 and 'Are you sure?' or vars.clearall == 3 and 'Once more! Clear ALL data!?' or vars.clearall == 4 and 'Data cleared.'), 200, 166, center)
			setcolor('black', 0.5)
			if vars.selection == 1 then drawrect(85 - vars.bump, 52, 230 + (vars.bump * 2), 18) end
			if vars.selection == 2 then drawrect(85 - vars.bump, 66, 230 + (vars.bump * 2), 18) end
			if vars.selection == 3 then drawrect(85 - vars.bump, 80, 230 + (vars.bump * 2), 18) end
			if vars.selection == 4 then drawrect(85 - vars.bump, 94, 230 + (vars.bump * 2), 18) end
			if vars.selection == 5 then drawrect(85 - vars.bump, 108, 230 + (vars.bump * 2), 18) end
			if vars.selection == 6 then drawrect(85 - vars.bump, 122, 230 + (vars.bump * 2), 18) end
			if vars.selection == 7 then drawrect(85 - vars.bump, 136, 230 + (vars.bump * 2), 18) end
			if vars.selection == 8 then drawrect(85 - vars.bump, 150, 230 + (vars.bump * 2), 18) end
			if vars.selection == 9 then drawrect(85 - vars.bump, 164, 230 + (vars.bump * 2), 18) end
		end
		setcolor()
	end
	drawrect(80, 200, 240, 30, 5)
	setcolor('white')
	drawtext(assets.disco, '➕' .. (platform == 'peedee' and '/🐟' or '') .. ' Move  ' .. ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. ' Back  ' .. ((save.gamepad or platform == 'peedee') and 'Ⓐ' or string.upper(save.primary)) .. ' Toggle', 200, 208, center)
	setcolor()
	drawtext(assets.discoteca, 'v' .. version, 65, 5)
	if platform == 'peedee' then drawtext(assets.discoteca, commalize(pd.metadata.buildNumber), 335, 5, right) end

	if vars.handler == 'remap' then
		setcolor('black', 0.5)
		fillrect(0, 0, 400, 240)
		setcolor('white')
		fillrect(30 - vars.remapbump, 75 - vars.remapbump, 340 + (vars.remapbump * 2), 90 + (vars.remapbump * 2), 10)
		setcolor()
		drawrect(30 - vars.remapbump, 75 - vars.remapbump, 340 + (vars.remapbump * 2), 90 + (vars.remapbump * 2), 8)

		setcolor('white')

		local button
		if vars.remap_step == 1 then
			button = '⬆'
		elseif vars.remap_step == 2 then
			button = '⬇'
		elseif vars.remap_step == 3 then
			button = '⬅'
		elseif vars.remap_step == 4 then
			button = '➡'
		elseif vars.remap_step == 5 then
			button = 'Ⓐ'
		elseif vars.remap_step == 6 then
			button = 'Ⓑ'
		end

		drawtext(assets.disco, 'Press the keyboard key you\'d\nlike to use as the ' .. button .. ' button.', 200, 94, center)
		drawtext(assets.discoteca, save.gamepad and 'Press Start to cancel & discard changes.' or 'Press ESC to cancel & discard changes.', 200, 134, center)

		setcolor()
	end

	drawontop()
end

function options:keypressed(button)
	if vars.handler == 'options' then
		if button == (platform == 'peedee' and 'up' or platform == 'love' and save.up) then
			if vars.selection > 1 then
				vars.selection = vars.selection - 1
				playsound(assets.swish)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'down' or platform == 'love' and save.down) then
			if vars.selection < #vars['selections' .. vars.page] then
				vars.selection = vars.selection + 1
				playsound(assets.swish)
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
			if vars.page > 1 then
				vars.page = vars.page - 1
				playsound(assets.swish)
				vars.selection = 1
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
			if vars.page < 2 then
				vars.page = vars.page + 1
				playsound(assets.swish)
				vars.selection = 1
				if platform == 'peedee' then gfx.sprite.redrawBackground() end
				vars.clearquikword = 1
				vars.clearpak = 1
				vars.clearall = 1
				rumble(0.3, 0.3, 0.025)
			else
				randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
				vars.bump = -3
				rumble(0.1, 0.1, 0.025)
			end
		elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
			playsound(assets.pop)
			scenemanager:transitionscene(title, false, 6)
			rumble(0.3, 0.3, 0.025)
		elseif button == (platform == 'peedee' and 'a' or platform == 'love' and save.primary) then
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
				if platform == 'peedee' then
					save.crank = not save.crank
				else
					setmusicvolume(0.5)
					vars.remap_step = 1
					vars.handler = 'remap'
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'flip' then
			save.flip = not save.flip
			elseif vars['selections' .. vars.page][vars.selection] == 'time' then
				save.time = not save.time
			elseif vars['selections' .. vars.page][vars.selection] == 'hours' then
				save.hours = not save.hours
			elseif vars['selections' .. vars.page][vars.selection] == 'menubg' then
				save.menubg = not save.menubg
				if save.menubg then
					create_bg()
					setredraw(true)
				else
					remove_bg()
					setredraw(false)
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'background' then
				save.background = save.background + 1
				if save.background > 5 then
					save.background = 0
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'boldtext' then
				save.boldtext = not save.boldtext
				assets.discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓')
			elseif vars['selections' .. vars.page][vars.selection] == 'autosubmit' then
				save.autosubmit = not save.autosubmit
			elseif vars['selections' .. vars.page][vars.selection] == 'showcontrols' then
				save.showcontrols = not save.showcontrols
			elseif vars['selections' .. vars.page][vars.selection] == 'scale' then
				if save.scale == 5 then
					save.scale = 1
				else
					save.scale = save.scale + 1
				end
				rescale(save.scale)
			elseif vars['selections' .. vars.page][vars.selection] == 'clean_scaling' then
				save.clean_scaling = not save.clean_scaling
				local w, h, _ = love.window.getMode()
				love.resize(w, h)
			elseif vars['selections' .. vars.page][vars.selection] == 'rumble' then
				save.rumble = not save.rumble
				rumble(1, 1, 0.2)
			elseif vars['selections' .. vars.page][vars.selection] == 'color' then
				if save.color == 4 then
					save.color = 1
				else
					save.color = save.color + 1
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'clearquikword' then
				if vars.clearquikword < 4 then
					vars.clearquikword = vars.clearquikword + 1
				end
				if vars.clearquikword == 4 then
					resetsave('quikword')
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'clearpak' then
				if vars.clearpak < 4 then
					vars.clearpak = vars.clearpak + 1
				end
				if vars.clearpak == 4 then
					resetsave('paks')
				end
			elseif vars['selections' .. vars.page][vars.selection] == 'clearall' then
				if vars.clearall < 4 then
					vars.clearall = vars.clearall + 1
				end
				if vars.clearall == 4 then
					resetsave('everything')
				end
			end
			playsound(assets.pop)
			rumble(0.3, 0.3, 0.025)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
		end
	elseif vars.handler == 'remap' then
		valid = true
		if vars.remap_step == 1 then
			save.up = button
		elseif vars.remap_step == 2 then
			if save.up == button then
				valid = false
			else
				save.down = button
			end
		elseif vars.remap_step == 3 then
			if save.up == button or save.down == button then
				valid = false
			else
				save.left = button
			end
		elseif vars.remap_step == 4 then
			if save.up == button or save.down == button or save.left == button then
				valid = false
			else
				save.right = button
			end
		elseif vars.remap_step == 5 then
			if save.up == button or save.down == button or save.left == button or save.right == button then
				valid = false
			else
				save.primary = button
			end
		elseif vars.remap_step == 6 then
			if save.up == button or save.down == button or save.left == button or save.right == button or save.primary == button then
				valid = false
			else
				save.secondary = button
			end
		end
		-- Great pyramid, am i right?
		if valid then
			playsound(assets.pop)
			vars.remap_step = vars.remap_step + 1
			if vars.remap_step > 6 then
				setmusicvolume(1)
				vars.handler = 'options'
				self:holdbuttons()
				savegame()
			end
			rumble(0.3, 0.3, 0.025)
		else
			vars.remapbump = -3
			rumble(0.1, 0.1, 0.025)
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
		end
	end
end

if platform == 'love' then return options end