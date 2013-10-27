-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.slash = {
  commands = 0,
  handlers = { }
}

ProbablyEngine.slash.print = function(message)
  print("|cFF"..ProbablyEngine.addonColor.."["..ProbablyEngine.addonName.."]|r " .. message .. "")
end

ProbablyEngine.slash.register = function (slash, handler)
  local name = 'PE_' .. slash
  _G["SLASH_" .. name .. "1"] = '/' .. slash
  SlashCmdList[name] = function(message, editbox) handler(message, editbox) end;
end

ProbablyEngine.slash.register('pe', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")
  if ProbablyEngine.slash.handlers[command] then
    ProbablyEngine.slash.handlers[command](text)
  else
    ProbablyEngine.slash.print('Unknown command: ' .. command);
  end
end)

ProbablyEngine.slash.register_handler = function(command, handler)
  local command_type = type(command)
  if command_type == "string" then
    ProbablyEngine.slash.handlers[command] = handler
  elseif command_type == "table" then
    for _,com in pairs(command) do
      ProbablyEngine.slash.handlers[com] = handler
    end
  else
    ProbablyEngine.slash.print('Unknown Command Type: ' .. command_type)
  end
end

ProbablyEngine.slash.register_handler({'version', 'ver', 'v'}, function()
  ProbablyEngine.slash.print('You are running build ' .. ProbablyEngine.version)
end)