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

	class('statistics').extends(gfx.sprite)
	function statistics:init(...)
		statistics.super.init(self)
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

	statistics = {}
	function statistics:enter(current, ...)
		love.window.setTitle('Labsylle — Statistics')
		local args = {...} -- Arguments passed in through the scene management will arrive here

		self:initialize(args)
	end
end

function statistics:initialize(args)
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
		lastplaytime = 0,
		handler = 'statistics'
	}

	create_bg()
end

function statistics:gethms(num)
	local hours = math.floor((num/30) / 3600)
	local minutes = math.floor((num/30) / 60 - (hours * 60))
	local seconds = math.floor((num/30) - (hours * 3600) - (minutes * 60))
	return hours .. 'h ' .. minutes .. 'm ' .. seconds .. 's'
end

function statistics:update()
	if platform == 'peedee' then
		if pd.buttonJustPressed('b') then
			self:keypressed('b')
		end
	end

	if platform == 'peedee' and not redraw then
		if vars.lastplaytime ~= save.playtime then
			gfx.sprite.redrawBackground()
			vars.lastplaytime = save.playtime
		end
	end
end

function statistics:draw()
	draw_bg()
	setcolor('white', 0.15)
	fillrect(80, 43, 240, 146, 5)
	fillrect(100, 200, 200, 30, 5)
	setcolor('black', 0.75)
	fillrect(0, 0, 60, 240)
	fillrect(340, 0, 60, 240)
	setcolor()
	drawtext(assets.cal, 'Statistics', 200, 3, center)

	drawtext(assets.discoteca, 'Total play time', 90, 53)
	drawtext(assets.disco, self:gethms(save.playtime), 310, 53, right)

	drawtext(assets.discoteca, 'Pak play time', 90, 67)
	drawtext(assets.disco, self:gethms(save.paktime), 310, 67, right)

	drawtext(assets.discoteca, 'Words found', 90, 81)
	drawtext(assets.disco, save.wordsfound, 310, 81, right)

	drawtext(assets.discoteca, 'Kerplosions', 90, 95)
	drawtext(assets.disco, save.kerplosions, 310, 95, right)

	drawtext(assets.discoteca, 'Brainfreezes', 90, 109)
	drawtext(assets.disco, save.brainfreezes, 310, 109, right)

	drawtext(assets.discoteca, 'Quik-Word play time', 90, 123)
	drawtext(assets.disco, self:gethms(save.quiktime), 310, 123, right)

	drawtext(assets.discoteca, 'Quik-Words played', 90, 137)
	drawtext(assets.disco, save.quikwordsplayed, 310, 137, right)

	drawtext(assets.discoteca, 'Best Quik-Word score', 90, 151)
	drawtext(assets.disco, save.quikwordbest, 310, 151, right)

	drawtext(assets.discoteca, 'Quik-Words found', 90, 165)
	drawtext(assets.disco, save.quikwordsfound, 310, 165, right)

	drawrect(80, 43, 240, 146, 5)
	drawrect(100, 200, 200, 30, 5)
	setcolor('white')
	drawtext(assets.disco, ((save.gamepad or platform == 'peedee') and 'Ⓑ' or string.upper(save.secondary)) .. ' Back', 200, 208, center)

	drawontop()
end

function statistics:keypressed(button)
	if vars.handler ~= 'statistics' then return end
	if button == (platform == 'peedee' and 'b' or platform == 'love' and save.secondary) then
		playsound(assets.pop)
		scenemanager:transitionscene(title, false, 4)
		rumble(0.3, 0.3, 0.025)
	end
end

if platform == 'love' then return statistics end