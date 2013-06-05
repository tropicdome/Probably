-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.canned = {
  withCount = "([%a_]+)%((%d)%)?:(.*)",
  withoutCount = "([%a_]+):(.*)"
}

ProbablyEngine.canned.parse = function(str, spell)
  if string.match(str, ProbablyEngine.canned.withCount) then
    local condition, count, spell = string.match(str, ProbablyEngine.canned.withCount)
    return ProbablyEngine.canned[condition](spell, tonumber(count))
  elseif string.match(str, ProbablyEngine.canned.withoutCount) then
    local condition, spell = string.match(str, ProbablyEngine.canned.withoutCount)
  else
    return ProbablyEngine.canned[str](spell)
  end
end

ProbablyEngine.canned.register = function (condition, evaluation)
  ProbablyEngine.canned[condition] = evaluation
end

ProbablyEngine.canned.unregister = function (condition)
  ProbablyEngine.canned[condition] = nil
end