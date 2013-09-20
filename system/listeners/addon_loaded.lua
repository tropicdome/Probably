-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("ADDON_LOADED", function(...)

  for button, state in pairs(ProbablyEngine_Data.button_states) do
    if state == true then
      ProbablyEngine.buttons.setActive(button)
      ProbablyEngine.toggle.states[button] = true
    else
      ProbablyEngine.buttons.setInactive(button)
      ProbablyEngine.toggle.states[button] = false
    end
  end

  ProbablyEngine_Minimap_Reposition()

  if ProbablyEngine_Data.button_shown ~= nil then
    if ProbablyEngine_Data.button_shown then
      ProbablyEngine.buttons.buttonFrame:Show()
    else
      ProbablyEngine.buttons.buttonFrame:Hide()
    end
  else
    ProbablyEngine.buttons.buttonFrame:Show()
    ProbablyEngine_Data.button_shown = true
  end

  if ProbablyEngine_Data.dynamic_cycle ~= nil then
    if ProbablyEngine_Data.dynamic_cycle then
      ProbablyEngine.dynamicCycle = true
    else
      ProbablyEngine.dynamicCycle = false
    end
  else
    ProbablyEngine.dynamicCycle = true
    ProbablyEngine_Data.dynamic_cycle = true
  end

  if ProbablyEngine_Data.cycle_time ~= nil then
    ProbablyEngine.cycleTime = ProbablyEngine_Data.cycle_time
  else
    ProbablyEngine_Data.cycle_time = ProbablyEngine.cycleTime
  end

  if ProbablyEngine_Data.style == nil then
    ProbablyEngine_Data.style = {size = 26,padding = 7,active = {0.2, 0.7, 0.1, 1}, inactive = {0, 0, 0, 1}}
  end

end)
