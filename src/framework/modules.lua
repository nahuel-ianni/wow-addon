-- local addonName, ns = ...

-- local MODULE_NAME = "M_%s"
-- local MODULE_DESC = "MD_%s"

-- local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-- function ns.Addon:CreateModule(name, ...)
--     local module = self:NewModule(name, ...)
--     module._name = L[MODULE_NAME:format(name)]
--     module._desc = L[MODULE_DESC:format(name)]
--     module._options = {}
    
--     module.Log = ns.Log
    
--     return module
-- end






local addonName, ns = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local MODULE_NAME = "M_%s"
local MODULE_DESC = "MD_%s"

local Prototype = {}

function Prototype:OnInitialize()
    self._name = L[MODULE_NAME:format(self:GetName())]
    self._desc = L[MODULE_DESC:format(self:GetName())]
    self._options = {}

    self.L = L
    self.Log = ns.Log
end

function Prototype:GetOptions() return self._options end
function Prototype:AddOption(key, option) self._options[key] = option end

ns.Addon:SetDefaultModulePrototype(Prototype)
