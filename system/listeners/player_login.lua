-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("PLAYER_LOGIN", function(...)
  ProbablyEngine.rotation.auto_unregister()
  ProbablyEngine.listener.trigger("PLAYER_SPECIALIZATION_CHANGED", "player")
  ProbablyEngine.rotation.add_buttons()
  if not ProbablyEngine.full then
    ProbablyEngine.full_check()
  end
end)
