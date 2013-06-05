-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer.register("rotation", function()
  if ProbablyEngine.module.player.combat then
    local spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation["paladin"]["protection"])
    if spell then
      CastSpellByName(spell, target)
    end
  end
end, 100)