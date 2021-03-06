local T, C, L, G = unpack(Tukui)

local chatwidth = C.chat.width
local chatheight = C.chat.height

T.ChatSetup = function()
	
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow(L.chat_trade)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)
	FCF_OpenNewWindow(L.chat_whisper)
	FCF_SetLocked(ChatFrame4, 1)
	FCF_DockFrame(ChatFrame4)
	
	if C.chat.loot == true then
		FCF_OpenNewWindow(LOOT)
		FCF_UnDockFrame(ChatFrame5)
		FCF_SetLocked(ChatFrame5, 1)
	else
		FCF_OpenNewWindow(LOOT)
		FCF_DockFrame(ChatFrame5)
		FCF_SetLocked(ChatFrame5, 1)
	end
	ChatFrame5:Show()
	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local id = frame:GetID()
		
		FCF_SetChatWindowFontSize(nil, frame, 12)
		frame:Size(chatwidth, chatheight)
		SetChatWindowSavedDimensions(id, T.Scale(chatwidth), T.Scale(chatheight))
		FCF_SavePositionAndDimensions(frame)
		
		if i == 1 then FCF_SetWindowName(frame, "Gen") end
		if i == 2 then FCF_SetWindowName(frame, "Log") end
		
		T.SetDefaultChatPosition(frame)
	end
	
	-- general chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_trade)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_general)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_defense)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_recrutment)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_lfg)
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")	
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	
	-- trade chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddChannel(ChatFrame3, L.chat_trade)
	ChatFrame_AddChannel(ChatFrame3, L.chat_general)
	ChatFrame_AddChannel(ChatFrame3, L.chat_defense)
	ChatFrame_AddChannel(ChatFrame3, L.chat_recrutment)
	ChatFrame_AddChannel(ChatFrame3, L.chat_lfg)
	
	-- whisper chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddMessageGroup(ChatFrame4, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "WHISPER")
	
	-- loot chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame5)
	ChatFrame_AddMessageGroup(ChatFrame5, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame5, "CURRENCY")
	ChatFrame_AddMessageGroup(ChatFrame5, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame5, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame5, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame5, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame5, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame5, "COMBAT_GUILD_XP_GAIN")
	
	-- classcolor
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
end

-- Not on live!!
-- local function CyCVars()
	-- SetCVar("lootUnderMouse", 1)
	-- SetCVar("autoLootDefault", 1)
	-- SetCVar("nameplateShowEnemies", 1)
	-- SetCVar("nameplateShowEnemyPets", 1)
	-- SetCVar("cameraDistanceMax", 50)
	-- SetCVar("cameraDistanceMaxFactor", 3.4)
	-- SetCVar("Maxfps", 120)
	-- SetCVar("autoDismountFlying", 1)
	--SetCVar("showLootSpam", 0)
	-- SetCVar("chatBubbles", 1)
	-- SetCVar("UnitNameOwn", 0)
	-- SetCVar("UnitNameNPC", 1)
	-- SetCVar("UnitNameFriendlyPlayerName", 1)
	-- SetCVar("UnitNameEnemyPlayerName", 1)
	-- SetCVar("secureAbilityToggle", 1)

	--SetCVar("taintlog", 1)
-- end

local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if C.general.welcomemsg == true then
		print(L.logon_welcome1)
		print(L.logon_welcome2)
	end
	
	-- CyCVars()
end)