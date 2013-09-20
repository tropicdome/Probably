-- SPEC ID 104
ProbablyEngine.rotation.register(104, {

  -- Buffs
  { "Mark of the Wild", "!player.buff" },
  { "Enrage", "player.rage < 20" },

  -- Instant Swipe
  { "Swipe", "modifier.shift" },

  -- Survival
  { "Cenarion Ward" , "player.health < 70", "player" },
  { "Might of Ursoc", "player.health < 50" },
  { "Frenzied Regeneration", {
    "player.health < 80",
    "player.rage > 50"
  }},
  { "Savage Defense", {
    "!player.buff",
    "player.health > 80"
  }},

  -- Cooldowns
  { "Incarnation: Son of Ursoc", "modifier.cooldowns" },
  { "Natures Vigil" },

  -- Mob Control
  { "Growl", "modifier.taunt" },

  -- Rotation
  { "Mangle" },
  { "Thrash", "target.debuff.duration < 4" },
  { "Lacerate" },
  { "Maul", "player.buff(Tooth and Claw)" },
  { "Faerie Fire", "!target.debuff" },
  { "Swipe", "modifier.multitarget" },
  
})