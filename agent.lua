local Object = require "./common/classic"
local States = require "states"
local Planner = require "planner"
require "goap"
local Agent = Object:extend()

Agent.goals_ = nil
Agent.actor_ = nil

Agent.current_goal_=nil
Agent.current_plan_ = nil
Agent.current_plan_index_ = 0


function Agent:new(actor,goals)
    self.actor_ = actor
    self.goals_ = goals
end

function Agent:Tick(delta)
    local goal = self:FindBestGoal()    

    if self.current_goal_ == nil or self.current_goal_~= goal then
        local currentWorldStates = Goap:GetWorldStates():Duplicate()

        self.current_goal_ = goal
        self.current_plan_ = Goap:GetActionPlanner():GetPlan(self.current_goal_,currentWorldStates)
        self.current_plan_index_ = 0
    else
        self:FollowPlan(self.current_plan_,delta)
    end
end

function Agent:FollowPlan(plan,delta)
    if self.current_plan_ == nil or #self.current_plan_ == 0 then
        return
    end

    local isStepComplete = plan[self.current_plan_index_].Tick(delta)
    if isStepComplete and self.current_plan_index_ < #plan then
        self.current_plan_index_ = self.current_plan_index_ + 1
    end
end

function Agent:FindBestGoal()
    local bestGoal = nil
    local priority = 0 
    for i = 1,#self.goals_,1 do
        local goal = self.goals_[i]
        if goal.IsValid() then
            local p = goal:GetPriority()
            if p > priority then
                bestGoal = goal
                priority = p
            end
        end
    end
    return bestGoal
end

return Agent