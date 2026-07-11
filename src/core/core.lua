local addonName, ns = ...
local addon = LibStub("AceAddon-3.0"):NewAddon(addonName)

ns.Addon = addon

function addon:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New(addonName:upper() .. "_DB", defaults, true)
    self.options = { name = addonName, type = "group", args = {} }

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)
end
