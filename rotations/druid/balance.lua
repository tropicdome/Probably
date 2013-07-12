-- SPEC ID 102
ProbablyEngine.rotation.register(102, {

    -- Dots
    { "Moonfire", "target.debuff(Moonfire).duration < 3" },
    { "Sunfire", "target.debuff(Sunfire).duration < 3" },

    -- Walking
    { "Moonfire", {
        "player.balance.moon",
        "player.moving"
    }},
    { "Sunfire", {
        "player.balance.sun",
        "player.moving"
    }},
    { "Starsurge", {
      "player.buff(Shooting Stars)",
      "player.moving"
    }},

    -- Small CDs
    { "Starsurge" },
    { "Starfall" },

    -- Balance
    { "Starfire", "player.balance.sun" },
    { "Wrath", "player.balance.moon" },

  }
)