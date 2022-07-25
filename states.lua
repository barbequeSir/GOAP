local Object = require "common.classic"

local States = Object:extend()

States.states_ = nil
function States:new()
    self.states_ = {}
end

function States:AddState(key,value)
    self.states_[key] = value
end

function States:CopyStates(otherStates)
    if self.states_ == nil then
        self.states_ = {}
    end

    for k, v in pairs(otherStates.states_) do
        self.states_[k] = v
    end
end

function States:IsAllStatesIn(otherStates)
    local ret = true
    for k, v in pairs(self.states_) do
        if otherStates.states_[k] ~= v then
            ret = false
            break
        end
    end
    return ret
end

function States:Subtract(otherStates)
    local ret = false
    for k, v in pairs(self.states_) do
        if otherStates.states_[k] == v then
            self.states_[k] = nil
            ret = true
        end
    end
    return ret
end

function States:Merge(otherStates)
    for k, v in pairs(otherStates.states_) do
        self.states_[k] = v
    end
end

function States:IsEmpty()
    local cnt = 0
    for k, v in pairs(self.states_) do
        if v~=nil then
            cnt = cnt+1
        end
    end
    return cnt == 0
end

function States:Duplicate()
    local newState = States()
    newState:Merge(self)
    return newState
end

return States