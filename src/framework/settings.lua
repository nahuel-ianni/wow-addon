local addonName, ns = ...

function ns.Addon:CreateSettings()
    self._options = {
        name = addonName,
        type = "group",
        args = {}
    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, self._options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)
end

function ns.Addon:RegisterModuleOptions(module, settings)
    local category = module._category

    if not self._options.args[category] then
        self._options.args[category] = {
            type = "group",
            name = category,
            args = {}
        }
    end

    for key, args in pairs(settings:GetOptions()) do
        local uniqueKey = module:GetName() .. "_" .. key
        self._options.args[category].args[uniqueKey] = args
    end
end

_G[addonName .. "_OnCompartmentClick"] = function()
    LibStub("AceConfigDialog-3.0"):Open(addonName)
end
