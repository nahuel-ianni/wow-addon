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
            childGroups = "tab",
            args = {}
        }
    end

    self._options.args[category].args[module:GetName()] = {
        type = "group",
        name = module._name,
        desc = module._desc,
        args = settings:GetOptions(),
    }
end

_G[addonName .. "_OnCompartmentClick"] = function()
    LibStub("AceConfigDialog-3.0"):Open(addonName)
end
