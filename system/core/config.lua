-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.config = {
  data = { }
}

ProbablyEngine.config.read = function(key, default)
  ProbablyEngine.debug("Reading Config Key: " .. tostring(key), 5)
  if ProbablyEngine.config.data[tostring(key)] then
    return ProbablyEngine.config.data[tostring(key)]
  elseif default then
    ProbablyEngine.config.data[tostring(key)] = default
    return ProbablyEngine.config.data[tostring(key)]
  end
  return
end

ProbablyEngine.config.write = function(key, value)
  ProbablyEngine.debug("Writing Config Key: " .. key, 5)
  ProbablyEngine.config.data[tostring(key)] = value
end

ProbablyEngine.config.load = function(data)
  ProbablyEngine.debug("Config Data Loaded", 5)
  ProbablyEngine.config.data = data
end

ProbablyEngine.config.toggle = function(key)
  if ProbablyEngine.config.data[tostring(key)] then
    ProbablyEngine.config.data[tostring(key)] = not ProbablyEngine.config.data[tostring(key)]
    return ProbablyEngine.config.data[tostring(key)]
  else
    ProbablyEngine.config.data[tostring(key)] = true
  end
end