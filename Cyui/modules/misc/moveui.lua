local T, C, L, G = unpack(Tukui)

-- watchframe
TukuiWatchFrameAnchor:ClearAllPoints()
TukuiWatchFrameAnchor:Point("TOPRIGHT", UIParent, -110, -175)

-- achievements
TukuiAchievementHolder:ClearAllPoints()
TukuiAchievementHolder:SetPoint("CENTER", UIParent, "CENTER", 0, 200)

-- durability
hooksecurefunc(DurabilityFrame,"SetPoint",function(self,_,parent)
    if (parent == "MinimapCluster") or (parent == _G["MinimapCluster"]) then
        self:ClearAllPoints()
		self:Point("BOTTOMLEFT", UIParent, 25, C.chat.height+75)
    end
end)

-- vehicle
TukuiVehicleAnchor:ClearAllPoints()
TukuiVehicleAnchor:SetPoint("TOP", UIParent, 0, -200)

-- loot
if C.loot.lootframe == true then
	TukuiRollAnchor:ClearAllPoints()
	TukuiRollAnchor:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 400)
end