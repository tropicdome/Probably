-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.module.register("queue", {
  queue = nil,
  macro_queue = nil
})

ProbablyEngine.module.queue.add_spell = function(spell_name)
  if ProbablyEngine.module.queue.queue ~= spell_name then
    ProbablyEngine.module.queue.queue = spell_name
    ProbablyEngine.debug.print(spell_name .. " was queued for casting.", 'queue')
  end
end

ProbablyEngine.module.queue.add_macro = function(macro_id)
  if ProbablyEngine.module.queue.macro_queue ~= macro_id then
    ProbablyEngine.module.queue.macro_queue = macro_id
    ProbablyEngine.debug.print("Macro ID " .. macro_id .. " was queued for casting.", 'queue')
  end
end

-- This hooks the secure function "UseAction" that is called when we press a button on our
-- action bars.  This allows us to let the engine know we would like to cast a spell other
-- than the one currently active in the rotation.

hooksecurefunc("UseAction", function(...)
  if ProbablyEngine.module.player.combat and UnitAffectingCombat("player") then
    if select(3, ...) ~= nil then
      local type, id, subType, spellID = GetActionInfo(select(1,...))
      if type == "spell" then
        local name,_,_,_,_,_,_,_,_ = ProbablyEngine.gsi.call(id)
        if ProbablyEngine.parser.can_cast_queue(name) then
          ProbablyEngine.module.queue.add_spell(name)
        end
      elseif type == "macro" then
        ProbablyEngine.module.queue.add_macro(id)
      end
    end
  end
end)