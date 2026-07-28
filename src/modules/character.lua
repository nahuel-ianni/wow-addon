local _, ns = ...
local Module = ns.Addon:NewModule("CHARACTER", "AceEvent-3.0", "AceHook-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local UNIT = "player"
local SLOTS = {
    [_G.INVSLOT_HEAD]     = _G.CharacterHeadSlot,
    [_G.INVSLOT_NECK]     = _G.CharacterNeckSlot,
    [_G.INVSLOT_SHOULDER] = _G.CharacterShoulderSlot,
    [_G.INVSLOT_BACK]     = _G.CharacterBackSlot,
    [_G.INVSLOT_CHEST]    = _G.CharacterChestSlot,
    [_G.INVSLOT_WRIST]    = _G.CharacterWristSlot,
    [_G.INVSLOT_HAND]     = _G.CharacterHandsSlot,
    [_G.INVSLOT_WAIST]    = _G.CharacterWaistSlot,
    [_G.INVSLOT_LEGS]     = _G.CharacterLegsSlot,
    [_G.INVSLOT_FEET]     = _G.CharacterFeetSlot,
    [_G.INVSLOT_FINGER1]  = _G.CharacterFinger0Slot,
    [_G.INVSLOT_FINGER2]  = _G.CharacterFinger1Slot,
    [_G.INVSLOT_TRINKET1] = _G.CharacterTrinket0Slot,
    [_G.INVSLOT_TRINKET2] = _G.CharacterTrinket1Slot,
    [_G.INVSLOT_MAINHAND] = _G.CharacterMainHandSlot,
    [_G.INVSLOT_OFFHAND]  = _G.CharacterSecondaryHandSlot,
}

local GetInventoryItemLink = _G.GetInventoryItemLink
local GetDetailedItemLevelInfo = _G.GetDetailedItemLevelInfo

local slotData = { ilvl = nil, enchant = nil }

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function UpdateContent(frame, data)
    -- TODO: Color de texto = item quality color
    if not frame._ilvl then frame._ilvl = ns.Frames:GetLabel(frame) end
    
    frame._ilvl:SetText(data.ilvl)
end

local function UpdateGearInfo()
    for slotID, frame in pairs(SLOTS) do
        local link = GetInventoryItemLink(UNIT, slotID)

        slotData.ilvl = link and GetDetailedItemLevelInfo(link)

        UpdateContent(frame, slotData)
    end
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable()
    self:SecureHookScript(CharacterFrame, "OnShow", UpdateGearInfo)
    self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED",  UpdateGearInfo)
end

function Module:OnDisable()
    self:UnhookAll()
    self:UnregisterAllEvents()
end
