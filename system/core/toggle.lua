-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.toggle = {
  states = { }
}

ProbablyEngine.toggle.create = function(toggle_name, icon, tooltip)
  ProbablyEngine.toggle.states[toggle_name] = false
  local toggleCallback = function(self)
    ProbablyEngine.toggle.states[toggle_name] = not ProbablyEngine.toggle.states[toggle_name]
    self.checked = not self.checked
    self:SetChecked(self.checked)
  end
  ProbablyEngine.buttons.create(toggle_name, icon, toggleCallback, tooltip)
end
