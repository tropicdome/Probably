---- Player
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


---- Target
ProbablyEngine.canned.register("with_target_debuff", function(spell)
  return ProbablyEngine.condition.target.debuff(spell)
end)

ProbablyEngine.canned.register("with_target_debuff_duration", function(spell, duration)
  return ProbablyEngine.condition.target.debuff_duration(spell) <= duration
end)

ProbablyEngine.canned.register("without_target_debuff", function(spell)
  return not ProbablyEngine.condition.target.debuff(spell)
end)
