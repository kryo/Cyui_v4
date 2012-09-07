local T, C, L, G = unpack(Tukui)

-- interrupt announcer
if C.announcement.interrupt ~= true then return end

local interrupt = CreateFrame("Frame")
interrupt:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt:SetScript("OnEvent", function(self, _, ...)
	local inInstance, instanceType = IsInInstance()
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player")) then return end
	
	if IsInRaid() then
		SendChatMessage(GetSpellLink(spellID).." interrupted.", "RAID")
	elseif IsInGroup() then
		SendChatMessage(GetSpellLink(spellID).." interrupted.", "PARTY")
	elseif (inInstance and instanceType == "pvp" and C.announcement.bg) then
		SendChatMessage(GetSpellLink(spellID).." interrupted.", "BATTLEGROUND")
	end
end)