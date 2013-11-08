-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local function HexToRGBPerc(hex)
  local rhex, ghex, bhex = string.sub(hex, 1, 2), string.sub(hex, 3, 4), string.sub(hex, 5, 6)
  return tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255
end

local max_tracking = ProbablyEngine.config.read('ct_maxtracking', 10)
local tracking_height = 16
local tracking_width = 250
local colorR, colorB, colorG = HexToRGBPerc(ProbablyEngine.addonColor)

UnitTracker = CreateFrame("Frame", "PE_Tracker", UIParent)
UnitTracker:IsResizable(true)
UnitTracker:SetWidth(tracking_width)
UnitTracker:SetHeight(max_tracking*tracking_height+(max_tracking*2))
UnitTracker:SetPoint("CENTER", UIParent)
UnitTracker:SetResizable(true)
UnitTracker:SetMovable(true)
UnitTracker:Hide()

UnitTracker.toggle = function(load)
  if load then
    local toggleState = ProbablyEngine.config.read('ut_toggle')
    if toggleState then
      UnitTracker:Show()
    end
  else
    if UnitTracker:IsShown() then
      UnitTracker:Hide()
      ProbablyEngine.config.write('ut_toggle', false)
    else
      UnitTracker:Show()
      ProbablyEngine.config.write('ut_toggle', true)
    end
  end
end

UnitTrackerSizer = CreateFrame("Frame", nil, PE_Tracker)
UnitTrackerSizer:SetWidth(10)
UnitTrackerSizer:SetHeight(10)
UnitTrackerSizer:SetPoint("BOTTOMRIGHT", PE_Tracker)
UnitTrackerSizer:SetFrameStrata("MEDIUM")

local UnitTrackerSizer_texture = UnitTrackerSizer:CreateTexture(nil, "BACKGROUND")
UnitTrackerSizer_texture:SetTexture(1,1,1,0.5)
UnitTrackerSizer_texture:SetAllPoints(UnitTrackerSizer)
UnitTrackerSizer.texture = UnitTrackerSizer_texture


UnitTrackerHeader = CreateFrame("Frame", nil, PE_Tracker)
UnitTrackerHeader:SetHeight(tracking_height)
UnitTrackerHeader:SetPoint("TOPLEFT", PE_Tracker, "TOPLEFT")
UnitTrackerHeader:SetPoint("TOPRIGHT", PE_Tracker, "TOPRIGHT")

local UnitTrackerHeader_texture = UnitTrackerHeader:CreateTexture(nil, "BACKGROUND")
UnitTrackerHeader_texture:SetTexture(0,0,0,1)
UnitTrackerHeader_texture:SetAllPoints(UnitTrackerHeader)
UnitTrackerHeader.texture = UnitTrackerHeader_texture


UnitTrackerHeader.statusText = UnitTrackerHeader:CreateFontString('PE_StatusText')
UnitTrackerHeader.statusText:SetFont("Fonts\\ARIALN.TTF", 10)
UnitTrackerHeader.statusText:SetPoint("CENTER", UnitTrackerHeader)
UnitTrackerHeader.statusText:SetText("CombatTracker")

local displayTTD = ProbablyEngine.config.read('ct_dttd', false)
local displayTotal = ProbablyEngine.config.read('ct_dtotal', false)

UnitTrackerToggle = CreateFrame("Button", "PE_TrackerToggle", PE_Tracker)
UnitTrackerToggle:SetWidth(20)
UnitTrackerToggle:SetHeight(tracking_height)
UnitTrackerToggle:SetPoint("TOPLEFT", UnitTrackerHeader, 5, 0)
UnitTrackerToggle.statusText = UnitTrackerToggle:CreateFontString('PE_StatusText')
UnitTrackerToggle.statusText:SetFont("Fonts\\ARIALN.TTF", 10)
UnitTrackerToggle.statusText:SetPoint("LEFT", UnitTrackerToggle, 0, 0)

UnitTrackerTotal = CreateFrame("Button", "PE_TrackerTotal", PE_Tracker)
UnitTrackerTotal:SetWidth(20)
UnitTrackerTotal:SetHeight(tracking_height)
UnitTrackerTotal:SetPoint("TOPRIGHT", UnitTrackerHeader, -5, 0)
UnitTrackerTotal.statusText = UnitTrackerTotal:CreateFontString('PE_StatusText')
UnitTrackerTotal.statusText:SetFont("Fonts\\ARIALN.TTF", 10)
UnitTrackerTotal.statusText:SetPoint("RIGHT", UnitTrackerTotal, 0, 0)
UnitTrackerTotal.statusText:SetText("T")

if displayTTD then
  UnitTrackerToggle.statusText:SetText("TTD")
else
  UnitTrackerToggle.statusText:SetText("HPR")
end

