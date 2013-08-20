

local AceGUI = LibStub("AceGUI-3.0")

ProbablyEngine.interface = {
  shown = false,
  moving = false
}

ProbablyEngine.interface.config = function()

  ProbablyEngine.interface.shown = true

  local frame = AceGUI:Create("Frame")

  frame:SetWidth(400)
  frame:SetTitle("ProbablyEngine Configuration")
  frame:SetStatusText("ProbablyEngine v" .. ProbablyEngine.version)
  frame:SetCallback("OnClose", function(widget)
    AceGUI:Release(widget)
    ProbablyEngine.interface.shown = false
  end)
  frame:SetLayout("Flow")

  -- Create the scroll frame
  scrollcontainer = AceGUI:Create("SimpleGroup")
  scrollcontainer:SetFullWidth(true)
  scrollcontainer:SetFullHeight(true)
  scrollcontainer:SetLayout("Fill")
  frame:AddChild(scrollcontainer)
  scroll = AceGUI:Create("ScrollFrame")
  scroll:SetFullWidth(true)
  scroll:SetLayout("Flow")
  scrollcontainer:AddChild(scroll)


  -- Interface Settings Group
  interface = AceGUI:Create("InlineGroup")
  interface:SetFullWidth(true)
  interface:SetTitle("Interface Settings")
  scroll:AddChild(interface)

  -- Show Toggle
  showGroup = AceGUI:Create("SimpleGroup")
  show = AceGUI:Create("CheckBox")
  show:SetValue(ProbablyEngine_Data.button_shown)
  show:SetCallback('OnValueChanged', function(value)
    local show = value:GetValue()
    if show then
      ProbablyEngine.buttons.buttonFrame:Show()
      ProbablyEngine_Data.button_shown = true
    else
      ProbablyEngine.buttons.buttonFrame:Hide()
      ProbablyEngine_Data.button_shown = false
    end
  end)
  show:SetLabel("Show Buttons")
  showGroup:AddChild(show)

  showDesc = AceGUI:Create("Label")
  showDesc:SetText("Allows the primary buttons to be hidden.")
  showDesc:SetFullWidth(true)
  showGroup:AddChild(showDesc)
  interface:AddChild(showGroup)

  spacerZ = AceGUI:Create("Heading")
  showGroup:AddChild(spacerZ)

  -- Position Toggle
  moveGroup = AceGUI:Create("SimpleGroup")
  move = AceGUI:Create("CheckBox")
  move:SetValue(ProbablyEngine.interface.moving)
  move:SetCallback('OnValueChanged', function(value)
    local move = value:GetValue()
    if move then
      ProbablyEngine.buttons.frame:Show()
      ProbablyEngine.interface.moving = true
    else
      ProbablyEngine.buttons.frame:Hide()
      ProbablyEngine.interface.moving = false
    end
  end)
  move:SetLabel("Unlock Buttons")
  moveGroup:AddChild(move)

  moveDesc = AceGUI:Create("Label")
  moveDesc:SetText("Allow the buttons to be positioned, while enabled buttons, cannnot be pressed.")
  moveDesc:SetFullWidth(true)
  moveGroup:AddChild(moveDesc)
  interface:AddChild(moveGroup)


  -- -- -- -- -- -- -- -- -- -- -- --
  -- -- -- -- -- -- -- -- -- -- -- --
  -- -- -- -- -- -- -- -- -- -- -- --
  -- -- -- -- -- -- -- -- -- -- -- --


  -- Engine Settings
  engine = AceGUI:Create("InlineGroup")
  engine:SetFullWidth(true)
  engine:SetTitle("Engine Settings")
  scroll:AddChild(engine)

  -- Cycle Time

  cycleTimeGroup = AceGUI:Create("SimpleGroup")
  cycleTime = AceGUI:Create("Slider")
  cycleTime:SetSliderValues(10, 500, 10)
  cycleTime:SetValue(ProbablyEngine_Data.cycle_time)
  cycleTime:SetLabel("Cycle Time in Milliseconds")
  cycleTime:SetCallback('OnValueChanged', function(value)
    cycleTime = value:GetValue()
    ProbablyEngine.cycleTime = cycleTime
    ProbablyEngine_Data.cycle_time = cycleTime
    if not ProbablyEngine.dynamicCycle then
      ProbablyEngine.timer.updatePeriod('rotation', cycleTime)
    end
  end)
  cycleTimeGroup:AddChild(cycleTime)
  cycleTimeDesc = AceGUI:Create("Label")
  cycleTimeDesc:SetText("Used when Dynamic Cycle Time is disabled. This adjustes the speed at which the rotations are ran.")
  cycleTimeDesc:SetFullWidth(true)
  cycleTimeGroup:AddChild(cycleTimeDesc)

  spacerA = AceGUI:Create("Heading")
  cycleTimeGroup:AddChild(spacerA)

  engine:AddChild(cycleTimeGroup)



  cycleGroup = AceGUI:Create("SimpleGroup")

  cycle = AceGUI:Create("CheckBox")
  cycle:SetLabel("Dynamic Cycle Time")
  cycle:SetValue(ProbablyEngine_Data.dynamic_cycle)
  cycle:SetCallback('OnValueChanged', function(value)
    cycle = value:GetValue()
    ProbablyEngine.dynamicCycle = cycle
    ProbablyEngine_Data.dynamic_cycle = cycle
  end)
  cycleGroup:AddChild(cycle)

  cycleDesc = AceGUI:Create("Label")
  cycleDesc:SetText("Enable dynamic adjusting of the cycle speed.  This can optimize rotation timing if you have a good connection to the server.")
  cycleDesc:SetFullWidth(true)
  cycleGroup:AddChild(cycleDesc)


  spacerB = AceGUI:Create("Heading")
  cycleGroup:AddChild(spacerB)

  engine:AddChild(cycleGroup)


  -- Garbage

  garbageGroup = AceGUI:Create("SimpleGroup")

  garbage = AceGUI:Create("CheckBox")
  garbage:SetLabel("Garbage Collection")
  garbageGroup:AddChild(garbage)

  garbageDesc = AceGUI:Create("Label")
  garbageDesc:SetText("Force garbage collection. Enable this if you notice the addon using a lot of memory.")
  garbageDesc:SetFullWidth(true)
  garbageGroup:AddChild(garbageDesc)

  engine:AddChild(garbageGroup)

end

function ProbablyEngine_Minimap_Reposition()
  if not ProbablyEngine_Data.minimapPos then ProbablyEngine_Data.minimapPos = 45 end
  ProbablyEngine_Minimap:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(ProbablyEngine_Data.minimapPos)),(80*sin(ProbablyEngine_Data.minimapPos))-52)
end
function ProbablyEngine_Minimap_DraggingFrame_OnUpdate()
  local xpos,ypos = GetCursorPosition()
  local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()
  xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
  ypos = ypos/UIParent:GetScale()-ymin-70
  ProbablyEngine_Data.minimapPos = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
  ProbablyEngine_Minimap_Reposition() -- move the button
end
function ProbablyEngine_Minimap_OnClick()
  if not ProbablyEngine.interface.shown then
    ProbablyEngine.interface.config()
  end
end