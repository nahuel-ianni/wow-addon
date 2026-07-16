local addonName = ...

local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Names
-- ─────────────────────────────────────────────────────────────────────────────────

L["M_CONTAINERS"] = "Sort bags"
L["M_TRACKERS"]   = "Untrack achievements"

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Descriptions
-- ─────────────────────────────────────────────────────────────────────────────────

L["MD_CONTAINERS"] = "Invert the sorting order of the player bags."
L["MD_TRACKERS"]   = "Fix achievements getting stuck in the tracked state when completed by different characters."

-- ─────────────────────────────────────────────────────────────────────────────────
--  String Resources
-- ─────────────────────────────────────────────────────────────────────────────────

L["UNTRACK"] = "Untracked"
