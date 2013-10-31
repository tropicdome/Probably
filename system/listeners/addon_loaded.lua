-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("ADDON_LOADED", function(...)

  local addon = ...

  if addon ~= ProbablyEngine.addonName then return end

  -- load all our config data
  ProbablyEngine.config.load(ProbablyEngine_ConfigData)

  -- load our previous button states
  ProbablyEngine.buttons.loadStates()

  -- position the minimap icon
  ProbablyEngine_Minimap_Reposition()

end)
