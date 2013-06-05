-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.parser = { }

local function castable(spell, unit)

  return true
end

ProbablyEngine.parser.table = function(spellTable)

  for _, arguments in pairs(spellTable) do

    local eventType = type(arguments[1])
    local spell = arguments[1]
    local evaluation = arguments[2]
    local target = arguments[3]

    if eventType == "table" then
      ProbablyEngine.debug("Table Parse: Table")
    end

    if evaluation == nil then
      evaluation = true
    end

    if target == nil then
      target = "target"
    end

    if castable(spell, target) and evaluation then
      ProbablyEngine.debug("Table Parse: Cast Spell - " .. spell)
      return spell, target
    end

  end

  spellTable = nil

end
