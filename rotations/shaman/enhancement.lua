-- SPEC ID 263
ProbablyEngine.rotation.register(263, {

    -- Buffs
    { "Windfury Weapon", "!enchant.mainhand" },
    { "Flametongue Weapon", "!enchant.offhand" },
    { "Lightning Shield", "!player.buff(Lightning Shield)" },

    -- Kick
    { "Wind Shear", "modifier.interrupts" },

    -- Healing
    { "Chain Heal", {
      "modifier.multitarget",
      "player.buff(Maelstrom Weapon).count = 5",
      "player.health < 80"
    }},
    { "Healing Surge", {
      "player.buff(Maelstrom Weapon).count = 5",
      "player.health < 80"
    }},

    -- Cooldowns
    { "Fire Elemental Totem", "modifier.cooldowns" },
    { "Earth Elemental Totem", "modifier.cooldowns" },
    { "Feral Spirit", "modifier.cooldowns" },
    { "Stormlash Totem", "modifier.cooldowns" },
    { "Ascendance", {
      "modifier.cooldowns",
      "!player.buff(Ascendance)"
    }},

    -- Totems
    { "Searing Totem", {
      "toggle.totems",
      "!totem(Fire Elemental Totem)",
      "!totem(Searing Totem)",
      "!modifier.multitarget",
    }},

    { "Magma Totem", {
      "toggle.totems",
      "!totem(Fire Elemental Totem)",
      "!totem(Magma Totem)",
      "modifier.multitarget"
    }},

    -- AoE
    { "Chain Lightning", {
      "player.buff(Maelstrom Weapon).count = 5",
      "modifier.multitarget"
    }},
    { "Fire Nova", {
      "modifier.multitarget",
      "target.debuff(Flame Shock)"
    }},

    -- Rotation
    { "Lightning Bolt", "player.buff(Maelstrom Weapon).count = 5" },
    { "Stormstrike" },
    { "Stormblast" },
    { "Flame Shock", "player.buff(Unleash Flame)" },
    { "Flame Shock", "target.debuff(Flame Shock).duration <= 3" },
    { "Lava Lash" },
    { "Unleash Elements" },
    { "Earth Shock" },
    
}, function()
end)