local Action = require "actions.action"

local ActionChopTree = Action:extend()

function ActionChopTree:new()
    ActionChopTree.super.new(self)
    self.name_ = "ActionChopTree"
    self.effects_:AddState("has_wood",true)
end



return ActionChopTree