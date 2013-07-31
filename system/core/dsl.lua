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
  if string.sub(condition, 1, 1) == '!' then
    condition = string.sub(condition, 2)
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
        ProbablyEngine.debug("Calling non-existant comparator: [" .. comparator_table .. "]", 1)
        evaluation = false
      end
    end
  else
    evaluation = ProbablyEngine.dsl.get(condition)(target, condition_spell)
  end
  if modify_not then
    return not evaluation
  end
  ProbablyEngine.debug(condition ..'-'.. target ..'-'.. condition_spell ..'-'.. tostring(evaluation), 6)
  return evaluation
end

ProbablyEngine.dsl.conditionizers = {}
ProbablyEngine.dsl.conditionizers['modifier'] = true
ProbablyEngine.dsl.conditionizers['!modifier'] = true
ProbablyEngine.dsl.conditionizers['spell'] = true
ProbablyEngine.dsl.conditionizers['!spell'] = true
ProbablyEngine.dsl.conditionizers['enchant'] = true
ProbablyEngine.dsl.conditionizers['!enchant'] = true
ProbablyEngine.dsl.conditionizers['totem'] = true
ProbablyEngine.dsl.conditionizers['!totem'] = true

ProbablyEngine.dsl.conditionize = function(target, condition)
  if ProbablyEngine.dsl.conditionizers[target] then
    return target..'.'..condition
  else
    return condition
  end
end

ProbablyEngine.dsl.parse = function(dsl, spell)
  parse_table = {strsplit('.', dsl, 3)}
  local size = #parse_table
  if size == 1 then
    local condition, spell = string.match(dsl, '(.+)%((.+)%)')
    return ProbablyEngine.dsl.comparator(condition, spell, spell)
  elseif size == 2 then
    local target = parse_table[1]
    local condition, condition_spell = ProbablyEngine.dsl.getConditionalSpell(parse_table[2], spell)
    condition = ProbablyEngine.dsl.conditionize(target, condition)
    return ProbablyEngine.dsl.comparator(condition, target, condition_spell)
  elseif size == 3 then
    local target = parse_table[1]
    local condition, condition_spell, subcondition = ProbablyEngine.dsl.getConditionalSpell(parse_table[2], spell)
    condition = ProbablyEngine.dsl.conditionize(target, condition)
    return ProbablyEngine.dsl.comparator(condition..'.'..parse_table[3], target, condition_spell)
  end
  return ProbablyEngine.dsl.get(dsl)('target', spell)
end

ProbablyEngine.dsl.get = function(condition)
  if ProbablyEngine.condition[condition] ~= nil then
    return ProbablyEngine.condition[condition]
  else
    ProbablyEngine.debug("Calling non-existant dsl condition: [" .. condition .. "]", 1)
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