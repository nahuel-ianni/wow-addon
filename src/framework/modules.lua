local addonName, ns = ...

local MODULE_NAME = "M_%s"
local MODULE_DESC = "MD_%s"

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

function ns.Addon:CreateModule(name, ...)
    local module = self:NewModule(name, ...)
    module._name = L[MODULE_NAME:format(name)]
    module._desc = L[MODULE_DESC:format(name)]
    
    return module
end
