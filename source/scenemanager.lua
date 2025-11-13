local pd <const> = playdate
local gfx <const> = pd.graphics
local floor <const> = math.floor
local bayer2 <const> = gfx.image.kDitherTypeBayer2x2

class('scenemanager').extends()

function scenemanager:init()
    self.transitiontime = 300
    self.transitioning = false

	self.loading4 = gfx.image.new('images/system/launchImage')
	self.loading3 = self.loading4:fadedImage(0.75, bayer2)
	self.loading2 = self.loading4:fadedImage(0.50, bayer2)
	self.loading1 = self.loading4:fadedImage(0.25, bayer2)
	self.loading0 = gfx.image.new(400, 240, gfx.kColorClear)

	self.sprite = gfx.sprite.new()
	self.sprite:setZIndex(26000)
	self.sprite:setCenter(0, 0)
	self.sprite:moveTo(0, 0)
	self.sprite:setIgnoresDrawOffset(true)
end

function scenemanager:switchscene(scene, ...)
	if self.transitioning then return end
    self.newscene = scene
    self.sceneargs = {...}
    -- Pop any rogue input handlers, leaving the default one.
    local inputsize = #playdate.inputHandlers - 1
    for i = 1, inputsize do
        pd.inputHandlers.pop()
    end
    self:loadnewscene()
    self.transitioning = false
end

-- This function will transition the scene with an animated effect.
function scenemanager:transitionscene(scene, ...)
	if self.transitioning then return end -- If there's already a scene transition, go away.
	self.transitioning = true -- Set this to true
	self.newscene = scene
	self.sceneargs = {...}
	-- Pop any rogue input handlers, leaving the default one.
	local inputsize = #playdate.inputHandlers - 1
	for i = 1, inputsize do
		pd.inputHandlers.pop()
	end
	if vars ~= nil and vars.keytimer ~= nil then vars.keytimer:remove() end
	self.sprite:add()
	self.timer = pd.timer.new(self.transitiontime, 0, 4.99, pd.easingFunctions.outQuart)
	self.timer.updateCallback = function(timer)
		self.sprite:setImage(self['loading' .. floor(timer.value)])
	end
	-- After the first timer ends...
	self.timer.timerEndedCallback = function()
		self:loadnewscene()
		self.sprite:add()
		self.timer = pd.timer.new(self.transitiontime, 4.99, 0, pd.easingFunctions.inQuart)
		self.timer.updateCallback = function(timer)
			self.sprite:setImage(self['loading' .. floor(timer.value)])
		end
		self.timer.timerEndedCallback = function()
			-- After this timer's over, remove the transition and the sprites.
			self.transitioning = false
			self.sprite:setImage(self.empty)
			self.sprite:remove()
		end
	end
end


function scenemanager:loadnewscene()
    self:cleanupscene()
    self.newscene(table.unpack(self.sceneargs))
end

function scenemanager:cleanupscene()
    gfx.sprite:removeAll()
    if sprites ~= nil then
        for i = 1, #sprites do
            sprites[i] = nil
        end
    end
    sprites = {}
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
    self:removealltimers() -- Remove every timer,
	--remove_bg()
    collectgarbage('collect') -- and collect the garbage.
    gfx.setDrawOffset(0, 0) -- Lastly, reset the drawing offset. just in case.
end

function scenemanager:removealltimers()
    local alltimers = pd.timer.allTimers()
    for _, timer in ipairs(alltimers) do
		if timer.value ~= quikword.value then
			timer:remove()
			timer = nil
		end
    end
end