-- SPEC ID 253
ProbablyEngine.rotation.register(253, {

    -- Pet
    { "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.alive" },
    { "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.exists" },

    -- Traps
    { "Snake Trap"    , "modifier.control", "ground" },
    { "Explosive Trap", "modifier.alt", "ground" },
    { "Freezing Trap" , "modifier.shift", "ground" },

    { "Silencing Shot", "modifier.interrupts" },

    -- Survival
    { "Deterrence", "player.health < 40" },
    { "Exhilaration", "player.health < 40" },
    { "Mend Pet", {
        "pet.health <= 75",
        "pet.exists",
        "!pet.buff(Mend Pet)"
    }},

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
    { "Kill Command", {
        "pet.exists",
        "player.spell.rage(Bite)"
    }},
    { "Glaive Toss" },
    { "Powershot" },
    { "Barrage" },
    { "Dire Beast" },
    { "Fervor" },
    { "Arcane Shot", "player.focus >= 60"},
    { "Arcane Shot", {
        "player.buff(Thrill of the Hunt)",
        "player.focus >= 20"
    }},
    { "Cobra Shot" }

  }
)