-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

-- Sets are a simple storage engine

ProbablyEngine.set = {
    set = { }
}

ProbablyEngine.set.new = function ()
    return ProbablyEngine.set
end

ProbablyEngine.set.add = function (key, value)
    ProbablyEngine.set.set[key] = value
end

ProbablyEngine.set.remove = function (key)
    ProbablyEngine.set.set[key] = nil
end
ProbablyEngine.set.contains = function (key)
    return ProbablyEngine.set.set[key] ~= nil
end


ProbablyEngine.rotations = ProbablyEngine.set.new()