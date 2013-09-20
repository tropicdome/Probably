-- SPEC ID 72
ProbablyEngine.rotation.register(72, {

  -- Buffs
  { "Berserker Rage" },

  -- Survival
  { "Rallying Cry", {
    "player.health < 15",
    "modifier.cooldowns"
  }},

  { "Die by the Sword", "player.health < 25" },
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
  { "Thunder Clap", "modifier.multitarget" },
  { "Whirlwind", "modifier.multitarget" },
  { "Dragon Roar", "modifier.multitarget" },

  -- Rotation
  { "Colossus Smash" },
  { "Bloodthirst" },
  { "Execute", "player.rage > 80" },
  { "Heroic Strike", "player.rage > 80" },
  { "Raging Blow" },
  { "Wild Strike", "player.buff(Bloodsurge)" },
  { "Impending Victory" },
  { "Heroic Throw" }

})
