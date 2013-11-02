-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener = {
  handlers = { },
  listeners = { },
}

ProbablyEngine.listener.register = function(...)

  local name = false
  local callback = false

  if select('#', ...) == 3 then
    name, _ = select(1, ...)
    event, _ = select(2, ...)
    callback = select(3, ...)
  else
    name = 'defualt'
    event, _ = select(1, ...)
    callback = select(2, ...)
  end

  ProbablyEngine.debug("Event Registered: " .. event, 4)

  -- is this our first handler ?
  if not ProbablyEngine.listener.handlers[name] then
    ProbablyEngine.listener.handlers[name] = { }
  end

  -- do we have a listender ?
  if not ProbablyEngine.listener.listeners[name] then
    ProbablyEngine.listener.listeners[name] = CreateFrame("Frame", "PE_Events_" .. name, UIParent)
    ProbablyEngine.listener.listeners[name].handlerName = name
    ProbablyEngine.listener.listeners[name].eventHandle = function (self, event, ...)
      local handler = self.handlerName
      local action = false
      if ProbablyEngine.listener.handlers[handler][event] then
        ProbablyEngine.listener.handlers[handler][event](...)
      end
    end
    ProbablyEngine.listener.listeners[name]:SetScript("OnEvent", ProbablyEngine.listener.listeners[name].eventHandle)
  end

  -- assign
  ProbablyEngine.listener.handlers[name][event] = callback
  ProbablyEngine.listener.listeners[name]:RegisterEvent(event)

end

ProbablyEngine.listener.unregister = function(event, arg1, arg2)
  ProbablyEngine.debug("Event Unregistered: " .. event, 4)

  local name = false
  local callback = false

  if type(arg1) == "string" then
    name = arg1
    callback = arg2
  else
    name = 'defualt'
    callback = arg1
  end

  ProbablyEngine.listener.handlers[name][event] = nil
  ProbablyEngine.listener.listeners[name]:UnregisterEvent(event)

end


ProbablyEngine.listener.trigger = function(...)

  local name, event, args, _
  if select('#', ...) >= 3 then
    name, _ = select(1, ...)
    event, _ = select(2, ...)
    args = select(3, ...)
  else
    name = 'defualt'
    event, _ = select(1, ...)
    args = select(2, ...)
  end
  ProbablyEngine.listener.handlers[name][event](args)

end
