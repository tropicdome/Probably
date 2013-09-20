-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2012

ProbablyEngine.module.register("world", {
  current = 0,
  expire = 15,
  friendly = { },
  enemy = { },
  dead = { },
  named = { }
})



ProbablyEngine.module.world.print = function()
  ProbablyEngine.module.world.named =  { }
  for i,v in pairs(ProbablyEngine.module.world.enemy) do
      if ProbablyEngine.module.world.named[v] then
        ProbablyEngine.module.world.named[v] = ProbablyEngine.module.world.named[v] + 1
      else
        ProbablyEngine.module.world.named[v] = 1
      end
  end
  for i,v in pairs(ProbablyEngine.module.world.named) do
    print(i, v)
  end
end

ProbablyEngine.module.world.build_friendly = function()
  if GetNumGroupMembers() ~= 0 then
    for i = 1, GetNumGroupMembers() do
      local name = GetRaidRosterInfo(i)
      local guid = UnitGUID(name)
      ProbablyEngine.module.world.add_friendly(guid, name)
    end
  end
end

ProbablyEngine.module.world.rebuild_friendly = function()
  ProbablyEngine.module.world.friendly = { }
  if GetNumGroupMembers() ~= 0 then
    for i = 1, GetNumGroupMembers() do
      local name = GetRaidRosterInfo(i)
      if guid then
        local guid = UnitGUID(name)
        ProbablyEngine.module.world.add_friendly(guid, name)
      end
    end
  end
end



ProbablyEngine.module.world.update_ui = function()
  if PE_Buttons_multitargetCount then
    PE_Buttons_multitargetCount:SetText(ProbablyEngine.module.world.current)
  end
end

ProbablyEngine.module.world.add_enemy = function(guid, name)
  if not ProbablyEngine.module.world.enemy[guid] and not ProbablyEngine.module.world.dead[guid] then
    --ProbablyEngine.debug("Added " .. guid .. " ( "..name.." ) to combat table.", 3)
    ProbablyEngine.module.world.enemy[guid] = name or 'Unknown'
    ProbablyEngine.module.world.current = ProbablyEngine.module.world.current + 1
    ProbablyEngine.module.world.update_ui()
  end
end

ProbablyEngine.module.world.remove_enemy = function(guid, death)
  if ProbablyEngine.module.world.enemy[guid] then
    --ProbablyEngine.debug("Removed " .. guid .. " ( "..ProbablyEngine.module.world.enemy[guid].." ) from combat table.", 2)
    ProbablyEngine.module.world.dead[guid] = death
    ProbablyEngine.module.world.current = ProbablyEngine.module.world.current - 1
    ProbablyEngine.module.world.enemy[guid] = nil
    ProbablyEngine.module.world.update_ui()
  end
end

ProbablyEngine.module.world.add_friendly = function(guid, name)
  if not ProbablyEngine.module.world.friendly[guid] and not ProbablyEngine.module.world.friendly[guid] then
    --ProbablyEngine.debug("Added " .. guid .. " ( "..name.." ) to party table.", 3)
    ProbablyEngine.module.world.friendly[guid] = name or 'Unknown'
  end
end

ProbablyEngine.module.world.remove_friendly = function(guid)
  if ProbablyEngine.module.world.friendly[guid] then
    --ProbablyEngine.debug("Removed " .. guid .. " ( "..ProbablyEngine.module.world.friendly[guid].." ) from party table.", 2)
    ProbablyEngine.module.world.friendly[guid] = nil
  end
end

ProbablyEngine.module.world.is_friendly = function(source, dest)
  if ProbablyEngine.module.world.friendly[source] or ProbablyEngine.module.world.friendly[dest] then
    return true
  end
  return false
end

ProbablyEngine.module.world.clean_tables = function(source, dest)
  local now = time()
  for guid, death in pairs(ProbablyEngine.module.world.dead) do
    if now >= (death + ProbablyEngine.module.world.expire) then
      --ProbablyEngine.debug("Removed " .. guid .. " from death table.", 3)
      ProbablyEngine.module.world.dead[guid] = nil
      ProbablyEngine.module.world.update_ui()
    end
  end
end

ProbablyEngine.module.world.flush_table = function()
  ProbablyEngine.module.world.enemy = { }
  ProbablyEngine.module.world.current = 0
  ProbablyEngine.module.world.update_ui()
end