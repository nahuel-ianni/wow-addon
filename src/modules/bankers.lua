local _, ns = ...
local Module = ns.Addon:NewModule("BANKERS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local DEPOSIT_VALUE = "DEPOSIT_VALUE"
local BANK_TYPE = _G.Enum.BankType.Account
local INTERACTION_TYPE = _G.Enum.PlayerInteractionType.Banker

local Bank = _G.C_Bank
local GetMoney = _G.GetMoney
local GetMoneyString = _G.GetMoneyString

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function DepositFunds(value)
    if not Bank.CanDepositMoney(BANK_TYPE) then
        Module.Log:Warning(Module.L.WB_WARNING)
        return
    end

    local money = GetMoney()
    local limit = tonumber(Module.Options:Get(DEPOSIT_VALUE)) * 10000 -- Gold to copper conversion
    local deposit = abs(money - limit)

    if money > limit then
        Bank.DepositMoney(BANK_TYPE, deposit)
        Module.Log:Info(Module.L.WB_DEPOSIT .. ": " .. GetMoneyString(deposit))
    end
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options:AddInput(DEPOSIT_VALUE, DEPOSIT_VALUE, DEPOSIT_VALUE)
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, type)
    if type ~= INTERACTION_TYPE then return end

    local deposit = self.Options:Get(DEPOSIT_VALUE)
    if deposit then DepositFunds(deposit) end
end
