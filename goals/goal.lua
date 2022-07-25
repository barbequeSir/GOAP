local Object = require "common.classic"
local States = require "states"
local Goal = Object:extend()

Goal.desired_states_ = nil
Goal.name_ = "Goal"
function Goal:new()
    self.desired_states_ = States()
end

function Goal:IsValid()
    return true
end
function Goal:GetPriority()
    return 1
end

function Goal:GetName()
    return self.name_
end

return Goal