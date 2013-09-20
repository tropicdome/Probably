-- SPEC ID 66
ProbablyEngine.rotation.register(66, {

	-- Buffs
    { "Blessing of Might", "!player.buff(Blessing of Might)" },
    { "Righteous Fury",    "!player.buff(Righteous Fury)" },


    -- Seals
    { "Seal of Righteousness", {
        "modifier.multitarget",
        "player.seal != 2"
    }},

    -- Dynamic Multitarget Seals
    -- Heal after Censure
    { "Seal of Insight", {
            "target.debuff(Censure).count = 5",
            "target.debuff(Censure).duration > 5",
            "player.seal != 3",
            "!modifier.multitarget"
    }},
    -- Refresh Censure
    { "Seal of Truth", {
            "target.debuff(Censure).duration <= 5",
            "player.seal != 1",
            "!modifier.multitarget"
    }},
    -- Apply Censure
    { "Seal of Truth", {
            "target.debuff(Censure).count < 5",
            "player.seal != 1",
            "!modifier.multitarget"
    }},

    -- Taunts
    { "Reckoning", "modifier.taunt" },

    -- Interrupts
    { "Rebuke", "modifier.interrupts" },
    { "Avenger's Shield", "modifier.interrupts" },

	-- Damage Reduction & Healing
    { "Sacred Shield", "!player.buff(Sacred shield)" }, -- T3 Tallent
    { "Eternal Flame", "!player.buff(Eternal Flame)" }, -- T3 Tallent
    { "Hand of Purity" },  -- T4 Tallent
    { "Shield of the Righteous", "player.holypower = 5" },
    { "Shield of the Righteous", "modifier.shift" },
    { "Word of Glory", "modifier.alt" },

    -- Survival
    { "Ardent Defender", "player.health < 15" },
    { "Divine Protection", "player.health < 35" },
    { "Guardian of Ancient Kings", "player.health < 50" },

    --Cooldowns
    { "Holy Avenger", "modifier.cooldowns" },  -- T5 Tallent

    -- T6 Tallents
    { "Holy Prism" },
    { "Light's Hammer" , "modifier.shift", "ground" },
    { "Execution Sentence" },

    -- DPS Rotation
    { "Hammer of the Righteous", "!target.debuff(Weakened Blows)" },
    { "Avenger's Shield", "player.buff(Grand Crusader)" },
    { "Consecration" },
    { "Holy Wrath" },
    { "Hammer of Wrath" },
    { "Hammer of the Righteous", "modifier.multitarget" },
    { "Judgment" },
    { "Crusader Strike" },
  }
)

 -- { "Avenging Wrath", "cooldowns" }, Not a cd
