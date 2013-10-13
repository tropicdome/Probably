-- SPEC ID 103
ProbablyEngine.rotation.register(103, {

  -- Cat
  { "Cat Form", "!player.buff(Cat Form)" },

  -- Self Heals
  { "Healing Touch", "player.buff(Predatory Swiftness)" },

  -- AoE
  { "Swipe", "modifier.multitarget" },

  -- Debuffs
  { "Faerie Fire", "!target.debuff(Weakened Armor)" },

  -- Buffs
  { "Savage Roar", {
    "!player.buff(Savage Roar)",
    "player.combopoints = 0"
  }},
  { "Savage Roar", {
    "player.buff(Savage Roar).duration < 5",
    "player.combopoints = 5"
  }},
  { "Savage Roar", {
    "player.buff(Savage Roar).duration < 3",
    "player.combopoints >= 2"
  }},

  -- Free Thrash
  { "Thrash", "player.buff(Omen of Clarity)" },

  -- Spend Combo
  -- Tiger's Fury
  { "Tiger's Fury", "player.energy <= 35"},

  -- Rake
  { "Rake", "target.debuff(Rake).duration <= 4" },

  -- Rip
  { "Rip", {
    "!target.debuff(Rip)",
    "player.combopoints = 5"
  }},
  { "Rip", {
    "target.health > 25",
    "target.debuff(Rip).duration < 5",
    "player.combopoints = 5"
  }},

  -- Ferocious Bite
  -- Target Health is less then 25%
  { "Ferocious Bite", {
    "target.debuff(Rip)",
    "target.health < 25",
    "player.combopoints = 5"
  }},

  -- Max Combo and Rip or Savage do not need refreshed
  { "Ferocious Bite", {
    "player.combopoints = 5",
    "target.debuff(Rip).duration > 5",
    "player.buff(Savage Roar).duration > 5",
  }},

  -- Build Combo
  -- Mangle
  { "Mangle", "player.buff(Clearcasting)" },
  { "Mangle", "player.buff(Berserk)" },
  { "Mangle", "player.combopoints < 5" },

})