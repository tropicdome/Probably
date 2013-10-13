-- SPEC ID 62
ProbablyEngine.rotation.register(62, {

    -- Buffs
    { "Mage Armor", "!player.buff(Mage Armor)" },
    { "Arcane Brilliance", "!player.buff(Arcane Brilliance)" },

    -- Gems
    { "!/use Mana Gem", "player.mana <= 70" },
    { "!/use Brilliant Mana Gem", "player.mana <= 70" },

    -- Grounds
    { "Rune of Power", "modifier.shift", "ground" },

    -- Cooldowns
    { "Mirror Image", "modifier.cooldowns" },

    -- Dots
    { "Nether Tempest",  "!target.debuff(Nether Tempest)" },
    { "Living Bomb", "!target.debuff(Living Bomb)" },

    -- Moving
    { "Arcane Barrage", "player.moving" },
    { "Fire Blast", "player.moving" },
    { "Ice Lance", "player.moving" },

    -- Opener
    { "Arcane Power", {
        "player.buff(Arcane Missiles!).count >= 2",
        "toggle.alter"
    }},

    { "Alter Time", {
        "player.buff(Arcane Power)",
        "!player.buff(Alter Time)",
        "toggle.alter"
    }},

    -- Rotation
    { "Arcane Missiles", {
        "player.buff(Arcane Missiles!).count >= 1",
        "player.debuff(Arcane Charge).count >= 4"
    }},
    { "Arcane Barrage", {
        "player.debuff(Arcane Charge).count >= 4",
        "!player.buff(Arcane Missiles)"
    }},
    { "Arcane Blast" }
  }
, function()
  ProbablyEngine.toggle.create('alter', 'Interface\\ICONS\\spell_mage_altertime', 'Alter Time', 'Toggle the usage of Alter Time and Arcane Power.')
end)