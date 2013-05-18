-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.listener = {}

-- create the frame to register listeners
ProbablyEngine.listener.listenerFrame = CreateFrame("FRAME")

ProbablyEngine.listener.eventActions = { }

-- abstract method to register listeners
ProbablyEngine.listener.register = function(event, action)
  ProbablyEngine.debug("Event Register: " .. event)
  ProbablyEngine.listener.listenerFrame:RegisterEvent(event)
  ProbablyEngine.listener.eventActions[event] = action
end

-- listen and fire events
ProbablyEngine.listener.handle = function (self, event, ...)
  ProbablyEngine.debug("Event Fire: " .. event)
  if ProbablyEngine.listener.eventActions[event] ~= nil then
    local action = ProbablyEngine.listener.eventActions[event]
    action(...)
  end
end

-- register our listener
ProbablyEngine.listener.listenerFrame:SetScript("OnEvent", ProbablyEngine.listener.handle)
