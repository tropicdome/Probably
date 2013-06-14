-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("ADDON_ACTION_FORBIDDEN", function(...)
  -- We can attempt to hide these without totally raping the UI
  local addon, event = ...
  if addon == "Probably" then
    StaticPopup1:Hide()
    ProbablyEngine.full = false
    ProbablyEngine.debug("Event Forbidden: " .. event, 3)
  end
end)
