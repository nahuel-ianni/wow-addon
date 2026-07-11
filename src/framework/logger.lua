local addonName, ns = ...

local Logger = {}
ns.Log = Logger

local PREFIX = "[ " .. addonName .. " ]"
local LEVELS = {
    Debug   = { color = _G.LIGHTGRAY_FONT_COLOR, force = true  },
    Error   = { color = _G.ERROR_COLOR,          force = true  },
    Info    = { color = _G.NORMAL_FONT_COLOR,    force = false },
    Success = { color = _G.ITEM_GOOD_COLOR,      force = true  },
    Warning = { color = _G.WARNING_FONT_COLOR,   force = true  },
}

local function Log(level, ...)
    local count = select("#", ...)
    local args  = { ... }

    for i = 1, count do args[i] = tostring(args[i]) end
    local msg = table.concat(args, " ")

    print(level.force
        and level.color:WrapTextInColorCode(PREFIX  .. " " .. msg)
        or  level.color:WrapTextInColorCode(PREFIX) .. " " .. msg)
end

for level, config in pairs(LEVELS) do
    Logger[level] = function(_, ...) Log(config, ...) end
end
