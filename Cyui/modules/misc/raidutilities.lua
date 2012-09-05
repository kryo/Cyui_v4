local T, C, L, G = unpack(Tukui)

if not C.unitframes.enable then return end
	
TukuiRaidUtilityShowButton:ClearAllPoints()
TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimapZone, "BOTTOM", 0, -3)
TukuiRaidUtility:ClearAllPoints()
TukuiRaidUtility:Point("TOP", TukuiMinimapZone, "BOTTOM", 0, -3)