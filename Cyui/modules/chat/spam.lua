local T, C, L, G = unpack(Tukui)

if not C.chat.enable then return end

-- tell spec
-- local SpecChange = CreateFrame("Frame")
-- local OnEvent = function(self, event, ...)
	-- if event == "ACTIVE_TALENT_GROUP_CHANGED" then
		-- local specId = GetSpecialization(false, false, group)
		-- _, spec, _, icon = GetSpecializationInfo(specId, false, false)
		-- print(T.RGBToHex(unpack(C.media.datatextcolor2)).."Switched to |T"..icon..":0|t "..spec.." spec.|r")
	-- end
-- end
-- SpecChange:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
-- SpecChange:SetScript("OnEvent", OnEvent)

-- remove spam from new spell and talent switch
function T.SPELL_FILTER(self, event, arg1)
    if strfind(arg1,"You have unlearned") or strfind(arg1,"You have learned a new") or strfind(arg1,"Your pet has unlearned") or strfind(arg1, "Your pet has learned") then
		return true
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", T.SPELL_FILTER)

-- remove spam from duel won/lost
if C.chat.spam == true then
	local function DuelSpamFilter(self, event, arg1)
		if (UnitName("player")) and (arg1:find(UnitName("player"))) then return end
		if (arg1:find("has defeated")) or (arg1:find("has fled from")) then return true end
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", DuelSpamFilter)

	-- remove auction spam
	local function AuctionFilter(self, event, arg1)
		if (arg1:find("A buyer has been found")) or (arg1:find("Auction created")) then return true end
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", AuctionFilter)
end