-- SPEC ID 253
ProbablyEngine.rotation.register(253, {

    -- Traps
    { "Snake Trap"    , "modifier.shift", "ground" },
    { "Explosive Trap", "modifier.alt", "ground" },
    { "Freezing Trap" , "modifier.control", "ground" },

    { "Silencing Shot", "modifier.interrupts" },

    -- Cooldowns
    { "Bestial Wrath", "modifier.cooldowns" },
    { "Stampede", "modifier.cooldowns" },
    { "A Murder of Crows", "modifier.cooldowns" },
    { "Dire Beast", "modifier.cooldowns" },
    { "Rapid Fire", "modifier.cooldowns" },

    -- Rotation
    { "Serpent Sting", "!target.debuff(Serpent Sting)" },
    { "Steady Shot", "target.debuff(Serpent Sting).duration < 4" },
    { "Focus Fire", {
        "player.buff(Frenzy).count = 5",
        "!player.buff(Bestial Wrath)"
    } },
    { "Kill Command" },
    { "Glaive Toss" },
    { "Powershot" },
    { "Barrage" },
    { "Dire Beast" },
    { "Fervor" },
    { "Arcane Shot", "player.focus >= 60"},
    { "Arcane Shot", {
        "player.buff(Thrill of the Hunt)",
        "player.focus >= 40"
    }},
    { "Cobra Shot" }

  }
)