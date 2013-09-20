-- SPEC ID 259
ProbablyEngine.rotation.register(259, {

  -- Buffs
  { "Deadly Poison", "!player.buff(Deadly Poison)" },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },

  -- Interrupts
  { "Kick", "modifier.interrupts" },

  -- Cooldowns
  { "Shadow Blades", "modifier.cooldowns" },
  { "Vendetta", "modifier.cooldowns" },

  -- Rotation
  { "Slice and Dice", {
    "!player.buff(Slice and Dice)",
    "player.combopoints >= 2"
  }},
  { "Rupture", {
    "target.debuff(Rupture).duration <= 8",
    "player.combopoints = 5"
  }},
  { "Envenom", "player.combopoints = 5" },
  { "Dispatch", "player.buff(Blindside)" },
  { "Fan of Knives", "modifier.multitarget" },
  { "Mutilate", "target.health > 35" },
  { "Dispatch", "target.health < 35" },

})