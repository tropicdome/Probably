-- SPEC ID 258
-- 7/11/2013 - Changed by j
ProbablyEngine.rotation.register(258, {

	-- Maintain these buffs
    { "Power Word: Fortitude", "!player.buff(Power Word: Fortitude)" },
    { "Inner Fire", "!player.buff(Inner Fire)" },
    { "Shadow Form", "!player.buff(Shadowform)" },
    
    -- We are moving
    { "Shadow Word: Pain", "player.moving" },
    { "Cascade", "player.moving" },
    { "Halo", "player.moving" },
    { "Shadow Word: Death", "player.moving" },
    -- Main DPS 
    { "Mind Blast", "player.buff(Divine Insight)" },
    { "Devouring Plague", "player.shadoworbs = 3" },

    { "Mind Blast" }, 
    { "Shadow Word: Death", "target.debuff(Shadow Word: Death).duration < 1" },
    { "Shadow Word: Pain", "target.debuff(Shadow Word: Pain).duration < 1" },
    { "Vampiric Touch", "target.debuff(Vampiric Touch).duration < 1" },
    { "Mind Flay", "target.debuff(Devouring Plague)" }, 
    { "Cascade", },
    { "Halo" },
    { "Mind Spike", "player.buff(Surge of Darkness)" },
    { "Mind Flay" },
 
    
    { "Shadow Word: Death" },
    
    
   
    
    
    
  }
)