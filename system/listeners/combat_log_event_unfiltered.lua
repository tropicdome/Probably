-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

-- lower table lookups since this happens A LOT
local flags = COMBATLOG_OBJECT_REACTION_HOSTILE
local pemw = ProbablyEngine.module.world
local band = bit.band

ProbablyEngine.listener.register("COMBAT_LOG_EVENT_UNFILTERED", function(...)

  local death, eventType, _, sourceGUID, sourceName, sourceFlags, _, destGUID, destName, destFlags, _ = ...

  -- Build a combat table
  if pemw.is_friendly(sourceGUID, destGUID) then

    -- Source was hostile, or we got attacked first
    if band(sourceFlags, flags) > 0 then
      if eventType == 'PARTY_KILL' or eventType == 'UNIT_DIED' then
        pemw.remove_enemy(sourceGUID, death)
      else
        pemw.add_enemy(sourceGUID, sourceName)
      end
    end

    -- Destination was hostile, or we attacked first
    if band(destFlags, flags) > 0 then
      if eventType == 'PARTY_KILL' or eventType == 'UNIT_DIED' then
        pemw.remove_enemy(destGUID, death)
      else
        pemw.add_enemy(destGUID, destName)
      end
    end

  end

end)