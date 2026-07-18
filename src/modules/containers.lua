local _, ns = ...
local Module = ns.Addon:NewModule("CONTAINERS")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local SetSortBags = _G.C_Container.SetSortBagsRightToLeft
local SetInsertItems = _G.C_Container.SetInsertItemsLeftToRight

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function UpdateContainerSettings(value)
    -- Blizzard Default: Sort Right to Left = True, Insert Left to Right = True
    SetSortBags(value)
    SetInsertItems(value)
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() UpdateContainerSettings(false) end
function Module:OnDisable() UpdateContainerSettings(true) end
