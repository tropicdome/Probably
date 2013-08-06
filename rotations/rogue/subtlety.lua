-- SPEC ID 261
ProbablyEngine.rotation.register(261, {

  -- Buffs
  { "Deadly Poison", "!player.buff(Deadly Poison)" },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },

  -- Cooldowns
  { "Shadow Blades", "modifier.cooldowns" },
  { "Slice and Dice", {
    "!player.buff(Slice and Dice)",
    "player.combopoints = 5"
  }},

  -- Rotation
  { "Eviscerate", "player.combopoints = 5" },
  { "Hemorrhage", "target.debuff(Hemorrhage).duration <= 4" },
  {{
    { "Fan of Knives", "modifier.multitarget" },
    { "Hemorrhage", "modifier.shift" },
    { "Backstab" }
  }, "player.combopoints < 5" },
  { "Sinister Strike" },

})