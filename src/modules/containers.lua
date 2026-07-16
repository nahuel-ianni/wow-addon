local _, ns = ...
local Module = ns.Addon:NewModule("CONTAINERS")

local SetSortBags = _G.C_Container.SetSortBagsRightToLeft
local GetSortBags = _G.C_Container.GetSortBagsRightToLeft
local SetInsertItems = _G.C_Container.SetInsertItemsLeftToRight
local GetInsertItems = _G.C_Container.GetInsertItemsLeftToRight

local function UpdateContainerSettings(invert)
    -- Invert = true means we want the "Inverted" behavior (False in Blizzard terms)
    -- Blizzard Default: Sort Right to Left = True, Insert Left to Right = True
    if GetSortBags() ~= invert then SetSortBags(invert) end
    if GetInsertItems() ~= invert then SetInsertItems(invert) end
end

function Module:OnEnable() UpdateContainerSettings(false) end
function Module:OnDisable() UpdateContainerSettings(true) end
