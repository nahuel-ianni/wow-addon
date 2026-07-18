local _, ns = ...
local Module = ns.Addon:NewModule("ARTIFACTS")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local UNDERLIGHT_ANGLER_ID = 133755

local ArtifactUI = _G.C_ArtifactUI
local CachedCallback = _G.C_ArtifactUI.GetArtifactTier

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function FixedCallback()
    local tier = CachedCallback()

    return ArtifactUI.GetArtifactItemID() == UNDERLIGHT_ANGLER_ID
        and math.max(tier, 1)
        or tier
end

local function UpdateFunction(callback)
    ArtifactUI.GetArtifactTier = callback

    local frame = _G.ArtifactFrame
    if frame and frame.PerksTab then frame.PerksTab:Refresh() end
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable() UpdateFunction(FixedCallback) end
function Module:OnDisable() UpdateFunction(CachedCallback) end
