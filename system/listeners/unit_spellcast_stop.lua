-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("UNIT_SPELLCAST_STOP", function(...)
  local unitID = ...
  if unitID == "player" then
    ProbablyEngine.module.player.casting = false
    ProbablyEngine.module.player.channeling = false
  end
end)
