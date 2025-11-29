local gfx = love.graphics
local ceil = math.ceil
local floor = math.floor

function savegame()
	love.filesystem.write('data.json', json.encode(save))
end

function newimage(image)
	return gfx.newImage(image .. '.png')
end

function drawimage(image, x, y)
	gfx.draw(image, floor(x), floor(y))
end

function newimagetable(name, table, width, height, cells)
	local img = gfx.newImage(table .. '-table-' .. width .. '-' .. height .. '.png')
	local w = img:getWidth()
	local h = img:getHeight()
	_G[name .. 'indexes'] = {}
	for i = 1, cells do
		local column = i % (w / width)
		if column == 0 then column = (w / width) end
		local row = ceil(i / (w / width))
		_G[name .. 'indexes'][i] = gfx.newQuad((column - 1) * width, (row - 1) * height, width, height, w, h)
	end
	return img
end

function drawimagetable(name, index, x, y)
	gfx.draw(_G[name], _G[name .. 'indexes'][index], floor(x), floor(y))
end

function newtimer(name, duration, startvalue, endvalue, easing, callback, group)
	if vars ~= nil then
		if easing == nil then easing = 'linear' end
		vars[name .. 'value'] = startvalue
		vars[name] = timer.tween(duration / 1000, {
			[vars] = {[name .. 'value'] = endvalue}
		})
			:ease(easings[easing])
			:finish(callback or nil)
			:group(group or nil)
	end
end

function afterdelay(name, duration, callback)
	if vars ~= nil then
		vars[name] = timer.after(duration / 1000, callback)
	end
end

function value(name)
	return vars[name .. 'value']
end

function resettimer(name, duration, startvalue, endvalue, easing, callback, group)
	if vars ~= nil then
		if easing == nil then easing = 'linear' end
		vars[name .. 'value'] = startvalue
		vars[name] = timer.tween(duration / 1000, {
			[vars] = {[name .. 'value'] = endvalue}
		})
			:ease(easings[easing])
			:finish(callback or nil)
			:group(group or nil)
	end
end

function quikwordtimer(duration, startvalue, endvalue, callback)
	_G['quikwordvalue'] = startvalue
	_G['quikword'] = timer.tween(duration / 1000, {
		[_G] = {['quikwordvalue'] = endvalue}
	})
		:finish(callback or nil)
end

function resetquikword(duration, startvalue, endvalue, callback)
	_G['quikwordvalue'] = startvalue
	_G['quikword'] = timer.tween(duration / 1000, {
		[_G] = {['quikwordvalue'] = endvalue}
	})
		:finish(callback or nil)
end

function newfont(font)
	return gfx.newFont(font ~= nil and (font .. '.ttf') or nil)
	-- TODO: replace with image font definition
end

function drawtext(font, text, x, y, alignment)
	if font ~= nil then gfx.setFont(font) end
	x = floor(x)
	y = floor(y)
	if alignment ~= nil then
		if alignment == 'center' then
			gfx.printf(text, x - 200, y, 400, alignment)
		elseif alignment == 'right' then
			gfx.printf(text, x, y, 400, right)
		end
	else
		gfx.print(text, x, y)
	end
end

function textwidth(font, text)
	return font:getWidth(text)
end

function newsound(sound)
	--return love.audio.newSource(sound .. '.wav', 'static')
end

-- Plays a sound (stopping the previous instance if already playing). Import LÖVE sound object
function playsound(sound)
	if save.jsdfjds then
		sound:stop()
		sound:play()
	end
end

-- Create a pool of up to five sound effects, randomly playing one of 'em. Import LÖVE sound objects
function randomizesfx(sfx1, sfx2, sfx3, sfx4, sfx5, rate)
	if save.jsdfjds then
		local sfc = 0
		if sfx1 ~= nil then sfc = sfc + 1 end
		if sfx2 ~= nil then sfc = sfc + 1 end
		if sfx3 ~= nil then sfc = sfc + 1 end
		if sfx4 ~= nil then sfc = sfc + 1 end
		if sfx5 ~= nil then sfc = sfc + 1 end
		local rand = math.random(1, sfc)
		if rand == 1 then
			sfx1:setRate(rate or 1)
			playsound(sfx1)
		elseif rand == 2 then
			sfx2:setRate(rate or 1)
			playsound(sfx2)
		elseif rand == 3 then
			sfx3:setRate(rate or 1)
			playsound(sfx3)
		elseif rand == 4 then
			sfx4:setRate(rate or 1)
			playsound(sfx4)
		elseif rand == 5 then
			sfx5:setRate(rate or 1)
			playsound(sfx5)
		end
	end
end

-- Fades the music out, and trashes it when finished. Should be called alongside a scene change, only if the music is expected to change. Delay can set the delay (in seconds) of the fade
function fademusic(delay)
	delay = delay ~= nil and (delay * 1000) or 400
	if music ~= nil then
		-- TODO: fademusic
	end
end

function stopmusic()
	if music ~= nil then
		-- TODO: stopmusic
		music = nil
	end
end

-- New music track. This should be called in a scene's init, only if there's no track leading into it. File is a path to an audio file in the PDX. Loop, if true, will loop the audio file. Range will set the loop's starting range.
function newmusic(file, loop, range)
	if save.jsdfjds and music == nil then -- If a music file isn't actively playing...then go ahead and set a new one.
		music = love.audio.newSource(file .. '.wav', 'stream')
		volume = {1}
		if loop then
			music:setLooping(true)
		end
		love.audio:play(music)
	end
end

function setcolor(color, alpha)
	color = color or 'black'
	alpha = alpha or 0
	alpha = -alpha + 1
	if color == 'black' then
		gfx.setColor(0, 0, 0, alpha)
	elseif color == 'white' then
		gfx.setColor(1, 1, 1, alpha)
	elseif color == 'clear' then
		gfx.setColor(1, 1, 1, 0)
	end
end

function drawrect(x, y, w, h, r)
	local lw = gfx.getLineWidth()
	r = r or 0
	gfx.rectangle('line', x + (lw / 2), y + (lw / 2), w - lw, h - lw, r, r)
end

function fillrect(x, y, w, h, r)
	r = r or 0
	gfx.rectangle('fill', x, y, w, h, r, r)
end

function gettime()
	return os.date('!*t')
end

function setinverted(dark)
	-- TODO: setinverted
end

function setredraw()
	-- noop
end