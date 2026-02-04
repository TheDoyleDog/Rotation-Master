-- RotationMaster Spell Database
-- Contains spell information for all classes

RotationMaster.SpellData = {}
RotationMaster.SpellData.AvailableSpells = {}

-- Spell database organized by class
local SpellDB = {
    WARRIOR = {
        -- Rage generators and attacks
        {name = "Heroic Strike", level = 1, rank = 1, id = 78},
        {name = "Heroic Strike", level = 8, rank = 2, id = 284},
        {name = "Heroic Strike", level = 14, rank = 3, id = 285},
        {name = "Heroic Strike", level = 22, rank = 4, id = 1608},
        {name = "Heroic Strike", level = 30, rank = 5, id = 11564},
        {name = "Heroic Strike", level = 38, rank = 6, id = 11565},
        {name = "Heroic Strike", level = 46, rank = 7, id = 11566},
        {name = "Heroic Strike", level = 54, rank = 8, id = 11567},
        
        {name = "Rend", level = 4, rank = 1, id = 772, dot = true},
        {name = "Rend", level = 12, rank = 2, id = 6546, dot = true},
        {name = "Rend", level = 20, rank = 3, id = 6547, dot = true},
        {name = "Rend", level = 28, rank = 4, id = 6548, dot = true},
        {name = "Rend", level = 36, rank = 5, id = 11572, dot = true},
        {name = "Rend", level = 44, rank = 6, id = 11573, dot = true},
        {name = "Rend", level = 52, rank = 7, id = 11574, dot = true},
        
        {name = "Thunder Clap", level = 6, rank = 1, id = 6343},
        {name = "Thunder Clap", level = 14, rank = 2, id = 8198},
        {name = "Thunder Clap", level = 24, rank = 3, id = 8204},
        {name = "Thunder Clap", level = 34, rank = 4, id = 8205},
        {name = "Thunder Clap", level = 44, rank = 5, id = 11580},
        {name = "Thunder Clap", level = 54, rank = 6, id = 11581},
        
        {name = "Overpower", level = 12, rank = 1, id = 7384},
        {name = "Overpower", level = 20, rank = 2, id = 7887},
        {name = "Overpower", level = 28, rank = 3, id = 11584},
        {name = "Overpower", level = 36, rank = 4, id = 11585},
        
        {name = "Execute", level = 24, rank = 1, id = 5308, execute = true},
        {name = "Execute", level = 32, rank = 2, id = 20658, execute = true},
        {name = "Execute", level = 40, rank = 3, id = 20660, execute = true},
        {name = "Execute", level = 48, rank = 4, id = 20661, execute = true},
        {name = "Execute", level = 56, rank = 5, id = 20662, execute = true},
        
        {name = "Mortal Strike", level = 40, rank = 1, id = 12294, talent = true},
        {name = "Mortal Strike", level = 48, rank = 2, id = 21551, talent = true},
        {name = "Mortal Strike", level = 54, rank = 3, id = 21552, talent = true},
        {name = "Mortal Strike", level = 60, rank = 4, id = 21553, talent = true},
        
        {name = "Bloodthirst", level = 40, rank = 1, id = 23881, talent = true},
        {name = "Bloodthirst", level = 48, rank = 2, id = 23892, talent = true},
        {name = "Bloodthirst", level = 54, rank = 3, id = 23893, talent = true},
        {name = "Bloodthirst", level = 60, rank = 4, id = 23894, talent = true},
        
        -- Buffs
        {name = "Battle Shout", level = 1, rank = 1, id = 6673, buff = true},
        {name = "Battle Shout", level = 12, rank = 2, id = 5242, buff = true},
        {name = "Battle Shout", level = 22, rank = 3, id = 6192, buff = true},
        {name = "Battle Shout", level = 32, rank = 4, id = 11549, buff = true},
        {name = "Battle Shout", level = 42, rank = 5, id = 11550, buff = true},
        {name = "Battle Shout", level = 52, rank = 6, id = 11551, buff = true},
    },
    
    PALADIN = {
        -- Melee attacks
        {name = "Judgement", level = 1, rank = 1, id = 20271},
        
        {name = "Crusader Strike", level = 4, rank = 1, id = 19750},
        {name = "Crusader Strike", level = 12, rank = 2, id = 19754},
        {name = "Crusader Strike", level = 20, rank = 3, id = 19755},
        {name = "Crusader Strike", level = 28, rank = 4, id = 19756},
        {name = "Crusader Strike", level = 36, rank = 5, id = 19757},
        {name = "Crusader Strike", level = 44, rank = 6, id = 19758},
        
        {name = "Hammer of Wrath", level = 44, rank = 1, id = 24275},
        {name = "Hammer of Wrath", level = 52, rank = 2, id = 24274},
        {name = "Hammer of Wrath", level = 60, rank = 3, id = 24239},
        
        -- Seals
        {name = "Seal of Righteousness", level = 1, rank = 1, id = 21084, seal = true},
        {name = "Seal of Righteousness", level = 10, rank = 2, id = 20287, seal = true},
        {name = "Seal of Righteousness", level = 18, rank = 3, id = 20288, seal = true},
        {name = "Seal of Righteousness", level = 26, rank = 4, id = 20289, seal = true},
        {name = "Seal of Righteousness", level = 34, rank = 5, id = 20290, seal = true},
        {name = "Seal of Righteousness", level = 42, rank = 6, id = 20291, seal = true},
        {name = "Seal of Righteousness", level = 50, rank = 7, id = 20292, seal = true},
        {name = "Seal of Righteousness", level = 58, rank = 8, id = 20293, seal = true},
        
        {name = "Seal of the Crusader", level = 6, rank = 1, id = 21082, seal = true},
        {name = "Seal of the Crusader", level = 14, rank = 2, id = 20162, seal = true},
        {name = "Seal of the Crusader", level = 22, rank = 3, id = 20305, seal = true},
        {name = "Seal of the Crusader", level = 30, rank = 4, id = 20306, seal = true},
        {name = "Seal of the Crusader", level = 38, rank = 5, id = 20307, seal = true},
        {name = "Seal of the Crusader", level = 46, rank = 6, id = 20308, seal = true},
        
        {name = "Seal of Command", level = 20, rank = 1, id = 20375, seal = true, talent = true},
        {name = "Seal of Command", level = 28, rank = 2, id = 20915, seal = true, talent = true},
        {name = "Seal of Command", level = 36, rank = 3, id = 20918, seal = true, talent = true},
        {name = "Seal of Command", level = 44, rank = 4, id = 20919, seal = true, talent = true},
        {name = "Seal of Command", level = 52, rank = 5, id = 20920, seal = true, talent = true},
        
        -- Blessings
        {name = "Blessing of Might", level = 4, rank = 1, id = 19740, buff = true},
        {name = "Blessing of Might", level = 12, rank = 2, id = 19834, buff = true},
        {name = "Blessing of Might", level = 22, rank = 3, id = 19835, buff = true},
        {name = "Blessing of Might", level = 32, rank = 4, id = 19836, buff = true},
        {name = "Blessing of Might", level = 42, rank = 5, id = 19837, buff = true},
        {name = "Blessing of Might", level = 52, rank = 6, id = 19838, buff = true},
    },
    
    ROGUE = {
        -- Combo point builders
        {name = "Sinister Strike", level = 1, rank = 1, id = 1752, builder = true},
        {name = "Sinister Strike", level = 8, rank = 2, id = 1757, builder = true},
        {name = "Sinister Strike", level = 14, rank = 3, id = 1758, builder = true},
        {name = "Sinister Strike", level = 20, rank = 4, id = 1759, builder = true},
        {name = "Sinister Strike", level = 26, rank = 5, id = 1760, builder = true},
        {name = "Sinister Strike", level = 34, rank = 6, id = 8621, builder = true},
        {name = "Sinister Strike", level = 42, rank = 7, id = 11293, builder = true},
        {name = "Sinister Strike", level = 50, rank = 8, id = 11294, builder = true},
        
        {name = "Backstab", level = 4, rank = 1, id = 53, builder = true},
        {name = "Backstab", level = 12, rank = 2, id = 2589, builder = true},
        {name = "Backstab", level = 20, rank = 3, id = 2590, builder = true},
        {name = "Backstab", level = 28, rank = 4, id = 2591, builder = true},
        {name = "Backstab", level = 36, rank = 5, id = 8721, builder = true},
        {name = "Backstab", level = 44, rank = 6, id = 11279, builder = true},
        {name = "Backstab", level = 52, rank = 7, id = 11280, builder = true},
        {name = "Backstab", level = 60, rank = 8, id = 11281, builder = true},
        
        {name = "Hemorrhage", level = 20, rank = 1, id = 16511, builder = true, talent = true},
        {name = "Hemorrhage", level = 28, rank = 2, id = 17347, builder = true, talent = true},
        {name = "Hemorrhage", level = 36, rank = 3, id = 17348, builder = true, talent = true},
        
        -- Finishers
        {name = "Eviscerate", level = 1, rank = 1, id = 2098, finisher = true},
        {name = "Eviscerate", level = 14, rank = 2, id = 6760, finisher = true},
        {name = "Eviscerate", level = 22, rank = 3, id = 6761, finisher = true},
        {name = "Eviscerate", level = 30, rank = 4, id = 6762, finisher = true},
        {name = "Eviscerate", level = 38, rank = 5, id = 8623, finisher = true},
        {name = "Eviscerate", level = 46, rank = 6, id = 8624, finisher = true},
        {name = "Eviscerate", level = 54, rank = 7, id = 11299, finisher = true},
        {name = "Eviscerate", level = 60, rank = 8, id = 11300, finisher = true},
        
        {name = "Slice and Dice", level = 10, rank = 1, id = 5171, finisher = true, buff = true},
        {name = "Slice and Dice", level = 30, rank = 2, id = 6434, finisher = true, buff = true},
        
        {name = "Rupture", level = 20, rank = 1, id = 1943, finisher = true, dot = true},
        {name = "Rupture", level = 28, rank = 2, id = 8639, finisher = true, dot = true},
        {name = "Rupture", level = 36, rank = 3, id = 8640, finisher = true, dot = true},
        {name = "Rupture", level = 44, rank = 4, id = 11273, finisher = true, dot = true},
        {name = "Rupture", level = 52, rank = 5, id = 11274, finisher = true, dot = true},
        {name = "Rupture", level = 60, rank = 6, id = 11275, finisher = true, dot = true},
        
        -- Debuffs
        {name = "Expose Armor", level = 8, rank = 1, id = 8647, finisher = true, debuff = true},
        {name = "Expose Armor", level = 18, rank = 2, id = 8649, finisher = true, debuff = true},
        {name = "Expose Armor", level = 28, rank = 3, id = 8650, finisher = true, debuff = true},
        {name = "Expose Armor", level = 38, rank = 4, id = 11197, finisher = true, debuff = true},
        {name = "Expose Armor", level = 48, rank = 5, id = 11198, finisher = true, debuff = true},
    },
    
    PRIEST = {
        -- Shadow spells
        {name = "Shadow Word: Pain", level = 4, rank = 1, id = 589, dot = true},
        {name = "Shadow Word: Pain", level = 10, rank = 2, id = 594, dot = true},
        {name = "Shadow Word: Pain", level = 18, rank = 3, id = 970, dot = true},
        {name = "Shadow Word: Pain", level = 26, rank = 4, id = 992, dot = true},
        {name = "Shadow Word: Pain", level = 34, rank = 5, id = 2767, dot = true},
        {name = "Shadow Word: Pain", level = 42, rank = 6, id = 10892, dot = true},
        {name = "Shadow Word: Pain", level = 50, rank = 7, id = 10893, dot = true},
        {name = "Shadow Word: Pain", level = 58, rank = 8, id = 10894, dot = true},
        
        {name = "Mind Blast", level = 10, rank = 1, id = 8092},
        {name = "Mind Blast", level = 16, rank = 2, id = 8102},
        {name = "Mind Blast", level = 22, rank = 3, id = 8103},
        {name = "Mind Blast", level = 28, rank = 4, id = 8104},
        {name = "Mind Blast", level = 34, rank = 5, id = 8105},
        {name = "Mind Blast", level = 40, rank = 6, id = 8106},
        {name = "Mind Blast", level = 46, rank = 7, id = 10945},
        {name = "Mind Blast", level = 52, rank = 8, id = 10946},
        {name = "Mind Blast", level = 58, rank = 9, id = 10947},
        
        {name = "Mind Flay", level = 20, rank = 1, id = 15407},
        {name = "Mind Flay", level = 28, rank = 2, id = 17311},
        {name = "Mind Flay", level = 36, rank = 3, id = 17312},
        {name = "Mind Flay", level = 44, rank = 4, id = 17313},
        {name = "Mind Flay", level = 52, rank = 5, id = 17314},
        {name = "Mind Flay", level = 60, rank = 6, id = 18807},
        
        {name = "Vampiric Embrace", level = 30, rank = 1, id = 15286, talent = true, buff = true},
        
        {name = "Shadowform", level = 40, rank = 1, id = 15473, talent = true, buff = true},
        
        -- Smite for non-shadow
        {name = "Smite", level = 1, rank = 1, id = 585},
        {name = "Smite", level = 6, rank = 2, id = 591},
        {name = "Smite", level = 14, rank = 3, id = 598},
        {name = "Smite", level = 22, rank = 4, id = 984},
        {name = "Smite", level = 30, rank = 5, id = 1004},
        {name = "Smite", level = 38, rank = 6, id = 6060},
        {name = "Smite", level = 46, rank = 7, id = 10933},
        {name = "Smite", level = 54, rank = 8, id = 10934},
    },
    
    -- Additional classes will be added in the next file continuation
}

