-- Paladin Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.PALADIN = function()
    local settings = Config:GetClassSettings()
    local targetHP = Engine:GetTargetHealthPercent()
    
    -- Maintain Blessing
    if settings.maintainBlessings then
        local hasBuff = Engine:HasBuff("Blessing of Might")
        if not hasBuff then
            if Engine:TryCastSpell("Blessing of Might", true) then
                return
            end
        end
    end
    
    -- Maintain Seal
    if settings.maintainSeal then
        local sealName = "Seal of " .. settings.preferredSeal
        local hasSeal = Engine:HasBuff(sealName)
        if not hasSeal then
            if Engine:TryCastSpell(sealName, true) then
                return
            end
        end
    end
    
    -- Use Hammer of Wrath on low health targets
    if targetHP < 20 then
        if Engine:TryCastSpell("Hammer of Wrath") then
            return
        end
    end
    
    -- Use Judgement
    if settings.useJudgement then
        if Engine:TryCastSpell("Judgement") then
            return
        end
    end
    
    -- Crusader Strike
    if Engine:TryCastSpell("Crusader Strike") then
        return
    end
end
