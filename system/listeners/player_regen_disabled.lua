-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("PLAYER_REGEN_DISABLED", function(...)
  ProbablyEngine.module.player.combat = true
end)
