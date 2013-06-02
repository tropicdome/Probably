-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

-- This is useful when debugging hard to find problems.
-- This will increase memory usage by a factor of at least 10.
-- Use with caution.

if ProbablyEngine.hardcore_debug == true then
  SetCVar('scriptProfile', 0) -- enable profiling
  ProbablyEngine.timer.register("profiling", function()
    UpdateAddOnCPUUsage()
    UpdateAddOnMemoryUsage()
    ProbablyEngine.cpu = GetAddOnCPUUsage("Probably")
    ProbablyEngine.mem = GetAddOnMemoryUsage("Probably")
  end, 1000)
end
