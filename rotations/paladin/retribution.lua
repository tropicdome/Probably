-- SPEC ID 70
ProbablyEngine.rotation.register(70, {
    { "Blessing of Kings", "!player.buff(Blessing of Kings)" },
    { "Avenging Wrath", "cooldowns" },
    { "Inquisition", {
        "!player.buff(Inquisition)",
        "player.holypower = 3"
    }},
    { "Hammer of Wrath" },
    { "Hammer of the Righteous", "multitarget" },
    { "Templar's Verdict", "player.holypower = 5" },
    { "Hammer of Wrath ", "target.health <= 20" },
    { "Hammer of Wrath ", "player.buff(Avenging Wrath)" },
    { "Exorcism" },
    { "Crusader Strike" },
    { "Judgment" },
  }
)