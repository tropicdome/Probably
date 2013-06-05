-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.parser = { }

local function castable(spell, unit)
  if spell == nil then return false end
  local spell = spell:lower()
  if unit == nil then unit = "target" end
  local _, spellID = GetSpellBookItemInfo(spell)
  local usable, nomana = IsUsableSpell(spell)
  if not UnitExists(unit) then return false end
  if UnitIsDead(unit) then return false end
  if UnitIsDeadOrGhost(unit) then return false end
  if not usable then return false end
  if select(2, GetSpellCooldown(spellID)) ~= 0 then return false end
  if nomana then return false end
  if not UnitIsVisible(unit) then return false end
  if SpellHasRange(spell) == 1 and IsSpellInRange(spell, unit) == 0 then return false end
  return true
end

ProbablyEngine.parser.table = function(spellTable)

  for _, arguments in pairs(spellTable) do

    local eventType = type(arguments[1])
    local spell = arguments[1]
    local evaluation = arguments[2]
    local target = arguments[3]

    if eventType == "table" then
      ProbablyEngine.debug("Table Parse: Table")
    end

    if evaluation == nil then
      evaluation = true
    else
      evaluation = evaluation()
    end

    if target == nil then
      target = "target"
    end

    if castable(spell, target) and evaluation then
      ProbablyEngine.debug("Table Parse: Cast Spell - " .. spell)
      return spell, target
    end

  end

  spellTable = nil

end
