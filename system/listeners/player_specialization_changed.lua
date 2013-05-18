-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener.register("PLAYER_SPECIALIZATION_CHANGED", function(...)
  local unitID = ...
  if unitID == "player" then
    local id, name, _, _, _, _ = GetSpecializationInfo(GetSpecialization());
    ProbablyEngine.module.player.specID = id;
    ProbablyEngine.module.player.specName = name;
  end
end)
