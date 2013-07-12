-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons = {
  frame = CreateFrame("Frame","PE_Buttons",UIParent),
  buttons = { },
  size = 36,
  scale = 1,
  padding = 6,
  count = 0
}

ProbablyEngine.buttons.frame:SetPoint("CENTER", UIParent)
ProbablyEngine.buttons.frame:SetWidth(5)
ProbablyEngine.buttons.frame:SetHeight(5)
ProbablyEngine.buttons.frame:SetMovable(true)

ProbablyEngine.buttons.frame:SetScript("OnMouseDown", function(self, button)
  if IsShiftKeyDown() and not self.isMoving then
   self:StartMoving()
   self.isMoving = true
  end
end)
ProbablyEngine.buttons.frame:SetScript("OnMouseUp", function(self, button)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)
ProbablyEngine.buttons.frame:SetScript("OnHide", function(self)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)

ProbablyEngine.buttons.create = function(name, icon, callback, tooltip)
  ProbablyEngine.buttons.buttons[name] = CreateFrame("CheckButton", "PE_Buttons_"..name, UIParent, "ActionButtonTemplate")
  local button = ProbablyEngine.buttons.buttons[name]
  --button:SetScale(ProbablyEngine.buttons.scale)
  button:SetPoint("TOPLEFT", ProbablyEngine.buttons.frame, "TOPLEFT", ((ProbablyEngine.buttons.size*ProbablyEngine.buttons.count)+(ProbablyEngine.buttons.count*ProbablyEngine.buttons.padding)), 0)
  --button:SetWidth(ProbablyEngine.buttons.size)
  --button:SetHeight(ProbablyEngine.buttons.size)
  if icon == nil then icon = 'Interface\\ICONS\\INV_Misc_QuestionMark' end
  _G[button:GetName().."Icon"]:SetTexture(icon)
  button:SetScript("OnClick", callback)
  ProbablyEngine.buttons.count = ProbablyEngine.buttons.count + 1
  button.checked = false

  button:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(tooltip)
    GameTooltip:Show()
  end)

end

ProbablyEngine.buttons.text = function(name, text)
  local hotkey = _G['PE_Buttons_'.. name .."HotKey"]
  hotkey:SetText(text);
  hotkey:Show();
end

ProbablyEngine.buttons.setActive = function(name)
  _G['PE_Buttons_'.. name]:SetChecked(1)
end

ProbablyEngine.buttons.icon = function(name, icon)
  _G['PE_Buttons_'.. name ..'Icon']:SetTexture(icon)
end