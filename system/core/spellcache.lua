-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

-- You see this a lot but is is never explained so here we go!

-- Create a meta table to hold a cache of spell info
local spellcache = setmetatable( {},
{
  -- the __index is a magic method that is used as a fallback if the table does not have the
  -- key we asked for, this is the core of how it helps speed up calls to GetSpellInfo
  __index = function (t,v)
    local a = {GetSpellInfo(v)}
    -- we cache the spell call here
    if GetSpellInfo(v) then
      t[v] = a
    end
    return a
  end
})

-- Herer we overwrite the default GetSpellInfo
-- to use our newly created metatable
local function GetSpellInfo(a)
    -- we just unpack the table entry if one exists
    return unpack(spellcache[a])
end