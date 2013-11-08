-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("GROUP_ROSTER_UPDATE", function(...)
  ProbablyEngine.raid.build()
end)