-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local ignoreSpells = { 75 }

ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
  local unitID, spell, rank, lineID, spellID = ...
  if unitID == "player" then
    local name, _, icon, _, _, _, _, _, _ = ProbablyEngine.gsi.call(spell)
    if icon then
      table.insert(ProbablyEngine.actionLog.log, 1, {
        event = 'Spell Cast Succeed',
        description = '|T' .. icon .. ':-1:-1:0:0|t |Hspell:' .. spellID .. '|h'..spell..'|h',
        time = date("%H:%M:%S")
      })
    end
    ProbablyEngine.module.player.cast(spell)
  end
end)
