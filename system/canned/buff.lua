---- Player
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


---- Target
ProbablyEngine.canned.register("with_target_buff", function(spell)
  return ProbablyEngine.condition.target.buff(spell)
end)

ProbablyEngine.canned.register("with_target_buff_duration", function(spell, duration)
  return ProbablyEngine.condition.target.buff_duration(spell) <= duration
end)

ProbablyEngine.canned.register("without_target_buff", function(spell)
  return not ProbablyEngine.condition.target.buff(spell)
end)
