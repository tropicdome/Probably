-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.module.register("tooltip", {

})
ProbablyEngine.module.tooltip.patterns = { }
ProbablyEngine.module.tooltip.patterns.purge = {
    "alter time", "ancient hysteria", "bloodlust", "divine favor", "divine insight",
    "divine plea", "dominate mind", "fear ward", "ghost wolf", "hand of freedom",
    "hand of protection", "hand of purity", "hand of sacrifice", "heroism",
    "ice barrier", "ice floes", "ice ward", "incanter's ward", "innervate",
    "levitate", "power infusion", "power word: shield", "speed of light",
    "slow fall", "temporal shield", "time warp"
}
ProbablyEngine.module.tooltip.patterns.status = {}
ProbablyEngine.module.tooltip.patterns.status.charm = {
    "^charmed"
}
ProbablyEngine.module.tooltip.patterns.status.disarm = {
    "disarmed"
}
ProbablyEngine.module.tooltip.patterns.status.disorient = {
    "^disoriented"
}
ProbablyEngine.module.tooltip.patterns.status.dot = {
    "damage every.*sec", "damage per.*sec"
}
ProbablyEngine.module.tooltip.patterns.status.fear = {
    "^horrified", "^fleeing", "^feared", "^intimidated", "^cowering in fear",
    "^running in fear", "^compelled to flee"
}
ProbablyEngine.module.tooltip.patterns.status.incapacitate = {
    "^incapacitated", "^sapped"
}
ProbablyEngine.module.tooltip.patterns.status.misc = {
    "unable to act", "^bound", "^frozen.$", "^cannot attack or cast spells",
    "^shackled.$"
}
ProbablyEngine.module.tooltip.patterns.status.root = {
    "^rooted", "^immobil", "^webbed", "frozen in place", "^paralyzed",
    "^locked in place", "^pinned in place"
}
ProbablyEngine.module.tooltip.patterns.status.silence = {
    "^silenced"
}
ProbablyEngine.module.tooltip.patterns.status.sleep = {
    "^asleep"
}
ProbablyEngine.module.tooltip.patterns.status.snare = {
    "^movement.*slowed", "movement speed reduced", "^slowed by", "^dazed",
    "^reduces movement speed"
}
ProbablyEngine.module.tooltip.patterns.status.stun = {
    "^stunned", "^webbed"
}
ProbablyEngine.module.tooltip.patterns.immune = {}
ProbablyEngine.module.tooltip.patterns.immune.all = {
    "dematerialize", "deterrence", "divine shield", "ice block"
}
ProbablyEngine.module.tooltip.patterns.immune.charm = {
    "bladestorm", "desecrated ground", "grounding totem effect", "lichborne"
}
ProbablyEngine.module.tooltip.patterns.immune.disorient = {
    "bladestorm", "desecrated ground"
}
ProbablyEngine.module.tooltip.patterns.immune.fear = {
    "berserker rage", "bladestorm", "desecrated ground", "grounding totem effect",
    "lichborne", "nimble brew"
}
ProbablyEngine.module.tooltip.patterns.immune.incapacitate = {
    "bladestorm", "desecrated ground"
}
ProbablyEngine.module.tooltip.patterns.immune.melee = {
    "dispersion", "evasion", "hand of protection", "ring of peace", "touch of karma"
}
ProbablyEngine.module.tooltip.patterns.immune.misc = {
    "bladestorm", "desecrated ground"
}
ProbablyEngine.module.tooltip.patterns.immune.silence = {
    "devotion aura", "inner focus", "unending resolve"
}
ProbablyEngine.module.tooltip.patterns.immune.sleep = {
    "bladestorm", "desecrated ground", "lichborne"
}
ProbablyEngine.module.tooltip.patterns.immune.snare = {
    "bestial wrath", "bladestorm", "death's advance", "desecrated ground",
    "dispersion", "hand of freedom", "master'scall", "windwalk totem"
}
ProbablyEngine.module.tooltip.patterns.immune.spell = {
    "anti-magic shell", "cloak of shadows", "diffuse magic", "dispersion",
    "mass spell reflection", "ring ofpeace", "spell reflection", "touch of karma"
}
ProbablyEngine.module.tooltip.patterns.immune.stun = {
    "bestialwrath", "bladestorm", "desecrated ground", "icebound fortitude",
    "grounding totem effect", "nimble brew"
}

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