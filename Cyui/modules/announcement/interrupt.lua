local T, C, L, G = unpack(Tukui)

-- local function BGCheck()
    -- local zone = GetZoneText()
    -- if ((zone == L.pvpzone_AV) or
		-- (zone == L.pvpzone_AB) or
		-- (zone == L.pvpzone_WSG) or
		-- (zone == L.pvpzone_EOTS) or
		-- (zone == L.pvpzone_SOTA) or
		-- (zone == L.pvpzone_TBFG)) then
        -- check = true
	-- end
	-- return check
-- end

-- interrupt announcer
if C.announcement.interrupt ~= true then return end

local interrupt = CreateFrame("Frame")
interrupt:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player")) then return end
	
	if GetNumSubgroupMembers() > 0  then
		SendChatMessage(GetSpellLink(spellID).." interrupted.", "PARTY")
	elseif (GetNumSubgroupMembers() > 0 and not UnitInRaid("player")) then
		SendChatMessage(GetSpellLink(spellID).." interrupted.", "RAID")
	-- else
		-- SendChatMessage(GetSpellLink(spellID).." interrupted.", "SAY")
	end
end)