-- Continuation of spell database
SpellDB.MAGE = {
    -- Frost
    {name = "Frostbolt", level = 4, rank = 1, id = 116},
    {name = "Frostbolt", level = 8, rank = 2, id = 205},
    {name = "Frostbolt", level = 14, rank = 3, id = 837},
    {name = "Frostbolt", level = 20, rank = 4, id = 7322},
    {name = "Frostbolt", level = 26, rank = 5, id = 8406},
    {name = "Frostbolt", level = 32, rank = 6, id = 8407},
    {name = "Frostbolt", level = 38, rank = 7, id = 8408},
    {name = "Frostbolt", level = 44, rank = 8, id = 10179},
    {name = "Frostbolt", level = 50, rank = 9, id = 10180},
    {name = "Frostbolt", level = 56, rank = 10, id = 10181},
    
    -- Fire
    {name = "Fireball", level = 1, rank = 1, id = 133},
    {name = "Fireball", level = 6, rank = 2, id = 143},
    {name = "Fireball", level = 12, rank = 3, id = 145},
    {name = "Fireball", level = 18, rank = 4, id = 3140},
    {name = "Fireball", level = 24, rank = 5, id = 8400},
    {name = "Fireball", level = 30, rank = 6, id = 8401},
    {name = "Fireball", level = 36, rank = 7, id = 8402},
    {name = "Fireball", level = 42, rank = 8, id = 10148},
    {name = "Fireball", level = 48, rank = 9, id = 10149},
    {name = "Fireball", level = 54, rank = 10, id = 10150},
    {name = "Fireball", level = 60, rank = 11, id = 10151},
    
    {name = "Fire Blast", level = 6, rank = 1, id = 2136},
    {name = "Fire Blast", level = 14, rank = 2, id = 2137},
    {name = "Fire Blast", level = 22, rank = 3, id = 2138},
    {name = "Fire Blast", level = 30, rank = 4, id = 8412},
    {name = "Fire Blast", level = 38, rank = 5, id = 8413},
    {name = "Fire Blast", level = 46, rank = 6, id = 10197},
    {name = "Fire Blast", level = 54, rank = 7, id = 10199},
    
    {name = "Scorch", level = 22, rank = 1, id = 2948},
    {name = "Scorch", level = 28, rank = 2, id = 8444},
    {name = "Scorch", level = 34, rank = 3, id = 8445},
    {name = "Scorch", level = 40, rank = 4, id = 8446},
    {name = "Scorch", level = 46, rank = 5, id = 10205},
    {name = "Scorch", level = 52, rank = 6, id = 10206},
    {name = "Scorch", level = 58, rank = 7, id = 10207},
    
    -- Arcane
    {name = "Arcane Missiles", level = 8, rank = 1, id = 5143},
    {name = "Arcane Missiles", level = 16, rank = 2, id = 5144},
    {name = "Arcane Missiles", level = 24, rank = 3, id = 5145},
    {name = "Arcane Missiles", level = 32, rank = 4, id = 8416},
    {name = "Arcane Missiles", level = 40, rank = 5, id = 8417},
    {name = "Arcane Missiles", level = 48, rank = 6, id = 10211},
    {name = "Arcane Missiles", level = 56, rank = 7, id = 10212},
}

