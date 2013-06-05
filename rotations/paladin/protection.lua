ProbablyEngine.rotation.register("paladin", "protection", {
    { "Sacred Shield",
      (function() return not pec.player.buff("Sacred shield") end)
    },
    { "Hammer of the Righteous",
      (function() return pec.target.debuff_duration("Weakened Blows") <= 4.5 end)
    },
    { "Shield of the Righteous",
      (function() return pec.player.holypower() == 3 end)
    },
    { "Avenger's Shield" },
    { "Consecration" },
    { "Holy Wrath" },
    { "Crusader Strike" },
    { "Judgment" }
  }
)