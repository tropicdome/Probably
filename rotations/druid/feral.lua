-- SPEC ID 103
ProbablyEngine.rotation.register(103, {
    { "Faerie Fire", "!target.debuff(Faerie Fire)" },
    { "Savage Roar", {
      "!player.buff(Savage Roar)",
      "player.combopoints = 0"
    }},
    { "Savage Roar", {
      "player.buff(Savage Roar).duration < 3",
      "player.combopoints = 5"
    }},
    { "Rip", {
      "target.debuff(Rip).duration < 3",
      "player.combopoints = 5"
    }},
    { "Tiger's Fury", "player.energy < 35"},
    { "Ferocious Bite", {
      "target.health <= 25",
      "player.combopoints = 5"
    }},
    { "Rake", "target.debuff(Rake).duration < 3" },
    { "Thrash", {
      "player.buff(Omen of Clarity)",
      "target.debuff(Thrash).duration < 3"
    }},
    { "Ferocious Bite", {
      "player.combopoints = 5",
      "target.debuff(Rip).duration < 6",
      "player.buff(Savage Road).duration < 6",
    }},
    { "Mangle", {
      "modifier.shift",
      "player.combopoints < 5"
    }},
    { "Shred", "player.combopoints < 5" }
  }
)