local Action = require "actions.action"

local ActionFindCover = Action:extend()

function ActionFindCover:new()
    ActionFindCover.super.new(self)
    self.name_ = "ActionFindCover"
    self.effects_:AddState("protected",true)
end

return ActionFindCover