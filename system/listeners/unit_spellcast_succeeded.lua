-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

local ignoreSpells = { 75 }

ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
  local unitID, spell, rank, lineID, spellID = ...
  if unitID == "player" then
    ProbablyEngine.debug(spell .. " : " .. spellID)
  end
end)
