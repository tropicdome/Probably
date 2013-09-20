-- SPEC ID 62
ProbablyEngine.rotation.register(62, {
    { "Frost Armor", "!player.buff(Frost Armor)" },
    { "Rune of Power", "modifier.shift", "ground" },
    { "Arcane Brilliance", "!player.buff(Arcane Brilliance)" },
    { "Nether Tempest",  "!target.debuff(Nether Tempest)" },
    { "Ice Lance", "player.moving" },
    { "Arcane Missiles", "player.buff(Arcane Missiles!).count >= 2" },
    { "Arcane Barrage", "player.debuff(Arcane Charge).count >= 4" },
    { "Arcane Blast" }
  }
)