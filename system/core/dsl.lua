-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.dsl = {

}

local function getConditionalSpell(dsl, spell)
  -- check if we are passing a spell with the conditional
  if string.match(dsl, '(.+)%((.+)%)') then
    return string.match(dsl, '(.+)%((.+)%)')
  else
    return dsl, spell
  end
end

ProbablyEngine.dsl.parse = function(dsl, spell)
  -- split the string on .'s
  local split = {strsplit('%.', dsl)}
  -- get the size of the dsl command
  local size = #split -- lol lua, you funny
  -- if the size is one then we have a non-spell related conditional
  if size == 1 then
    local action = split[1]
    local target = 'target'
    return ProbablyEngine.dsl.get(action)(target)
  -- if the size is two, we have a single condition conditional
  elseif size == 2 then
    local target = split[1]
    local condition, condition_spell = getConditionalSpell(split[2], spell)

    local subcondition_split = {strsplit('%s', condition)}



    if #subcondition_split == 2 then
      print(subcondition_split[2])
      local subcondition = subcondition_split[1]
      local subcondition_comparison = subcondition_split[2]
      local subcondition_comparison_value = subcondition_split[3]
      return ProbablyEngine.dsl.get(condition)(target, condition_spell)
    else
      return ProbablyEngine.dsl.get(condition)(target, condition_spell)
    end


  elseif size == 3 then
    local target = split[1]
    local condition, condition_spell = getConditionalSpell(split[2], spell)
    local subcondition_split = strsplit('%s', split[3])
    local subcondition = subcondition_split[1]
    local subcondition_comparison = subcondition_split[2]
    local subcondition_comparison_value = subcondition_split[3]
    return ProbablyEngine.dsl.get(condition..'.'..subcondition)(target, condition_spell, subcondition_comparison, subcondition_comparison_value)
  end
  return ProbablyEngine.dsl.get(dsl)('target', spell)
end

ProbablyEngine.dsl.get = function(condition)
  if ProbablyEngine.condition[condition] ~= nil then
    return ProbablyEngine.condition[condition]
  else
    ProbablyEngine.debug("Calling non-existant dsl condition: [" .. condition .. "]")
    return (function() return false end)
  end
end

ProbablyEngine.dsl.register = function (condition, evaluation)
  ProbablyEngine.dsl[condition] = evaluation
end

ProbablyEngine.dsl.unregister = function (condition)
  ProbablyEngine.dsl[condition] = nil
end


--[[

ProbablyEngine.dsl = {
  old_withCount = "([%a%!%._]+)%((%d+%.?%d?)%)?:?(.*)",
  old_withoutCount = "([%a%!%._]+):(.*)"
}

ProbablyEngine.dsl.parse_old = function(str, spell)
  if string.match(str, ProbablyEngine.dsl.withCount) then
    local condition, count, spell = string.match(str, ProbablyEngine.dsl.withCount)
    if tonumber(count) then count = tonumber(count) end
    return ProbablyEngine.dsl.get(condition)(spell, count)
  elseif string.match(str, ProbablyEngine.dsl.withoutCount) then
    local condition, spell = string.match(str, ProbablyEngine.dsl.withoutCount)
    if tonumber(spell) then spell = tonumber(spell) end
    return ProbablyEngine.dsl.get(condition)(spell)
  else
    return ProbablyEngine.dsl.get(str)(spell)
  end
end

]]--