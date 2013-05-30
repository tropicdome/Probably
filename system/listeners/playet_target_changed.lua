-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_TARGET_CHANGED", function(...)
  ProbablyEngine.module.target.health = UnitHealth("target")
  ProbablyEngine.module.target.power = UnitPower("target")
  ProbablyEngine.module.target.class = UnitClass("target")
  ProbablyEngine.module.target.level = UnitLevel("target")
  ProbablyEngine.module.target.name = UnitName("target")
end)
