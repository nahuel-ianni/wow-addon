local _, ns = ...

-- ─────────────────────────────────────────────────────────────────────────────────
--  Local Variables
-- ─────────────────────────────────────────────────────────────────────────────────

local Frames = {}
Frames.__index = Frames
ns.Frames = Frames

local CreateFrame = _G.CreateFrame

-- ─────────────────────────────────────────────────────────────────────────────────
--  Object Functions
-- ─────────────────────────────────────────────────────────────────────────────────

function Frames:GetLabel(parent)
    local paddingX = 4
    local paddingY = 2

    local frame = CreateFrame("Frame", nil, parent)
    frame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT")
    frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT")
    frame:Hide()

    frame.bg = frame:CreateTexture(nil, "BACKGROUND")
    frame.bg:SetAllPoints()
    frame.bg:SetColorTexture(0, 0, 0, 0.5)

    frame.text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    frame.text:SetPoint("CENTER")
    frame.text:SetJustifyH("CENTER")
    frame.text:SetJustifyV("MIDDLE")

    function frame:SetText(text)
        if not text or text == "" then
            self:Hide()
            return
        end

        self.text:SetText(text)

        self:SetHeight(self.text:GetStringHeight() + (paddingY * 2))
        self:Show()
    end

    return frame
end
