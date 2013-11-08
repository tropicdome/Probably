-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.parser = {
  lastCast = '',
  items = {
    head     = "HeadSlot",
    helm     = "HeadSlot",
    neck     = "NeckSlot",
    shoulder = "ShoulderSlot",
    shirt    = "ShirtSlot",
    chest    = "ChestSlot",
    belt     = "WaistSlot",
    waist    = "WaistSlot",
    legs     = "LegsSlot",
    pants    = "LegsSlot",
    feet     = "FeetSlot",
    boots    = "FeetSlot",
    wrist    = "WristSlot",
    bracers  = "WristSlot",
    gloves   = "HandsSlot",
    hands    = "HandsSlot",
    finger1  = "Finger0Slot",
    finger2  = "Finger1Slot",
    trinket1 = "Trinket0Slot",
    trinket2 = "Trinket1Slot",
    back     = "BackSlot",
    cloak    = "BackSlot",
    mainhand = "MainHandSlot",
    offhand  = "SecondaryHandSlot",
    weapon   = "MainHandSlot",
    weapon1  = "MainHandSlot",
    weapon2  = "SecondaryHandSlot",
    ranged   = "RangedSlot"
  }
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


ProbablyEngine.parser.nested = function(evaluationTable, event, target)
  local eval
  for _, evaluation in pairs(evaluationTable) do
    if string.sub(evaluation, 1, 1) == '@' then
      eval = ProbablyEngine.library.parse(event, evaluation, target)
      if not eval then return false end
    else
      eval = ProbablyEngine.dsl.parse(evaluation, event)
      if not eval then return false end
    end
  end
  return true
end

ProbablyEngine.parser.table = function(spellTable, fallBackTarget)

  for _, arguments in pairs(spellTable) do

    local eventType = type(arguments[1])
    local event = arguments[1]
    local evaluationType = type(arguments[2])
    local evaluation = arguments[2]
    local target = arguments[3] or fallBackTarget
    local slotId = 0

    if eventType == "string" then
      if string.sub(event, 1, 1) == '!' then
        eventType = "macro"
      elseif string.sub(event, 1, 1) == '#' then
        eventType = "item"
      end
    end

    -- is our eval a lib call ?
    if evaluationType == "string" then
      if string.sub(evaluation, 1, 1) == '@' then
        evaluationType = "library"
      end
    end

    if eventType == "string" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, event)
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, event, target)
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "library" then
        evaluation = ProbablyEngine.library.parse(event, evaluation, target)
      elseif evaluationType == "nil" then
        evaluation = true
      end
    elseif eventType == "table" or eventType == "macro" or eventType == "item" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, '')
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, '', target)
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "library" then
        evaluation = ProbablyEngine.library.parse(event, evaluation, target)      
      elseif evaluationType == "nil" then
        evaluation = true
      end
    end

    if target == nil then
      target = "target"
    end

    if eventType == "item" then
      local slot = string.sub(event, 2)
      slotId = GetInventorySlotInfo(ProbablyEngine.parser.items[slot])
      if slotId then
        local itemStart, itemDuration, itemEnable = GetInventoryItemCooldown("player", slotId)
        if evaluation == true and itemEnable == 1 and itemStart > 0 then
          evaluation = false
        end
      else
        -- soon my child
        return false
      end
    end

    if evaluation then
      if eventType == "table" then
        local testNest = ProbablyEngine.parser.table(event, target)
        if testNest then return testNest end
      elseif eventType == "macro" then
        RunMacroText(string.sub(event, 2))
        return false
      elseif eventType == "item" then
        UseInventoryItem(slotId)
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
