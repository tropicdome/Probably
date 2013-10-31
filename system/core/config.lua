-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.config = {
  data = { }
}

ProbablyEngine.config.read = function(key, default)
  ProbablyEngine.debug("Reading Config Key: " .. key, 5)
  if ProbablyEngine.config.data[key] then
    return ProbablyEngine.config.data[key]
  elseif default then
    ProbablyEngine.config.data[key] = default
    return ProbablyEngine.config.data[key]
  end
  return
end

ProbablyEngine.config.write = function(key, value)
  ProbablyEngine.debug("Writing Config Key: " .. key, 5)
  ProbablyEngine.config.data[key] = value
end

ProbablyEngine.config.load = function(data)
  ProbablyEngine.debug("Config Data Loaded", 5)
  ProbablyEngine.config.data = data
end