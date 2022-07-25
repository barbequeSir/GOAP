local Action = require "actions.action"

local ActionBuildFirepit = Action:extend()

function ActionBuildFirepit:new()
    ActionBuildFirepit.super.new(self)
    self.name_ = "ActionBuildFirepit"
    self.pre_conds_:AddState("has_wood",true)
    self.effects_:AddState("has_firepit",true)
end


return ActionBuildFirepit