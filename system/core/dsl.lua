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

local function comparator(condition, target, condition_spell)

  local modify_not = false

  if string.sub(target, 1, 1) == '!' then
    target = string.sub(target, 2)
    modify_not = true
  end

  local conditions = {strsplit(' ', condition)}
  local evaluation = false
  if #conditions == 3 then
    local value = tonumber(ProbablyEngine.dsl.get(conditions[1])(target, condition_spell))
    local compare_value = tonumber(conditions[3])
    if conditions[2] == '>=' then
      evaluation = value >= compare_value
    elseif conditions[2] == '<=' then
      evaluation = value <= compare_value
    elseif conditions[2] == '>' then
      evaluation = value > compare_value
    elseif conditions[2] == '<' then
      evaluation = value < compare_value
    elseif conditions[2] == '=' or conditions[2] == '==' then
      evaluation = value == compare_value
    elseif conditions[2] == '!=' or conditions[2] == '!' then
      evaluation = value ~= compare_value
    else
      ProbablyEngine.debug("Calling non-existant comparator: [" .. conditions .. "]")
      evaluation = false
    end
  else
    evaluation = ProbablyEngine.dsl.get(condition)(target, condition_spell)
  end

  if modify_not then
    return not evaluation
  end

  return evaluation

end

ProbablyEngine.dsl.parse = function(dsl, spell)
  local split = {strsplit('.', dsl)}
  local size = #split
  if size == 1 then
    local condition = split[1]
    local target = 'target'
    return comparator(condition, target, condition)
  elseif size == 2 then
    local target = split[1]
    local condition, condition_spell = getConditionalSpell(split[2], spell)
    return comparator(condition, target, condition_spell)
  elseif size == 3 then
    local target = split[1]
    local condition, condition_spell, subcondition = getConditionalSpell(split[2], spell)
    return comparator(condition..'.'..split[3], target, condition_spell)
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