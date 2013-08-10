-- SPEC ID 268
ProbablyEngine.rotation.register(268, {

  -- Ground Stuff
  { "Dizzying Haze", "modifier.shift", "ground" },
  { "Summon Black Ox Statue", "modifier.control", "ground" },

  -- Interrupts
  { "Spear Hand Strike", "modifier.interrupts" },

  -- Heals
  { "Chi Wave" },
  { "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
  { "Chi Burst" },

  -- Brews
  { "Purifying Brew", "player.debuff(Moderate Stagger)" },
  { "Purifying Brew", "player.debuff(Heavy Stagger)" },
  { "Elusive Brew", "player.buff(Elusive Brew).count >= 10" },

  { "Keg Smash" },
  { "Guard", "player.health < 95" },
  { "Blackout Kick" },
  { "Tiger Palm", "player.buff(Tiger Power).duration < 4" },
  { "Expel Harm", "player.health < 90" },
  { "Breath of Fire", {
    "player.chi >= 4",
    "modifier.multitarget"
  }},
  { "Rushing Jade Wind", {
    "modifier.multitarget",
    "!player.buff(Rushing Jade Wind)"
  }},
  { "Spinning Crane Kick", "modifier.multitarget" },
  { "Jab" },


})