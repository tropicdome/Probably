ProbablyEngine.rotation.register(71, {
  { "Battle Shout" },
  { "Recklessness", {
      "cooldowns",
      "target.health:20",
      "target.debuff.duration(5):Colossus Smash"
  }},
  { "Berserker Rage", "cooldowns" },
  { "Deadly Calm", {
      "cooldowns",
      "player.rage:40"
  }},
  { "Lifeblood", "cooldowns" },
  { "Impending Victory", "player.health:90" },
  { "Heroic Strike", {
      "target.debuff:Colossus Smash",
      "player.rage:70"
  }},
  { "Dragon Roar" },
  { "Mortal Strike" },
  { "Sweeping Strikes", "multitarget"},
  { "Colossus Smash", "target.debuff.duration(1.5):Colossus Smash" },
  { "Execute" },
  { "Overpower" },
  { "Slam", {
      "player.rage:40",
      "target.health:20"
  }}
})
