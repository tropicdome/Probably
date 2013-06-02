-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer = {
  interval = 0.01,
  timers = {}
}

-- create the frame to register timers
ProbablyEngine.timer.timerFrame = CreateFrame("FRAME")

ProbablyEngine.timer.register = function (module, event, period)
  ProbablyEngine.timer.timers[module] = {
    e = event,
    p = (period / 1000),
    l = 0
  }
end

ProbablyEngine.timer.unregister = function (module)
  ProbablyEngine.timer.timers[module] = nil
end

-- listen and fire events
ProbablyEngine.timer.handle = function (self, elapsed)
  for timer, struct in pairs(ProbablyEngine.timer.timers) do
    struct.l = struct.l + elapsed;
    if (struct.l > struct.p) then
      struct.e()
      struct.l = 0
    end
  end
end

-- register our listener
ProbablyEngine.timer.timerFrame:SetScript("OnUpdate", ProbablyEngine.timer.handle)

