-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.timer.register("rotation", function()

  local cycle =
    IsMounted() ~= 1
    and ProbablyEngine.module.player.combat
    and ProbablyEngine.active
    and ProbablyEngine.module.player.specId

  if cycle then

    local spell, target = ''

    local queue = ProbablyEngine.module.queue.queue
    local macro_queue = ProbablyEngine.module.queue.macro_queue
    if queue ~= nil and ProbablyEngine.parser.can_cast(queue) then
      spell = queue
      target = 'target'
      ProbablyEngine.module.queue.queue = nil
    elseif macro_queue ~= nil then
      RunMacro(macro_queue)
      ProbablyEngine.module.queue.macro_queue = nil
      return
    else
      spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeRotation)
    end

    if spell then

      local name, _, icon, _, _, _, _, _, _ = ProbablyEngine.gsi.call(spell)
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