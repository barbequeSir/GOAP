local Goal = require "goals.goal"

local GoalCalmDown = Goal:extend()

function GoalCalmDown:new()
    GoalCalmDown.super.new(self)
    self.name_ = "GoalCalmDown"
    self.desired_states_:AddState("is_frightened",false)
end

function GoalCalmDown:GetPriority()
    return 1
end

return GoalCalmDown