-- Shaman Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.SHAMAN = function()
    local settings = Config:GetClassSettings()
    
    -- Use Stormstrike if available (Enhancement talent)
    if Engine:TryCastSpell("Stormstrike") then
        return
    end
    
    -- Maintain Flame Shock DoT
    if settings.useShocks then
        local hasFlameShock, flameTime = Engine:HasDebuff("Flame Shock")
        if not hasFlameShock or flameTime < 3 then
            if Engine:TryCastSpell("Flame Shock") then
                return
            end
        end
    end
    
    -- Use shock based on priority
    if settings.useShocks then
        local shockSpell = settings.shockPriority .. " Shock"
        if Engine:TryCastSpell(shockSpell) then
            return
        end
    end
    
    -- Lightning Bolt as filler
    if Engine:TryCastSpell("Lightning Bolt") then
        return
    end
    
    -- Earth Shock as fallback
    if Engine:TryCastSpell("Earth Shock") then
        return
    end
end
