-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.spellcache = {
  tmp = { }
}

ProbablyEngine.spellcache.cache = setmetatable( {},
{
  __index = function (table, value)
    local tmp = {GetSpellInfo(value)}
    if GetSpellInfo(value) then
      table[value] = tmp
    end
    return tmp
  end
})

ProbablyEngine.spellcache.gsi = function(spell)
    return unpack(ProbablyEngine.spellcache.cache[spell])
end