SpellDB.WARLOCK = {
    -- DoTs
    {name = "Corruption", level = 4, rank = 1, id = 172, dot = true},
    {name = "Corruption", level = 14, rank = 2, id = 6222, dot = true},
    {name = "Corruption", level = 24, rank = 3, id = 6223, dot = true},
    {name = "Corruption", level = 34, rank = 4, id = 7648, dot = true},
    {name = "Corruption", level = 44, rank = 5, id = 11671, dot = true},
    {name = "Corruption", level = 54, rank = 6, id = 11672, dot = true},
    
    {name = "Curse of Agony", level = 8, rank = 1, id = 980, curse = true, dot = true},
    {name = "Curse of Agony", level = 18, rank = 2, id = 1014, curse = true, dot = true},
    {name = "Curse of Agony", level = 28, rank = 3, id = 6217, curse = true, dot = true},
    {name = "Curse of Agony", level = 38, rank = 4, id = 11711, curse = true, dot = true},
    {name = "Curse of Agony", level = 48, rank = 5, id = 11712, curse = true, dot = true},
    {name = "Curse of Agony", level = 58, rank = 6, id = 11713, curse = true, dot = true},
    
    {name = "Immolate", level = 1, rank = 1, id = 348, dot = true},
    {name = "Immolate", level = 10, rank = 2, id = 707, dot = true},
    {name = "Immolate", level = 20, rank = 3, id = 1094, dot = true},
    {name = "Immolate", level = 30, rank = 4, id = 2941, dot = true},
    {name = "Immolate", level = 40, rank = 5, id = 11665, dot = true},
    {name = "Immolate", level = 50, rank = 6, id = 11667, dot = true},
    {name = "Immolate", level = 60, rank = 7, id = 11668, dot = true},
    
    {name = "Siphon Life", level = 30, rank = 1, id = 18265, talent = true, dot = true},
    {name = "Siphon Life", level = 38, rank = 2, id = 18879, talent = true, dot = true},
    {name = "Siphon Life", level = 48, rank = 3, id = 18880, talent = true, dot = true},
    {name = "Siphon Life", level = 58, rank = 4, id = 18881, talent = true, dot = true},
    
    -- Direct damage
    {name = "Shadow Bolt", level = 1, rank = 1, id = 686},
    {name = "Shadow Bolt", level = 6, rank = 2, id = 695},
    {name = "Shadow Bolt", level = 12, rank = 3, id = 705},
    {name = "Shadow Bolt", level = 20, rank = 4, id = 1088},
    {name = "Shadow Bolt", level = 28, rank = 5, id = 1106},
    {name = "Shadow Bolt", level = 36, rank = 6, id = 7641},
    {name = "Shadow Bolt", level = 44, rank = 7, id = 11659},
    {name = "Shadow Bolt", level = 52, rank = 8, id = 11660},
    {name = "Shadow Bolt", level = 60, rank = 9, id = 11661},
    
    -- Utility
    {name = "Life Tap", level = 6, rank = 1, id = 1454},
    {name = "Life Tap", level = 14, rank = 2, id = 1455},
    {name = "Life Tap", level = 22, rank = 3, id = 1456},
    {name = "Life Tap", level = 30, rank = 4, id = 11687},
    {name = "Life Tap", level = 38, rank = 5, id = 11688},
    {name = "Life Tap", level = 46, rank = 6, id = 11689},
}

