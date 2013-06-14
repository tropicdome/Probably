-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2012

ProbablyEngine.module.register("world", {
  current = 0,
  expire = 15,
  friendly = { },
  enemy = { },
  dead = { }
})

local pemw = ProbablyEngine.module.world

pemw.build_friendly = function()
  if GetNumGroupMembers() ~= 0 then
    for i = 1, GetNumGroupMembers() do
      local name = GetRaidRosterInfo(i)
      local guid = UnitGUID(name)
      pemw.add_friendly(guid, name)
    end
  end
end

pemw.rebuild_friendly = function()
  pemw.friendly = { }
  if GetNumGroupMembers() ~= 0 then
    for i = 1, GetNumGroupMembers() do
      local name = GetRaidRosterInfo(i)
      local guid = UnitGUID(name)
      pemw.add_friendly(guid, name)
    end
  end
end

pemw.add_enemy = function(guid, name)
  if not pemw.enemy[guid] and not pemw.dead[guid] then
    ProbablyEngine.debug("Added " .. guid .. " ( "..name.." ) to combat table.", 2)
    pemw.enemy[guid] = name
    pemw.current = pemw.current + 1
  end
end

pemw.remove_enemy = function(guid, death)
  if pemw.enemy[guid] then
    ProbablyEngine.debug("Removed " .. guid .. " ( "..pemw.enemy[guid].." ) from combat table.", 2)
    pemw.dead[guid] = death
    pemw.current = pemw.current - 1
    pemw.enemy[guid] = nil
  end
end

pemw.add_friendly = function(guid, name)
  if not pemw.friendly[guid] and not pemw.friendly[guid] then
    ProbablyEngine.debug("Added " .. guid .. " ( "..name.." ) to party table.", 2)
    pemw.friendly[guid] = name
  end
end

pemw.remove_friendly = function(guid)
  if pemw.friendly[guid] then
    ProbablyEngine.debug("Removed " .. guid .. " ( "..pemw.friendly[guid].." ) from party table.", 2)
    pemw.friendly[guid] = nil
  end
end

pemw.friendly = function(source, dest)
  if pemw.friendly[source] or pemw.friendly[dest] then
    return true
  end
  return false
end

pemw.clean_tables = function(source, dest)
  local now = time()
  for guid, death in pairs(pemw.dead) do
    if now >= (death + pemw.expire) then
      ProbablyEngine.debug("Removed " .. guid .. " from death table.", 2)
      pemw.dead[guid] = nil
    end
  end
end

