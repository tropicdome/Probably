-- SPEC ID 64
ProbablyEngine.rotation.register(64, {
    { "Flamestrike", "modifier.shift", "ground" },
    { "Nether Tempest",  "target.debuff" },
    { "Frozen Orb", "player.buff(Fingers of Frost).count < 2" },
    { "Ice Lance", "player.buff(Fingers of Frost)" },
    { "Frostfire Bolt", "player.buff(Brain Freeze)" },
    { "Ice Lance", "player.moving" },
    { "Frostbolt" }
  }
)