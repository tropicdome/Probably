---- Things that don't have a home yet....

ProbablyEngine.dsl.register("modifier.shift", function()
  return IsShiftKeyDown() ~= nil
end)

ProbablyEngine.dsl.register("cooldowns", function()
  return ProbablyEngine.module.config.cooldowns
end)

ProbablyEngine.dsl.register("multitarget", function()
  return ProbablyEngine.module.config.multitarget
end)
