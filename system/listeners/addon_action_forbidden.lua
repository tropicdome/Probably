-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("ADDON_ACTION_FORBIDDEN", function(...)
  -- We can attempt to hide these without totally raping the UI
  local addon, event = ...
  if addon == ProbablyEngine.addonName then
    StaticPopup1:Hide()
    ProbablyEngine.plua = false
    ProbablyEngine.debug("Protected Lua Event Forbidden: " .. event, 1)
  end
end)
