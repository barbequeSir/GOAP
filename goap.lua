local Planner = require "planner"
local States = require "states"
local ActionBuildFirepit = require "actions.action_build_firepit"
local ActionCalmDown = require "actions.action_calm_down"
local ActionChopTree = require "actions.action_chop_tree"
local ActionCollectWoodFormStock = require "actions.action_collect_wood_from_stock"
local ActionFindCover = require "actions.action_find_cover"
local ActionFindFood = require "actions.action_find_food"
Goap = {}
Goap.action_planner_ = nil

function Goap:CreateActionPlanner()
    if self.action_planner_ == nil then
        self.action_planner_ = Planner()

        local actions = {}
        table.insert(actions,ActionBuildFirepit())
        table.insert(actions,ActionCalmDown())
        table.insert(actions,ActionChopTree())
        table.insert(actions,ActionCollectWoodFormStock())
        table.insert(actions,ActionFindCover())
        table.insert(actions,ActionFindFood())

        self.action_planner_:SetActions(actions)
    end
end

function Goap:GetActionPlanner()
    if self.action_planner_ == nil then
        self:CreateActionPlanner()
    end
    return self.action_planner_
end


Goap. world_states_ = nil
function Goap:GetWorldStates()
    if self.world_states_ == nil then
        self.world_states_ = States()
        --self.world_states_:AddState("has_wood",true)
    end
    return self.world_states_
end
