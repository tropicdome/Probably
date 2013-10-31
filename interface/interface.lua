-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

-- Handle the minimap icon

local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local button_moving = false

function ProbablyEngine_Minimap_Reposition()
  if not ProbablyEngine.config.read('minimap_position') then ProbablyEngine.config.write('minimap_position', 45) end
  local position = ProbablyEngine.config.read('minimap_position')
  ProbablyEngine_Minimap:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(position)),(80*sin(position))-52)
end

function ProbablyEngine_Minimap_DraggingFrame_OnUpdate()
  local xpos,ypos = GetCursorPosition()
  local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()
  xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
  ypos = ypos/UIParent:GetScale()-ymin-70
  ProbablyEngine.config.write('minimap_position', math.floor(math.deg(math.atan2(ypos,xpos)))) -- save the degrees we are relative to the minimap center
  ProbablyEngine_Minimap_Reposition() -- move the button
end

function ProbablyEngine_Minimap_OnClick(button)
  if button == 'RightButton' then
    if not button_moving then
      ProbablyEngine.buttons.frame:Show()
      button_moving = true
    else
      ProbablyEngine.buttons.frame:Hide()
      button_moving = false
    end
  else
    InterfaceOptionsFrame_OpenToCategory('ProbablyEngine')
  end
end

function ProbablyEngine_Minimap_OnEnter(self)
  GameTooltip:SetOwner( self, "ANCHOR_BOTTOMLEFT" )
  GameTooltip:AddLine("|cff" .. ProbablyEngine.addonColor .. ProbablyEngine.addonName.. "|r v".. ProbablyEngine.version)
  GameTooltip:AddLine("|cff" .. ProbablyEngine.addonColor .. "Left-Click|r to open configuration.")
  GameTooltip:AddLine("|cff" .. ProbablyEngine.addonColor .. "Right-Click|r to unlock buttons.")
  GameTooltip:AddLine("|cff" .. ProbablyEngine.addonColor .. "Drag|r to move minimap button.")
  GameTooltip:Show()
end

function ProbablyEngine_Minimap_OnLeave(self)
  GameTooltip:Hide()
end