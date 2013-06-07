-- Target DSL

-- buffs

ProbablyEngine.dsl.register("target.health", function(health)
  return ProbablyEngine.condition.target.health() >= tonumber(health)
end)

ProbablyEngine.dsl.register("target.buff", function(spell)
  return ProbablyEngine.condition.target.buff(spell)
end)

ProbablyEngine.dsl.register("target.buff.duration", function(spell, duration)
  return ProbablyEngine.condition.target.buff.duration(spell) <= duration
end)

ProbablyEngine.dsl.register("target.buff", function(spell)
  return not ProbablyEngine.condition.target.buff(spell)
end)

-- debuffs

ProbablyEngine.dsl.register("target.debuff", function(spell)
  return ProbablyEngine.condition.target.debuff(spell)
end)

ProbablyEngine.dsl.register("target.debuff.duration", function(spell, duration)
  return ProbablyEngine.condition.target.debuff.duration(spell) <= duration
end)

ProbablyEngine.dsl.register("!target.debuff", function(spell)
  return not ProbablyEngine.condition.target.debuff(spell)
end)
