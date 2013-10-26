-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.module.register("tooltip", {
  -- make sure it has a name
  pattern = { },
  pattern.purge = {
      "alter time", "ancient hysteria", "bloodlust", "divine favor", "divine insight",
      "divine plea", "dominate mind", "fear ward", "ghost wolf", "hand of freedom",
      "hand of protection", "hand of purity", "hand of sacrifice", "heroism",
      "ice barrier", "ice floes", "ice ward", "incanter's ward", "innervate",
      "levitate", "power infusion", "power word: shield", "speed of light",
      "slow fall", "temporal shield", "time warp"
  }
  pattern.status = {}
  pattern.status.charm = {
      "^charmed"
  }
  pattern.status.disarm = {
      "disarmed"
  }
  pattern.status.disorient = {
      "^disoriented"
  }
  pattern.status.dot = {
      "damage every.*sec", "damage per.*sec"
  }
  pattern.status.fear = {
      "^horrified", "^fleeing", "^feared", "^intimidated", "^cowering in fear",
      "^running in fear", "^compelled to flee"
  }
  pattern.status.incapacitate = {
      "^incapacitated", "^sapped"
  }
  pattern.status.misc = {
      "unable to act", "^bound", "^frozen.$", "^cannot attack or cast spells",
      "^shackled.$"
  }
  pattern.status.root = {
      "^rooted", "^immobil", "^webbed", "frozen in place", "^paralyzed",
      "^locked in place", "^pinned in place"
  }
  pattern.status.silence = {
      "^silenced"
  }
  pattern.status.sleep = {
      "^asleep"
  }
  pattern.status.snare = {
      "^movement.*slowed", "movement speed reduced", "^slowed by", "^dazed",
      "^reduces movement speed"
  }
  pattern.status.stun = {
      "^stunned", "^webbed"
  }
  pattern.immune = {}
  pattern.immune.all = {
      "dematerialize", "deterrence", "divine shield", "ice block"
  }
  pattern.immune.charm = {
      "bladestorm", "desecrated ground", "grounding totem effect", "lichborne"
  }
  pattern.immune.disorient = {
      "bladestorm", "desecrated ground"
  }
  pattern.immune.fear = {
      "berserker rage", "bladestorm", "desecrated ground", "grounding totem effect",
      "lichborne", "nimble brew"
  }
  pattern.immune.incapacitate = {
      "bladestorm", "desecrated ground"
  }
  pattern.immune.melee = {
      "dispersion", "evasion", "hand of protection", "ring of peace", "touch of karma"
  }
  pattern.immune.misc = {
      "bladestorm", "desecrated ground"
  }
  pattern.immune.silence = {
      "devotion aura", "inner focus", "unending resolve"
  }
  pattern.immune.sleep = {
      "bladestorm", "desecrated ground", "lichborne"
  }
  pattern.immune.snare = {
      "bestial wrath", "bladestorm", "death's advance", "desecrated ground",
      "dispersion", "hand of freedom", "master'scall", "windwalk totem"
  }
  pattern.immune.spell = {
      "anti-magic shell", "cloak of shadows", "diffuse magic", "dispersion",
      "mass spell reflection", "ring ofpeace", "spell reflection", "touch of karma"
  }
  pattern.immune.stun = {
      "bestialwrath", "bladestorm", "desecrated ground", "icebound fortitude",
      "grounding totem effect", "nimble brew"
  }
})

ProbablyEngine.module.tooltip.parseBuffs = function(pattern)
  local f = CreateFrame('GameTooltip', 'MyTooltip', UIParent, 'GameTooltipTemplate')
  for i=1,40 do
    f:SetOwner(UIParent, 'ANCHOR_NONE')
    f:SetUnitBuff('player', i)
    local text = MyTooltipTextLeft2:GetText()
    if string.find(text, pattern) then
      return true
    end
  end
end

ProbablyEngine.module.tooltip.parseDebuffs = function(pattern)
  local f = CreateFrame('GameTooltip', 'MyTooltip', UIParent, 'GameTooltipTemplate')
  for i=1,40 do
    f:SetOwner(UIParent, 'ANCHOR_NONE')
    f:SetUnitDebuff('player', i)
    local text = MyTooltipTextLeft2:GetText()
    if string.find(text, pattern) then
      return true
    end
  end
end