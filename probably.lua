-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

-- Huge thanks to the people who run
-- http://wowprogramming.com/
-- The site is amazingly helpful.

-- Lets fire this bitch up
ProbablyEngine = {
  addonName = "Probably",
  version = "0.1",
  addonColor = "e6cc80",
  active = false,
  full = false,
  debug = false,
  debugLevel = 0,
  hardcore_debug = false,
  rotations = { },
  dynamicCycle = false,
  cycleTime = 100,
  lag = 0
}

ProbablyEngine_Data = {
  minimapPos = 45,
  button_shown = true,
  dynamic_cycle = false,
  cycle_time = 100,
  button_states = { },
  config = { },
  style = {
    size = 26,
    padding = 7,
    active = {0.2, 0.7, 0.1, 1},
    inactive = {0, 0, 0, 1}
  }
}
