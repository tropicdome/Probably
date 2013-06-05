ProbablyEngine.canned.register("when_moving", function(spell)
  return GetUnitSpeed("player") ~= 0
end)

ProbablyEngine.canned.register("with_buff", function(spell)
  return ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.canned.register("with_buff_count", function(spell, count)
  return ProbablyEngine.condition.player.buff_count(spell) >= count
end)

ProbablyEngine.canned.register("without_buff", function(spell)
  return not ProbablyEngine.condition.player.buff(spell)
end)

ProbablyEngine.canned.register("with_debuff", function(spell)
  return ProbablyEngine.condition.player.debuff(spell)
end)

ProbablyEngine.canned.register("with_debuff_count", function(spell, count)
  return ProbablyEngine.condition.player.debuff_count(spell) >= count
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

ProbablyEngine.canned.register("without_target_debuff", function(spell)
  return not ProbablyEngine.condition.target.debuff(spell)
end)