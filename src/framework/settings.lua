local addonName, ns = ...

local function InitSettings(addon)
    addon._options = {
        name = addonName,
        type = "group",
        childGroups = "tree",
        args = {}
    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, addon._options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)
end

local function PopulateSettings(addon)
    for name, module in addon:IterateModules() do
        options = module:GetOptions()
        if options then addon._options.args[name] = options end
    end
end

function ns.Addon:CreateSettings()
    InitSettings(self)
    -- Create categories ?
    PopulateSettings(self)
end

_G[addonName .. "_OnCompartmentClick"] = function()
    LibStub("AceConfigDialog-3.0"):Open(addonName)
end
