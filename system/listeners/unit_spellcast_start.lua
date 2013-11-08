-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("UNIT_SPELLCAST_START", function(...)
  local unitID = ...
  if unitID == "player" then
    ProbablyEngine.module.player.casting = true
  end
end)
