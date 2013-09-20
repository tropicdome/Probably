-- SPEC ID 254
ProbablyEngine.rotation.register(254, {

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
    { "Stampede", "modifier.cooldowns" },
    { "A Murder of Crows", "modifier.cooldowns" },
    { "Lynx Rush", "modifier.cooldowns" },
    { "Rapid Fire", "modifier.cooldowns" },
    { "Rabid", {
        "modifier.cooldowns",
        "player.buff(Rapid Fire)"
    }},

    -- AoE
    { "Multi-Shot", {
        "player.buff(Thrill of the Hunt)",
        "modifier.multitarget"
    }},
    { "Multi-Shot", {
        "player.focus >= 60",
        "modifier.multitarget"
    }},

    -- Debuffs
    { "Serpent Sting", "!target.debuff(Serpent Sting)" },

    -- Careful Aim Rotation ( 90% + HP )
    {{
      { "Chimera Shot", "target.debuff(Serpent Sting).duration < 5" },
      { "Aimed Shot", "!player.moving" },
      { "Aimed Shot", "player.buff(Fire!)" },
      { "Steady Shot", "player.debuff(Steady Focus).duration < 6" },
      { "Steady Shot" }
    }, "target.health > 80" },

    -- Standard Rotation ( 90% - HP )
    {{
      { "Serpent Sting", "!target.debuff(Serpent Sting)" },
      { "Chimera Shot" },
      { "Kill Shot" },
      { "Glaive Toss" },
      { "Powershot" },
      { "Barrage" },
      { "Dire Beast" },
      { "Fervor" },
      { "Aimed Shot", "player.buff(Fire!)" },
      { "Arcane Shot", "player.focus >= 65" },
      { "Steady Shot" }
    }, "target.health < 80"}

  }
)