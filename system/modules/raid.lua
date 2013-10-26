-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.raid = {
  roster = { },
  roster_fast = { }
}


ProbablyEngine.raid.acquireTank = function()
  if UnitExists('focus') then
    return 'focus'
  else
    return 'player'
  end
end

ProbablyEngine.raid.rebuild_raid = function()
  if UnitInRaid("player") then
    for i = 1, GetNumGroupMembers() do
      local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(i);
      if online then
        ProbablyEngine.raid.roster['raid' .. i] = UnitHealth('raid' .. i)
      end
    end
  elseif UnitInParty("player") then
    for i = 1, GetNumGroupMembers() do
      local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(i);
      if online then
        ProbablyEngine.raid.roster['party' .. i] = UnitHealth('party' .. i)
      end
    end
  else

  end
  ProbablyEngine.raid.roster['player'] = UnitHealth('player')
end

ProbablyEngine.raid.populate = function()
  if UnitInRaid("player") then
    for i = 1, MAX_RAID_MEMBERS do
      ProbablyEngine.raid.roster['raid' .. i] = false
    end
  elseif UnitInParty("player") then
    for i = 1, MAX_PARTY_MEMBERS do
      ProbablyEngine.raid.roster['party' .. i] = false
    end
  else

  end
  ProbablyEngine.raid.roster['player'] = false
end

ProbablyEngine.raid.lowestHP = function()
  local lowestTarget = false
  local lowestHP = 100
  for target, health in pairs(ProbablyEngine.raid.roster) do
    local max = UnitHealthMax(target)
    local per = math.abs(health/max*100)
    if per < lowestHP and health ~= 0 then
      lowestHP = per
      lowestTarget = target
    end
  end
  if lowestTarget and lowestHP ~= 100 then
    return lowestTarget
  end
  return false
end

ProbablyEngine.raid.lowestHealth = function()
  local lowest = ''
  for name, _ in ipairs(ProbablyEngine.raid.roster_fast) do

  end
end