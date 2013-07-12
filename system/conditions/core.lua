
ProbablyEngine.condition.register("buff", function(target, spell)
  local buff,_,_,_,_,_,_,caster = UnitBuff(target, spell)
  if buff ~= nil and (caster == 'player' or caster == 'pet') then
    return true
  end
  return false
end)

ProbablyEngine.condition.register("buff.count", function(target, spell)
  local buff,_,_,count,_,_,_,caster = UnitBuff(target, spell)
  if buff ~= nil and (caster == 'player' or caster == 'pet') then
    return count
  end
  return 0
end)

ProbablyEngine.condition.register("debuff", function(target, spell)
  local debuff,_,_,_,_,_,_,caster = UnitDebuff(target, spell)
  if debuff ~= nil and (caster == 'player' or caster == 'pet') then
    return true
  end
  return false
end)

ProbablyEngine.condition.register("debuff.duration", function(target, spell)
  local debuff,_,_,_,_,_,expires,caster = UnitDebuff(target, spell)
  if debuff ~= nil and (caster == 'player' or caster == 'pet') then
    return (expires - (GetTime()-ProbablyEngine.lag))
  end
  return 0
end)

ProbablyEngine.condition.register("buff.duration", function(target, spell)
  local buff,_,_,_,_,_,expires,caster = UnitBuff(target, spell)
  if buff ~= nil and (caster == 'player' or caster == 'pet') then
    return (expires - (GetTime()-ProbablyEngine.lag))
  end
  return 0
end)

ProbablyEngine.condition.register("focus", function(target, spell)
  return UnitPower(target, SPELL_POWER_FOCUS)
end)

ProbablyEngine.condition.register("holypower", function(target, spell)
  return UnitPower(target, SPELL_POWER_HOLY_POWER)
end)

ProbablyEngine.condition.register("shadoworbs", function(target, spell)
  return UnitPower(target, SPELL_POWER_SHADOW_ORBS)
end)

ProbablyEngine.condition.register("energy", function(target, spell)
  return UnitPower(target, SPELL_POWER_ENERGY)
end)

ProbablyEngine.condition.register("combopoints", function()
  return GetComboPoints('player', 'target')
end)

ProbablyEngine.condition.register("modifier.shift", function()
  return IsShiftKeyDown() == 1
end)

ProbablyEngine.condition.register("modifier.control", function()
  return IsControlKeyDown() == 1
end)

ProbablyEngine.condition.register("modifier.alt", function()
  return IsAltKeyDown() == 1
end)

ProbablyEngine.condition.register("balance.sun", function()
  local direction = GetEclipseDirection()
  if direction == 'none' or direction == 'sun' then return true end
end)

ProbablyEngine.condition.register("balance.moon", function()
  local direction = GetEclipseDirection()
  if direction == 'moon' then return true end
end)

ProbablyEngine.condition.register("moving", function(target, spell)
  return GetUnitSpeed(target) ~= 0
end)

-- DK Power

ProbablyEngine.condition.register("runicpower", function(target, spell)
  return UnitPower(target, SPELL_POWER_RUNIC_POWER)
end)

ProbablyEngine.condition.register("runes", function(target, rune)
  if rune == 'frost' or rune == 'Frost' then
    local r1 = select(3, GetRuneCooldown(5))
    local r2 = select(3, GetRuneCooldown(6))
    if r1 and r2 then
      return 2
    elseif r1 or r2 then
      return 1
    else
      return 0
    end
  elseif rune == 'death' or rune == 'Death' or rune == 'Blood' or rune == 'blood' then
    local r1 = select(3, GetRuneCooldown(1))
    local r2 = select(3, GetRuneCooldown(2))
    if r1 and r2 then
      return 2
    elseif r1 or r2 then
      return 1
    else
      return 0
    end
  elseif rune == 'unholy' or rune == 'Unholy' then
    local r1 = select(3, GetRuneCooldown(3))
    local r2 = select(3, GetRuneCooldown(4))
    if r1 and r2 then
      return 2
    elseif r1 or r2 then
      return 1
    else
      return 0
    end
  end

end)

ProbablyEngine.condition.register("unholy", function(target, spell)
  return select(3, GetRuneCooldown(3)) or select(3, GetRuneCooldown(4))
end)


ProbablyEngine.condition.register("health", function(target, spell)
  return math.floor((UnitHealth(target) / UnitHealthMax(target)) * 100)
end)

ProbablyEngine.condition.register("modifier.multitarget", function()
  return ProbablyEngine.module.config.multitarget
end)

ProbablyEngine.condition.register("modifier.cooldowns", function()
  return ProbablyEngine.module.config.cooldowns
end)

ProbablyEngine.condition.register("modifier.enemies", function()
  return ProbablyEngine.module.world.count
end)

