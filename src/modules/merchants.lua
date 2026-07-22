local _, ns = ...
local Module = ns.Addon:NewModule("MERCHANTS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local KEY_SELL = "KEY_SELL"
local KEY_REPAIR, KEY_REPAIR_GUILD = "KEY_REPAIR", "KEY_REPAIR_GUILD"
local INTERACTION_TYPE = _G.Enum.PlayerInteractionType.Merchant

local IsInGuild = _G.IsInGuild
local RepairAllItems = _G.RepairAllItems
local SellAllJunkItems = _G.C_MerchantFrame.SellAllJunkItems

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function RepairItems()
    if Module.Options:Get(KEY_REPAIR_GUILD) and IsInGuild() then RepairAllItems(true) end
    if Module.Options:Get(KEY_REPAIR) then RepairAllItems(false) end
end

local function SellJunk() SellAllJunkItems() end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options
        :AddToggle(KEY_SELL)
        :AddToggle(KEY_REPAIR)
        :AddToggle(KEY_REPAIR_GUILD)
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, type)
    if type ~= INTERACTION_TYPE then return end

    if self.Options:Get(KEY_SELL) then SellJunk() end
    if self.Options:Get(KEY_REPAIR) then RepairItems() end
end
