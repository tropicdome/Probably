-- SPEC ID 255
ProbablyEngine.rotation.register(255, {

    -- Traps
    { "Snake Trap"    , "modifier.shift", "ground" },
    { "Explosive Trap", "modifier.alt", "ground" },
    { "Freezing Trap" , "modifier.shift", "ground" },

    -- Cooldowns
    { "Stampede", "modifier.cooldowns" },
    { "A Murder of Crows", "modifier.cooldowns" },
    { "Dire Beast", "modifier.cooldowns" },
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

    -- Rotation
    { "Serpent Sting", "!target.debuff(Serpent Sting)" },
    { "Arcane Shot", "player.buff(Thrill of the Hunt)"},
    { "Arcane Shot", "player.focus >= 60"},
    { "Black Arrow"},
    { "Explosive Shot" },
    { "Glaive Toss" },
    { "Cobra Shot" }
    
  }
)