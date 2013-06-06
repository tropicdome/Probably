ProbablyEngine.rotation.register(71, {
  { "Battle Shout" },
  { "Recklessness", {
      "with_cooldowns",
      "target_health:20",
      "with_target_debuff_duration(5):Colossus Smash"
  }},
  { "Berserker Rage", "with_cooldowns" },
  { "Deadly Calm", {
      "with_cooldowns",
      "rage:40"
  }},
  { "Lifeblood", "with_cooldowns" },
  { "Impending Victory", "player_health:90" },
  { "Heroic Strike", {
      "target_debuff:Colossus Smash",
      "rage:70"
  }},
  { "Dragon Roar" },
  { "Mortal Strike" },
  { "Sweeping Strikes", "with_multitarget"},
  { "Colossus Smash", "with_target_debuff_duration(1.5):Colossus Smash" },
  { "Execute" },
  { "Overpower" },
  { "Slam", {
      "rage:40",
      "target_health:20"
  }}
})
