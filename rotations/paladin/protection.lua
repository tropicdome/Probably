ProbablyEngine.rotation.register("paladin", "protection", function()
  return ProbablyEngine.parser.table({
    { "Sacred Shield",
      not pec.player.buff("Sacred shield")
    },
    { "Hammer of the Righteous",
      pec.target.debuff_duration("Weakened Blows") <= 4.5
    },
    { "Shield of the Righteous",
      pec.player.holypower() == 3 },
    { "Avenger's Shield" },
    { "Consecration" },
    { "Holy Wrath" },
    { "Crusader Strike" },
    { "Judgment" }
  })
end )