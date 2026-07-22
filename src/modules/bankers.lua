local _, ns = ...
local Module = ns.Addon:NewModule("BANKERS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local KEY_DEPOSIT = "KEY_DEPOSIT"
local BANK_TYPE = _G.Enum.BankType.Account

local Bank = _G.C_Bank
local GetMoney, GetMoneyString = _G.GetMoney, _G.GetMoneyString

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function DepositFunds(value)
    if not Bank.CanDepositMoney(BANK_TYPE) then
        Module.Log:Warning(Module.L.WB_WARNING)
        return
    end

    local money = GetMoney()
    local limit = tonumber(value) * 10000 -- Gold to copper conversion
    local deposit = abs(money - limit)

    if money > limit then
        Bank.DepositMoney(BANK_TYPE, deposit)
        Module.Log:Info(Module.L.WB_DEPOSIT, GetMoneyString(deposit))
    end
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() self:RegisterEvent("BANKFRAME_OPENED") end
function Module:OnDisable() self:UnregisterAllEvents() end

function Module:InjectOptions()
    self.Options:AddInput(KEY_DEPOSIT)
end

function Module:BANKFRAME_OPENED()
    local deposit = self.Options:Get(KEY_DEPOSIT)
    if deposit then DepositFunds(deposit) end
end
