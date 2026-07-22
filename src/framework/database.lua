local addonName, ns = ...

local DB_NAME = "%s_DB"

ns.Addon.defaults = {
    profile = {
        modules = {
            ["*"] = {
                enabled = false,
            },
        },
    },
}

function ns.Addon:CreateDatabase()
    self.db = LibStub("AceDB-3.0"):New(
        DB_NAME:format(addonName:upper()),
        self.defaults,
        true
    )
end
