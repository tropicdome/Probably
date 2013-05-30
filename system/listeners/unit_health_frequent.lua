-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("UNIT_HEALTH_FREQUENT", function(...)
  local unitID = ...
  if unitID == "player" then
    ProbablyEngine.module.player.health = UnitHealth("player")
  end
end)
