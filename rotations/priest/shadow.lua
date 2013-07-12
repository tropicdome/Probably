-- SPEC ID 258
ProbablyEngine.rotation.register(258, {

	-- Maintain these buffs
    { "Power Word: Fortitude", "!player.buff(Power Word: Fortitude)" },
    { "Inner Fire", "!player.buff(Inner Fire)" },
    { "Shadow Form", "!player.buff(Shadowform)" },
    
    -- Main DPS 
    { "Mind Blast", "player.buff(Divine Insight)" },
    { "Devouring Plague", "player.shadoworbs = 3" },

    { "Mind Blast" }, 
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