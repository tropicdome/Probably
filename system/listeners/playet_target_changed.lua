-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("PLAYER_TARGET_CHANGED", function(...)
  ProbablyEngine.module.target.health = UnitHealth("target")
  ProbablyEngine.module.target.power = UnitPower("target")
  ProbablyEngine.module.target.class = UnitClass("target")
  ProbablyEngine.module.target.level = UnitLevel("target")
  ProbablyEngine.module.target.name = UnitName("target")
end)
