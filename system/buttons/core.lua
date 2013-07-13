-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons.create('MasterToggle', nil, function(self)
  ProbablyEngine.active = not ProbablyEngine.active
  self.checked = not self.checked
  self:SetChecked(self.checked)
end, 'Toggle')
ProbablyEngine.buttons.setActive('MasterToggle')

ProbablyEngine.toggle.create('cooldowns', 'Interface\\ICONS\\Achievement_BG_winAB_underXminutes', 'Toggle Cooldowns')
ProbablyEngine.toggle.create('multitarget', 'Interface\\ICONS\\Ability_Druid_Starfall', 'Toggle MultiTarget')
ProbablyEngine.toggle.create('interrupt', 'Interface\\ICONS\\Ability_Kick.png', 'Toggle Interrupts')
