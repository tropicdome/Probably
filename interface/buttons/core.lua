-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons.create('MasterToggle', nil, function(self)
  ProbablyEngine.active = not ProbablyEngine.active
  self.checked = not self.checked
  self:SetChecked(self.checked)
  ProbablyEngine_Data.button_states['MasterToggle'] = self.checked
end, 'Toggle', 'Temporarily enable or disable the addon.')

ProbablyEngine.toggle.create('cooldowns', 'Interface\\ICONS\\Achievement_BG_winAB_underXminutes', 'Cooldowns', 'Toggle the usage of long duration cooldowns.')
ProbablyEngine.toggle.create('multitarget', 'Interface\\ICONS\\Ability_Druid_Starfall', 'Multi-Target', 'Toggle the usage of multi-target abilities.')
ProbablyEngine.toggle.create('interrupt', 'Interface\\ICONS\\Ability_Kick.png', 'Interrupts', 'Toggle the usage of spell interrupts.')
