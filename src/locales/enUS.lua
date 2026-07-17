local addonName = ...

local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Names
-- ─────────────────────────────────────────────────────────────────────────────────

L["MN_CONTAINERS"] = "Sort bags"
L["MN_TRACKERS"]   = "Untrack achievements"

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Descriptions
-- ─────────────────────────────────────────────────────────────────────────────────

L["MD_CONTAINERS"] = "Invert the player's bag sorting order."
L["MD_TRACKERS"]   = "Fix achievements getting stuck in the tracked state when completed by different characters."

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Categories (Settings menu)
-- ─────────────────────────────────────────────────────────────────────────────────

L["MC_CONTAINERS"] = "General"
L["MC_TRACKERS"]   = "General"

-- ─────────────────────────────────────────────────────────────────────────────────
--  String Resources
-- ─────────────────────────────────────────────────────────────────────────────────

L["UNTRACK"] = "Untracked"