SpellDB.SHAMAN = {
    -- Shocks
    {name = "Earth Shock", level = 4, rank = 1, id = 8042},
    {name = "Earth Shock", level = 10, rank = 2, id = 8044},
    {name = "Earth Shock", level = 18, rank = 3, id = 8045},
    {name = "Earth Shock", level = 26, rank = 4, id = 8046},
    {name = "Earth Shock", level = 34, rank = 5, id = 10412},
    {name = "Earth Shock", level = 42, rank = 6, id = 10413},
    {name = "Earth Shock", level = 50, rank = 7, id = 10414},
    
    {name = "Flame Shock", level = 10, rank = 1, id = 8050, dot = true},
    {name = "Flame Shock", level = 18, rank = 2, id = 8052, dot = true},
    {name = "Flame Shock", level = 28, rank = 3, id = 8053, dot = true},
    {name = "Flame Shock", level = 38, rank = 4, id = 10447, dot = true},
    {name = "Flame Shock", level = 48, rank = 5, id = 10448, dot = true},
    {name = "Flame Shock", level = 58, rank = 6, id = 29228, dot = true},
    
    {name = "Frost Shock", level = 20, rank = 1, id = 8056},
    {name = "Frost Shock", level = 28, rank = 2, id = 8058},
    {name = "Frost Shock", level = 40, rank = 3, id = 10472},
    {name = "Frost Shock", level = 52, rank = 4, id = 10473},
    
    -- Lightning Bolt
    {name = "Lightning Bolt", level = 1, rank = 1, id = 403},
    {name = "Lightning Bolt", level = 8, rank = 2, id = 529},
    {name = "Lightning Bolt", level = 14, rank = 3, id = 548},
    {name = "Lightning Bolt", level = 20, rank = 4, id = 915},
    {name = "Lightning Bolt", level = 26, rank = 5, id = 943},
    {name = "Lightning Bolt", level = 32, rank = 6, id = 6041},
    {name = "Lightning Bolt", level = 38, rank = 7, id = 10391},
    {name = "Lightning Bolt", level = 44, rank = 8, id = 10392},
    {name = "Lightning Bolt", level = 50, rank = 9, id = 15207},
    {name = "Lightning Bolt", level = 56, rank = 10, id = 15208},
    
    -- Stormstrike
    {name = "Stormstrike", level = 40, rank = 1, id = 17364, talent = true},
}

