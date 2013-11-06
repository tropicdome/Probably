-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.


local log_height = 16
local log_items = 10
local abs_height = log_height * log_items + log_height
local delta = 0

PE_ActionLog = CreateFrame("Frame", "PE_ActionLog", UIParent)
local ActionLog = PE_ActionLog
ActionLog.show = false
ActionLog:SetFrameLevel(90)
ActionLog:SetWidth(500)
ActionLog:SetHeight(abs_height)
ActionLog:SetPoint("CENTER", UIParent)
ActionLog:SetMovable(true)
ActionLog:EnableMouseWheel(true)

local ActionLog_texture = ActionLog:CreateTexture(nil, "BACKGROUND")
ActionLog_texture:SetTexture(0,0,0,0.9)
ActionLog_texture:SetAllPoints(ActionLog)
ActionLog.texture = ActionLogHeader_texture

ActionLog:SetScript("OnMouseDown", function(self, button)
  if not self.isMoving then
   self:StartMoving()
   self.isMoving = true
  end
end)
ActionLog:SetScript("OnMouseUp", function(self, button)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)
ActionLog:SetScript("OnHide", function(self)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)
ActionLog:SetScript("OnMouseWheel", function(self, mouse)
  -- borked
  --[[if IsShiftKeyDown() then
    if delta == 1 then
      delta = 0
    else
      delta = select('#', ProbablyEngine.actionLog.log)
    end
  else
    delta = delta + mouse
  end]]--
end)


local ActionLogDivA = CreateFrame("Frame", nil , PE_ActionLog)
ActionLogDivA:SetFrameLevel(99)
ActionLogDivA:SetWidth(1)
ActionLogDivA:SetHeight(abs_height)
ActionLogDivA:SetPoint("LEFT", PE_ActionLog, 125, 0)
ActionLogDivA:SetMovable(true)

local ActionLogDivA_texture = ActionLogDivA:CreateTexture(nil, "BACKGROUND")
ActionLogDivA_texture:SetTexture(0,0,0,0.5)
ActionLogDivA_texture:SetAllPoints(ActionLogDivA)
ActionLogDivA.texture = ActionLogDivA_texture

local ActionLogDivB = CreateFrame("Frame", nil , PE_ActionLog)
ActionLogDivB:SetFrameLevel(99)
ActionLogDivB:SetWidth(1)
ActionLogDivB:SetHeight(abs_height)
ActionLogDivB:SetPoint("LEFT", PE_ActionLog, 375, 0)
ActionLogDivB:SetMovable(true)

local ActionLogDivB_texture = ActionLogDivB:CreateTexture(nil, "BACKGROUND")
ActionLogDivB_texture:SetTexture(0,0,0,0.5)
ActionLogDivB_texture:SetAllPoints(ActionLogDivB)
ActionLogDivB.texture = ActionLogDivB_texture


PE_ActionLog:Hide()

local ActionLogHeader = CreateFrame("Frame", nil, PE_ActionLog)
ActionLogHeader:SetFrameLevel(92)
ActionLogHeader:SetHeight(log_height)
ActionLogHeader:SetPoint("TOPLEFT", PE_ActionLog, "TOPLEFT")
ActionLogHeader:SetPoint("TOPRIGHT", PE_ActionLog, "TOPRIGHT")
local ActionLogHeader_texture = ActionLogHeader:CreateTexture(nil, "BACKGROUND")
ActionLogHeader_texture:SetTexture(0.15,0.15,0.15,1)
ActionLogHeader_texture:SetGradient("VERTICAL", 0.8,0.8,0.8, 0,0,0)
ActionLogHeader_texture:SetAllPoints(ActionLogHeader)
ActionLogHeader.texture = ActionLogHeader_texture


ActionLogHeader.statusTextA = ActionLogHeader:CreateFontString('PE_ActionLogHeaderText')
ActionLogHeader.statusTextA:SetFont("Fonts\\ARIALN.TTF", 10)
ActionLogHeader.statusTextA:SetPoint("LEFT", ActionLogHeader, 5, 0)
ActionLogHeader.statusTextA:SetText("Action")

ActionLogHeader.statusTextB = ActionLogHeader:CreateFontString('PE_ActionLogHeaderText')
ActionLogHeader.statusTextB:SetFont("Fonts\\ARIALN.TTF", 10)
ActionLogHeader.statusTextB:SetPoint("LEFT", ActionLogHeader, 130, 0)
ActionLogHeader.statusTextB:SetText("Description")

