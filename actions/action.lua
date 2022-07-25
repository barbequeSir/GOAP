local Object =  require "common.classic"
local States = require "states"

local Action = Object:extend()
Action.pre_conds_ = nil
Action.effects_ = nil

Action.name_ = nil
function Action:new()
    self.name_ ="Action"
    self.pre_conds_ = States()
    self.effects_ = States()
end

function Action:IsValid()
    return true
end

function Action:GetCost()
    return 1
end

function Action:Tick()
    return true
end

function Action:GetEffects()
    return self.effects_
end

function Action:GetPreConditions()
    return self.pre_conds_
end

function Action:GetName()
    return self.name_
end
return Action