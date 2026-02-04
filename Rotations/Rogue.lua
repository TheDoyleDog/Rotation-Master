-- Rogue Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.ROGUE = function()
    local settings = Config:GetClassSettings()
    local comboPoints = Engine:GetComboPoints()
    local energy = UnitMana("player")
    local targetHP = Engine:GetTargetHealthPercent()
    
    -- Determine if we should use finisher
    local useFinisher = false
    if comboPoints >= settings.comboPointsForFinisher then
        useFinisher = true
    elseif comboPoints >= 4 and settings.useFinisherAt4CP and targetHP < 30 then
        useFinisher = true
    end
    
    -- Finisher priority
    if useFinisher then
        -- Maintain Slice and Dice
        if settings.maintainSliceAndDice then
            local hasBuff, timeLeft = Engine:HasBuff("Slice and Dice")
            if not hasBuff or timeLeft < 3 then
                if Engine:TryCastSpell("Slice and Dice") then
                    return
                end
            end
        end
        
        -- Apply Expose Armor if configured
        if settings.useExposeArmor then
            local hasDebuff, timeLeft = Engine:HasDebuff("Expose Armor")
            if not hasDebuff or timeLeft < 5 then
                if Engine:TryCastSpell("Expose Armor") then
                    return
                end
            end
        end
        
        -- Rupture for DoT damage
        local hasRupture, ruptureTime = Engine:HasDebuff("Rupture")
        if not hasRupture or ruptureTime < 3 then
            if Engine:TryCastSpell("Rupture") then
                return
            end
        end
        
        -- Eviscerate as default finisher
        if Engine:TryCastSpell("Eviscerate") then
            return
        end
    end
    
    -- Combo point builders
    -- Hemorrhage (talent) has priority
    if Engine:TryCastSpell("Hemorrhage") then
        return
    end
    
    -- Backstab from behind
    if Engine:TryCastSpell("Backstab") then
        return
    end
    
    -- Sinister Strike as fallback
    if Engine:TryCastSpell("Sinister Strike") then
        return
    end
end
