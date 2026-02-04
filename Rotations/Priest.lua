-- Priest Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.PRIEST = function()
    local settings = Config:GetClassSettings()
    local manaPercent = Engine:GetPowerPercent()
    
    -- Use wand when OOM
    if settings.useWandWhenOOM and manaPercent < settings.oomThreshold then
        -- Wanding is handled by auto-attack
        return
    end
    
    -- Maintain Shadowform
    if settings.useShadowform then
        local hasBuff = Engine:HasBuff("Shadowform")
        if not hasBuff then
            if Engine:TryCastSpell("Shadowform", true) then
                return
            end
        end
    end
    
    -- Maintain Vampiric Embrace
    if settings.maintainVampiricEmbrace then
        local hasDebuff, timeLeft = Engine:HasDebuff("Vampiric Embrace")
        if not hasDebuff or timeLeft < 5 then
            if Engine:TryCastSpell("Vampiric Embrace") then
                return
            end
        end
    end
    
    -- Maintain Shadow Word: Pain
    if settings.maintainShadowWordPain then
        local hasDebuff, timeLeft = Engine:HasDebuff("Shadow Word: Pain")
        if not hasDebuff or timeLeft < 3 then
            if Engine:TryCastSpell("Shadow Word: Pain") then
                return
            end
        end
    end
    
    -- Mind Flay as filler
    if Engine:TryCastSpell("Mind Flay") then
        return
    end
    
    -- Mind Blast on cooldown
    if Engine:TryCastSpell("Mind Blast") then
        return
    end
    
    -- Smite as fallback (for non-shadow)
    if Engine:TryCastSpell("Smite") then
        return
    end
end