ActionLogHeader.statusTextC = ActionLogHeader:CreateFontString('PE_ActionLogHeaderText')
ActionLogHeader.statusTextC:SetFont("Fonts\\ARIALN.TTF", 10)
ActionLogHeader.statusTextC:SetPoint("LEFT", ActionLogHeader, 380, 0)
ActionLogHeader.statusTextC:SetText("Time")

local ActionLogClose = CreateFrame("Button", "PE_TrackerClose", PE_ActionLog)
ActionLogClose:SetFrameLevel(93)
ActionLogClose:SetWidth(20)
ActionLogClose:SetHeight(log_height)
ActionLogClose:SetPoint("TOPRIGHT", ActionLogHeader, 2, -1)

ActionLogClose.statusText = ActionLogHeader:CreateFontString('PE_ActionLogCloseX')
ActionLogClose.statusText:SetFont("Fonts\\ARIALN.TTF", 20)ActionLogClose.statusText:SetPoint("CENTER", ActionLogClose)
ActionLogClose.statusText:SetText("×")

ActionLogClose:SetScript("OnMouseUp", function(self, button)
  PE_ActionLog:Hide()
end)

local ActionLogItem = { }

for i = 1, (log_items) do

  ActionLogItem[i] = CreateFrame("Frame", nil, PE_ActionLog)
  ActionLogItem[i]:SetFrameLevel(94)
  local texture = ActionLogItem[i]:CreateTexture(nil, "BACKGROUND")
  texture:SetAllPoints(ActionLogItem[i])

  if (i % 2) == 1 then
    texture:SetTexture(0.15,0.15,0.15,1)
  else
    texture:SetTexture(0.1,0.1,0.1,1)
  end

  ActionLogItem[i].texture = texture


  ActionLogItem[i]:SetHeight(log_height)
  ActionLogItem[i]:SetPoint("LEFT", PE_ActionLog, "LEFT")
  ActionLogItem[i]:SetPoint("RIGHT", PE_ActionLog, "RIGHT")


  ActionLogItem[i].itemA = ActionLogItem[i]:CreateFontString('itemA')
  ActionLogItem[i].itemA:SetFont("Fonts\\ARIALN.TTF", 10)
  ActionLogItem[i].itemA:SetShadowColor(0,0,0, 0.8)
  ActionLogItem[i].itemA:SetShadowOffset(-1,-1)
  ActionLogItem[i].itemA:SetPoint("LEFT", ActionLogItem[i], 5, 0)

  ActionLogItem[i].itemB = ActionLogItem[i]:CreateFontString('itemA')
  ActionLogItem[i].itemB:SetFont("Fonts\\ARIALN.TTF", 10)
  ActionLogItem[i].itemB:SetShadowColor(0,0,0, 0.8)
  ActionLogItem[i].itemB:SetShadowOffset(-1,-1)
  ActionLogItem[i].itemB:SetPoint("LEFT", ActionLogItem[i], 130, 0)

  ActionLogItem[i].itemC = ActionLogItem[i]:CreateFontString('itemA')
  ActionLogItem[i].itemC:SetFont("Fonts\\ARIALN.TTF", 10)
  ActionLogItem[i].itemC:SetShadowColor(0,0,0, 0.8)
  ActionLogItem[i].itemC:SetShadowOffset(-1,-1)
  ActionLogItem[i].itemC:SetPoint("LEFT", ActionLogItem[i], 380, 0)


  local position = ((i * log_height) * -1)
  ActionLogItem[i]:SetPoint("TOPLEFT", PE_ActionLog, "TOPLEFT", 0, position)

end

ProbablyEngine.actionLog = { }
ProbablyEngine.actionLog.log = { }

ProbablyEngine.timer.register("updateActionLog", function()
  if not PE_ActionLog:IsShown() then return end

  local offset = 0
  local entries = select('#', ProbablyEngine.actionLog.log)
  if delta < 0 then return end
  for i = 1+delta, log_items + delta do
    offset = offset + 1
    if ProbablyEngine.actionLog.log[i] ~= nil then
      ActionLogItem[offset].itemA:SetText(ProbablyEngine.actionLog.log[i].event)
      ActionLogItem[offset].itemB:SetText(ProbablyEngine.actionLog.log[i].description)
      ActionLogItem[offset].itemC:SetText(ProbablyEngine.actionLog.log[i].time)
    end
  end

end, 100)
