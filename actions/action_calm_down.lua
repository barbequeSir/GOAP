local Action = require "actions.action"

local ActionCalmDown = Action:extend()

function ActionCalmDown:new()
    ActionCalmDown.super.new(self)
    self.name_ = "ActionCalmDown"
    self.pre_conds_:AddState("protected",true)
    self.effects_:AddState("is_frightened",false)
end


return ActionCalmDown