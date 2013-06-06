-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_LOGIN", function(...)
  ProbablyEngine.listener.eventActions["PLAYER_SPECIALIZATION_CHANGED"]("player")
  if not ProbablyEngine.plua then
    ProbablyEngine.plua_check()
  end
end)
