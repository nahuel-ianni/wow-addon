local addonName, ns = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local MODULE_NAME = "N_%s"
local MODULE_DESC = "D_%s"
local MODULE_CATEGORY = "C_%s"

local Prototype = {}

function Prototype:OnInitialize()
    self._name = L[MODULE_NAME:format(self:GetName())]
    self._desc = L[MODULE_DESC:format(self:GetName())]
    self._category = L[MODULE_CATEGORY:format(self:GetName())]

    self.L = L
    self.Log = ns.Log
    self.Options = ns.Options:New(ns.Addon, self)
    
    if self.InjectOptions then self:InjectOptions() end
    ns.Addon:RegisterModuleOptions(self)
end

ns.Addon:SetDefaultModulePrototype(Prototype)
