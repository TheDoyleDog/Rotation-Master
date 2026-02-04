-- RotationMaster Status Display

RotationMaster.UI = RotationMaster.UI or {}

local UI = RotationMaster.UI

-- Create status display frame
function UI:CreateStatusDisplay()
    if self.StatusFrame then
        return self.StatusFrame
    end
    
    -- Main frame
    local frame = CreateFrame("Frame", "RotationMasterStatusFrame", UIParent)
    frame:SetWidth(200)
    frame:SetHeight(60)
    frame:SetPoint("TOP", UIParent, "TOP", 0, -100)
    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.8)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    
    -- Title
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    title:SetPoint("TOP", 0, -8)
    title:SetText("Rotation Master")
    
    -- Status text
    local statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    statusText:SetPoint("CENTER", 0, -5)
    frame.statusText = statusText
    
    self.StatusFrame = frame
    self:UpdateStatus()
    
    return frame
end

-- Update status display
function UI:UpdateStatus()
    if not self.StatusFrame then
        self:CreateStatusDisplay()
    end
    
    local status
    if RotationMaster.Enabled then
        if RotationMaster.InCombat then
            status = "|cFF00FF00Active|r"
        else
            status = "|cFFFFFF00Ready|r"
        end
    else
        status = "|cFFFF0000Disabled|r"
    end
    
    self.StatusFrame.statusText:SetText("Status: " .. status)
    
    -- Show/hide based on settings
    if RotationMasterCharDB and RotationMasterCharDB.showStatus then
        self.StatusFrame:Show()
    else
        self.StatusFrame:Hide()
    end
end

-- Toggle status display
function UI:ToggleStatusDisplay()
    if not RotationMasterCharDB then
        RotationMasterCharDB = {}
    end
    
    RotationMasterCharDB.showStatus = not RotationMasterCharDB.showStatus
    self:UpdateStatus()
end

-- Initialize status display on load
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
    if RotationMaster.UI then
        RotationMaster.UI:CreateStatusDisplay()
    end
end)
