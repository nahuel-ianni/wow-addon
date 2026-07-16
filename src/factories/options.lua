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
    local moduleName = module:GetName()

    object.addon = addon
    object.module = module
    object._options = {}
    
    object._options.enabled = {
        type = "toggle",
        name = module._name,
        desc = module._desc,

        get = function() return addon.db.profile.modules[moduleName].enabled end,
        set = function(_, value)
            addon.db.profile.modules[moduleName].enabled = value

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

    self.addon.defaults.profile.modules[moduleName] = self.addon.defaults.profile.modules[moduleName] or {}
    self.addon.defaults.profile.modules[moduleName][key] = default or false

    self._options[key] = {
        type = "toggle",
        name = name,
        desc = desc,

        get = function() return  self.addon.db.profile.modules[moduleName][key] end,
        set = function(_, value) self.addon.db.profile.modules[moduleName][key] = value end
    }

    return self
end
