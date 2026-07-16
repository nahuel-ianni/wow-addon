local _, ns = ...

local Options = {}
Options.__index = Options

ns.Options = Options

function Options:Get(key)
    local moduleName = self.module:GetName()
    return self.addon.db.profile.modules[moduleName][key]
end

function Options:GetOptions() return self._options end

function Options:New(addon, module)
    local object = setmetatable({}, Options)
    local name = module:GetName()

    object.addon = addon
    object.module = module
    object._options = {}
    object._options.enabled = {
        type = "toggle",
        name = module._name,
        desc = module._desc,

        get = function() return module:IsEnabled() end,
        set = function(_, value)
            if value then
                module:Enable()
            else
                module:Disable()
            end
        end
    }

    addon:RegisterModuleOptions(module, object)
    return object
end

function Options:SetToggle(key, name, desc, default)
    local moduleName = self.module:GetName()

    self.module.defaults[moduleName] = self.module.defaults[moduleName] or {}
    self.module.defaults[moduleName][key] = default or false

    self._options[key] = {
        type = "toggle",
        name = name,
        desc = desc,

        get = function() return  self.addon.db.profile.modules[moduleName][name] end,
        set = function(_, value) self.addon.db.profile.modules[moduleName][name] = value end
    }

    return self
end
