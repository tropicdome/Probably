-- Discipline Priest Rotation
-- Probably v0.0.1

local rotation = {

  {"Power Word: Shield",
    without.buff("Power Word: Shild"),
    without.debuff("Weakened Soul")
  },

  {"Flash Heal"
    when.health < 30
  },

  {"Archangle",
    with.buff("Evangelism") > 5
  }

  { "Alter Time",
    with.cooldowns,
    with.buff("Fingers of Frost") >= 1,
    with.buff("Brain Freeze"),
    without.buff("Alter time")
  },

  { "Nether Tempest"
    {
      without.debuff("Nether Tempest")
    },
    {
      target.debuffDuration("Nether Tempest") <= 2
    }
  }

}