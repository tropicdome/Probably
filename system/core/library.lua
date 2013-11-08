-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.


-- User loaded library ? yes please!
ProbablyEngine.library = {
  libs = { }
}

ProbablyEngine.library.register = function(name, lib)
  if ProbablyEngine.library.libs[name] then
    ProbablyEngine.debug.print("Cannot overwrite library:" .. name, 'library')
    return false
  end
  ProbablyEngine.library.libs[name] = lib
end

ProbablyEngine.library.fetch = function(name)
  return ProbablyEngine.library.libs[name]
end

ProbablyEngine.library.parse = function(event, evaluation, target)
  if target == nil then target = "target" end
  local call = string.sub(evaluation, 2)
  local func
  -- this will work most of the time... I hope :)
  if string.sub(evaluation, -1) == ')' then
    -- the user calls the function for us
    func = loadstring('local target = "'..target..'";return ProbablyEngine.library.libs.' .. call .. '')
  else
    -- we need to call the function
    func = loadstring('local target = "'..target..'";return ProbablyEngine.library.libs.' .. call .. '(target)')
  end
  local eval = func(target, event)
  return eval
end