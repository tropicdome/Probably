ProbablyEngine.canned.register("with_shiftkey", function()
  return IsShiftKeyDown() ~= nil
end)

ProbablyEngine.canned.register("when_moving", function(spell)
  return GetUnitSpeed("player") ~= 0
end)

ProbablyEngine.canned.register("with_buff", function(spell)
  return ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.canned.register("with_buff_count", function(spell, count)
  return ProbablyEngine.condition.player.buff_count(spell) >= tonumber(count)
end)

ProbablyEngine.canned.register("with_buff_count_lt", function(spell, count)
  return ProbablyEngine.condition.player.buff_count(spell) <= tonumber(count)
end)

ProbablyEngine.canned.register("without_buff", function(spell)
  return not ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.canned.register("with_debuff", function(spell)
  return ProbablyEngine.condition.player.debuff(spell)
end)

ProbablyEngine.canned.register("with_debuff_count", function(spell, count)
  return ProbablyEngine.condition.player.debuff_count(spell) >= tonumber(count)
end)

ProbablyEngine.canned.register("with_debuff_count_lt", function(spell, count)
  return ProbablyEngine.condition.player.debuff_count(spell) <= count
end)

ProbablyEngine.canned.register("without_debuff", function(spell)
  return not ProbablyEngine.condition.player.debuff(spell)
end)

ProbablyEngine.canned.register("with_target_buff", function(spell)
  return ProbablyEngine.condition.target.buff(spell)
end)

ProbablyEngine.canned.register("without_target_buff", function(spell)
  return not ProbablyEngine.condition.target.buff(spell)
end)

ProbablyEngine.canned.register("with_target_debuff", function(spell)
  return ProbablyEngine.condition.target.debuff(spell)
end)

ProbablyEngine.canned.register("with_target_debuff_duration", function(spell, duration)
  return ProbablyEngine.condition.target.debuff_duration(spell) <= duration
end)

ProbablyEngine.canned.register("without_target_debuff", function(spell)
  return not ProbablyEngine.condition.target.debuff(spell)
end)

ProbablyEngine.canned.register("mana", function(count)
  return UnitPower("player", 0) >= tonumber(count)
end)

ProbablyEngine.canned.register("rage", function(count)
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
