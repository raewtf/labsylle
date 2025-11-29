loadingimages = {
	loading4 = newimage('images/loading/loading4'),
	loading3 = newimage('images/loading/loading3'),
	loading2 = newimage('images/loading/loading2'),
	loading1 = newimage('images/loading/loading1'),
	loading0 = newimage('images/loading/loading0'),
	loading4d = newimage('images/loading/loading4d'),
	loading3d = newimage('images/loading/loading3d'),
	loading2d = newimage('images/loading/loading2d'),
	loading1d = newimage('images/loading/loading1d'),
	loading0d = newimage('images/loading/loading0d')
}

transitiontime = 300
transitioning = false
transition = {}

local pd
local gfx
local floor = math.floor

if platform == 'peedee' then
	pd = playdate
	gfx = pd.graphics

	class('scenemanager').extends()

	function scenemanager:init()
		self.sprite = gfx.sprite.new()
		self.sprite:setZIndex(26000)
		self.sprite:setCenter(0, 0)
		self.sprite:moveTo(0, 0)
		self.sprite:setIgnoresDrawOffset(true)
	end
elseif platform == 'love' then
	gfx = love.graphics

	class = require 'libraries/class'
	if not table.unpack then
		table.unpack = unpack
	end

	scenemanager = class{
		init = function(self)
		end
	}
end

function scenemanager:switchscene(scene, ...)
	if transitioning then return end
    self.newscene = scene
    self.sceneargs = {...}
    self:loadnewscene()
    transitioning = false
end

-- This function will transition the scene with an animated effect.
function scenemanager:transitionscene(scene, ...)
	if transitioning then return end -- If there's already a scene transition, go away.
	transitioning = true -- Set this to true
	self.newscene = scene
	self.sceneargs = {...}
	if vars ~= nil then vars.handler = '' end
	if platform == 'peedee' then
		self.sprite:add()
	end
	newtimer('transition', transitiontime, 0, 4.99, 'outQuart', function()
		self:loadnewscene()
		if platform == 'peedee' then
			self.sprite:add()
		end
		newtimer('transition', transitiontime, 4.99, 0, 'inQuart', function()
			-- After this timer's over, remove the transition and the sprites.
			transitioning = false
			if platform == 'peedee' then
				self.sprite:setImage(loadingimages.loading0)
				self.sprite:remove()
			end
		end, transition)
		if platform == 'peedee' then
			vars.transition.updateCallback = function(timer)
				self.sprite:setImage(loadingimages['loading' .. floor(timer.value) .. (isdarkmode() and 'd' or '')])
			end
		end
	end, transition)
	if platform == 'peedee' then
		vars.transition.updateCallback = function(timer)
			self.sprite:setImage(loadingimages['loading' .. floor(timer.value) .. (isdarkmode() and 'd' or '')])
		end
	end
end


function scenemanager:loadnewscene()
    self:cleanupscene()
	savegame()
	if platform == 'peedee' then
    	self.newscene(table.unpack(self.sceneargs))
	elseif platform == 'love' then
		gamestate.switch(self.newscene, table.unpack(self.sceneargs))
	end
end

function scenemanager:cleanupscene()
	quit = 0
	if platform == 'peedee' then
		gfx.sprite:removeAll()
		local alltimers = pd.timer.allTimers()
		for _, timer in ipairs(alltimers) do
			if timer.value ~= quikword.value then
				timer:remove()
				timer = nil
			end
		end
		gfx.setDrawOffset(0, 0) -- Lastly, reset the drawing offset. just in case.
	elseif platform == 'love' then
		-- TODO: don't clear quikword
		timer.clear()
	end
    if assets ~= nil then
        for i = 1, #assets do
            assets[i] = nil
        end
        assets = nil -- Nil all the assets,
    end
    if vars ~= nil then
        for i = 1, #vars do
            vars[i] = nil
        end
    end
    vars = nil -- and nil all the variables.
    collectgarbage('collect') -- and collect the garbage.
end

if platform == 'love' then return scenemanager end