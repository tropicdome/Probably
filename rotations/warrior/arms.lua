ProbablyEngine.rotation.register(71, {

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

  { "Overpower", "with_buff:Overpower" },

  { "Slam", (function() return ((
      pec.player.rage() >= 70 or
      pec.player.debuff("Colossus Smash") ) and
      pec.target.health() >= 20
  )end)},

  { "Heroic Throw" },

  { "Battle Shout", (function() return (
      pec.player.rage() <= 70
      and not pec.player.debuff("Colossus Smash")
  )end)},

  { "Slam", "target_health:20" },

  { "Battle Shout", "rage:30" }

})
