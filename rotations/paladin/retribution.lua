-- SPEC ID 70
ProbablyEngine.rotation.register(70, {
    { "Blessing of Might", "!player.buff(Blessing of Might)" },
    { "Avenging Wrath", "modifier.cooldowns" },
    { "Guardian of Ancient Kings", "modifier.cooldowns" },
    { "Inquisition", {
        "!player.buff(Inquisition)",
        "player.holypower = 3"
    }},
    
    { "Templar's Verdict", {
        "player.holypower = 5",
        "!modifier.multitarget"
    }},
    
    { "Divine Storm", {
        "player.holypower >= 3",
        "modifier.multitarget"
    }},
    { "Hammer of Wrath" },
    { "Hammer of the Righteous", "!target.debuff(Weakened Blows)" }, 
    { "Hammer of the Righteous", "modifier.multitarget" },
    
    { "Hammer of Wrath ", "target.health <= 20" },
    { "Hammer of Wrath ", "player.buff(Avenging Wrath)" },
    { "Exorcism" },
    { "Crusader Strike", "!modifier.multitarget" },
    { "Judgment" },
  }
)

-- Updated 7 13 2013
