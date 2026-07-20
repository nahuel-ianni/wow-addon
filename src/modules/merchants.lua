local _, ns = ...
local Module = ns.Addon:NewModule("MERCHANTS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local AUTO_SELL = "AUTO_SELL"
local AUTO_REPAIR, AUTO_REPAIR_GUILD = "AUTO_REPAIR", "AUTO_REPAIR_GUILD"
local INTERACTION_TYPE = _G.Enum.PlayerInteractionType.Merchant

local RepairAllItems = _G.RepairAllItems
local SellAllJunkItems = _G.C_MerchantFrame.SellAllJunkItems

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function RepairItems()
    if Module.Options:Get(AUTO_REPAIR_GUILD) then RepairAllItems(true) end
    if Module.Options:Get(AUTO_REPAIR) then RepairAllItems(false) end
end

local function SellJunk() SellAllJunkItems() end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options
        :AddToggle(AUTO_SELL, "Auto Sell", "Automatically sell junk.", true)
        :AddToggle(AUTO_REPAIR, "Auto Repair", "Automatically repair.", true)
        :AddToggle(AUTO_REPAIR_GUILD, "Use Guild Funds", "Use guild funds first.", true)
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, type)
    if type ~= INTERACTION_TYPE then return end

    if self.Options:Get(AUTO_SELL) then SellJunk() end
    if self.Options:Get(AUTO_REPAIR) then RepairItems() end
end
