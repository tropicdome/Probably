-- SPEC ID 255
ProbablyEngine.rotation.register(255, {
    { "Snake Trap"    , "modifier.shift", "ground" },
    { "Explosive Trap", "modifier.shift", "ground" },
    { "Freezing Trap" , "modifier.shift", "ground" },
    { "Multi-Shot", {
        "player.buff(Thrill of the Hunt)",
        "modifier.multitarget"
    }},
    { "Multi-Shot", {
        "player.focus >= 60",
        "modifier.multitarget"
    }},
    { "Arcane Shot", "player.buff(Thrill of the Hunt)"},
    { "Arcane Shot", "player.focus >= 60"},
    { "Black Arrow"},
    { "Explosive Shot" },
    { "Glaive Toss" },
    { "Cobra Shot" }
  }
)