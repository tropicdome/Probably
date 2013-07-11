-- SPEC ID 258
ProbablyEngine.rotation.register(258, {

    { "Power Word: Fortitude", "!player.buff(Power Word: Fortitude)" },
    { "Inner Fire", "!player.buff(Inner Fire)" },
    { "Shadow Form", "!player.buff(Shadowform)" },
    { "Shadow Word: Pain", "target.debuff(Shadow Word: Pain).duration < 3" },
    { "Vampiric Touch", "target.debuff(Vampiric Touch).duration < 4" },
    { "Devouring Plague", "player.shadoworbs = 3" },
    { "Mind Blast" },
    { "Mind Spike", "player.buff(Surge of Darkness)" },
    { "Shadow Word: Death" },
    { "Mind Flay", "target.debuff(Devouring Plague)" },
    { "Mind Flay" }
  }
)