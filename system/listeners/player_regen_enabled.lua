-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("PLAYER_REGEN_ENABLED", function(...)
  ProbablyEngine.module.player.combat = false
  ProbablyEngine.module.world.flush_table()
end)