SpellDB.HUNTER = {
    -- Shots
    {name = "Serpent Sting", level = 4, rank = 1, id = 1978, dot = true},
    {name = "Serpent Sting", level = 10, rank = 2, id = 13549, dot = true},
    {name = "Serpent Sting", level = 18, rank = 3, id = 13550, dot = true},
    {name = "Serpent Sting", level = 26, rank = 4, id = 13551, dot = true},
    {name = "Serpent Sting", level = 34, rank = 5, id = 13552, dot = true},
    {name = "Serpent Sting", level = 42, rank = 6, id = 13553, dot = true},
    {name = "Serpent Sting", level = 50, rank = 7, id = 13554, dot = true},
    {name = "Serpent Sting", level = 58, rank = 8, id = 13555, dot = true},
    
    {name = "Arcane Shot", level = 6, rank = 1, id = 3044},
    {name = "Arcane Shot", level = 12, rank = 2, id = 14281},
    {name = "Arcane Shot", level = 20, rank = 3, id = 14282},
    {name = "Arcane Shot", level = 28, rank = 4, id = 14283},
    {name = "Arcane Shot", level = 36, rank = 5, id = 14284},
    {name = "Arcane Shot", level = 44, rank = 6, id = 14285},
    {name = "Arcane Shot", level = 52, rank = 7, id = 14286},
    {name = "Arcane Shot", level = 60, rank = 8, id = 14287},
    
    {name = "Multi-Shot", level = 18, rank = 1, id = 2643},
    {name = "Multi-Shot", level = 30, rank = 2, id = 14288},
    {name = "Multi-Shot", level = 42, rank = 3, id = 14289},
    {name = "Multi-Shot", level = 54, rank = 4, id = 14290},
    
    {name = "Aimed Shot", level = 20, rank = 1, id = 19434, talent = true},
    {name = "Aimed Shot", level = 28, rank = 2, id = 20900, talent = true},
    {name = "Aimed Shot", level = 36, rank = 3, id = 20901, talent = true},
    {name = "Aimed Shot", level = 44, rank = 4, id = 20902, talent = true},
    {name = "Aimed Shot", level = 52, rank = 5, id = 20903, talent = true},
    {name = "Aimed Shot", level = 60, rank = 6, id = 20904, talent = true},
    
    -- Auto shot is automatic, no need to cast
}

