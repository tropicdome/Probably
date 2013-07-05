
ProbablyEngine.condition.register("buff", function(target, spell)
  local buff = UnitBuff(target, spell)
  if buff == nil then
    return false
  end
  return true
end)

ProbablyEngine.condition.register("focus", function(target, spell)
  return UnitPower(target, SPELL_POWER_FOCUS)
end)