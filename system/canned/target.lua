-- Target conditions

ProbablyEngine.canned.register("target_health", function(health)
  return ProbablyEngine.condition.target.health() >= tonumber(health)
end)