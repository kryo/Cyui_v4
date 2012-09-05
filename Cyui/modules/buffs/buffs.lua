local T, C, L, G = unpack(Tukui)

if not C.auras.player then return end

local buffs = TukuiAurasPlayerBuffs
local debuffs = TukuiAurasPlayerDebuffs
local size = TukuiMinimap:GetWidth()

buffs:ClearAllPoints()
buffs:SetPoint("TOPRIGHT", UIParent, -(size+10), -8)
buffs:SetAttribute("xOffset", -35)
buffs:SetAttribute("wrapAfter", 18)
buffs:SetAttribute("wrapYOffset", -45)

debuffs:ClearAllPoints()
debuffs:SetPoint("TOPRIGHT", UIParent, -(size+10), -(size-5))
debuffs:SetAttribute("xOffset", -35)
debuffs:SetAttribute("wrapAfter", 18)
debuffs:SetAttribute("wrapYOffset", -45)

local hooks = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function(self)
	for i = 1, self:GetNumChildren() do
		local child = select(i, self:GetChildren())
		
		if child.Duration then
			child.Duration:SetFont(C.media.uffont, 12, "OUTLINE")
			child.Duration:SetPoint("BOTTOM", 0, -6)
		end
		
		if child.Count then
			child.Count:SetFont(C.media.uffont, 11, "OUTLINE")
			child.Count:SetPoint("TOPRIGHT", -2, -1)
		end
	end
end

for _, frame in pairs(hooks) do
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:HookScript("OnAttributeChanged", OnAttributeChanged)
	frame:HookScript("OnEvent", OnAttributeChanged)
end