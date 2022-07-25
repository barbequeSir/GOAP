local Goal = require "goals.goal"

local GoalRelax = Goal:extend()

function GoalRelax:new()    
    GoalRelax.super.new(self)
    self.name_ = "GoalRelax"
end

function GoalRelax:GetPriority()
    return 1
end
return GoalRelax