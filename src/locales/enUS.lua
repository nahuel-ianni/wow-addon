local addonName, ns = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module/Settings Names
-- ─────────────────────────────────────────────────────────────────────────────────

L["N_ARTIFACTS"]  = "Artifact: Underlight's Angler"
L["N_BANKERS"]    = "Warband bank deposit"
L["N_CINEMATICS"] = "Cinematic skip"
L["N_CONTAINERS"] = "Sort bags"
L["N_ENABLED"]    = "Enable module"
L["N_INDICATORS"] = "Frame indicators"
L["N_MERCHANTS"]  = "Merchant interaction"
L["N_TRACKERS"]   = "Untrack achievements"

L["N_KEY_DEPOSIT"] = "Warband bank deposit"
L["N_KEY_REPAIR"]  = "Repair gear"
L["N_KEY_REPAIR_GUILD"] = "Repair gear (guild)"
L["N_KEY_SELL"]    = "Sell junk"

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module/Settings Descriptions
-- ─────────────────────────────────────────────────────────────────────────────────

L["D_ARTIFACTS"]  = "Fix the Underlight Angler's artifact UI not displaying perks."
L["D_BANKERS"]    = "Deposit any excess of gold on the warband bank account."
L["D_CINEMATICS"] = "Bypass the confirmation popup to skip cinematics."
L["D_CONTAINERS"] = "Invert the player's bag sorting order."
L["D_ENABLED"]    = "Enable module"
L["D_INDICATORS"] = "Remove damage and healing indicators from the player and pet frames."
L["D_MERCHANTS"]  = "Enable auto repair and auto sell junk options when interacting with a merchant."
L["D_TRACKERS"]   = "Fix achievements getting stuck in the tracked state when completed by different characters."

L["D_KEY_DEPOSIT"] = "The maximum amount of gold to keep per character."
L["D_KEY_REPAIR"]  = "Attempt to use personal funds when repairing gear items automatically."
L["D_KEY_REPAIR_GUILD"] = "Attempt to use guild funds when repairing gear items automatically."
L["D_KEY_SELL"]    = "Sell all junk items automatically."

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Categories (Settings menu)
-- ─────────────────────────────────────────────────────────────────────────────────

L["C_ARTIFACTS"]  = "Legacy"
L["C_BANKERS"]    = "General"
L["C_CINEMATICS"] = "General"
L["C_CONTAINERS"] = "General"
L["C_INDICATORS"] = "General"
L["C_MERCHANTS"]  = "General"
L["C_TRACKERS"]   = "General"

-- ─────────────────────────────────────────────────────────────────────────────────
--  String Resources
-- ─────────────────────────────────────────────────────────────────────────────────

L["CUTSCENE_SKIPPED"] = "Cutscene skipped"
L["UNTRACK"]          = "Untracked"
L["WB_DEPOSIT"]       = "Bank deposit"
L["WB_WARNING"]       = "The warband bank experiencing technical difficulties.\nBank interaction's been omitted to prevent any issues."
