-- SPEC ID 104
ProbablyEngine.rotation.register(104, {

  { "!/cast Bear Form", "!player.buff(Bear Form)" },

  -- Interrupts
  { "Skull Bash", "modifier.interrupts" },
  { "Faerie Fire", "modifier.interrupts" },
  { "Mighty Bash" , "modifier.interrupts" },

  { "Healing Touch", "player.buff(Dream of Cenarius)", "player" },

  -- Instant Swipe
  { "Swipe", "modifier.shift" },

  -- Survival
  { "Savage Defense", {
    "!player.buff",
    "player.health > 70"
  }},
  { "Barkskin", "player.health < 90" },
  { "Bone Shield", "player.health < 85" },
  { "Cenarion Ward" , "player.health < 80", "player" },
  { "Frenzied Regeneration", {
    "!player.buff",
    "player.health < 70"
  }},
  { "Might of Ursoc", "player.health < 60" },
  { "Survival Instincts", "player.health < 50" },
  { "Renewal", "player.health < 40" },

  -- Cooldowns
  { "Incarnation: Son of Ursoc", {
    "!player.buff(Incarnation: Son of Ursoc)",
    "modifier.cooldowns"
  }},
  { "Natures Vigil" },

  -- Mob Control
  { "Growl", "modifier.taunt" },

  { "Swipe", "modifier.multitarget" },
  { "Enrage", "player.rage < 20" },
  { "Mangle" },
  { "Thrash", "target.debuff.duration < 4" },
  { "Faerie Fire", "!target.debuff(Weakened Armor)" },
  { "Lacerate" },
  { "Maul", "player.buff(Tooth and Claw)" },
  { "Maul", "player.rage >= 85" },



})