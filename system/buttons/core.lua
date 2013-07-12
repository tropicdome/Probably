-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons.create('MasterToggle', nil, function(self)
  ProbablyEngine.active = not ProbablyEngine.active
  self.checked = not self.checked
  self:SetChecked(self.checked)
end, 'Toggle')
ProbablyEngine.buttons.setActive('MasterToggle')

ProbablyEngine.buttons.create('CooldownToggle', 'Interface\\ICONS\\Achievement_BG_winAB_underXminutes', function(self)
  ProbablyEngine.module.config.cooldowns = not ProbablyEngine.module.config.cooldowns
  self.checked = not self.checked
  self:SetChecked(self.checked)
end, 'Cooldowns')

ProbablyEngine.buttons.create('MultitargetToggle', 'Interface\\ICONS\\Ability_Druid_Starfall', function(self)
  ProbablyEngine.module.config.multitarget = not ProbablyEngine.module.config.multitarget
  self.checked = not self.checked
  self:SetChecked(self.checked)
end, 'MultiTarget')