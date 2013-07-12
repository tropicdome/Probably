-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.buttons = {
  frame = CreateFrame("Frame","PE_Buttons",UIParent),
  scale = 1,
  padding = 6,
  count = 0
}

ProbablyEngine.buttons.frame:SetPoint("CENTER", UIParent)
ProbablyEngine.buttons.frame:SetWidth(5)
ProbablyEngine.buttons.frame:SetHeight(5)
ProbablyEngine.buttons.frame:SetMovable(true)
ProbablyEngine.buttons.frame:Show()

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

ProbablyEngine.buttons.create = function(name, icon, callback)
  local button = CreateFrame("Button", "PE_Buttons_"..name, UIParent, "ActionButtonTemplate")
  button:SetScale(ProbablyEngine.buttons.scale)

  if ProbablyEngine.buttons.count == 0 then
    button:SetPoint("TOPLEFT", ProbablyEngine.buttons.frame, "TOPLEFT", 0, 0)
  else
    button:SetPoint("TOPLEFT", ProbablyEngine.buttons.frame, "TOPLEFT", ((ProbablyEngine.buttons.count*32)+ProbablyEngine.buttons.padding), 0)
  end

  button:SetWidth(32)
  button:SetHeight(32)
  ProbablyEngine.buttons.frame:SetWidth(((ProbablyEngine.buttons.count*(32+ProbablyEngine.buttons.padding))))

  _G[button:GetName().."Icon"]:SetTexture(icon)
  button:SetScript("OnClick", callback)

  ProbablyEngine.buttons.count = ProbablyEngine.buttons.count + 1
end
