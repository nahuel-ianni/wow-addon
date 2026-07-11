local _, ns = ...
local Module = ns.Addon:CreateModule("Welcome")

local Log = ns.Log

function Module:OnInitialize()
    Log:Debug(Module:GetName(), "Debug message.")
    Log:Error(Module:GetName(), "Error message.")
    Log:Info(Module:GetName(), "Info message.")
    Log:Success(Module:GetName(), "Success message.")
    Log:Warning(Module:GetName(), "Warning message.")
end
