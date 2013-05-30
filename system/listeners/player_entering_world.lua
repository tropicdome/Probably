-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_ENTERING_WORLD", function(...)
  ProbablyEngine.module.player.health = UnitHealth("player")
  ProbablyEngine.module.player.power = UnitPower("player")
  ProbablyEngine.listener.eventActions["PLAYER_SPECIALIZATION_CHANGED"]("player")
end)
