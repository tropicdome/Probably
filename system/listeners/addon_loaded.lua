-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("ADDON_LOADED", function(...)
  for button, state in pairs(ProbablyEngine_Data.button_states) do
    if state == true then
      ProbablyEngine.buttons.setActive(button)
    else
      ProbablyEngine.buttons.setInactive(button)
    end
  end
end)
