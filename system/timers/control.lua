-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer.register("has_control", function()
  ProbablyEngine.module.player.control = HasFullControl() == 1
end, 100)
