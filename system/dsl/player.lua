---- player status

ProbablyEngine.dsl.register("player.moving", function(spell)
  return GetUnitSpeed("player") ~= 0
end)

ProbablyEngine.dsl.register("player.health", function(health)
  return ProbablyEngine.condition.player.health() >= tonumber(health)
end)

ProbablyEngine.dsl.register("!player.health", function(health)
  return ProbablyEngine.condition.player.health() <= tonumber(health)
end)

-- buffs

ProbablyEngine.dsl.register("player.buff", function(spell)
  return ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.dsl.register("!player.buff", function(spell)
  return not ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.dsl.register("player.buff.count", function(spell, count)
  return ProbablyEngine.condition.player.buff_count(spell) >= tonumber(count)
end)

-- debuffs

ProbablyEngine.dsl.register("player.debuff", function(spell)
  return ProbablyEngine.condition.player.debuff(spell)
end)

ProbablyEngine.dsl.register("player.debuff.count", function(spell, count)
  return ProbablyEngine.condition.player.debuff_count(spell) >= tonumber(count)
end)

ProbablyEngine.dsl.register("!player.debuff", function(spell)
  return not ProbablyEngine.condition.player.debuff(spell)
end)

---- player powers

ProbablyEngine.dsl.register("player.mana", function(count)
  return ProbablyEngine.condition.player.mana() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.rage", function(count)
  return ProbablyEngine.condition.player.rage() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.focus", function(count)
  return ProbablyEngine.condition.player.focus() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.energy", function(count)
  return ProbablyEngine.condition.player.energy() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.runes", function(count)
  return ProbablyEngine.condition.player.runes() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.runicpower", function(count)
  return ProbablyEngine.condition.player.runicpower() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.soulshards", function(count)
  return ProbablyEngine.condition.player.soulshards() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.eclipse", function(count)
  return ProbablyEngine.condition.player.eclipse() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.holypower", function(count)
  return ProbablyEngine.condition.player.holypower() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.darkforce", function(count)
  return ProbablyEngine.condition.player.darkforce() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.lightforce", function(count)
  return ProbablyEngine.condition.player.lightforce() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.shadoworbs", function(count)
  return ProbablyEngine.condition.player.shadoworbs() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.burningembers", function(count)
  return ProbablyEngine.condition.player.burningembers() >= tonumber(count)
end)

ProbablyEngine.dsl.register("player.demonicfury", function(count)
  return ProbablyEngine.condition.player.demonicfury() >= tonumber(count)
end)
