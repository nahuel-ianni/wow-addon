local _, ns = ...

local Options = {}
Options.__index = Options

ns.Options = Options

local function SetEnabledState(object)
    object.module:SetEnabledState(object.addon.db.profile.modules[object.module:GetName()])

    object._options.enabled = {
        type = "toggle",
        name = object.module._name,
        desc = object.module._desc,

        get = function() return object.module:IsEnabled() end,
        set = function(_, value)
            object.addon.db.profile.modules[object.module:GetName()] = value
            if value then object.module:Enable() else object.module:Disable() end
        end
    }
end

function Options:Get(key) return self.addon.db.profile.modules[self.module:GetName()][key] end
function Options:GetOptions() return self._options end

function Options:New(addon, module)
    local object = setmetatable({}, Options)
    local moduleName = module:GetName()

    object.addon = addon
    object.module = module
    object._options = {}
        
    SetEnabledState(object)
    addon:RegisterModuleOptions(module, object)
    return object
end

function Options:SetToggle(key, name, desc, default)
    local moduleName = self.module:GetName()

    self.addon.db.profile.modules[moduleName] = self.addon.db.profile.modules[moduleName] or {}
    self.addon.db.profile.modules[moduleName][key] = default or false

    self._options[key] = {
        type = "toggle",
        name = name,
        desc = desc,

        get = function() return  self.addon.db.profile.modules[moduleName][key] end,
        set = function(_, value) self.addon.db.profile.modules[moduleName][key] = value end
    }

    return self
end
