-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.rotation = {

}

ProbablyEngine.rotation.register = function(class, spec, lambda)
  if not ProbablyEngine.rotation[class] then
    ProbablyEngine.rotation[class] = {}
  end
  ProbablyEngine.rotation[class][spec] = lambda
end

ProbablyEngine.rotation.unregister = function(class, spec)
  ProbablyEngine.rotation[class][spec] = nil
end
