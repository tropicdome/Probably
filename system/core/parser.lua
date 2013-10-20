-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

-- Credits to iLulz (JPS) for the idea
-- of a spell table.  It works great.

ProbablyEngine.parser = {
  lastCast = ''
}

ProbablyEngine.parser.can_cast =  function(spell, unit)
  -- Credits to iLulz (JPS) for this function

  if spell == nil then return false end
  if unit == "ground" then unit = nil end
  if unit == nil then unit = "target" end
  local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = ProbablyEngine.gsi.call(spellId)
  local skillType, spellId = GetSpellBookItemInfo(spell)
  local isUsable, notEnoughMana = IsUsableSpell(spell)
  if not isUsable then return false end
  if notEnoughMana then return false end
  if not UnitExists(unit) then return false end
  if not UnitIsVisible(unit) then return false end
  if UnitIsDeadOrGhost(unit) then return false end
  if SpellHasRange(spell) == 1 and IsSpellInRange(spell, unit) == 0 then return false end
  if select(2, GetSpellCooldown(spell)) > 1 then return false end
  if ProbablyEngine.module.player.casting == true then return false end
  if UnitChannelInfo("player") == nil then return true else return false end
  return true
end

ProbablyEngine.parser.can_cast_queue =  function(spell)
  local isUsable, notEnoughMana = IsUsableSpell(spell)
  if not isUsable then return false end
  if notEnoughMana then return false end
  if select(2, GetSpellCooldown(spell)) ~= 0 then return false end
  return true
end


ProbablyEngine.parser.nested = function(evaluationTable, event)
  for _, evaluation in pairs(evaluationTable) do
    local eval = ProbablyEngine.dsl.parse(evaluation, event)
    if not eval then
      return false
    end
  end
  return true
end

ProbablyEngine.parser.table = function(spellTable)

  for _, arguments in pairs(spellTable) do

    local eventType = type(arguments[1])
    local event = arguments[1]
    local evaluationType = type(arguments[2])
    local evaluation = arguments[2]
    local target = arguments[3]

    if eventType == "string" then
      if string.sub(event, 1, 1) == '!' then
        eventType = "macro"
      end
    end

    if eventType == "string" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, event)
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, event)
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "nil" then
        evaluation = true
      end
    elseif eventType == "table" or eventType == "macro" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, '')
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, '')
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "nil" then
        evaluation = true
      end
    end

    if target == nil then
      target = "target"
    end

    if evaluation then
      if eventType == "table" then
        return ProbablyEngine.parser.table(event)
      elseif eventType == "macro" then
        RunMacroText(string.sub(event, 2))
        return false
      else
        if ProbablyEngine.parser.can_cast(event, target) then
          ProbablyEngine.parser.lastCast = event
          return event, target
        end
      end
    end

  end
  spellTable = nil
end
