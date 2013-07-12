-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("GROUP_ROSTER_UPDATE", function(...)
  ProbablyEngine.module.world.rebuild_friendly()
  ProbablyEngine.module.world.add_friendly(UnitGUID("player"), UnitName("player"))
end)