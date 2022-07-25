local Goal = require "goals.goal"

local GoalHasFirepit = Goal:extend()
function GoalHasFirepit:new()
    GoalHasFirepit.super.new(self)
    self.name_ = "GoalHasFirepit"
    self.desired_states_:AddState("has_firepit",true)
end

function GoalHasFirepit:GetPriority()
    return 10
end

return GoalHasFirepit