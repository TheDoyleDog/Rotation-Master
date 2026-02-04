-- Druid Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.DRUID = function()
    local settings = Config:GetClassSettings()
    local comboPoints = Engine:GetComboPoints()
    
    -- Check current form
    local _, _, active = GetShapeshiftFormInfo(1) -- Cat Form
    local inCatForm = active
    
    _, _, active = GetShapeshiftFormInfo(2) -- Bear Form
    local inBearForm = active
    
    -- Cat Form rotation
    if inCatForm or settings.preferredForm == "Cat" then
        -- Finishers at 5 combo points
        if comboPoints >= settings.comboPointsForFinisher then
            -- Maintain Rip
            local hasRip, ripTime = Engine:HasDebuff("Rip")
            if not hasRip or ripTime < 3 then
                if Engine:TryCastSpell("Rip") then
                    return
                end
            end
            
            -- Ferocious Bite as damage finisher
            if Engine:TryCastSpell("Ferocious Bite") then
                return
            end
        end
        
        -- Maintain Rake DoT
        if settings.maintainRake then
            local hasRake, rakeTime = Engine:HasDebuff("Rake")
            if not hasRake or rakeTime < 3 then
                if Engine:TryCastSpell("Rake") then
                    return
                end
            end
        end
        
        -- Claw as combo point builder
        if Engine:TryCastSpell("Claw") then
            return
        end
        
    -- Bear Form rotation
    elseif inBearForm or settings.preferredForm == "Bear" then
        -- Maintain Faerie Fire
        if settings.maintainFaerieFire then
            local hasDebuff, timeLeft = Engine:HasDebuff("Faerie Fire")
            if not hasDebuff or timeLeft < 5 then
                if Engine:TryCastSpell("Faerie Fire (Feral)") then
                    return
                end
            end
        end
        
        -- Swipe for AoE
        if Engine:TryCastSpell("Swipe") then
            return
        end
        
        -- Maul as main attack
        if Engine:TryCastSpell("Maul") then
            return
        end
        
    -- Caster form (Balance)
    else
        -- Maintain Moonfire
        if settings.maintainMoonfire then
            local hasDebuff, timeLeft = Engine:HasDebuff("Moonfire")
            if not hasDebuff or timeLeft < 3 then
                if Engine:TryCastSpell("Moonfire") then
                    return
                end
            end
        end
        
        -- Starfire as main nuke
        if Engine:TryCastSpell("Starfire") then
            return
        end
        
        -- Wrath as faster cast
        if Engine:TryCastSpell("Wrath") then
            return
        end
    end
end
