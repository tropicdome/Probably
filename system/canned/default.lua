---- Things that don't have a home yet....

ProbablyEngine.canned.register("with_shiftkey", function()
  return IsShiftKeyDown() ~= nil
end)

ProbablyEngine.canned.register("with_cooldowns", function()
  return ProbablyEngine.module.config.cooldowns
end)

ProbablyEngine.canned.register("with_multitarget", function()
  return ProbablyEngine.module.config.multitarget
end)
