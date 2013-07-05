-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.module.register("queue", {
  queue = { }
})

ProbablyEngine.module.queue.add_spell = function(spell_name)
  if ProbablyEngine.module.queue.queue[#ProbablyEngine.module.queue.queue] ~= name then
    table.insert(ProbablyEngine.module.queue.queue, name)
    ProbablyEngine.debug(name, " was queued for casting.", 3)
  end
end

-- This hooks the secure function "UseAction" that is called when we press a button on our
-- action bars.  This allows us to let the engine know we would like to cast a spell other
-- than the one currently active in the rotation.

hooksecurefunc("UseAction", function(...)
  if ProbablyEngine.module.player.combat then
    if select(3, ...) ~= nil then
      local type, id, subType, spellID = GetActionInfo(select(1,...))
      if type == "spell" then
        local name,_,_,_,_,_,_,_,_ = GetSpellInfo(id)
        ProbablyEngine.module.queue.add_spell(name)
      end
    end
  end
end)