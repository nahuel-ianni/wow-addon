local _, ns = ...
local Module = ns.Addon:NewModule("INDICATORS")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local FRAME_EVENTS = {
    ["PetFrame"]    = "UNIT_COMBAT",
    ["PlayerFrame"] = "UNIT_COMBAT",
}

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable()
    for name, event in pairs(FRAME_EVENTS) do
        local frame = _G[name]
        if frame then frame:UnregisterEvent(event) end
    end
end

function Module:OnDisable()
    for name, event in pairs(FRAME_EVENTS) do
        local frame = _G[name]
        if frame then frame:RegisterEvent(event) end
    end
end
