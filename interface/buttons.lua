-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons = {
  frame = CreateFrame("Frame", "PE_Buttons", UIParent),
  buttonFrame = CreateFrame("Frame", "PE_Buttons_Container", UIParent),
  buttons = { },
  count = 0
}

local BACKDROP = {
  bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
  insets = {top = -1, bottom = -1, left = -1, right = -1},
}


ProbablyEngine.buttons.updateSize = function()

  ProbablyEngine.buttons.frame:SetHeight(ProbablyEngine_Data.style.size+5)
  ProbablyEngine.buttons.count = 0
  for name, button in pairs(ProbablyEngine.buttons.buttons) do
    button:SetPoint("TOPLEFT", ProbablyEngine.buttons.frame, "TOPLEFT",
      (
        (ProbablyEngine_Data.style.size*ProbablyEngine.buttons.count)
        +
        (ProbablyEngine.buttons.count*ProbablyEngine_Data.style.padding)
        + 4
      )
    , -3)
    button:SetWidth(ProbablyEngine_Data.style.size)
    button:SetHeight(ProbablyEngine_Data.style.size)
    ProbablyEngine.buttons.count = ProbablyEngine.buttons.count + 1
  end

end

ProbablyEngine.buttons.updateColors = function()

  for button, state in pairs(ProbablyEngine_Data.button_states) do
    if state == true then
      ProbablyEngine.buttons.setActive(button)
    else
      ProbablyEngine.buttons.setInactive(button)
    end
  end

end

ProbablyEngine.buttons.frame:SetPoint("CENTER", UIParent)
ProbablyEngine.buttons.frame:SetWidth(170)
ProbablyEngine.buttons.frame:SetHeight(ProbablyEngine_Data.style.size+5)
ProbablyEngine.buttons.frame:SetMovable(true)
ProbablyEngine.buttons.frame:SetFrameStrata('HIGH')

ProbablyEngine.buttons.frame:Hide()
ProbablyEngine.buttons.buttonFrame:Hide()

ProbablyEngine.buttons.statusText = ProbablyEngine.buttons.frame:CreateFontString('PE_StatusText')
ProbablyEngine.buttons.statusText:SetFont("Fonts\\ARIALN.TTF", 16)
ProbablyEngine.buttons.statusText:SetShadowColor(0,0,0, 0.8)
ProbablyEngine.buttons.statusText:SetShadowOffset(-1,-1)
ProbablyEngine.buttons.statusText:SetPoint("CENTER", ProbablyEngine.buttons.frame)
ProbablyEngine.buttons.statusText:SetText("|cffffffffDrag to Position|r")

ProbablyEngine.buttons.frame.texture = ProbablyEngine.buttons.frame:CreateTexture()
ProbablyEngine.buttons.frame.texture:SetAllPoints(ProbablyEngine.buttons.frame)
ProbablyEngine.buttons.frame.texture:SetTexture(0,0,0,0.6)

ProbablyEngine.buttons.frame:SetScript("OnMouseDown", function(self, button)
  if not self.isMoving then
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

ProbablyEngine.buttons.create = function(name, texture, callback, tooltipl1, tooltipl2)

  ProbablyEngine.buttons.buttons[name] = CreateFrame("CheckButton", "PE_Buttons_"..name, ProbablyEngine.buttons.buttonFrame)

  local button = ProbablyEngine.buttons.buttons[name]
  button:SetPoint("TOPLEFT", ProbablyEngine.buttons.frame, "TOPLEFT",
    (
      (ProbablyEngine_Data.style.size*ProbablyEngine.buttons.count)
      +
      (ProbablyEngine.buttons.count*ProbablyEngine_Data.style.padding)
      + 4
    )
  , -3)
  button:SetWidth(ProbablyEngine_Data.style.size)
  button:SetHeight(ProbablyEngine_Data.style.size)

  button:SetBackdrop(BACKDROP)
  button:SetBackdropColor(0, 0, 0)

  local count = button:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal') -- XXX: replace font
  count:SetPoint('BOTTOMRIGHT')
  button.count = count


  local icon = button:CreateTexture(nil, 'BORDER')
  icon:SetAllPoints()
  icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
  button.icon = icon

  if texture == nil then
    button.icon:SetTexture('Interface\\ICONS\\INV_Misc_QuestionMark')
  else
    button.icon:SetTexture(texture)
  end

  button:SetScript("OnClick", callback)

  if tooltipl1 ~= nil then
    button:SetScript("OnEnter", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_TOP")
      GameTooltip:AddLine("|cffffffff" .. tooltipl1 .. "|r")
      if tooltipl2 then
        GameTooltip:AddLine(tooltipl2)
      end
      GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function(self)
      GameTooltip:Hide()
    end)
  end

  button.checked = false

  button:SetPushedTexture(nil);

  ProbablyEngine.buttons.count = ProbablyEngine.buttons.count + 1

end

ProbablyEngine.buttons.text = function(name, text)
  local count = ProbablyEngine.buttons.buttons[name].count
  count:SetText(text);
  count:Show();
end

ProbablyEngine.buttons.setActive = function(name)
  if name == 'MasterToggle' then ProbablyEngine.active = true end
  local button = ProbablyEngine.buttons.buttons[name]
  if button then
    button.checked = true
    button:SetBackdropColor(ProbablyEngine_Data.style.active[1], ProbablyEngine_Data.style.active[2], ProbablyEngine_Data.style.active[3], ProbablyEngine_Data.style.active[4])
    ProbablyEngine_Data.button_states[name] = true
  end
end

ProbablyEngine.buttons.setInactive = function(name)
  if name == 'MasterToggle' then ProbablyEngine.active = false end
  local button = ProbablyEngine.buttons.buttons[name]
  if button then
    button.checked = false
    button:SetBackdrop(BACKDROP)
    button:SetBackdropColor(ProbablyEngine_Data.style.inactive[1], ProbablyEngine_Data.style.inactive[2], ProbablyEngine_Data.style.inactive[3], ProbablyEngine_Data.style.inactive[4])
    ProbablyEngine_Data.button_states[name] = false
  end
end

ProbablyEngine.buttons.icon = function(name, icon)
  _G['PE_Buttons_'.. name].icon:SetTexture(icon)
end