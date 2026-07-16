local addonName, ns = ...

local DB_NAME = "%s_DB"

function ns.Addon:CreateDatabase()
    self.db = LibStub("AceDB-3.0"):New(
        DB_NAME:format(addonName:upper()),
        {
            profile = {
                modules = {}
            }
        },
        true)
end
