-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.debug = function(message, level)
  if level == nil then level = 0 end
  if ProbablyEngine.debugLevel >= level then
    print("|cFFff8000[Debug]|r " .. message)
  end
end

ProbablyEngine.print = function(message)
  local icon = "swords.tga"
  if IsMacClient() then
    icon = "pg.tga"
  else
    icon = "sb.tga"
  end
  print("|TInterface\\Addons\\Probably\\system\\media\\"..icon..":16:16|t|cFF"..ProbablyEngine.addonColor.."["..ProbablyEngine.addonName.."] " .. message .. "|r")
end

ProbablyEngine.dump = function(object) -- protected
  print(object)
  ProbablyEngine.have_full = true
end

ProbablyEngine.full_check = function() -- protected
  if ProbablyEngine.full == true then return end
  RunMacroText("/run ProbablyEngine_full_check_bool = true")
  if ProbablyEngine_full_check_bool == true then
    ProbablyEngine.full = true
    ProbablyEngine_full_check_bool = nil
    ProbablyEngine.print("full functionality enabled, we are good to go.")
  end
end