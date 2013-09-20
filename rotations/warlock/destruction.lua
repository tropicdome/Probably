-- SPEC ID 267
ProbablyEngine.rotation.register(267, {

  { "Dark Intent", "!player.buff(Dark Intent)" },
  { "Curse of the Elements", "!target.debuff(Curse of the Elements)" },

  -- Cooldowns
  { "Dark Soul: Instability", "modifier.cooldowns" },
  { "Summon Doomguard", "modifier.cooldowns" },

  -- Rotation
  { "Immolate", "target.debuff(Immolate).duration <= 4" },
  { "Shadowburn", "target.health <= 20" },
  { "Incinerate", "player.buff(Backdraft)" },
  { "Conflagrate" },
  { "Rain of Fire", "modifier.shift", "ground" },
  { "Chaos Bolt", "!modifier.control" },
  { "Incinerate"}

})