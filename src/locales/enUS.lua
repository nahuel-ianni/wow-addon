local addonName, ns = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Names
-- ─────────────────────────────────────────────────────────────────────────────────

L["MN_ARTIFACTS"]  = "Artifact: Underlight's Angler"
L["MN_BANKERS"]    = "Warband bank deposit"
L["MN_CINEMATICS"] = "Cinematic skip"
L["MN_CONTAINERS"] = "Sort bags"
L["MN_MERCHANTS"]  = "Merchant interaction"
L["MN_TRACKERS"]   = "Untrack achievements"

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Descriptions
-- ─────────────────────────────────────────────────────────────────────────────────

L["MD_ARTIFACTS"]  = "Fix the Underlight Angler's artifact UI not displaying perks."
L["MD_BANKERS"]    = "Deposit any excess of gold on the warband bank account."
L["MD_CINEMATICS"] = "Bypass the confirmation popup to skip cinematics."
L["MD_CONTAINERS"] = "Invert the player's bag sorting order."
L["MD_MERCHANTS"]  = "Enable auto repair and auto sell junk options when interacting with a merchant."
L["MD_TRACKERS"]   = "Fix achievements getting stuck in the tracked state when completed by different characters."

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Categories (Settings menu)
-- ─────────────────────────────────────────────────────────────────────────────────

L["MC_ARTIFACTS"]  = "Legacy"
L["MC_BANKERS"]    = "General"
L["MC_CINEMATICS"] = "General"
L["MC_CONTAINERS"] = "General"
L["MC_MERCHANTS"]  = "General"
L["MC_TRACKERS"]   = "General"

-- ─────────────────────────────────────────────────────────────────────────────────
--  String Resources
-- ─────────────────────────────────────────────────────────────────────────────────

L["CUTSCENE_SKIPPED"] = "Cutscene skipped"
L["UNTRACK"]    = "Untracked"
L["WB_DEPOSIT"] = "Bank deposit"
L["WB_WARNING"] = "The warband bank API is experiencing technical difficulties.\nBank interaction's been omitted to prevent any issues."
