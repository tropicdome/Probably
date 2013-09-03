-- SPEC ID 251
ProbablyEngine.rotation.register(251, {


    -- Survival
    -- Death Pact Macro
    { "!/cast Raise Dead\n/cast Death Pact", {
      "player.health < 35",
      "player.spell.cooldown(Death Pact)",
      "player.spell.cooldown(Raise Dead)",
      "player.spell.usable(Death Pact)"
    }},


    -- Keep up dots
    { "Outbreak", "!target.debuff(Blood Plague)" },
    { "Outbreak", "!target.debuff(Frost Fever)" },
    { "Soul Reaper", "target.health < 30" },
    { "Plague Strike", "!target.debuff(Blood Plague)" },
    --{ "Howling Blast", "player.buff(Rime)" },
    { "Obliterate", "player.buff(Killing Machine)" },
    { "Frost Strike", "player.runicpower >= 80"},
    { "Obliterate" },
    --{ "Howling Blast", "player.buff(Freezing Fog)" },
    { "Howling Blast", "player.runes(frost) = 2" },
    { "Horn of Winter" },

  }
)