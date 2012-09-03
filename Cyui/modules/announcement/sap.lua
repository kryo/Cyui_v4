local T, C, L, G = unpack(Tukui)

-- announce sap to party
if not C.announcement.sap then return end

-- Channel output
local Channel
if GetNumGroupMembers() > 0 then
	Channel = "PARTY"
elseif (GetNumSubgroupMembers() > 0 and not UnitInRaid("player")) then
	Channel = "RAID"
else
	Channel = "SAY"
end

local sapped = CreateFrame("Frame")
sapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
sapped:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if not (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH" and sourceGUID == UnitGUID("player")) then return end
	
	if spellID == 6770 then -- sap
		SendChatMessage("Sapped by "..sourceName, CHANNEL)
	end	
end)