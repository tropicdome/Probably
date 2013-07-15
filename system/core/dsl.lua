-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.dsl = {

}

local comparator_table = { }
local parse_table = { }

ProbablyEngine.dsl.getConditionalSpell = function(dsl, spell)
  -- check if we are passing a spell with the conditional
  if string.match(dsl, '(.+)%((.+)%)') then
    return string.match(dsl, '(.+)%((.+)%)')
  else
    return dsl, spell
  end
end

ProbablyEngine.dsl.comparator = function(condition, target, condition_spell)
  local modify_not = false
  if string.sub(target, 1, 1) == '!' then
    target = string.sub(target, 2)
    modify_not = true
  end
  comparator_table = { strsplit(' ', condition) }
  local evaluation = false
  if #comparator_table == 3 then
    local condition_call = ProbablyEngine.dsl.get(comparator_table[1])(target, condition_spell)

    local value = tonumber(condition_call)
    local compare_value = tonumber(comparator_table[3])

    if compare_value == nil then
      evaluation = comparator_table[3]  == condition_call
    else
      if comparator_table[2] == '>=' then
        evaluation = value >= compare_value
      elseif comparator_table[2] == '<=' then
        evaluation = value <= compare_value
      elseif comparator_table[2] == '>' then
        evaluation = value > compare_value
      elseif comparator_table[2] == '<' then
        evaluation = value < compare_value
      elseif comparator_table[2] == '=' or comparator_table[2] == '==' then
        evaluation = value == compare_value
      elseif comparator_table[2] == '!=' or comparator_table[2] == '!' then
        evaluation = value ~= compare_value
      else
        ProbablyEngine.debug("Calling non-existant comparator: [" .. comparator_table .. "]")
        evaluation = false
      end
    end
  else
    evaluation = ProbablyEngine.dsl.get(condition)(target, condition_spell)
  end
  if modify_not then
    return not evaluation
  end
  ProbablyEngine.debug(condition ..'-'.. target ..'-'.. condition_spell ..'-'.. tostring(evaluation), 5)
  return evaluation
end

ProbablyEngine.dsl.parse = function(dsl, spell)
  parse_table = {strsplit('.', dsl, 3)}
  local size = #parse_table
  if size == 1 then
    local condition = parse_table[1]
    local target = 'target'
    return ProbablyEngine.dsl.comparator(condition, target, condition)
  elseif size == 2 then
    local target = parse_table[1]
    local condition, condition_spell = ProbablyEngine.dsl.getConditionalSpell(parse_table[2], spell)
    if target == 'modifier' or target == '!modifier' or target == 'spell' or target == '!spell' then
      condition = target..'.'..condition
    end
    return ProbablyEngine.dsl.comparator(condition, target, condition_spell)
  elseif size == 3 then
    local target = parse_table[1]
    if target == 'modifier' or target == '!modifier' or target == 'spell' or target == '!spell' then
      condition = target..'.'..condition
    end
    local condition, condition_spell, subcondition = ProbablyEngine.dsl.getConditionalSpell(parse_table[2], spell)
    return ProbablyEngine.dsl.comparator(condition..'.'..parse_table[3], target, condition_spell)
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