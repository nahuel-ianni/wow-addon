local _, ns = ...
local Module = ns.Addon:NewModule("FISHING", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local FISHING_SPELL = _G.C_Spell.GetSpellName(131474)
local FISHING_SPELLS = { [131474] = true, [131490] = true, [131476] = true, [7620] = true, }
local SOFT_TARGET_INTERACT, SOFT_TARGET_INTERACT_V = "SoftTargetInteract", "3"
local K_FISHING, PLAYER, INTERACT_TARGET = "KEY_FISHING", "player", "INTERACTTARGET"

local After = _G.C_Timer.After
local GetCVar, SetCVar = _G.GetCVar, _G.SetCVar
local InCombatLockdown, ClearOverrideBindings = _G.InCombatLockdown, _G.ClearOverrideBindings
local SetOverrideBinding, SetOverrideBindingSpell = _G.SetOverrideBinding, _G.SetOverrideBindingSpell

local frame = _G.CreateFrame("Frame")
local cachedCVar

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

local function IsFishing(unit, spellID)
    return unit == PLAYER and FISHING_SPELLS[spellID]
end

local function ApplyBinding(interact)
    if InCombatLockdown() then return end

    if interact then
        SetOverrideBinding(frame, false, Module.Options:Get(K_FISHING), INTERACT_TARGET)
    else
        SetOverrideBindingSpell(frame, false, Module.Options:Get(K_FISHING), FISHING_SPELL)
    end
end

local function SetInteractCVar(enable)
    if enable then
        cachedCVar = cachedCVar or GetCVar(SOFT_TARGET_INTERACT)
        return SetCVar(SOFT_TARGET_INTERACT, SOFT_TARGET_INTERACT_V)
    end

    if not cachedCVar then return end

    SetCVar(SOFT_TARGET_INTERACT, cachedCVar)
    cachedCVar = nil
end

local function StartFishing()
    SetInteractCVar(true)
    ApplyBinding(true)
end

local function StopFishing()
    ApplyBinding(false)
    SetInteractCVar(false)
end

-- ─────────────────────────────────────────────────────────────────────────────────
--  Module Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Module:OnEnable()
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
    self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")

    ApplyBinding(false)
end

function Module:OnDisable()
    ClearOverrideBindings(frame)
    SetInteractCVar(false)
    self:UnregisterAllEvents()
end

function Module:InjectOptions()
    self.Options:AddKeybind(K_FISHING)
end

function Module:PLAYER_REGEN_ENABLED()
    ApplyBinding(cachedCVar ~= nil)
end

function Module:UNIT_SPELLCAST_CHANNEL_START(_, unit, _, spellID)
    if IsFishing(unit, spellID) then StartFishing() end
end

function Module:UNIT_SPELLCAST_CHANNEL_STOP(_, unit, _, spellID)
    if IsFishing(unit, spellID) then After(0.5, StopFishing) end
end
