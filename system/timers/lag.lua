-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local warningSent = false

ProbablyEngine.timer.register("lag", function()
  local bandwidthIn, bandwidthOut, latencyHome, latencyWorld = GetNetStats()
  ProbablyEngine.lag = math.floor( (((latencyWorld + latencyHome) / 2) / 2) )
  -- Dynamic rotation timing
  if ProbablyEngine.dynamicCycle == true then
    if ProbablyEngine.lag < 500 then
      ProbablyEngine.cycleTime = ProbablyEngine.lag
      ProbablyEngine.timer.updatePeriod("rotation", ProbablyEngine.cycleTime)
      ProbablyEngine.debug("Dynamic Cycle Update: " .. ProbablyEngine.cycleTime .. "ms" , 4)
    end
  else
    ProbablyEngine.cycleTime = ProbablyEngine_Data.cycle_time
  end
end, 2000)

ProbablyEngine.timer.register("garbage", function()
  local addonUsage = GetAddOnMemoryUsage(ProbablyEngine.addonName)
  if addonUsage > 1000 then
    collectgarbage('collect')
    ProbablyEngine.debug("Garbage Collection Ran: " .. addonUsage .. "kb" , 4)
  end
end, 10000)


