-- Hunter Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.HUNTER = function()
    local settings = Config:GetClassSettings()
    
    -- Maintain Aspect
    if settings.maintainAspect then
        local aspectName = "Aspect of the " .. settings.preferredAspect
        local hasAspect = Engine:HasBuff(aspectName)
        if not hasAspect then
            if Engine:TryCastSpell(aspectName, true) then
                return
            end
        end
    end
    
    -- Send pet to attack
    if settings.petAssist and UnitExists("pet") and not UnitIsDeadOrGhost("pet") then
        -- Pet attack is handled by default pet behavior
    end
    
    -- Maintain Serpent Sting
    if settings.maintainSerpentSting then
        local hasDebuff, timeLeft = Engine:HasDebuff("Serpent Sting")
        if not hasDebuff or timeLeft < 3 then
            if Engine:TryCastSpell("Serpent Sting") then
                return
            end
        end
    end
    
    -- Use Aimed Shot (talent)
    if Engine:TryCastSpell("Aimed Shot") then
        return
    end
    
    -- Multi-Shot for AoE
    if Engine:TryCastSpell("Multi-Shot") then
        return
    end
    
    -- Arcane Shot
    if Engine:TryCastSpell("Arcane Shot") then
        return
    end
    
    -- Auto Shot is automatic
end
