-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.rotation = {
  specId = { }
}

ProbablyEngine.rotation.specId[62] = 'Arcane Mage'
ProbablyEngine.rotation.specId[63] = 'Fire Mage'
ProbablyEngine.rotation.specId[64] = 'Frost Mage'
ProbablyEngine.rotation.specId[65] = 'Holy Paladin'
ProbablyEngine.rotation.specId[66] = 'Protection Paladin'
ProbablyEngine.rotation.specId[70] = 'Retribution Paladin'
ProbablyEngine.rotation.specId[71] = 'Arms Warrior'
ProbablyEngine.rotation.specId[72] = 'Furry Warrior'
ProbablyEngine.rotation.specId[73] = 'Protection Warrior'
ProbablyEngine.rotation.specId[102] = 'Balance Druid'
ProbablyEngine.rotation.specId[103] = 'Feral Combat Druid'
ProbablyEngine.rotation.specId[104] = 'Guardian Druid'
ProbablyEngine.rotation.specId[105] = 'Restoration Druid'
ProbablyEngine.rotation.specId[250] = 'Blood Death Knight'
ProbablyEngine.rotation.specId[251] = 'Frost Death Knight'
ProbablyEngine.rotation.specId[252] = 'Unholy Death Knight'
ProbablyEngine.rotation.specId[253] = 'Beast Mastery Hunter'
ProbablyEngine.rotation.specId[254] = 'Marksmanship Hunter'
ProbablyEngine.rotation.specId[255] = 'Survival Hunter'
ProbablyEngine.rotation.specId[256] = 'Discipline Priest'
ProbablyEngine.rotation.specId[257] = 'Holy Priest'
ProbablyEngine.rotation.specId[258] = 'Shadow Priest'
ProbablyEngine.rotation.specId[259] = 'Assassination Rogue'
ProbablyEngine.rotation.specId[260] = 'Combat Rogue'
ProbablyEngine.rotation.specId[261] = 'Subtlety Rogue'
ProbablyEngine.rotation.specId[262] = 'Elemental Shaman'
ProbablyEngine.rotation.specId[263] = 'Enhancement Shaman'
ProbablyEngine.rotation.specId[264] = 'Restoration Shaman'
ProbablyEngine.rotation.specId[265] = 'Affliction Warlock'
ProbablyEngine.rotation.specId[266] = 'Demonology Warlock'
ProbablyEngine.rotation.specId[267] = 'Destruction Warlock'
ProbablyEngine.rotation.specId[268] = 'Brewmaster Monk'
ProbablyEngine.rotation.specId[269] = 'Windwalker Monk'
ProbablyEngine.rotation.specId[270] = 'Mistweaver Monk'

ProbablyEngine.rotation.register = function(specId, spellTable)
  ProbablyEngine.rotation[specId] = spellTable
  ProbablyEngine.debug('Loaded Rotation for ' .. ProbablyEngine.rotation.specId[specId] )
end

ProbablyEngine.rotation.unregister = function(specId)
  ProbablyEngine.rotation[specId] = nil
end
