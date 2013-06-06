---- player status

ProbablyEngine.canned.register("player_moving", function(spell)
  return GetUnitSpeed("player") ~= 0
end)

ProbablyEngine.canned.register("player_health", function(health)
  return ProbablyEngine.condition.player.health() >= tonumber(health)
end)

---- player powers

ProbablyEngine.canned.register("mana", function(count)
  return UnitPower("player", 0) >= tonumber(count)
end)

ProbablyEngine.canned.register("rage", function(count)
  print(count)
  return UnitPower("player", 1) >= tonumber(count)
end)

ProbablyEngine.canned.register("focus", function(count)
  return UnitPower("player", 2) >= tonumber(count)
end)

ProbablyEngine.canned.register("energy", function(count)
  return UnitPower("player", 3) >= tonumber(count)
end)

ProbablyEngine.canned.register("runes", function(count)
  return UnitPower("player", 5) >= tonumber(count)
end)

ProbablyEngine.canned.register("runicpower", function(count)
  return UnitPower("player", 6) >= tonumber(count)
end)

ProbablyEngine.canned.register("soulshards", function(count)
  return UnitPower("player", 7) >= tonumber(count)
end)

ProbablyEngine.canned.register("eclipse", function(count)
  return UnitPower("player", 8) >= tonumber(count)
end)

ProbablyEngine.canned.register("holypower", function(count)
  return UnitPower("player", 9) >= tonumber(count)
end)

ProbablyEngine.canned.register("darkforce", function(count)
  return UnitPower("player", 11) >= tonumber(count)
end)

ProbablyEngine.canned.register("lightforce", function(count)
  return UnitPower("player", 12) >= tonumber(count)
end)

ProbablyEngine.canned.register("shadoworbs", function(count)
  return UnitPower("player", 13) >= tonumber(count)
end)

ProbablyEngine.canned.register("burningembers", function(count)
  return UnitPower("player", 14) >= tonumber(count)
end)

ProbablyEngine.canned.register("demonicfury", function(count)
  return UnitPower("player", 15) >= tonumber(count)
end)
