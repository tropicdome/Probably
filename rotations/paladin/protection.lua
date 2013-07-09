-- SPEC ID 66
ProbablyEngine.rotation.register(66, {
    { "Blessing of Kings", "!player.buff(Blessing of Kings)" },
    { "Avenging Wrath", "cooldowns" },
    { "Sacred Shield", "!player.buff(Sacred shield)" },
    { "Hammer of the Righteous", "!target.debuff(Weakened Blows)" },
    { "Shield of the Righteous", {
        "player.holypower = 3",
        "player.health >= 90"
    }},
    { "Word of Glory", {
        "player.holypower = 3",
        "player.health < 90"
    }},
    { "Avenger's Shield" },
    { "Consecration" },
    { "Holy Wrath" },
    { "Hammer of Wrath" },
    { "Hammer of the Righteous", "multitarget" },
    { "Judgment" },
    { "Crusader Strike" }
  }
)