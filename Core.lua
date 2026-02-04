-- RotationMaster Core
-- Main addon initialization and event handling

RotationMaster = {}
RotationMaster.Version = "1.0.0"
RotationMaster.Enabled = false
RotationMaster.InCombat = false
RotationMaster.PlayerClass = nil
RotationMaster.PlayerLevel = 1
RotationMaster.LastUpdate = 0
RotationMaster.UpdateInterval = 0.1 -- Check rotation every 100ms

-- Create main frame for event handling
local frame = CreateFrame("Frame")
RotationMaster.Frame = frame

-- Initialize addon
function RotationMaster:Initialize()
    -- Get player class
    local _, class = UnitClass("player")
    self.PlayerClass = class
    self.PlayerLevel = UnitLevel("player")
    
    -- Load saved variables
    if not RotationMasterDB then
        RotationMasterDB = {}
    end
    
    if not RotationMasterCharDB then
        RotationMasterCharDB = {
            enabled = false,
            showStatus = true,
        }
    end
    
    -- Initialize configuration
    RotationMaster.Config:Initialize()
    
    -- Print welcome message
    self:Print("Rotation Master v" .. self.Version .. " loaded for " .. class)
    self:Print("Type /rm to open configuration or /rm toggle to enable/disable")
    
    -- Register slash commands
    self:RegisterSlashCommands()
end

-- Print message to chat
function RotationMaster:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[RotationMaster]|r " .. msg)
end

-- Enable rotation
function RotationMaster:Enable()
    if not self.Enabled then
        self.Enabled = true
        RotationMasterCharDB.enabled = true
        self:Print("Rotation |cFF00FF00ENABLED|r")
        
        if RotationMaster.UI then
            RotationMaster.UI:UpdateStatus()
        end
    end
end

-- Disable rotation
function RotationMaster:Disable()
    if self.Enabled then
        self.Enabled = false
        RotationMasterCharDB.enabled = false
        self:Print("Rotation |cFFFF0000DISABLED|r")
        
        if RotationMaster.UI then
            RotationMaster.UI:UpdateStatus()
        end
    end
end

-- Toggle rotation
function RotationMaster:Toggle()
    if self.Enabled then
        self:Disable()
    else
        self:Enable()
    end
end

-- Register slash commands
function RotationMaster:RegisterSlashCommands()
    SLASH_ROTATIONMASTER1 = "/rm"
    SLASH_ROTATIONMASTER2 = "/rotationmaster"
    
    SlashCmdList["ROTATIONMASTER"] = function(msg)
        msg = string.lower(msg or "")
        
        if msg == "toggle" or msg == "t" then
            RotationMaster:Toggle()
        elseif msg == "enable" or msg == "on" then
            RotationMaster:Enable()
        elseif msg == "disable" or msg == "off" then
            RotationMaster:Disable()
        elseif msg == "config" or msg == "" then
            if RotationMaster.UI and RotationMaster.UI.ShowConfigPanel then
                RotationMaster.UI:ShowConfigPanel()
            else
                RotationMaster:Print("Configuration panel not yet loaded")
            end
        elseif msg == "status" then
            local status = RotationMaster.Enabled and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"
            RotationMaster:Print("Status: " .. status)
            RotationMaster:Print("Class: " .. (RotationMaster.PlayerClass or "Unknown"))
            RotationMaster:Print("Level: " .. RotationMaster.PlayerLevel)
        else
            RotationMaster:Print("Commands:")
            RotationMaster:Print("/rm toggle - Toggle rotation on/off")
            RotationMaster:Print("/rm enable - Enable rotation")
            RotationMaster:Print("/rm disable - Disable rotation")
            RotationMaster:Print("/rm config - Open configuration")
            RotationMaster:Print("/rm status - Show current status")
        end
    end
end

-- Event handlers
function RotationMaster:OnEvent(event, ...)
    if event == "ADDON_LOADED" then
        local addonName = (...)
        if addonName == "RotationMaster" then
            self:Initialize()
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        self.PlayerLevel = UnitLevel("player")
        
        -- Restore enabled state
        if RotationMasterCharDB.enabled then
            self.Enabled = true
        end
    elseif event == "PLAYER_LEVEL_UP" then
        local level = ...
        self.PlayerLevel = level
        self:Print("Level up! Now level " .. level)
        
        -- Rebuild available spells
        if RotationMaster.SpellData then
            RotationMaster.SpellData:RebuildAvailableSpells()
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        -- Entered combat
        self.InCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Left combat
        self.InCombat = false
    end
end

-- OnUpdate handler for rotation execution
function RotationMaster:OnUpdate(elapsed)
    self.LastUpdate = self.LastUpdate + elapsed
    
    if self.LastUpdate >= self.UpdateInterval then
        self.LastUpdate = 0
        
        -- Only run rotation if enabled and in combat
        if self.Enabled and self.InCombat then
            if RotationMaster.RotationEngine then
                RotationMaster.RotationEngine:ExecuteRotation()
            end
        end
    end
end

-- Register events
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(self, event, ...)
    RotationMaster:OnEvent(event, ...)
end)

frame:SetScript("OnUpdate", function(self, elapsed)
    RotationMaster:OnUpdate(elapsed)
end)
