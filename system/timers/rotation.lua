-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.timer.register("rotation", function()
  if ProbablyEngine.module.player.combat and ProbablyEngine.active then

    local spell, target = ''

    local queue = ProbablyEngine.module.queue.queue
    if queue ~= nil and ProbablyEngine.parser.can_cast(queue) then
      spell = queue
      target = 'target'
      ProbablyEngine.module.queue.queue = nil
    else
      local rotation = ProbablyEngine.rotation[ProbablyEngine.module.player.specId]
      spell, target = ProbablyEngine.parser.table(rotation)
    end

    if spell then

      local name, _, icon, _, _, _, _, _, _ = GetSpellInfo(spell)
      if target ~= "ground" then
        ProbablyEngine.debug("Casting |T"..icon..":10:10|t ".. name .. " on ( " .. UnitName((target or 'target')) .. " )", 2)
      else
        ProbablyEngine.debug("Casting |T"..icon..":10:10|t ".. name .. " on the ground!", 2)
      end

      ProbablyEngine.buttons.icon('MasterToggle', icon)

      if target == "ground" then
        SetCVar("deselectOnClick", "0")
        CameraOrSelectOrMoveStart(1) -- this is unlocked
        CameraOrSelectOrMoveStop(1) -- this isn't unlocked
        SetCVar("deselectOnClick", "1")
        CastSpellByName(name)
      else
        CastSpellByName(name, target)
      end
    end
  end
end, ProbablyEngine.cycleTime)