local AceGUI = LibStub("AceGUI-3.0")

ProbablyEngine.interface = {
  shown = false,
  moving = false,
  indent = IndentationLib,
  syntaxcolors = { },
}

local T = ProbablyEngine.interface.indent.Tokens
local ProbablyEngine.interface.syntaxcolors = { }

local function color ( color, ... )
  for i = 1, select( "#", ... ) do
    ProbablyEngine.interface.syntaxcolors[ select( i, ... ) ] = color;
  end
end

color( "|cffad91b8", T.KEYWORD )
color( "|cffc5c8c6", T.UNKNOWN )
color( "|cffc5c8c6", T.CONCAT, T.VARARG, T.ASSIGNMENT, T.PERIOD, T.COMMA, T.SEMICOLON, T.COLON, T.SIZE )
color( "|cffde935f", T.NUMBER )
color( "|cffb5bd68", T.STRING, T.STRING_LONG )
color( "|cff969896", T.COMMENT_SHORT, T.COMMENT_LONG )
color( "|cffc5c8c6", T.LEFTCURLY, T.RIGHTCURLY, T.LEFTBRACKET, T.RIGHTBRACKET)
color( "|cffc5c8c6", T.LEFTPAREN, T.RIGHTPAREN)
color( "|cff8abeb7", T.ADD, T.SUBTRACT, T.MULTIPLY, T.DIVIDE, T.POWER, T.MODULUS )
color( "|cff8abeb7", T.EQUALITY, T.NOTEQUAL, T.LT, T.LTE, T.GT, T.GTE )

color( "|cff81a2be",
  "assert", "error", "ipairs", "next", "pairs",
  "pcall", "print", "select", "tonumber", "tostring",
  "type", "unpack", "bit", "coroutine", "math", "string", "table" )

color( "|cff81a2be",
  "abs", "ceil", "floor", "max", "min", "format", "gsub", "strbyte",
  "strchar", "strconcat", "strfind", "strjoin", "strlower", "strmatch",
  "strrep", "strrev", "strsplit", "strsub", "strtrim", "strupper", "tostringall",
  "sort", "tinsert", "tremove", "wipe" )

ProbablyEngine.interface.manager = function()

  local frame = AceGUI:Create("Window")
  frame:SetLayout("Flow")
  frame:SetWidth(800)
  frame:SetHeight(350)

  local list = AceGUI:Create("TreeGroup")

  list:SetCallback('OnGroupSelected', function(widget, action, value)

    if value == "import" then

      widget:SetFullHeight(true)
      widget:SetFullWidth(true)
      widget:SetLayout("Fill")

      local scroll = AceGUI:Create("ScrollFrame")
      scroll:SetLayout("Flow")
      widget:AddChild(scroll)

      local input = AceGUI:Create("MultiLineEditBox")
      input:SetLabel('')
      input:SetNumLines(10)
      input:SetFullWidth(true)
      input:DisableButton(true)
      input.editBox:SetFont("Interface\\AddOns\\Probably\\external\\DejaVuSansMono.ttf", 10)
      ProbablyEngine.interface.indent.Enable(input.editBox, 2, ProbablyEngine.interface.syntaxcolors)

      scroll:AddChild(input)

    else

    end

  end)

  local tree = {
    {
      value = "import",
      text = "|cff2c9800Import|r",
      icon = "Interface\\PaperDollInfoFrame\\Character-Plus"
    },
    {
      value = "Phelps Bear",
      text = "Phelps Bear"
    }
  }

  list:SetFullHeight(true)
  list:SetFullWidth(true)
  list:SetTree(tree)

  frame:AddChild(list)


end

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

function ProbablyEngine_Minimap_OnClick(button)
  if button == 'RightButton' then
    if not ProbablyEngine.interface.moving then
      ProbablyEngine.buttons.frame:Show()
      ProbablyEngine.interface.moving = true
    else
      ProbablyEngine.buttons.frame:Hide()
      ProbablyEngine.interface.moving = false
    end
  else
    if not ProbablyEngine.interface.shown then
      ProbablyEngine.interface.config()
    end
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