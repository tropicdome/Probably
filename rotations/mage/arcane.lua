ProbablyEngine.rotation.register("mage", "arcane", {
    { "Nether Tempest",
      (function() return not pec.target.debuff("Nether Tempest") end)
    },
    { "Ice Lance",
      (function() return pem.player.moving end)
    },
    { "Arcane Missiles",
      (function() return pec.player.buff_count("Arcane Missiles!") > 1 end)
    },
    { "Arcane Barrage",
      (function() return pec.player.debuff_count("Arcane Charge") >= 4 end)
    },
    { "Arcane Blast" }
  }
)