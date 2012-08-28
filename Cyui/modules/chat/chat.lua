local T, C, L, G = unpack(Tukui)

if not C.chat.enable then return end

local width = T.Scale(C.chat.width)
local height = T.Scale(C.chat.height)
local adjust = 0
if C.chat.background == true then adjust = 10 end

T.SetDefaultChatPosition = function(frame)
	if frame then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo(id)
		
		frame:SetSize(width+1, height)
		SetChatWindowSavedDimensions(id, width+1, height)
		
		if (id == 1) then
			frame:ClearAllPoints()
			frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10+adjust, 10+adjust)
		elseif (id == 5 and name == LOOT) then
			if C.chat.loot == true then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -(10+adjust), 10+adjust)
				frame:SetJustifyH("RIGHT")
			else
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10+adjust, 10+adjust)
				frame:SetJustifyH("LEFT")
				if not frame.isLocked then FCF_SetLocked(frame, 4) end
			end
		end
		
		FCF_SavePositionAndDimensions(frame)
		
		if not frame.isLocked then FCF_SetLocked(frame, 1) end
	end
end
hooksecurefunc("FCF_RestorePositionAndDimensions", T.SetDefaultChatPosition)

local function SetChatStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]
	
	_G[chat.."TabText"]:SetTextColor(unpack(C.media.datatextcolor2))
	_G[chat.."TabText"]:SetFont(C.media.font, 11, "THINOUTLINE")
	_G[chat.."TabText"].SetTextColor = T.dummy
end

TukuiChat:HookScript("OnEvent", function(self, event, ...)
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format("ChatFrame%s", i)]
		SetChatStyle(chat)

		button = _G["TukuiButtonCF"..i]
		button:ClearAllPoints()
		button:SetPoint("BOTTOMLEFT", 5, 5)
	end
end)