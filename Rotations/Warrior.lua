-- Warrior Rotation

if not RotationMaster.Rotations then
    RotationMaster.Rotations = {}
end

local Engine = RotationMaster.RotationEngine
local Config = RotationMaster.Config

RotationMaster.Rotations.WARRIOR = function()
    local settings = Config:GetClassSettings()
    local targetHP = Engine:GetTargetHealthPercent()
    local rage = UnitMana("player")
    
    -- Execute phase (target below 20% health)
    if settings.useExecute and targetHP < settings.executeThreshold then
        if Engine:TryCastSpell("Execute") then
            return
        end
    end
    
    -- Use Mortal Strike or Bloodthirst if available (talent abilities)
    if settings.useCooldowns then
        if Engine:TryCastSpell("Mortal Strike") then
            return
        end
        
        if Engine:TryCastSpell("Bloodthirst") then
            return
        end
    end
    
    -- Maintain Battle Shout
    if settings.maintainBattleShout then
        local hasBuff, timeLeft = Engine:HasBuff("Battle Shout")
        if not hasBuff or timeLeft < 10 then
            if Engine:TryCastSpell("Battle Shout", true) then
                return
            end
        end
    end
    
    -- Apply/maintain Rend
    local hasRend, rendTime = Engine:HasDebuff("Rend")
    if not hasRend or rendTime < 3 then
        if Engine:TryCastSpell("Rend") then
            return
        end
    end
    
    -- Use Overpower when available (requires dodge)
    if Engine:TryCastSpell("Overpower") then
        return
    end
    
    -- Thunder Clap for AoE threat/damage
    if Engine:TryCastSpell("Thunder Clap") then
        return
    end
    
    -- Heroic Strike as rage dump
    if rage > 40 then
        if Engine:TryCastSpell("Heroic Strike") then
            return
        end
    end
end
