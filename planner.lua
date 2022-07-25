local Object = require "common.classic"
local States = require "states"
local Planner = Object:extend()

Planner.actions_ = nil
function Planner:new()
end

function Planner:SetActions(actions)
    self.actions_ = actions
end

function Planner:GetPlan(goal,worldState)
    local desiredState = States()
    desiredState:CopyStates(goal.desired_states_)

    if desiredState:IsEmpty() then
        return {}
    end

    return self:FindBestPlan(goal,desiredState,worldState)
    
end

function Planner:FindBestPlan(goal,desiredStates,worldStates)
    local rootNode = {
        action = goal,
        states = desiredStates,
        children = {}
    }

    if self:BuildPlans(rootNode,worldStates) then
        local plans = self:TransTreeToArray(rootNode,worldStates)
        return self:GetCheapestPlan(plans)
    end
    return {}
end

function Planner:BuildPlans(node,worldState)
    local hasFollowUp = false

    local state = node.states:Duplicate()

    state:Subtract(worldState)

    if state:IsEmpty() then
        return true
    end

    for i, action in ipairs(self.actions_) do
        if action:IsValid() then
            local useAction = false
            local effects = action:GetEffects()
            local desiredState = state:Duplicate()

            useAction = desiredState:Subtract(effects)
            if useAction then
                local preConds = action:GetPreConditions()
                desiredState:Merge(preConds)

                local tempNode = {
                    action = action,
                    states = desiredState,
                    children = {}
                }
                
                if desiredState:IsEmpty() or self:BuildPlans(tempNode,worldState) then
                    table.insert(node.children,tempNode)
                    hasFollowUp = true
                end
            end
        end
    end

    return hasFollowUp
end

function Planner:TransTreeToArray(p,worldStates)
    local plans = {}

    if #p.children == 0 then
        table.insert(plans,{
            actions = {p.action},
            cost = p.action:GetCost(worldStates)
        })
        return plans
    end

    for i, child in ipairs(p.children) do
        local subPlans = self:TransTreeToArray(child,worldStates)
        for i, subPlan in ipairs(subPlans) do
            if p.action.GetCost~=nil then
                table.insert(subPlan.actions,p.action)
                subPlan.cost = subPlan.cost + p.action:GetCost(worldStates)
            end
            table.insert(plans,subPlan)
        end 
    end
    return plans
end

function Planner:GetCheapestPlan(plans)
    local bestPlan = nil
    for i, plan in ipairs(plans) do
        self:PrintPlan(plan)
        if bestPlan == nil or bestPlan.cost > plan.cost then
            bestPlan = plan
        end
    end
    return bestPlan.actions
end

function Planner:PrintPlan(plan)
    local str = "**:" .. plan.cost .. "||"
    for i, action in ipairs(plan.actions) do
        str = str .. action:GetName() .. " -"
    end

    print(str)
end

return Planner