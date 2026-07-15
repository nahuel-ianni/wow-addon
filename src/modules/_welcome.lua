local _, ns = ...
local Module = ns.Addon:NewModule("WELCOME", "AceEvent-3.0")

function Module:OnEnable()
    self:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
end

function Module:OnDisable()
    self:UnregisterAllEvents()
end

function Module:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(...)
    self.Log:Debug(Module:GetName(), ...)
end