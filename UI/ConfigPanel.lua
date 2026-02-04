-- RotationMaster Configuration Panel UI

RotationMaster.UI = RotationMaster.UI or {}

local UI = RotationMaster.UI

-- Create configuration panel
function UI:CreateConfigPanel()
    if self.ConfigFrame then
        return self.ConfigFrame
    end
    
    -- Main frame
    local frame = CreateFrame("Frame", "RotationMasterConfigFrame", UIParent)
    frame:SetWidth(400)
    frame:SetHeight(500)
    frame:SetPoint("CENTER")
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()
    
    -- Title
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("Rotation Master Configuration")
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    
    -- Enable/Disable button
    local toggleBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
    toggleBtn:SetWidth(150)
    toggleBtn:SetHeight(30)
    toggleBtn:SetPoint("TOP", 0, -60)
    toggleBtn:SetText("Toggle Rotation")
    toggleBtn:SetScript("OnClick", function()
        RotationMaster:Toggle()
        UI:UpdateConfigPanel()
    end)
    
    -- Status text
    local statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    statusText:SetPoint("TOP", 0, -100)
    frame.statusText = statusText
    
    -- Class info
    local classText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    classText:SetPoint("TOP", 0, -130)
    classText:SetText("Class: " .. (RotationMaster.PlayerClass or "Unknown"))
    
    local levelText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    levelText:SetPoint("TOP", 0, -150)
    levelText:SetText("Level: " .. RotationMaster.PlayerLevel)
    
    -- Instructions
    local instructions = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    instructions:SetPoint("TOP", 0, -190)
    instructions:SetWidth(350)
    instructions:SetText("Use /rm toggle to enable/disable rotations\nUse /rm status to check current status\n\nThe addon will automatically execute optimal\nrotations based on your class and level.")
    instructions:SetJustifyH("LEFT")
    
    -- Class-specific settings info
    local settingsText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    settingsText:SetPoint("TOP", 0, -280)
    settingsText:SetWidth(350)
    settingsText:SetText("Class-specific settings are configured\nautomatically based on optimal rotations.\n\nAdvanced configuration coming soon!")
    settingsText:SetJustifyH("CENTER")
    
    -- Reset button
    local resetBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
    resetBtn:SetWidth(150)
    resetBtn:SetHeight(30)
    resetBtn:SetPoint("BOTTOM", 0, 20)
    resetBtn:SetText("Reset to Defaults")
    resetBtn:SetScript("OnClick", function()
        RotationMaster.Config:ResetToDefaults()
        UI:UpdateConfigPanel()
    end)
    
    self.ConfigFrame = frame
    return frame
end

-- Show configuration panel
function UI:ShowConfigPanel()
    if not self.ConfigFrame then
        self:CreateConfigPanel()
    end
    
    self:UpdateConfigPanel()
    self.ConfigFrame:Show()
end

-- Update configuration panel
function UI:UpdateConfigPanel()
    if not self.ConfigFrame then
        return
    end
    
    local status = RotationMaster.Enabled and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"
    self.ConfigFrame.statusText:SetText("Status: " .. status)
end
