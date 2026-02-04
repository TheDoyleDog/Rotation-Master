-- Mage Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.MAGE = function()
    local settings = Config:GetClassSettings()
    local manaPercent = Engine:GetPowerPercent()
    
    -- Use wand when OOM
    if settings.useWandWhenOOM and manaPercent < settings.oomThreshold then
        -- Wanding is handled by auto-attack in vanilla
        return
    end
    
    local preferredSchool = settings.preferredSchool
    
    if preferredSchool == "Frost" then
        -- Frost rotation
        if Engine:TryCastSpell("Frostbolt") then
            return
        end
    elseif preferredSchool == "Fire" then
        -- Fire rotation
        -- Use Scorch for stacking debuff
        if Engine:TryCastSpell("Scorch") then
            return
        end
        
        -- Fire Blast as instant cast
        if Engine:TryCastSpell("Fire Blast") then
            return
        end
        
        -- Fireball as main nuke
        if Engine:TryCastSpell("Fireball") then
            return
        end
    elseif preferredSchool == "Arcane" then
        -- Arcane rotation
        if Engine:TryCastSpell("Arcane Missiles") then
            return
        end
        
        -- Fallback to Frostbolt
        if Engine:TryCastSpell("Frostbolt") then
            return
        end
    end
    
    -- Default fallback
    if Engine:TryCastSpell("Frostbolt") then
        return
    end
end
