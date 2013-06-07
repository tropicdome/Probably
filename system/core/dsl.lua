-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.dsl = {
  withCount = "([%a%._]+)%((%d+%.?%d?)%)?:?(.*)",
  withoutCount = "([%a_]+):(.*)"
}

-- Why can't Lua just use regex... fuck off with this pattern shit.

ProbablyEngine.dsl.parse = function(str, spell)
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

ProbablyEngine.dsl.get = function(condition)
  if ProbablyEngine.dsl[condition] ~= nil then
    return ProbablyEngine.dsl[condition]
  else
    ProbablyEngine.debug("Calling non-existant dsl condition: " .. condition)
    return (function() return false end)
  end
end

ProbablyEngine.dsl.register = function (condition, evaluation)
  ProbablyEngine.dsl[condition] = evaluation
end

ProbablyEngine.dsl.unregister = function (condition)
  ProbablyEngine.dsl[condition] = nil
end