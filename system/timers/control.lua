-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer.register("HasFullControl", function()
  ProbablyEngine.module.player.control = HasFullControl() == 1
end, 100)

ProbablyEngine.timer.register("test", function()
  CastSpellByName("Cobra Shot")
end, 3000)