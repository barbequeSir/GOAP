local Agent = require "agent"
local GoalCalmDown = require "goals/goal_calm_down"
local GoalHasFirepit = require "goals/goal_has_firepit"
local GoalKeepFet = require "goals/goal_keep_fet"
local GoalRelax = require "goals/goal_relax"

local actor=  {}
local goals = {}
table.insert(goals,GoalCalmDown())
table.insert(goals,GoalHasFirepit())
table.insert(goals,GoalKeepFet())
table.insert(goals,GoalRelax())

local agent = Agent(actor,goals)

agent:Tick()