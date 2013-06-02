-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_REGEN_DISABLED", function(...)
  ProbablyEngine.module.player.combat = true
end)
