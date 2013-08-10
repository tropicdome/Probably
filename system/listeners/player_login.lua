-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_LOGIN", function(...)
  ProbablyEngine.rotation.auto_unregister()
  ProbablyEngine.listener.eventActions["PLAYER_SPECIALIZATION_CHANGED"]("player")
  if not ProbablyEngine.full then
    ProbablyEngine.full_check()
    ProbablyEngine.module.world.add_friendly(UnitGUID("player"), UnitName("player"))
  end
end)