SpellDB.DRUID = {
    -- Balance
    {name = "Moonfire", level = 4, rank = 1, id = 8921, dot = true},
    {name = "Moonfire", level = 10, rank = 2, id = 8924, dot = true},
    {name = "Moonfire", level = 16, rank = 3, id = 8925, dot = true},
    {name = "Moonfire", level = 22, rank = 4, id = 8926, dot = true},
    {name = "Moonfire", level = 28, rank = 5, id = 8927, dot = true},
    {name = "Moonfire", level = 34, rank = 6, id = 8928, dot = true},
    {name = "Moonfire", level = 40, rank = 7, id = 8929, dot = true},
    {name = "Moonfire", level = 46, rank = 8, id = 9833, dot = true},
    {name = "Moonfire", level = 52, rank = 9, id = 9834, dot = true},
    {name = "Moonfire", level = 58, rank = 10, id = 9835, dot = true},
    
    {name = "Wrath", level = 1, rank = 1, id = 5176},
    {name = "Wrath", level = 6, rank = 2, id = 5177},
    {name = "Wrath", level = 14, rank = 3, id = 5178},
    {name = "Wrath", level = 22, rank = 4, id = 5179},
    {name = "Wrath", level = 30, rank = 5, id = 5180},
    {name = "Wrath", level = 38, rank = 6, id = 6780},
    {name = "Wrath", level = 46, rank = 7, id = 8905},
    {name = "Wrath", level = 54, rank = 8, id = 9912},
    
    {name = "Starfire", level = 20, rank = 1, id = 2912},
    {name = "Starfire", level = 26, rank = 2, id = 8949},
    {name = "Starfire", level = 34, rank = 3, id = 8950},
    {name = "Starfire", level = 42, rank = 4, id = 8951},
    {name = "Starfire", level = 50, rank = 5, id = 9875},
    {name = "Starfire", level = 58, rank = 6, id = 9876},
    
    -- Feral (Cat)
    {name = "Claw", level = 20, rank = 1, id = 1082, form = "cat", builder = true},
    {name = "Claw", level = 28, rank = 2, id = 3029, form = "cat", builder = true},
    {name = "Claw", level = 36, rank = 3, id = 5201, form = "cat", builder = true},
    {name = "Claw", level = 44, rank = 4, id = 9849, form = "cat", builder = true},
    {name = "Claw", level = 52, rank = 5, id = 9850, form = "cat", builder = true},
    
    {name = "Rake", level = 24, rank = 1, id = 1822, form = "cat", dot = true, builder = true},
    {name = "Rake", level = 34, rank = 2, id = 1823, form = "cat", dot = true, builder = true},
    {name = "Rake", level = 44, rank = 3, id = 1824, form = "cat", dot = true, builder = true},
    {name = "Rake", level = 54, rank = 4, id = 9904, form = "cat", dot = true, builder = true},
    
    {name = "Rip", level = 20, rank = 1, id = 1079, form = "cat", finisher = true, dot = true},
    {name = "Rip", level = 28, rank = 2, id = 9492, form = "cat", finisher = true, dot = true},
    {name = "Rip", level = 36, rank = 3, id = 9493, form = "cat", finisher = true, dot = true},
    {name = "Rip", level = 44, rank = 4, id = 9752, form = "cat", finisher = true, dot = true},
    {name = "Rip", level = 52, rank = 5, id = 9894, form = "cat", finisher = true, dot = true},
    {name = "Rip", level = 60, rank = 6, id = 9896, form = "cat", finisher = true, dot = true},
    
    {name = "Ferocious Bite", level = 32, rank = 1, id = 22568, form = "cat", finisher = true},
    {name = "Ferocious Bite", level = 42, rank = 2, id = 22827, form = "cat", finisher = true},
    {name = "Ferocious Bite", level = 52, rank = 3, id = 22828, form = "cat", finisher = true},
    {name = "Ferocious Bite", level = 60, rank = 4, id = 22829, form = "cat", finisher = true},
    
    -- Feral (Bear)
    {name = "Maul", level = 10, rank = 1, id = 6807, form = "bear"},
    {name = "Maul", level = 18, rank = 2, id = 6808, form = "bear"},
    {name = "Maul", level = 26, rank = 3, id = 6809, form = "bear"},
    {name = "Maul", level = 34, rank = 4, id = 8972, form = "bear"},
    {name = "Maul", level = 42, rank = 5, id = 9745, form = "bear"},
    {name = "Maul", level = 50, rank = 6, id = 9880, form = "bear"},
    {name = "Maul", level = 58, rank = 7, id = 9881, form = "bear"},
    
    {name = "Swipe", level = 16, rank = 1, id = 779, form = "bear"},
    {name = "Swipe", level = 26, rank = 2, id = 780, form = "bear"},
    {name = "Swipe", level = 36, rank = 3, id = 769, form = "bear"},
    {name = "Swipe", level = 46, rank = 4, id = 9754, form = "bear"},
    {name = "Swipe", level = 56, rank = 5, id = 9908, form = "bear"},
    
    {name = "Faerie Fire (Feral)", level = 24, rank = 1, id = 16857, debuff = true},
    {name = "Faerie Fire (Feral)", level = 32, rank = 2, id = 17390, debuff = true},
    {name = "Faerie Fire (Feral)", level = 40, rank = 3, id = 17391, debuff = true},
    {name = "Faerie Fire (Feral)", level = 48, rank = 4, id = 17392, debuff = true},
}

