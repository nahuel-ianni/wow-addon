local _, ns = ...
local Module = ns.Addon:NewModule("MERCHANTS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local K_SELL = "KEY_MERCHANTS_S"
local K_REPAIR, K_REPAIR_G = "KEY_MERCHANTS_R", "KEY_MERCHANTS_G"
local INTERACTION_TYPE = _G.Enum.PlayerInteractionType.Merchant

local GetMoneyString = _G.GetMoneyString
local SellAllJunkItems = _G.C_MerchantFrame.SellAllJunkItems
local IsInGuild, CanGuildBankRepair = _G.IsInGuild, _G.CanGuildBankRepair
local GetRepairAllCost, RepairAllItems = _G.GetRepairAllCost, _G.RepairAllItems

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function ReportCost()

end

local function RepairItems()
    local totalCost = GetRepairAllCost()
    local remainingCost = totalCost

    if Module.Options:Get(K_REPAIR_G) and IsInGuild() and CanGuildBankRepair() then
        RepairAllItems(true)
        remainingCost = GetRepairAllCost()
        if totalCost ~= remainingCost then
            Module.L:Info("Repaired (guild):", GetMoneyString(totalCost - remainingCost))
            totcalCost = remainingCost
        end
    end
    
    if Module.Options:Get(K_REPAIR) then
        RepairAllItems(false)
        remainingCost = GetRepairAllCost()
        if totalCost ~= remainingCost then
            Module.L:Info("Repaired:", GetMoneyString(totalCost - remainingCost))
        end
    end
end

local function SellJunk() SellAllJunkItems() end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options
        :AddToggle(K_SELL)
        :AddToggle(K_REPAIR)
        :AddToggle(K_REPAIR_G)
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, type)
    if type ~= INTERACTION_TYPE then return end

    if self.Options:Get(K_SELL) then SellJunk() end
    if self.Options:Get(K_REPAIR) then RepairItems() end
end
