local _, ns = ...
local Module = ns.Addon:NewModule("BANKERS", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local K_DEPOSIT = "KEY_BANKERS"
local BANK_TYPE = _G.Enum.BankType.Account

local Bank = _G.C_Bank
local GetMoney, GetMoneyString = _G.GetMoney, _G.GetMoneyString

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function DepositFunds(value)
    if not Bank.CanDepositMoney(BANK_TYPE) then
        Module.Log:Error(Module.L.WB_ERROR)
        return
    elseif type(value) ~= "number" or value <= 0 then
        Module.Log:Warning(Module.L.WB_WARNING)
        return
    end
    
    local money = GetMoney()
    local limit = value * 10000 -- Gold to copper conversion
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
    self.Options:AddInput(K_DEPOSIT)
end

function Module:BANKFRAME_OPENED()
    local deposit = self.Options:Get(K_DEPOSIT)
    if deposit then DepositFunds(tonumber(deposit)) end
end