-- Build available spells for current character
function RotationMaster.SpellData:RebuildAvailableSpells()
    self.AvailableSpells = {}
    
    local playerClass = RotationMaster.PlayerClass
    local playerLevel = RotationMaster.PlayerLevel
    
    if not playerClass or not SpellDB[playerClass] then
        return
    end
    
    -- Get highest rank of each spell available at current level
    local spellRanks = {}
    
    for _, spell in ipairs(SpellDB[playerClass]) do
        if spell.level <= playerLevel then
            -- Check if spell is learned (for talents, check if in spellbook)
            local learned = true
            if spell.talent then
                learned = self:IsSpellLearned(spell.name)
            end
            
            if learned then
                if not spellRanks[spell.name] or spell.level > spellRanks[spell.name].level then
                    spellRanks[spell.name] = spell
                end
            end
        end
    end
    
    -- Convert to array
    for name, spell in pairs(spellRanks) do
        table.insert(self.AvailableSpells, spell)
    end
end

-- Check if spell is learned
function RotationMaster.SpellData:IsSpellLearned(spellName)
    local i = 1
    while true do
        local name, rank = GetSpellName(i, BOOKTYPE_SPELL)
        if not name then
            break
        end
        if name == spellName then
            return true
        end
        i = i + 1
    end
    return false
end

-- Get spell by name
function RotationMaster.SpellData:GetSpell(spellName)
    for _, spell in ipairs(self.AvailableSpells) do
        if spell.name == spellName then
            return spell
        end
    end
    return nil
end

-- Get all spells with a specific tag
function RotationMaster.SpellData:GetSpellsByTag(tag)
    local spells = {}
    for _, spell in ipairs(self.AvailableSpells) do
        if spell[tag] then
            table.insert(spells, spell)
        end
    end
    return spells
end
