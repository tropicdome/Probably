ProbablyEngine.condition.register_group("player")

-- buff/debuff
ProbablyEngine.condition.register("player", "buff", function(buff)
  buff = UnitBuff("player", buff)
  if buff == nil then
    return false
  end
  return true
end)

ProbablyEngine.condition.register("player", "debuff", function(debuff)
  debuff = UnitDebuff("player", debuff)
  if debuff == nil then
    return false
  end
  return true
end)

ProbablyEngine.condition.register("player", "buff_duration", function(buff)
  buff = UnitBuff("player", buff)
  if buff == nil then
    return false
  end
  return (select(7, buff) - GetTime())
end)

ProbablyEngine.condition.register("player", "debuff_duration", function(debuff)
  debuff = UnitDebuff("player", debuff)
  if debuff == nil then
    return false
  end
  return (select(7, debuff) - GetTime())
end)

-- health

ProbablyEngine.condition.register("player", "health", function()
  return (UnitHealth("player") / UnitHealthMax("player"))
end)

ProbablyEngine.condition.register("player", "abs_health", function()
  return UnitHealth("player")
end)

ProbablyEngine.condition.register("player", "health", function()
  return (UnitHealth("player") / UnitHealthMax("player"))
end)

-- Resources

ProbablyEngine.condition.register("player", "mana", function()
  return UnitPower("player", 0)
end)

ProbablyEngine.condition.register("player", "rage", function()
  return UnitPower("player", 1)
end)

ProbablyEngine.condition.register("player", "focus", function()
  return UnitPower("player", 2)
end)

ProbablyEngine.condition.register("player", "energy", function()
  return UnitPower("player", 3)
end)

ProbablyEngine.condition.register("player", "runes", function()
  return UnitPower("player", 5)
end)

ProbablyEngine.condition.register("player", "runicpower", function()
  return UnitPower("player", 6)
end)

ProbablyEngine.condition.register("player", "soulshards", function()
  return UnitPower("player", 7)
end)

ProbablyEngine.condition.register("player", "eclipse", function()
  return UnitPower("player", 8)
end)

ProbablyEngine.condition.register("player", "holypower", function()
  return UnitPower("player", 9)
end)

ProbablyEngine.condition.register("player", "darkforce", function()
  return UnitPower("player", 11)
end)

ProbablyEngine.condition.register("player", "lightforce", function()
  return UnitPower("player", 12)
end)

ProbablyEngine.condition.register("player", "shadoworbs", function()
  return UnitPower("player", 13)
end)

ProbablyEngine.condition.register("player", "burningembers", function()
  return UnitPower("player", 14)
end)

ProbablyEngine.condition.register("player", "demonicfury", function()
  return UnitPower("player", 15)
end)
