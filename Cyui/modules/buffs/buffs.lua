local T, C, L, G = unpack(Tukui)

if not C.auras.player then return end

local buffs = TukuiAurasPlayerBuffs
local debuffs = TukuiAurasPlayerDebuffs
local buffadjust = 3

buffs:ClearAllPoints()
buffs:SetPoint("TOPRIGHT", UIParent, -(C.ufsize.minimapsize+15), -7)
buffs:SetAttribute("xOffset", -35)
buffs:SetAttribute("wrapAfter", 15+buffadjust)
buffs:SetAttribute("wrapYOffset", -45)

debuffs:ClearAllPoints()
debuffs:SetPoint("TOPRIGHT", UIParent, -(C.ufsize.minimapsize+15), -(C.ufsize.minimapsize))
debuffs:SetAttribute("xOffset", -35)
debuffs:SetAttribute("wrapAfter", 15+buffadjust)
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