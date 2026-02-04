-- RotationMaster Rotation Engine
-- Core rotation execution logic

RotationMaster.RotationEngine = {}

-- Execute rotation for current class
function RotationMaster.RotationEngine:ExecuteRotation()
    -- Check if we have a valid target
    if not UnitExists("target") or UnitIsDead("target") then
        return
    end
    
    -- Check if target is attackable
    if not UnitCanAttack("player", "target") then
        return
    end
    
    -- Check if we're casting
    if RotationMaster.Config:Get("waitForCast") and self:IsCasting() then
        return
    end
    
    -- Get class-specific rotation
    local playerClass = RotationMaster.PlayerClass
    if not playerClass then
        return
    end
    
    -- Call class-specific rotation
    local rotationFunc = RotationMaster.Rotations and RotationMaster.Rotations[playerClass]
    if rotationFunc then
        rotationFunc()
    end
end

-- Check if player is casting
function RotationMaster.RotationEngine:IsCasting()
    local spell, rank, displayName, icon, startTime, endTime = UnitCastingInfo("player")
    if spell then
        return true
    end
    
    spell, rank, displayName, icon, startTime, endTime = UnitChannelInfo("player")
    if spell then
        return true
    end
    
    return false
end

-- Check if spell is on cooldown
function RotationMaster.RotationEngine:IsOnCooldown(spellName)
    local start, duration = GetSpellCooldown(spellName, BOOKTYPE_SPELL)
    if start and duration and duration > 0 then
        local remaining = duration - (GetTime() - start)
        if remaining > 0.5 then -- Allow for small GCD
            return true
        end
    end
    return false
end

-- Check if we have enough mana/rage/energy for spell
function RotationMaster.RotationEngine:HasEnoughResource(spellName)
    -- Get spell cost from tooltip (vanilla doesn't have easy API for this)
    -- For now, we'll just check if we have any resource
    local powerType = UnitPowerType("player")
    local current = UnitMana("player")
    
    -- If we have at least some resource, assume we can cast
    -- More sophisticated checking would require tooltip parsing
    return current > 0
end

-- Check if target is in range
function RotationMaster.RotationEngine:IsInRange(spellName)
    -- Use spell range checking
    local inRange = IsSpellInRange(spellName, "target")
    if inRange == 1 then
        return true
    end
    return false
end

-- Check if buff is active on player
function RotationMaster.RotationEngine:HasBuff(buffName)
    local i = 1
    while true do
        local name, rank, icon, count, debuffType, duration, expirationTime = UnitBuff("player", i)
        if not name then
            break
        end
        if name == buffName then
            return true, expirationTime - GetTime()
        end
        i = i + 1
    end
    return false, 0
end

-- Check if debuff is active on target
function RotationMaster.RotationEngine:HasDebuff(debuffName, unit)
    unit = unit or "target"
    local i = 1
    while true do
        local name, rank, icon, count, debuffType, duration, expirationTime = UnitDebuff(unit, i)
        if not name then
            break
        end
        if name == debuffName then
            return true, expirationTime - GetTime()
        end
        i = i + 1
    end
    return false, 0
end

-- Get target health percentage
function RotationMaster.RotationEngine:GetTargetHealthPercent()
    local health = UnitHealth("target")
    local maxHealth = UnitHealthMax("target")
    if maxHealth > 0 then
        return (health / maxHealth) * 100
    end
    return 100
end

-- Get player power percentage
function RotationMaster.RotationEngine:GetPowerPercent()
    local power = UnitMana("player")
    local maxPower = UnitManaMax("player")
    if maxPower > 0 then
        return (power / maxPower) * 100
    end
    return 100
end

-- Get combo points (for rogues/druids)
function RotationMaster.RotationEngine:GetComboPoints()
    return GetComboPoints("player", "target") or 0
end

-- Cast spell by name
function RotationMaster.RotationEngine:CastSpell(spellName)
    -- Check if spell exists in spellbook
    local i = 1
    while true do
        local name, rank = GetSpellName(i, BOOKTYPE_SPELL)
        if not name then
            break
        end
        if name == spellName then
            CastSpell(i, BOOKTYPE_SPELL)
            return true
        end
        i = i + 1
    end
    return false
end

-- Try to cast spell with all checks
function RotationMaster.RotationEngine:TryCastSpell(spellName, ignoreRange)
    -- Check if spell is on cooldown
    if self:IsOnCooldown(spellName) then
        return false
    end
    
    -- Check range (unless ignored, e.g., for buffs)
    if not ignoreRange and not self:IsInRange(spellName) then
        return false
    end
    
    -- Check if we have enough resources
    if not self:HasEnoughResource(spellName) then
        return false
    end
    
    -- Cast the spell
    return self:CastSpell(spellName)
end

-- Face target if needed
function RotationMaster.RotationEngine:FaceTarget()
    if RotationMaster.Config:Get("autoFaceTarget") then
        if not UnitIsFacing("player", "target") then
            -- Turn to face target
            TurnOrActionStart()
        end
    end
end
