-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_REGEN_ENABLED", function(...)
  ProbablyEngine.module.player.combat = false
  ProbablyEngine.module.world.flush_table()
end)
