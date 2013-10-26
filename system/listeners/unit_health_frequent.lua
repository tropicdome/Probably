-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("UNIT_HEALTH_FREQUENT", function(...)
  local unitID = ...
  if unitID == "player" then
    ProbablyEngine.module.player.health = UnitHealth("player")
  else
    --if ProbablyEngine.raid.roster[unitID] then
    --  ProbablyEngine.raid.roster[unitID] = UnitHealth(unitID)
    --end
  end
end)
