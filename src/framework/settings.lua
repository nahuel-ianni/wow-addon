local addonName, ns = ...

function ns.Addon:CreateSettings()
    print("Creating settings.")

    self.options = { name = addonName, type = "group", args = {} }

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)
end
