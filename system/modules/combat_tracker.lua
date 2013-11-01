-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.module.register("combatTracker", {
  current = 0,
  expire = 15,
  friendly = { },
  enemy = { },
  dead = { },
  named = { },
  healthCache = { },
  healthCacheCount = { },
})

ProbablyEngine.module.combatTracker.aquireHealth = function(guid, maxHealth, name)
  if maxHealth then health = UnitHealthMax else health = UnitHealth end
  local inGroup = GetNumGroupMembers()
  if inGroup then
    if IsInRaid("player") then
      for i=1,inGroup do
        if guid == UnitGUID("RAID".. i .. "TARGET") then
          return health("RAID".. i .. "TARGET")
        end
      end
    else
      for i=1,inGroup do
        if guid == UnitGUID("PARTY".. i .. "TARGET") then
          return health("PARTY".. i .. "TARGET")
        end
      end
      if guid == UnitGUID("PLAYERTARGET") then
        return health("PLAYERTARGET")
      end
    end
  else
    print(guid, UnitGUID("PLAYERTARGET"))
    if guid == UnitGUID("PLAYERTARGET") then
      return health("PLAYERTARGET")
    end
    if guid == UnitGUID("MOUSEOVER") then
      return health("MOUSEOVER")
    end
  end
  -- All health checks failed, do we have a cache of this units health ?
  if maxHealth then
    if ProbablyEngine.module.combatTracker.healthCache[name] ~= nil then
      return ProbablyEngine.module.combatTracker.healthCache[name]
    end
  end
  return false
end

ProbablyEngine.module.combatTracker.combatCheck = function()
  local inGroup = GetNumGroupMembers()
  local inCombat = false
  if inGroup then
    if IsInRaid("player") then
      for i = 1, inGroup do
        if UnitAffectingCombat("RAID".. i) then return true end
      end
    else
      for i = 1, inGroup do
        if UnitAffectingCombat("PARTY".. i) then return true end
      end
    end
    if UnitAffectingCombat("PLAYER") then return true end
  else
    if UnitAffectingCombat("PLAYER") then return true end
  end
  return false
end

ProbablyEngine.timer.register("updateCTHealth", function()
  if ProbablyEngine.module.combatTracker.combatCheck() then
    for guid,table in pairs(ProbablyEngine.module.combatTracker.enemy) do
      local health = ProbablyEngine.module.combatTracker.aquireHealth(guid)
      if health then
        -- attempt to aquire max health again
        if ProbablyEngine.module.combatTracker.enemy[guid]['maxHealth'] == false then
          local name = ProbablyEngine.module.combatTracker.enemy[guid]['name']
          ProbablyEngine.module.combatTracker.enemy[guid]['maxHealth'] = ProbablyEngine.module.combatTracker.aquireHealth(guid, true, name)
        end

        ProbablyEngine.module.combatTracker.enemy[guid].health = health
      end
    end
  else
    if #ProbablyEngine.module.combatTracker.enemy >= 1 then
      ProbablyEngine.module.combatTracker.enemy = { }
    end
  end
end, 100)

ProbablyEngine.module.combatTracker.damageUnit = function(guid, damage)
  if damage ~= nil and type(damage) == "number" then
    if ProbablyEngine.module.combatTracker.enemy[guid] and ProbablyEngine.module.combatTracker.enemy[guid]['health'] then
      local newHealth = ProbablyEngine.module.combatTracker.enemy[guid]['health'] - damage
      if newHealth >= 0 then
        ProbablyEngine.module.combatTracker.enemy[guid]['health'] = newHealth
      end
    elseif ProbablyEngine.module.combatTracker.enemy[guid] and ProbablyEngine.module.combatTracker.enemy[guid]['maxHealth'] then
      local newHealth = ProbablyEngine.module.combatTracker.enemy[guid]['maxHealth'] - damage
      if newHealth >= 0 then
        ProbablyEngine.module.combatTracker.enemy[guid]['health'] = newHealth
      end
    end
    if not ProbablyEngine.module.combatTracker.enemy[guid]['time'] then
      ProbablyEngine.module.combatTracker.enemy[guid]['time'] = time()
    end
  end
end

ProbablyEngine.module.combatTracker.insert = function(guid, unitname, timestamp)
  if ProbablyEngine.module.combatTracker.enemy[guid] == nil then

    local maxHealth = ProbablyEngine.module.combatTracker.aquireHealth(guid, true, unitname)
    local health = ProbablyEngine.module.combatTracker.aquireHealth(guid)

    ProbablyEngine.module.combatTracker.enemy[guid] = { }
    ProbablyEngine.module.combatTracker.enemy[guid]['maxHealth'] = maxHealth
    ProbablyEngine.module.combatTracker.enemy[guid]['health'] = health
    ProbablyEngine.module.combatTracker.enemy[guid]['name'] = unitname
    ProbablyEngine.module.combatTracker.enemy[guid]['time'] = false

    if maxHealth then
      -- we got a health value from aquire, store it for later usage
      if ProbablyEngine.module.combatTracker.healthCacheCount[unitname] then
        -- we've alreadt seen this type, average it
        local currentAverage = ProbablyEngine.module.combatTracker.healthCache[unitname]
        local currentCount = ProbablyEngine.module.combatTracker.healthCacheCount[unitname]
        local newAverage = (currentAverage + maxHealth) / 2
        ProbablyEngine.module.combatTracker.healthCache[unitname] = newAverage
        ProbablyEngine.module.combatTracker.healthCacheCount[unitname] = currentCount + 1
      else
        -- this is new to use, save it
        ProbablyEngine.module.combatTracker.healthCache[unitname] = maxHealth
        ProbablyEngine.module.combatTracker.healthCacheCount[unitname] = 1
      end
    end

  end
end

ProbablyEngine.module.combatTracker.cleanCT = function()
  ProbablyEngine.module.combatTracker.enemy = { }
end

ProbablyEngine.module.combatTracker.remove = function(guid)
  ProbablyEngine.module.combatTracker.enemy[guid] = nil
end

ProbablyEngine.module.combatTracker.tagUnit = function(guid, name)
  ProbablyEngine.module.combatTracker.insert(guid, name)
end

ProbablyEngine.module.combatTracker.killUnit = function(guid)
  ProbablyEngine.module.combatTracker.remove(guid, name)
end