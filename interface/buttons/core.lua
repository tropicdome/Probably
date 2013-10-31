-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local AceGUI = LibStub("AceGUI-3.0")

ProbablyEngine.buttons.create('MasterToggle', nil, function(self, button)
  if button == "LeftButton" then
    ProbablyEngine.active = not ProbablyEngine.active
    self.checked = not self.checked
    self:SetChecked(self.checked)
    ProbablyEngine.config.data['button_states']['MasterToggle'] = self.checked
  else
    local dropdown = CreateFrame("Frame", "Test_DropDown", self, "UIDropDownMenuTemplate");
    UIDropDownMenu_Initialize(dropdown, ProbablyEngine.rotation.list_custom, "MENU");
    ToggleDropDownMenu(1, nil, dropdown, self, 0, 0);
    -- Don't toggle the state, I'm not sure why a return value can't handle this
    self.checked = self.checked
    self:SetChecked(self.checked)
  end
end, 'Toggle', 'Temporarily enable or disable the rotation.')

ProbablyEngine.toggle.create('cooldowns', 'Interface\\ICONS\\Achievement_BG_winAB_underXminutes', 'Cooldowns', 'Toggle the usage of long duration cooldowns.')
ProbablyEngine.toggle.create('multitarget', 'Interface\\ICONS\\Ability_Druid_Starfall', 'Multi-Target', 'Toggle the usage of multi-target abilities.')
ProbablyEngine.toggle.create('interrupt', 'Interface\\ICONS\\Ability_Kick.png', 'Interrupts', 'Toggle the usage of spell interrupts.')
