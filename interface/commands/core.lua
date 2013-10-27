-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.command.register_handler({'version', 'ver', 'v'}, function()
  ProbablyEngine.command.print('You are running build ' .. ProbablyEngine.version)
end)