local T, C, L, G = unpack(Tukui)

-- bag position
local function TukuiBagPosNew()
	if TukuiBags then
		TukuiBags:ClearAllPoints()
		TukuiBags:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 10)
	end
	
	if TukuiBank then
		TukuiBank:ClearAllPoints()
		TukuiBank:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	end
end
TukuiBags:HookScript("OnUpdate", function(self) TukuiBagPosNew() end)