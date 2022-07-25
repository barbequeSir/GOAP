local Action = require "actions.action"

local ActionFindFood = Action:extend()
function ActionFindFood:new()
    ActionFindFood.super.new(self)
    self.name_ = "ActionFindFood"
    self.effects_:AddState("is_hungry",true)
end

return ActionFindFood