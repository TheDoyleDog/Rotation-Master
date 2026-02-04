-- Warlock Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.WARLOCK = function()
    local settings = Config:GetClassSettings()
    local manaPercent = Engine:GetPowerPercent()
    local healthPercent = (UnitHealth("player") / UnitHealthMax("player")) * 100
    
    -- Life Tap management
    if settings.useLifeTap and manaPercent < settings.lifeTapThreshold then
        if healthPercent > settings.healthThresholdForLifeTap then
            if Engine:TryCastSpell("Life Tap", true) then
                return
            end
        end
    end
    
    -- Apply preferred curse
    local curseSpell = "Curse of " .. settings.preferredCurse
    local hasCurse, curseTime = Engine:HasDebuff(curseSpell)
    if not hasCurse or curseTime < 3 then
        if Engine:TryCastSpell(curseSpell) then
            return
        end
    end
    
    -- Maintain Corruption
    if settings.maintainCorruption then
        local hasCorruption, corruptionTime = Engine:HasDebuff("Corruption")
        if not hasCorruption or corruptionTime < 3 then
            if Engine:TryCastSpell("Corruption") then
                return
            end
        end
    end
    
    -- Maintain Immolate
    if settings.maintainImmolate then
        local hasImmolate, immolateTime = Engine:HasDebuff("Immolate")
        if not hasImmolate or immolateTime < 3 then
            if Engine:TryCastSpell("Immolate") then
                return
            end
        end
    end
    
    -- Siphon Life (talent)
    local hasSiphon, siphonTime = Engine:HasDebuff("Siphon Life")
    if not hasSiphon or siphonTime < 3 then
        if Engine:TryCastSpell("Siphon Life") then
            return
        end
    end
    
    -- Shadow Bolt as filler
    if Engine:TryCastSpell("Shadow Bolt") then
        return
    end
end
