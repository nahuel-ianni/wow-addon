local _, ns = ...
local Module = ns.Addon:NewModule("FISHING", "AceEvent-3.0")

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local PLAYER = "player"
local K_FISHING = "KEY_FISHING"
local FISHING_SPELL = _G.C_Spell.GetSpellName(131474)
local INTERACT_TARGET = "INTERACTTARGET"

local FISHING_SPELLS = {
    [7620] = true,
    [131474] = true,
    [131476] = true,
    [131490] = true,
}
local SOFT_TARGET = {
    CVAR = "SoftTargetInteract",
    VALUE = "3"
}

local After = _G.C_Timer.After
local GetCVar = _G.GetCVar
local SetCVar = _G.SetCVar
local InCombatLockdown = _G.InCombatLockdown
local SetOverrideBinding = _G.SetOverrideBinding
local ClearOverrideBindings = _G.ClearOverrideBindings
local SetOverrideBindingSpell = _G.SetOverrideBindingSpell

local frame = _G.CreateFrame("Frame")
local cachedCVar

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Functions
-- ─────────────────────────────────────────────────────────────────────────────────

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
        cachedCVar = cachedCVar or GetCVar(SOFT_TARGET.CVAR)
        return SetCVar(SOFT_TARGET.CVAR, SOFT_TARGET.VALUE)
    end

    if not cachedCVar then return end

    SetCVar(SOFT_TARGET.CVAR, cachedCVar)
    cachedCVar = nil
end

local function StartFishing()
    ApplyBinding(true)
    SetInteractCVar(true)
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
    if unit == PLAYER and FISHING_SPELLS[spellID] then StartFishing() end
end

function Module:UNIT_SPELLCAST_CHANNEL_STOP(_, unit, _, spellID)
    if unit == PLAYER and FISHING_SPELLS[spellID] then After(0.5, StopFishing) end
end
