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

  -- fuck lua you are a dirty basterd
  -- we do this so we can keep the same table
  -- and save some memory
  for i,_ in ipairs(comparator_table) do comparator_table[i] = nil end
  local arg1, arg2, arg3 = strsplit(' ', condition, 3)
  if arg1 then table.insert(comparator_table, arg1) end
  if arg2 then table.insert(comparator_table, arg2) end
  if arg3 then table.insert(comparator_table, arg3) end

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

ProbablyEngine.dsl.conditionizers_single = {}
ProbablyEngine.dsl.conditionizers_single['toggle'] = true
ProbablyEngine.dsl.conditionizers_single['!toggle'] = true

ProbablyEngine.dsl.conditionize = function(target, condition)
  if ProbablyEngine.dsl.conditionizers[target] then
    return target..'.'..condition
  elseif ProbablyEngine.dsl.conditionizers_single[target] then
    return target
  else
    return condition
  end
end

ProbablyEngine.dsl.parse = function(dsl, spell)

  -- same as above, saving ram
  for i,_ in ipairs(parse_table) do parse_table[i] = nil end
  local arg1, arg2, arg3 = strsplit('.', dsl, 3)
  if arg1 then table.insert(parse_table, arg1) end
  if arg2 then table.insert(parse_table, arg2) end
  if arg3 then table.insert(parse_table, arg3) end

  local size = #parse_table
  if size == 1 then
    local condition, spell = string.match(dsl, '(.+)%((.+)%)')
    return ProbablyEngine.dsl.comparator(condition, spell, spell)
  elseif size == 2 then
    local target = parse_table[1]
    local condition, condition_spell = ProbablyEngine.dsl.getConditionalSpell(parse_table[2], spell)
    condition = ProbablyEngine.dsl.conditionize(target, condition)
    if ProbablyEngine.dsl.conditionizers_single[target] then
      return ProbablyEngine.dsl.comparator(condition, parse_table[2], condition_spell)
    end
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
