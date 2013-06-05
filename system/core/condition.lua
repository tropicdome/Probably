-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.condition = {

}

ProbablyEngine.condition.register = function(group, name, evaluation)
  ProbablyEngine.condition[group][name] = evaluation
end

ProbablyEngine.condition.unregister = function(group, name)
  ProbablyEngine.condition[group][name] = nil
end

ProbablyEngine.condition.register_group = function(group)
  ProbablyEngine.condition[group] = { }
end

ProbablyEngine.condition.unregister_group = function(group)
  ProbablyEngine.condition[group] = nil
end

pec = ProbablyEngine.condition