local _, ns = ...
local Module = ns.Addon:NewModule("MERCHANTS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local INTERACTION_TYPE = _G.Enum.PlayerInteractionType.Merchant
local KEYS = {
    SELL = "KEY_SELL",
    REPAIR_GUILD = "KEY_REPAIR_GUILD",
    REPAIR_PERSONAL = "KEY_REPAIR_PERSONAL",
}

local IsInGuild = _G.IsInGuild
local RepairAllItems = _G.RepairAllItems
local SellAllJunkItems = _G.C_MerchantFrame.SellAllJunkItems
local CanGuildBankRepair = _G.CanGuildBankRepair

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options
        :AddToggle(KEYS.SELL)
        :AddToggle(KEYS.REPAIR_GUILD)
        :AddToggle(KEYS.REPAIR_PERSONAL)
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, type)
    if type ~= INTERACTION_TYPE then return end

    if self.Options:Get(KEYS.SELL) then SellAllJunkItems() end
    if self.Options:Get(KEYS.REPAIR_GUILD) and IsInGuild() and CanGuildBankRepair() then RepairAllItems(true) end
    if self.Options:Get(KEYS.REPAIR_PERSONAL) then RepairAllItems(false) end
end
