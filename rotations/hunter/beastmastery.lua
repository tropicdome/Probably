-- SPEC ID 253
ProbablyEngine.rotation.register(253, {
    -- { "Hunter's Mark" , "!target.debuff(Hunter's Mark)" },

    { "Snake Trap"    , "modifier.shift", "ground" },
    { "Explosive Trap", "modifier.alt", "ground" },
    { "Freezing Trap" , "modifier.control", "ground" },

    { "Serpent Sting", "!target.debuff(Serpent Sting)" },
    { "Focus Fire", "player.buff(Frenzy).count = 5" },
    { "Kill Command" },
    { "Glaive Toss" },
    { "Arcane Shot", "player.focus >= 60"},
    { "Cobra Shot" }
  }
)