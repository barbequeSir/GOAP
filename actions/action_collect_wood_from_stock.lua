local Action = require "actions.action"

local ActionCollectWoodFromStock = Action:extend()

function  ActionCollectWoodFromStock:new()
    ActionCollectWoodFromStock.super.new(self)
    self.name_ = "ActionCollectWoodFromStock"
    self.effects_:AddState("has_wood",true)
end

function ActionCollectWoodFromStock:GetCost()
    return 100
end


return ActionCollectWoodFromStock