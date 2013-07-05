-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.condition = {

}

ProbablyEngine.condition.register = function(name, evaluation)
  ProbablyEngine.condition[name] = evaluation
end

ProbablyEngine.condition.unregister = function(name)
  ProbablyEngine.condition[name] = nil
end
