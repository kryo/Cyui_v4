local T, C, L, G = unpack(Tukui)

-- watchframe
TukuiWatchFrameAnchor:ClearAllPoints()
TukuiWatchFrameAnchor:Point("TOPRIGHT", UIParent, -110, -175)

-- achievements
TukuiAchievementHolder:ClearAllPoints()
TukuiAchievementHolder:SetPoint("CENTER", UIParent, "CENTER", 0, 275)

-- durability
hooksecurefunc(DurabilityFrame,"SetPoint",function(self,_,parent)
    if (parent == "MinimapCluster") or (parent == _G["MinimapCluster"]) then
        self:ClearAllPoints()
		self:Point("BOTTOMLEFT", UIParent, 25, C.chat.height+75)
    end
end)

-- vehicle
TukuiVehicleAnchor:ClearAllPoints()
TukuiVehicleAnchor:SetPoint("TOP", UIParent, 0, -150)

-- loot
if C.loot.lootframe == true then
	TukuiRollAnchor:ClearAllPoints()
	TukuiRollAnchor:SetPoint("TOP", UIParent, "TOP", 0, -300)
end

-- menu
GameMenuFrame:SetMovable(true)
GameMenuFrame:SetScript("OnMouseDown", function() GameMenuFrame:ClearAllPoints() GameMenuFrame:StartMoving() end)
GameMenuFrame:SetScript("OnMouseUp", function() GameMenuFrame:StopMovingOrSizing() end)

VideoOptionsFrame:SetMovable(true)
VideoOptionsFrame:SetScript("OnMouseDown", function() VideoOptionsFrame:ClearAllPoints() VideoOptionsFrame:StartMoving() end)
VideoOptionsFrame:SetScript("OnMouseUp", function() VideoOptionsFrame:StopMovingOrSizing() end)

InterfaceOptionsFrame:SetMovable(true)
InterfaceOptionsFrame:SetScript("OnMouseDown", function() InterfaceOptionsFrame:ClearAllPoints() InterfaceOptionsFrame:StartMoving() end)
InterfaceOptionsFrame:SetScript("OnMouseUp", function() InterfaceOptionsFrame:StopMovingOrSizing() end)

HelpFrame:SetMovable(true)
HelpFrame:SetScript("OnMouseDown", function() HelpFrame:ClearAllPoints() HelpFrame:StartMoving() end)
HelpFrame:SetScript("OnMouseUp", function() HelpFrame:StopMovingOrSizing() end)

-- hook for T.AllowFrameMoving
local ENABLE_MOVE = false
local function MoveUI()
	if InCombatLockdown() then return end
	if ENABLE_MOVE then
		ENABLE_MOVE = false
	else
		ENABLE_MOVE = true
	end
	
	local movers = {
		FilgerPlayerBuffMover,
		FilgerPlayerDebuffMover,
		FilgerPlayerProcMover,
		FilgerTargetProcMover,
		FilgerTargetBuffMover,
		FilgerTargetDebuffMover,
		FilgerMiscMover
	}
	
	if FilgerPlayerBuffMover or FilgerPlayerDebuffMover or FilgerPlayerProcMover or FilgerTargetProcMover or FilgerTargetBuffMover or FilgerTargetDebuffMover then
		if ENABLE_MOVE then
			for _, panels in pairs(movers) do
				panels:Show()
			end
		else
			for _, panels in pairs(movers ) do
				panels:Hide()
			end
		end
	end
	
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
end
hooksecurefunc(_G.SlashCmdList, "MOVING", MoveUI)