
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
  return false
end)

ProbablyEngine.condition.register("debuff", function(target, spell)
  local debuff,_,_,_,_,_,_,caster = UnitDebuff(target, spell)
  if debuff ~= nil and (caster == 'player' or caster == 'pet') then
    return true
  end
  return false
end)

ProbablyEngine.condition.register("focus", function(target, spell)
  return UnitPower(target, SPELL_POWER_FOCUS)
end)