-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013
local warningSent = false

ProbablyEngine.timer.register("lag", function()
  local bandwidthIn, bandwidthOut, latencyHome, latencyWorld = GetNetStats()
  ProbablyEngine.lag = (((latencyWorld + latencyHome) / 2) * 2)
  -- Dynamic rotation timing
  if ProbablyEngine.dynamicCycle == true then
    if ProbablyEngine.lag < 500 then
      ProbablyEngine.cycleTime = ProbablyEngine.lag
      ProbablyEngine.timer.updatePeriod("rotation", ProbablyEngine.cycleTime)
    end
  end
end, 2000)