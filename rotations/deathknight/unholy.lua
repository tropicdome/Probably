-- SPEC ID 252
ProbablyEngine.rotation.register(252, {

  -- Cooldowns
  { "Unholy Frenzy", "modifier.cooldowns" },
  { "Summon Gargoyle", "modifier.cooldowns" },

  -- Survival
  { "Death Pact", "player.health < 20" },
  { "Icebound Fortitude", "player.health < 50" },
  { "Blood Boil", {
    "player.buff(Crimson Scourge)",
    "target.range <= 8"
  }},
  { "Blood Boil", {
    "modifier.multitarget",
    "target.range <= 8"
  }},
  -- Rotation
  { "Outbreak", "!target.debuff(Frost Fever)" },
  { "Icy Touch", "target.debuff(Frost Fever).duration < 4" },
  { "Plague Strike", "target.debuff(Blood Plague).duration < 4" },
  { "Death and Decay", "modifier.shift" },
  { "Soul Reaper", "target.health < 35" },
  { "Dark Transformation" },
  { "Death Coil", "player.buff(Sudden Doom)" },
  { "Scourge Strike" },
  { "Festering Strike" },
  { "Death Coil", "player.runicpower > 90"},
  { "Horn of Winter" },

})
