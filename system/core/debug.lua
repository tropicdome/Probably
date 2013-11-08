-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.debug = {
  level = {
    value = 0,
  },
  flags = {
    index = 0,
  }
}

ProbablyEngine.debug.flags.add = function(name)
  local bitValue = bit.lshift(1, ProbablyEngine.debug.flags.index)
  ProbablyEngine.debug.flags[name] = bitValue
  ProbablyEngine.debug.flags.index = ProbablyEngine.debug.flags.index + 1
end

ProbablyEngine.debug.flags.add('library')
ProbablyEngine.debug.flags.add('listener')
ProbablyEngine.debug.flags.add('config')
ProbablyEngine.debug.flags.add('dsl_no_exist')
ProbablyEngine.debug.flags.add('dsl_call')
ProbablyEngine.debug.flags.add('dsl_debug')
ProbablyEngine.debug.flags.add('rotation')
ProbablyEngine.debug.flags.add('action_block')
ProbablyEngine.debug.flags.add('queue')
ProbablyEngine.debug.flags.add('dynamic')
ProbablyEngine.debug.flags.add('spell_cast')
ProbablyEngine.debug.flags.add('no_flag')
ProbablyEngine.debug.flags.add('timer')


ProbablyEngine.debug.flag = function(name)
  return ProbablyEngine.debug.flags[name]
end

ProbablyEngine.debug.level.add = function(flag)
  ProbablyEngine.debug.level.value = bit.bor(ProbablyEngine.debug.level.value, ProbablyEngine.debug.flag(flag))
end

ProbablyEngine.debug.level.remove = function(flag)
  ProbablyEngine.debug.level.value = bit.bxor(ProbablyEngine.debug.level.value, ProbablyEngine.debug.flag(flag))
end

-- defaults

ProbablyEngine.debug.level.add('spell_cast')
ProbablyEngine.debug.level.add('dsl_no_exist')

ProbablyEngine.debug.print = function(message, flag)
  if not debugging then return end
  if flag == nil then flag = 'no_flag' end
  local bitFlag = ProbablyEngine.debug.flag(flag)
  if bit.band(bitFlag, ProbablyEngine.debug.level.value) ~= 0 then
    print("|cFFff8000[Debug]|r " .. message)
  end
end


--[[
ProbablyEngine.debug = function(message, level)
  if level == nil then level = 0 end
  if ProbablyEngine.debugLevel >= level then
    print("|cFFff8000[Debug]|r " .. message)
  end
end]]

ProbablyEngine.print = function(message)
  print("|cFF"..ProbablyEngine.addonColor.."["..ProbablyEngine.addonName.."] " .. message .. "|r")
end

ProbablyEngine.dump = function(object) -- protected
  print(object)
  ProbablyEngine.have_full = true
end

ProbablyEngine.full_check = function() -- protected
  if ProbablyEngine.full == true then return end
  --RunMacroText("/run ProbablyEngine_full_check_bool = true")
  if ProbablyEngine_full_check_bool == true then
    ProbablyEngine.full = true
    ProbablyEngine_full_check_bool = nil
    ProbablyEngine.print("full functionality enabled, we are good to go.")
  end
end