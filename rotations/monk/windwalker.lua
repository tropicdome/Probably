-- SPEC ID 269
ProbablyEngine.rotation.register(269, {

  -- { "Touch of Death" }, -- Broken for now

  -- Interrupts
  { "Spear Hand Strike", "modifier.interrupts" },

  -- Survival
  { "Expel Harm", "player.health < 80" },

  -- Cooldowns
  { "Invoke Xuen, the White Tiger", "modifier.cooldowns" },

  -- Rotation
  { "Energizing Brew" },
  { "Tigereye Brew", "player.buff(Tigereye Brew).count >= 10" },

  { "Rising Sun Kick" },
  { "Tiger Palm", "player.buff(Tiger Power).duration < 4" },
  { "Blackout Kick", "player.buff(Combo Breaker: Blackout Kick)" },
  { "Tiger Palm", "player.buff(Combo Breaker: Tiger Palm)" },
  { "Fists of Fury", "player.energy < 30" },
  { "Chi Wave", "player.energy > 60" },
  { "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
  { "Chi Burst" },
  { "Rushing Jade Wind" },
  { "Blackout Kick", "player.chi > 4" },
  { "Rushing Jade Wind", "modifier.multitarget" },
  { "Spinning Crane Kick", "modifier.multitarget" },
  { "Jab" }

})