if displayTotal then
  UnitTrackerTotal.statusText:SetTextColor(0.2,0.7,0.2,1)
else
  UnitTrackerTotal.statusText:SetTextColor(1,1,1,1)
end

UnitTrackerToggle:SetScript("OnClick", function(self, button)
  displayTTD = not displayTTD
  if displayTTD then
    UnitTrackerToggle.statusText:SetText("TTD")
  else
    UnitTrackerToggle.statusText:SetText("HPR")
  end
  ProbablyEngine.config.write('ct_dttd', displayTTD)
end)

UnitTrackerTotal:SetScript("OnClick", function(self, button)
  displayTotal = not displayTotal
  if displayTotal then
    UnitTrackerTotal.statusText:SetTextColor(0.2,0.7,0.2,1)
  else
    UnitTrackerTotal.statusText:SetTextColor(1,1,1,1)
  end
  ProbablyEngine.config.write('ct_dtotal', displayTotal)
end)

UnitTrackerSizer:SetScript("OnMouseDown", function(self, button)
  if not UnitTracker.isMoving then
   UnitTracker:StartSizing()
   UnitTracker.isMoving = true
  end
end)
UnitTrackerSizer:SetScript("OnMouseUp", function(self, button)
  if UnitTracker.isMoving then
   UnitTracker:StopMovingOrSizing()
   UnitTracker.isMoving = false
  end
end)
UnitTrackerSizer:SetScript("OnHide", function(self)
  if UnitTracker.isMoving then
   UnitTracker:StopMovingOrSizing()
   UnitTracker.isMoving = false
  end
end)
UnitTrackerSizer:SetScript("OnUpdate", function(self)
  if UnitTracker.isMoving then
   UnitTracker:SetHeight(max_tracking*tracking_height+(max_tracking*4)-tracking_height)
  end
end)

UnitTracker:SetScript("OnMouseDown", function(self, button)
  if not self.isMoving then
   self:StartMoving()
   self.isMoving = true
  end
end)
UnitTracker:SetScript("OnMouseUp", function(self, button)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)
UnitTracker:SetScript("OnHide", function(self)
  if self.isMoving then
   self:StopMovingOrSizing()
   self.isMoving = false
  end
end)


local UnitTracker_texture = UnitTracker:CreateTexture(nil, "BACKGROUND")
UnitTracker_texture:SetTexture(0,0,0,0.5)
UnitTracker_texture:SetAllPoints(UnitTracker)
UnitTracker.texture = UnitTracker_texture

UnitTracker:SetPoint("CENTER", 0, 0)
CombatTableUnit = { }

if displayTotal then max_tracking = max_tracking + 1 end

for i = 1, (max_tracking) do
  CombatTableUnit[i] = CreateFrame("StatusBar", nil, UnitTracker)
  CombatTableUnit[i]:SetStatusBarTexture(1,1,1,0.8)
  CombatTableUnit[i]:GetStatusBarTexture():SetHorizTile(false)
  CombatTableUnit[i]:SetMinMaxValues(0, 100)
  CombatTableUnit[i]:SetHeight(tracking_height)
  CombatTableUnit[i]:SetPoint("LEFT", PE_Tracker, "LEFT")
  CombatTableUnit[i]:SetPoint("RIGHT", PE_Tracker, "RIGHT")

  CombatTableUnit[i]:SetValue(100)
  CombatTableUnit[i]:SetStatusBarColor(colorR,colorB,colorG)

  CombatTableUnit[i].unitName = CombatTableUnit[i]:CreateFontString('unitName')
  CombatTableUnit[i].unitName:SetFont("Fonts\\ARIALN.TTF", 10)
  CombatTableUnit[i].unitName:SetShadowColor(0,0,0, 0.8)
  CombatTableUnit[i].unitName:SetShadowOffset(-1,-1)
  CombatTableUnit[i].unitName:SetPoint("LEFT", CombatTableUnit[i])


  CombatTableUnit[i].unitHealth = CombatTableUnit[i]:CreateFontString('unitHealth')
  CombatTableUnit[i].unitHealth:SetFont("Fonts\\ARIALN.TTF", 10)
  CombatTableUnit[i].unitHealth:SetShadowColor(0,0,0, 0.8)
  CombatTableUnit[i].unitHealth:SetShadowOffset(-1,-1)
  CombatTableUnit[i].unitHealth:SetPoint("RIGHT", CombatTableUnit[i])

  local position = 0
  position = ((((i * tracking_height) + (i * 1)) - 1) * -1)
  CombatTableUnit[i]:SetPoint("TOPLEFT", UnitTracker, "TOPLEFT", 0, position)

end

