-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.canned = {
  withCount = "([%a_]+)%((%d%.?%d?)%)?:(.*)",
  withoutCount = "([%a_]+):(.*)"
}

-- Why can't Lua just use regex... fuck off with this pattern shit.

ProbablyEngine.canned.parse = function(str, spell)
  if string.match(str, ProbablyEngine.canned.withCount) then
    local condition, count, spell = string.match(str, ProbablyEngine.canned.withCount)
    return ProbablyEngine.canned.get(condition)(spell, tonumber(count))
  elseif string.match(str, ProbablyEngine.canned.withoutCount) then
    local condition, spell = string.match(str, ProbablyEngine.canned.withoutCount)
    return ProbablyEngine.canned.get(condition)(spell)
  else
    return ProbablyEngine.canned.get(str)(spell)
  end
end

ProbablyEngine.canned.get = function(condition)
  if ProbablyEngine.canned[condition] ~= nil then
    return ProbablyEngine.canned[condition]
  else
    ProbablyEngine.debug("Calling non-existant canned condition: " .. condition)
    return (function() return false end)
  end
end

ProbablyEngine.canned.register = function (condition, evaluation)
  ProbablyEngine.canned[condition] = evaluation
end

ProbablyEngine.canned.unregister = function (condition)
  ProbablyEngine.canned[condition] = nil
end