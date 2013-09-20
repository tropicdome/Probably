-- SPEC ID 260
ProbablyEngine.rotation.register(260, {

  -- Buffs
  { "Deadly Poison", "!player.buff(Deadly Poison)" },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },

  -- Interrupts
  { "Kick", "modifier.interrupts" },

  -- Cooldowns
  { "Adrenaline Rush", "modifier.cooldowns" },
  { "Killing Spree", {
    "modifier.cooldowns",
    "player.energy <= 20",
    "!player.buff(Adrenaline Rush)"
  }},
  { "Shadow Blades", {
    "modifier.cooldowns",
    "player.buff(Adrenaline Rush)"
  }},

  -- Blade Flurry
  { "Blade Flurry", {
    "!modifier.multitarget",
    "player.buff(Blade Flurry)"
  }},
  { "Blade Flurry", {
    "modifier.multitarget",
    "!player.buff(Blade Flurry)"
  }},

  -- Rotation
  { "Marked for Death", "player.combopoints = 0" },
  { "Slice and Dice", {
    "!player.buff(Slice and Dice)",
    "player.combopoints = 5"
  }},
  { "Revealing Strike", "target.debuff(Revealing Strike).duration <= 6" },
  { "Rupture", {
    "target.debuff(Rupture).duration <= 8",
    "player.combopoints = 5"
  }},
  { "Eviscerate", "player.combopoints = 5" },
  { "Fan of Knives", "modifier.multitarget" },
  { "Sinister Strike" },

})