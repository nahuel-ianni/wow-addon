local _, ns = ...
local Module = ns.Addon:NewModule("CONTAINERS")

local SetSortBags = _G.C_Container.SetSortBagsRightToLeft
local SetInsertItems = _G.C_Container.SetInsertItemsLeftToRight

local function UpdateContainerSettings(value)
    -- Blizzard Default: Sort Right to Left = True, Insert Left to Right = True
    SetSortBags(value)
    SetInsertItems(value)
end

function Module:OnEnable() UpdateContainerSettings(false) end
function Module:OnDisable() UpdateContainerSettings(true) end
