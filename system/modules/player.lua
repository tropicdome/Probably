-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.module.register("player", {
  cast_cache = { }
})

ProbablyEngine.module.player.cast = function(spell)
  table.insert(ProbablyEngine.module.player.cast_cache, 1, spell)
  if #ProbablyEngine.module.player.cast_cache > 10 then
    table.remove(ProbablyEngine.module.player.cast_cache)
  end
end

ProbablyEngine.module.player.casted = function(query)
  local count = 0
  for _,spell in ipairs(ProbablyEngine.module.player.cast_cache) do
    if spell == query then
        count = count + 1
    else
      return count
    end
  end
end