ProbablyEngine.rotation.register(71, {

  -- TODO: Flag for cooldown use.
  -- TODO: Check the cooldown for a spell.
  { "Recklessness", (function()
      return ProbablyEngine.condition.target.health() < .2 and ProbablyEngine.condition.player.debuff_duration("Colossus Smash") >= 5
    end) },

  -- TODO: Flag for cooldown use.
  { "Berserker Rage" },

  -- TODO: Flag for cooldown use.
  { "Deadly Calm", (function() return ProbablyEngine.condition.player.rage() >= 40 end) },

  -- TODO: Flag for cooldown use.
  { "Lifeblood" },

  { "Impending Victory", (function() return ProbablyEngine.condition.player.health() < .9 end) },
  
  -- { "Heroic Strike" ,
  -- jps.hp("target") >= .2 and jps.debuff("Colossus Smash") and ( ( ( jps.buff("taste for blood") and jps.buffDuration("taste for blood") <= 2 ) or jps.buffStacks("taste for blood") == 5 or ( jps.buff("Taste for Blood") and jps.debuffDuration("Colossus Smash") <= 2 and jps.cooldown("Colossus Smash") > 0 ) or jps.buff("Deadly Calm") or rage >= 110 ) ) },

  { "Dragon Roar" },

  { "Mortal Strike" },

  -- TODO: Flag for multi target
  -- { "Sweeping Strikes", jps.MultiTarget },

  { "Colossus Smash", (function() return ProbablyEngine.condition.player.debuff_duration("Colossus Smash") <= 1.5 end) },

  { "Execute" },

  { "Overpower", (function() return ProbablyEngine.condition.player.buff("Overpower") end) },

  { "Slam", (function()
    return
      ( ProbablyEngine.condition.player.rage() >= 70 or 
        ProbablyEngine.condition.player.debuff("Colossus Smash") ) and
      ProbablyEngine.condition.target.health() >= .2
    end) },

  { "Heroic Throw" },

  { "Battle Shout", (function()
      return ProbablyEngine.condition.player.rage() <= 70 and
        not ProbablyEngine.condition.player.debuff("Colossus Smash")
    end) },

  { "Slam", (function() return ProbablyEngine.condition.target.health() >= .2 end) },

  { "Battle Shout", (function() return ProbablyEngine.condition.player.rage() <= 70 end) }

})


