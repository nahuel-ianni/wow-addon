local addonName, ns = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local MODULE_NAME = "M_%s"
local MODULE_DESC = "MD_%s"

local Prototype = {}

function Prototype:OnInitialize()
    self._name = L[MODULE_NAME:format(self:GetName())]
    self._desc = L[MODULE_DESC:format(self:GetName())]
    
    self.L = L
    self.Log = ns.Log
    self.Options = ns.Options:New(ns.Addon, self)
end

ns.Addon:SetDefaultModulePrototype(Prototype)
