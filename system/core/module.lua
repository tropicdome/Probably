-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.module = {}

ProbablyEngine.module.register = function (module, struct)
  ProbablyEngine.module[module] = struct
end

ProbablyEngine.module.unregister = function (module)
  ProbablyEngine.module[module] = nil
end