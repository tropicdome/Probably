-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

local GetSpellInfo = GetSpellInfo

ProbablyEngine.gsi = {

}

ProbablyEngine.gsi.cache = setmetatable(
  { },
  {__index = function(t, v)
      local a = { GetSpellInfo(v) }
      if GetSpellInfo(v)
        then t[v] = a
      end
      return a
    end
  }
)

ProbablyEngine.gsi.call = function(a) return unpack(ProbablyEngine.gsi.cache[a]) end