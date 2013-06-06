-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer.register("rotation", function()
  if ProbablyEngine.module.player.combat then
    local rotation = ProbablyEngine.rotation[ProbablyEngine.module.player.specId]
    local spell, target = ProbablyEngine.parser.table(rotation)
    if spell then
      if target == "ground" then
        SetCVar("deselectOnClick", "0")
        CameraOrSelectOrMoveStart(1) -- this is unlocked
        CameraOrSelectOrMoveStop(1) -- this isn't unlocked
        SetCVar("deselectOnClick", "1")
        CastSpellByName(spell)
      else
        CastSpellByName(spell, target)
      end
    end
  end
end, 250)