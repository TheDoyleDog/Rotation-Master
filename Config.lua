-- RotationMaster Configuration System

RotationMaster.Config = {}

-- Default configuration for all classes
local DefaultConfig = {
    -- Global settings
    updateInterval = 0.1, -- How often to check rotation (seconds)
    debugMode = false,
    showStatusFrame = true,
    
    -- Combat settings
    autoFaceTarget = true,
    waitForCast = true,
    
    -- Class-specific settings (will be populated per class)
    classSettings = {},
}

-- Class-specific default settings
local ClassDefaults = {
    WARRIOR = {
        useExecute = true,
        executeThreshold = 20, -- Use Execute below 20% health
        maintainBattleShout = true,
        useCooldowns = true,
        preferredStance = "Auto", -- Auto, Battle, Defensive, Berserker
    },
    PALADIN = {
        maintainSeal = true,
        preferredSeal = "Righteousness", -- Righteousness, Command, Crusader
        maintainBlessings = true,
        useJudgement = true,
        useCooldowns = true,
    },
    HUNTER = {
        maintainAspect = true,
        preferredAspect = "Hawk", -- Hawk, Monkey, Cheetah
        useStings = true,
        maintainSerpentSting = true,
        useCooldowns = true,
        petAssist = true,
    },
    ROGUE = {
        comboPointsForFinisher = 5, -- Wait for this many combo points
        useFinisherAt4CP = false, -- Use finisher at 4 CP if target is low
        maintainSliceAndDice = true,
        useExposeArmor = false,
        useCooldowns = true,
        openFromStealth = true,
    },
    PRIEST = {
        maintainShadowWordPain = true,
        maintainVampiricEmbrace = true,
        useWandWhenOOM = true,
        oomThreshold = 20, -- Use wand when below this % mana
        useCooldowns = true,
        useShadowform = true,
    },
    SHAMAN = {
        maintainWeaponBuffs = true,
        useShocks = true,
        shockPriority = "Flame", -- Flame, Earth, Frost
        maintainTotems = false, -- Don't auto-drop totems (player choice)
        useCooldowns = true,
    },
    MAGE = {
        preferredSchool = "Frost", -- Frost, Fire, Arcane
        useWandWhenOOM = true,
        oomThreshold = 10,
        useCooldowns = true,
        useEvocation = true,
        evocationThreshold = 20,
        useManaGems = true,
    },
    WARLOCK = {
        maintainCurseOfAgony = true,
        maintainCorruption = true,
        maintainImmolate = false,
        useLifeTap = true,
        lifeTapThreshold = 50, -- Use Life Tap when mana below this %
        healthThresholdForLifeTap = 60, -- Don't Life Tap if health below this %
        useCooldowns = true,
        preferredCurse = "Agony", -- Agony, Elements, Recklessness, Shadow
    },
    DRUID = {
        preferredForm = "Cat", -- Cat, Bear, Moonkin, Caster
        maintainFaerieFire = true,
        maintainMoonfire = true,
        maintainRake = true,
        comboPointsForFinisher = 5,
        useCooldowns = true,
    },
}

-- Initialize configuration
function RotationMaster.Config:Initialize()
    -- Merge saved config with defaults
    if not RotationMasterDB.config then
        RotationMasterDB.config = self:DeepCopy(DefaultConfig)
    end
    
    -- Ensure class settings exist
    local playerClass = RotationMaster.PlayerClass
    if playerClass and ClassDefaults[playerClass] then
        if not RotationMasterDB.config.classSettings[playerClass] then
            RotationMasterDB.config.classSettings[playerClass] = self:DeepCopy(ClassDefaults[playerClass])
        end
    end
end

-- Get configuration value
function RotationMaster.Config:Get(key, classSpecific)
    if classSpecific then
        local playerClass = RotationMaster.PlayerClass
        if RotationMasterDB.config.classSettings[playerClass] then
            return RotationMasterDB.config.classSettings[playerClass][key]
        end
        return nil
    else
        return RotationMasterDB.config[key]
    end
end

-- Set configuration value
function RotationMaster.Config:Set(key, value, classSpecific)
    if classSpecific then
        local playerClass = RotationMaster.PlayerClass
        if not RotationMasterDB.config.classSettings[playerClass] then
            RotationMasterDB.config.classSettings[playerClass] = {}
        end
        RotationMasterDB.config.classSettings[playerClass][key] = value
    else
        RotationMasterDB.config[key] = value
    end
end

-- Deep copy table
function RotationMaster.Config:DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[self:DeepCopy(orig_key)] = self:DeepCopy(orig_value)
        end
    else
        copy = orig
    end
    return copy
end

-- Get class-specific settings
function RotationMaster.Config:GetClassSettings()
    local playerClass = RotationMaster.PlayerClass
    if RotationMasterDB.config.classSettings[playerClass] then
        return RotationMasterDB.config.classSettings[playerClass]
    end
    return {}
end

-- Reset to defaults
function RotationMaster.Config:ResetToDefaults()
    RotationMasterDB.config = self:DeepCopy(DefaultConfig)
    
    local playerClass = RotationMaster.PlayerClass
    if playerClass and ClassDefaults[playerClass] then
        RotationMasterDB.config.classSettings[playerClass] = self:DeepCopy(ClassDefaults[playerClass])
    end
    
    RotationMaster:Print("Configuration reset to defaults")
end
