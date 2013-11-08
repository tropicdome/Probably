-- SPEC ID 71
ProbablyEngine.rotation.register(71, {

  -- Buffs
  { "Berserker Rage" },

  -- Survival
  { "Rallying Cry", {
    "player.health < 20",
  }},

  { "Shield Wall", {
    "player.health < 10"
  }},

  { "Die by the Sword", {
    "player.health < 40",
  }},

  { "Hamstring", {
    "!target.debuff(Hamstring)",
    "modifier.player"
  }},

  { "Impending Victory" },
  { "Victory Rush" },

  -- Kicks
  { "Pummel", "modifier.interrupts" },
  { "Disrupting Shout", "modifier.interrupts" },

  -- Cooldowns
  { "Bloodbath", "modifier.cooldowns" },
  { "Avatar", "modifier.cooldowns" },
  { "Recklessness", "modifier.cooldowns" },
  { "Skull Banner", "modifier.cooldowns" },
  { "Bladestorm", "modifier.cooldowns" },

  -- AoE
  { "Sweeping Strikes", "modifier.multitarget" },
  { "Thunder Clap", "modifier.multitarget" },
  { "Whirlwind", "modifier.multitarget" },
  { "Dragon Roar", "modifier.multitarget" },
  { "Dragon Roar", "modifier.cooldowns" },

  -- Rotation
  { "Overpower" },
  { "Mortal Strike" },
  { "Colossus Smash" },
  { "Heroic Throw" },
  { "Heroic Strike", {
    "player.rage > 70",
    "target.debuff(Colossus Smash)"
  }},
  { "Slam", "player.rage > 40" },
  { "Execute" },

})