ProbablyEngine.timer.register("updateCTHealthUI", function()

  local incombatwith = #ProbablyEngine.module.combatTracker.enemy
  local currentRow
  if displayTotal then currentRow = 2 else currentRow = 1 end

  local totalHP = 0
  local totalCurrentHP = 0
  local totalDPS = 0

  for guid, unit in pairs(ProbablyEngine.module.combatTracker.enemy) do

    if unit.health and unit.health <= 1 then
      -- shits dead yo
      ProbablyEngine.module.combatTracker.enemy[guid] = nil
    else
      if currentRow <= max_tracking then

        CombatTableUnit[currentRow].unitName:SetText(unit.name)
        if unit.health and unit.maxHealth then

          totalHP = totalHP + unit.maxHealth
          totalCurrentHP = totalCurrentHP + unit.health

          local percent = math.floor(((unit.health / unit.maxHealth) * 100))
          local remaining = math.floor(unit.health / 1000)
          -- We have the unitHP and max HP
          -- show a nice % bar
          CombatTableUnit[currentRow]:SetValue(percent)

          if displayTTD then
            --[[
              So this is how it works, pretty stable
              T - N = S ( Time - Now = Seconds )
              M - H = D ( Max HP - Current HP = Deficit )
              D / S = P ( Deficit / Seconds = Per Second )
              H / P = R ( Current HP / Per Second = Remaining )
            ]]--
            local deaht_in
            if unit.time then
              local T = unit.time
              local N = time()
              local M = unit.maxHealth
              local H = unit.health
              local S = T - N
              local D = M - H
              local P = D / S
              local R = math.floor(math.abs(H / P))
              if R > 3600 then R = 1 end
              if ProbablyEngine.module.combatTracker.enemy[guid]['ttdsamples'] == nil then
                ProbablyEngine.module.combatTracker.enemy[guid]['ttdsamples'] = 0
                ProbablyEngine.module.combatTracker.enemy[guid]['ttdest'] = 0
              end
              local sampled
              ProbablyEngine.module.combatTracker.enemy[guid]['ttdsamples'] = ProbablyEngine.module.combatTracker.enemy[guid]['ttdsamples'] + 1
              ProbablyEngine.module.combatTracker.enemy[guid]['ttdest'] = ProbablyEngine.module.combatTracker.enemy[guid]['ttdest'] + R
              sampled = ProbablyEngine.module.combatTracker.enemy[guid]['ttdest'] / ProbablyEngine.module.combatTracker.enemy[guid]['ttdsamples'];
              sampled = math.floor(sampled)
              deaht_in = string.format("%.2d:%.2d", sampled/60, sampled%60)
            else
              deaht_in = "Est."
            end
            CombatTableUnit[currentRow].unitHealth:SetText(deaht_in)
          else
            CombatTableUnit[currentRow].unitHealth:SetText(remaining)
          end

        elseif unit.maxHealth then
          -- We have the units max HP but we don't know its current HP
          -- This happens often as we probably are guessing the units HP
          totalHP = totalHP + unit.maxHealth
          local remaining = math.floor(unit.maxHealth / 1000)
          CombatTableUnit[currentRow]:SetValue(100)
          CombatTableUnit[currentRow].unitHealth:SetText(remaining .. 'k')
        elseif unit.health then
          -- We have the units HP now, but not its max HP
          -- this should never happen.. but here it is
          totalCurrentHP = totalCurrentHP + unit.health
          local remaining = math.floor(unit.health / 1000)
          CombatTableUnit[currentRow]:SetValue(100)
          CombatTableUnit[currentRow].unitHealth:SetText(remaining .. 'k')
        else
          -- we actually don't know the units health :'(
          CombatTableUnit[currentRow]:SetValue(100)
          CombatTableUnit[currentRow].unitHealth:SetText('n/a')
        end
        currentRow = currentRow + 1
      end

    end

  end

  local totalPercent = math.floor(((totalCurrentHP / totalHP) * 100))
  local totalRemaining = math.floor(totalCurrentHP / 1000)

  if displayTotal then
    CombatTableUnit[1].unitName:SetText('All Units')
    CombatTableUnit[1]:SetPoint("TOPLEFT", UnitTracker, "TOPLEFT", 0, tracking_height*-1)
    CombatTableUnit[1]:SetValue(totalPercent)
    CombatTableUnit[1].unitHealth:SetText(totalRemaining .. 'k')
  end

  for i = currentRow, max_tracking do
    CombatTableUnit[i]:SetValue(0)
    CombatTableUnit[i].unitName:SetText('')
    CombatTableUnit[i].unitHealth:SetText('')
  end
end, 100)

ProbablyEngine.interface.cleanCT = function()
  for i = 1, max_tracking do
    CombatTableUnit[i]:SetValue(0)
    CombatTableUnit[i].unitName:SetText('')
    CombatTableUnit[i].unitHealth:SetText('')
  end
end
