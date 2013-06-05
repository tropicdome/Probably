-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer = {
  interval = 0.01,
  timers = {}
}

-- create the frame to register timers
ProbablyEngine.timer.timerFrame = CreateFrame("FRAME")

ProbablyEngine.timer.register = function (module, _event, _period)
  ProbablyEngine.timer.timers[module] = {
    event = _event,
    period = (_period / 1000),
    last = 0
  }
end

ProbablyEngine.timer.unregister = function (module)
  ProbablyEngine.timer.timers[module] = nil
end

-- listen and fire events
ProbablyEngine.timer.handle = function (self, elapsed)
  for timer, struct in pairs(ProbablyEngine.timer.timers) do
    struct.last = struct.last + elapsed
    if (struct.last > struct.period) then
      ProbablyEngine.debug("Timer Fire: " .. timer , 4)
      struct.event()
      struct.last = 0
    end
  end
end

-- register our handler
ProbablyEngine.timer.timerFrame:SetScript("OnUpdate", ProbablyEngine.timer.handle)

