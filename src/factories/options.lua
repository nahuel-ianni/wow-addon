local _, ns = ...

local Options = {}
Options.__index = Options
ns.Options = Options

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function CreateOption(db, key, name, desc, type, custom)
    local option = {
        type = type,
        name = name,
        desc = desc,

        get = function() return db[key] end,
        set = function(_, value) db[key] = value end,
    }

    if custom then for k, v in pairs(custom) do option[k] = v end end

    return option
end

local function SetModuleState(object)
    local db = object.db
    local module = object.module
    local options = object._options

    module:SetEnabledState(db.enabled)
    options.enabled = CreateOption(db, "enabled", module._name, module._desc, "toggle",
    {
        order = 0,
        width = "full",
        set = function(_, value)
            db.enabled = value
            if value then object.module:Enable() else object.module:Disable() end
        end,
    })
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Object Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Options:Get(key) return self.db[key] end
function Options:GetOptions() return self._options end

function Options:New(addon, module)
    local object = setmetatable({}, Options)

    object.db = addon.db.profile.modules[module:GetName()]
    object.addon = addon
    object.module = module
    object._options = {}

    SetModuleState(object)

    return object
end

function Options:AddToggle(key, name, desc)
    self._options[key] = CreateOption(self.db, key, name, desc, "toggle")
    return self
end
