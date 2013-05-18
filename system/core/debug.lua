-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.debug = function(message)
  print("[Debug] " .. message)
end

ProbablyEngine.dump = function(object) -- protected
  RunMacroText("/dump" .. object)
end