ProbablyEngine.condition.register_group("target")

-- buff/debuff
ProbablyEngine.condition.register("target", "buff", function(buff)
  local buff = UnitBuff("target", buff)
  if buff == nil then
    return false
  end
  return true
end)

ProbablyEngine.condition.register("target", "debuff", function(debuff)
  local debuff = UnitDebuff("target", debuff)
  if debuff == nil then
    return false
  end
  return true
end)

ProbablyEngine.condition.register("target", "buff_duration", function(buff)
  local debuff,_,_,_,_,_,time = UnitDebuff("target", debuff)
  if buff == nil then
    return 0
  end
  return (time - GetTime())
end)

ProbablyEngine.condition.register("target", "debuff_duration", function(debuff)
  local debuff,_,_,_,_,_,time = UnitDebuff("target", debuff)
  if debuff == nil then
    return 0
  end
  return (time - GetTime())
end)
