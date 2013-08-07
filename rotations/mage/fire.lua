-- SPEC ID 63
ProbablyEngine.rotation.register(63, {
    { "Molten Armor", "!player.buff(Molten Armor)" },
    { "Arcane Brilliance", "!player.buff(Arcane Brilliance)" },
    { "Combustion",  "target.debuff(Ignite)" },
    { "Pyroblast", "player.buff(Pyroblast!)" },
    { "Inferno Blast", "player.buff(Heating Up)" },
    { "Living Bomb", "target.debuff(Living Bomb).duration <= 3" },
    { "Scorch", "player.moving" },
    { "Fireball" }
  }
)