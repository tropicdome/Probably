-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.condition = {

}

ProbablyEngine.condition.register = function(name, evaluation)
  ProbablyEngine.condition[name] = evaluation
end

ProbablyEngine.condition.unregister = function(name)
  ProbablyEngine.condition[name] = nil
end
