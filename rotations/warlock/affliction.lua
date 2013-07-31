-- SPEC ID 265
ProbablyEngine.rotation.register(265, {

  { "Curse of the Elements", "!target.debuff(Curse of the Elements)" },

  -- Soul Burn + Soul Swap
  {{
    { "Soulburn", "!player.buff(Soulburn)" },
    { "Soul Swap", "player.buff(Soulburn)" },
  }, {
    "target.debuff(Agony).duration <= 3",
    "target.debuff(Corruption).duration <= 3",
    "target.debuff(Unstable Affliction).duration <= 3",
  }},

  { "Fel Flame", "player.moving" },

  { "Agony", "target.debuff(Agony).duration <= 3" },
  { "Corruption", "target.debuff(Corruption).duration <= 3" },
  { "Unstable Affliction", "target.debuff(Unstable Affliction).duration <= 3" },

  { "Haunt", "!target.debuff(Haunt)" },

  { "Drain Soul", "target.health <= 20" },
  { "Malefic Grasp" },

})