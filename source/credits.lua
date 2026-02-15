local pd
local gfx
local black
local white
local center
local right

if platform == 'peedee' then
	pd = playdate
	gfx = pd.graphics
	black = gfx.kColorBlack
	white = gfx.kColorWhite
	center = kTextAlignment.center
	right = kTextAlignment.right

	class('credits').extends(gfx.sprite)
	function credits:init(...)
		credits.super.init(self)
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
	black = love.math.colorFromBytes(0, 0, 0, 1)
	white = love.math.colorFromBytes(1, 1, 1, 1)
	center = 'center'
	right = 'right'

	credits = {}
	function credits:enter(current, ...)
		love.window.setTitle('Labsylle — Credits')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function credits:initialize(args)
	assets = {
		disco = newfont('fonts/disco', '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-'),
		discoteca = newfont(save.boldtext and 'fonts/disco' or 'fonts/discoteca', save.boldtext and '0123456789 !"&\'(),./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz–—➖|ⒶⒷ➕➡⬅⬆⬇🐟❓-' or '0123456789 !"#%&\'()+,-./:;?ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz–—❓'),
		cal = newfont('fonts/cal', '0123456789 !ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz❓'),
		swish = newsound('audio/sfx/swish'),
		block1 = newsound('audio/sfx/block1'),
		block2 = newsound('audio/sfx/block2'),
		block3 = newsound('audio/sfx/block3'),
		block4 = newsound('audio/sfx/block4'),
		block5 = newsound('audio/sfx/block5'),
		pop = newsound('audio/sfx/pop'),
	}

	vars = {
		page = 1,
		bump = 0,
		credits1 = {{thing = 'Graphics and design', name = 'Rae'}, {thing = 'Programming', name = 'Rae'}, {thing = 'Music', name = 'Rae'}, {thing = 'SFX', name = 'Rae\'s mouth & hands'}, {thing = '', name = ''}, {thing = 'Pak Writing', name = 'Rae, Toad, & Voxy'}, {thing = 'Quik-Word List', name = 'Gaute Solheim'}, {thing = '"Digital Disco" font', name = 'Font End Dev'}, {thing = '"Cal Sans" font', name = 'Mark Davis'}},
		credits2 = {{thing = 'xorshift implementation', name = '2DArray'}, {thing = 'Playtesters', name = 'Oatcup, Dimitri,'}, {thing = '', name = 'dennens, scizzorz, benjymous,'}, {thing = '', name = 'TheOddLinguist, Scenic Route,'}, {thing = '', name = 'Toad, BrittOmnRex, & Angry'}, {thing = 'Thank you!', name = 'Voxy, Toad, Robbo,'}, {thing = '', name = 'Scenic Route, Orchid, Winter,'}, {thing = '', name = 'Rev, The Rhythm League, the'}, {thing = '', name = 'PeeDee Dev Server, & Panic!'}},
		handler = '',
		credits3 = {{thing = 'HUMP library', name = 'Matthias Richter'}, {thing = '', name = ''}, {thing = 'Knife library', name = 'airstruck'}, {thing = '', name = ''}, {thing = '', name = ''}, {thing = 'Tween easings', name = 'Yuichi Tateno &'}, {thing = '', name = 'Emmanuel Oga'}, {thing = '', name = ''}, {thing = 'JSON Parser', name = 'rxi'}},
		handler = 'credits'
	}

	create_bg()
end

function credits:update()
	if platform == 'peedee' then
		if pd.buttonJustPressed('left') then
			self:keypressed('left')
		elseif pd.buttonJustPressed('right') then
			self:keypressed('right')
		elseif pd.buttonJustPressed('b') then
			self:keypressed('b')
		end
	end

	vars.bump = vars.bump - (vars.bump * 0.4)
	if vars.bump <= 0.1 and vars.bump >= -0.1 and vars.bump ~= 0 then
		vars.bump = 0
	end

	if platform == 'peedee' and not redraw then
		if vars.bump ~= 0 then
			gfx.sprite.redrawBackground()
		end
	end
end

function credits:draw()
	draw_bg()
	setcolor('white', 0.15)
	fillrect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
	fillrect(100, 200, 200, 30, 5)
	setcolor('black', 0.75)
	fillrect(0, 0, 60, 240)
	fillrect(340, 0, 60, 240)
	setcolor()
	drawtext(assets.cal, 'Credits', 200, 3, center)
	for i = 1, #vars['credits' .. vars.page] do
		drawtext(assets.discoteca, vars['credits' .. vars.page][i].thing, 90, 39 + (14 * i))
		drawtext(assets.disco, vars['credits' .. vars.page][i].name, 310, 39 + (14 * i), right)
	end
	drawrect(80 - vars.bump, 43 - vars.bump, 240 + (vars.bump * 2), 146 + (vars.bump * 2), 5)
	drawrect(100, 200, 200, 30, 5)
	setcolor('white')
	drawtext(assets.disco, '➖ Move     ' .. ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. ' Back', 200, 208, center)

	drawontop()
end

function credits:keypressed(button)
	if vars.handler ~= 'credits' then return end
	if button == (platform == 'peedee' and 'left' or platform == 'love' and save.left) then
		if vars.page > 1 then
			vars.page = vars.page - 1
			playsound(assets.swish)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
			rumble(0.3, 0.3, 0.025)
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'right' or platform == 'love' and save.right) then
		if vars.page < (platform == 'peedee' and 2 or platform == 'love' and 3) then
			vars.page = vars.page + 1
			playsound(assets.swish)
			if platform == 'peedee' then gfx.sprite.redrawBackground() end
			rumble(0.3, 0.3, 0.025)
		else
			randomizesfx(assets.block1, assets.block2, assets.block3, assets.block4, assets.block5)
			vars.bump = -3
			rumble(0.1, 0.1, 0.025)
		end
	elseif button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
		playsound(assets.pop)
		scenemanager:transitionscene(title, false, 7)
		rumble(0.3, 0.3, 0.025)
	end
end

if platform == 'love' then return credits end