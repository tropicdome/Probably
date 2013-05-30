-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("UNIT_SPELLCAST_CHANNEL_START", function(...)
  local unitID = ...
  if unitID == "player" then
    ProbablyEngine.module.player.casting = true
    ProbablyEngine.module.player.channeling = true
  end
end)
