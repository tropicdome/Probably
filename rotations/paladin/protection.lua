-- SPEC ID 66
ProbablyEngine.rotation.register(66, {
	-- Buffs
    { "Blessing of Might", "!player.buff(Blessing of Might)" },
    { "Righteous Fury",    "!player.buff(Righteous Fury)" },
	-- Damage Reduction & Healing
    { "Sacred Shield", "!player.buff(Sacred shield)" },
    { "Eternal Flame", "!player.buff(Eternal Flame)" },
    { "Hand of Purity" },
    { "Shield of the Righteous", "player.holypower = 5" },
    { "Shield of the Righteous", "modifier.shift" },
    { "Word of Glory", "modifier.alt" },
    --Cooldowns
    { "Holy Avenger", "modifier.cooldowns" },
    -- Tier Talenmts
    { "Holy Prism" },
    { "Light's Hammer" , "modifier.shift", "ground" },
    { "Execution Sentence"},
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
 