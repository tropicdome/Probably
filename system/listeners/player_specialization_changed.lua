-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

-- This shit fires all the time... wtf blizz, don't be stupid.
ProbablyEngine.listener.register("PLAYER_SPECIALIZATION_CHANGED", function(...)
  local unitID = ...
  if unitID == "player" then
    if GetSpecialization() then
      local id, name, description, icon, background, role = GetSpecializationInfo(GetSpecialization())
      if id ~= ProbablyEngine.module.player.specId then
        ProbablyEngine.buttons.icon('MasterToggle', icon)
        ProbablyEngine.module.player.specId = id
        ProbablyEngine.module.player.specName = name
        ProbablyEngine.rotation.activeRotation = ProbablyEngine.rotation.rotations[ProbablyEngine.module.player.specId]
        if ProbablyEngine.rotation.oocrotations[ProbablyEngine.module.player.specId] then
          ProbablyEngine.rotation.activeOOCRotation = ProbablyEngine.rotation.oocrotations[ProbablyEngine.module.player.specId]
        else
          ProbablyEngine.rotation.activeOOCRotation = false
        end
        ProbablyEngine.print(ProbablyEngine.rotation.specId[id] .. " rotation loaded!")
      end
    else
      ProbablyEngine.module.player.specId = false
    end
  end
end)
