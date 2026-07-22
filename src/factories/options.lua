local _, ns = ...

local Options = {}
Options.__index = Options
ns.Options = Options

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function SetModuleState(object)
    local db = object.db

    if db.enabled == nil then db.enabled = false end

    object.module:SetEnabledState(db.enabled)

    object._options.enabled = {
        type = "toggle",
        name = object.module._name,
        desc = object.module._desc,
        order = 0,
        width = "full",

        get = function() return db.enabled end,
        set = function(_, value)
            db.enabled = value
            if value then object.module:Enable() else object.module:Disable() end
        end,
    }
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Object Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Options:Get(key) return self.db[key] end
function Options:GetOptions() return self._options end

function Options:New(addon, module)
    local object = setmetatable({}, Options)

    object.addon = addon
    object.module = module
    object.db = addon.db.profile.modules[module:GetName()]
    object._options = {}

    SetModuleState(object)

    return object
end

function Options:AddToggle(key, name, desc, default)
    if self.db[key] == nil then self.db[key] = default or false end

    self._options[key] = {
        type = "toggle",
        name = name,
        desc = desc,

        get = function() return self.db[key] end,
        set = function(_, value) self.db[key] = value end,
    }

    return self
end
