local Goal = require "goals.goal"

local GoalKeepFet = Goal:extend()

function GoalKeepFet:new()
    GoalKeepFet.super.new(self)
    self.name_ = "GoalKeepFet"
    self.desired_states_:AddState("is_hungry",false)
end

function GoalKeepFet:GetPriority()
    return 3
end

return GoalKeepFet