-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local ignoreSpells = { 75 }

ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
  local unitID, spell, rank, lineID, spellID = ...
  if unitID == "player" then
  end
end)
