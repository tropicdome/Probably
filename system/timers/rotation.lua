-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.cycle = function(skip_verify)

  local cycle =
    IsMounted() ~= 1
    and ProbablyEngine.module.player.combat
    and ProbablyEngine.active
    and ProbablyEngine.module.player.specId

  if cycle or skip_verify then

    local spell, target = ''

    --[[ Disabled for now...
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
    end]]--

    spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeRotation)

    if spell then

      local name, _, icon, _, _, _, _, _, _ = ProbablyEngine.gsi.call(spell)

      if target ~= "ground" then
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on ( " .. UnitName((target or 'target')) .. " )", 'spell_cast')
      else
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on the ground!", 'spell_cast')
      end

      ProbablyEngine.buttons.icon('MasterToggle', icon)

      if target == "ground" then
        SetCVar("deselectOnClick", "0")
        CameraOrSelectOrMoveStart(1) -- this is unlocked
        CameraOrSelectOrMoveStop(1) -- this isn't unlocked
        SetCVar("deselectOnClick", "1")
        CastSpellByName(name)
        if icon then
          table.insert(ProbablyEngine.actionLog.log, 1, {
            event = 'Ground Cast',
            description = '|T' .. icon .. ':-1:-1:0:0|t '..spell..'',
            time = date("%H:%M:%S")
          })
        end
      else
        CastSpellByName(name, target)
        if icon then
          table.insert(ProbablyEngine.actionLog.log, 1, {
            event = 'Spell Cast',
            description = '|T' .. icon .. ':-1:-1:0:0|t ' .. spell..'',
            time = date("%H:%M:%S")
          })
        end
      end

    end
  end

end

ProbablyEngine.timer.register("rotation", function()
    ProbablyEngine.cycle()
end, ProbablyEngine.cycleTime)

ProbablyEngine.timer.register("oocrotation", function()
  local cycle =
    IsMounted() ~= 1
    and ProbablyEngine.module.player.combat ~= true
    and ProbablyEngine.active == true
    and ProbablyEngine.module.player.specId ~= 0
    and ProbablyEngine.rotation.activeOOCRotation ~= false

  if cycle then
    local spell, target = ''
    spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeOOCRotation, 'player')
    if target == nil then target = 'player' end
    if spell then
      local name, _, icon, _, _, _, _, _, _ = ProbablyEngine.gsi.call(spell)
      if target ~= "ground" then
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on ( " .. UnitName((target or 'target')) .. " )", 'spell_cast')
      end
      ProbablyEngine.buttons.icon('MasterToggle', icon)
      if target == "ground" then
        ProbablEngine.print('Ground targeted spells are unsupported in OOC rotations.')
      else
        CastSpellByName(name, target)
      end
      if icon then
        table.insert(ProbablyEngine.actionLog.log, 1, {
          event = 'Spell Cast Succeed',
          description = '|T' .. icon .. ':-1:-1:0:0|t '..spell..'',
          time = date("%H:%M:%S")
        })
      end
    end
  end
end, 500)