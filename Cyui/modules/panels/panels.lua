local T, C, L, G = unpack(Tukui)

local ps = T.Scale(C.datatext.panelsize)

if C.unitframes.backgroundpanels ~= true then
	TukuiBar1:StripTextures()
	TukuiBar2:StripTextures()
	TukuiBar3:StripTextures()
	TukuiBar4:StripTextures()
	TukuiBar5:StripTextures()
	TukuiBar6:StripTextures()
	TukuiBar7:StripTextures()
	TukuiPetBar:StripTextures()
end

TukuiBar1:ClearAllPoints()
TukuiBar1:SetPoint("BOTTOM", -((T.buttonsize*6)+(T.buttonspacing*6)), ps+T.buttonspacing)
TukuiBar1:SetWidth(T.buttonsize*12+T.buttonspacing*13)
TukuiBar1:SetHeight(T.buttonsize+T.buttonspacing*2)

TukuiBar2:ClearAllPoints()
TukuiBar2:SetPoint("LEFT", TukuiBar1, "RIGHT", -T.buttonspacing, 0)
TukuiBar2:SetWidth(T.buttonsize*12+T.buttonspacing*13)
TukuiBar2:SetHeight(T.buttonsize+T.buttonspacing*2)

TukuiBar3:ClearAllPoints()
TukuiBar4:ClearAllPoints()
TukuiBar5:ClearAllPoints()
TukuiPetBar:ClearAllPoints()

if C.actionbar.dhamphmode == true then
	TukuiBar3:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", 0, 0)
	TukuiBar3:SetWidth(T.buttonsize*12+T.buttonspacing*13)
	TukuiBar3:SetHeight(T.buttonsize+T.buttonspacing)
		
	TukuiBar4:SetPoint("BOTTOMRIGHT", TukuiBar2, "TOPRIGHT", 0, 0)
	TukuiBar4:SetWidth(T.buttonsize*12+T.buttonspacing*13)
	TukuiBar4:SetHeight(T.buttonsize+T.buttonspacing)
		
	TukuiBar5:SetPoint("RIGHT", UIParent, "RIGHT", -10, -T.buttonspacing)
	TukuiBar5:SetWidth(T.buttonsize+T.buttonspacing*2)
	TukuiBar5:SetHeight(T.buttonsize*12+T.buttonspacing*13)
		
	TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
else	
	TukuiBar4:SetPoint("RIGHT", UIParent, "RIGHT", -10, -T.buttonspacing)
	TukuiBar4:SetWidth(T.buttonsize+T.buttonspacing*2)
	TukuiBar4:SetHeight(T.buttonsize*12+T.buttonspacing*13)
		
	TukuiBar5:SetPoint("TOPRIGHT", TukuiBar4, "TOPLEFT", T.buttonspacing, 0)
	TukuiBar5:SetWidth(T.buttonsize+T.buttonspacing*2)
	TukuiBar5:SetHeight(T.buttonsize*12+T.buttonspacing*13)
		
	TukuiBar3:SetPoint("TOPRIGHT", TukuiBar2, -(T.buttonsize*6+T.buttonspacing*6), T.buttonspacing+T.buttonsize)
	TukuiBar3:SetWidth(T.buttonsize*12+T.buttonspacing*13)
	TukuiBar3:SetHeight(T.buttonsize+T.buttonspacing*2)
	TukuiBar3:SetAlpha(1)
	
	TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
end

-- kill panels
local panels = {TukuiLineToPetActionBarBackground, TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABRight, TukuiMinimapStatsRight, TukuiMinimapStatsLeft, TukuiCubeLeft, TukuiCubeRight}
for _, panel in pairs(panels) do
	panel:Kill()
end

local ileft = TukuiInfoLeft
local iright = TukuiInfoRight

-- minimap stat panel
local mapstat = CreateFrame("Frame", "CyMinimapDatatext", TukuiMinimap)
mapstat:Size(50, ps)
mapstat:Point("TOP", TukuiMinimap, "TOP", 0, 5)
mapstat:SetTemplate("Default")
mapstat:SetFrameLevel(TukuiMinimap:GetFrameLevel()+2)

-- middle panel
local ip = CreateFrame("Frame", "CyuiInfoPanel", TukuiBar1)
ip:Size(115, ps)
ip:Point("BOTTOM", UIParent, "BOTTOM", 0, 5)
ip:SetTemplate("Default")
ip:SetFrameLevel(2)
ip:SetFrameStrata("MEDIUM")

-- left panel
ileft:ClearAllPoints()
ileft:SetHeight(ps)
ileft:SetWidth(260)
ileft:SetPoint("RIGHT", ip, "LEFT", -4, 0)

-- right panel
iright:ClearAllPoints()
iright:SetHeight(ps)
iright:SetWidth(260)
iright:SetPoint("LEFT", ip, "RIGHT", 4, 0)

-- cubes
if C.actionbar.cubes then
	local cubeleft = CreateFrame("Frame", "CyCubeLeft", UIParent)
	cubeleft:SetTemplate("Default")
	cubeleft:Size(8)
	cubeleft:Point("TOPRIGHT", ileft, "TOPLEFT", -5, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetFrameLevel(1)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)
	
	-- right cube
	local cuberight = CreateFrame("Frame", "CyCubeRight", UIParent)
	cuberight:SetTemplate("Default")
	cuberight:Size(8)
	cuberight:SetFrameLevel(1)
	cuberight:Point("TOPLEFT", iright, "TOPRIGHT", 5, 0)
	cuberight:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then
			if IsAddOnLoaded("Recount") then
				SlashCmdList.ACECONSOLE_RECOUNT('toggle')
			elseif IsAddOnLoaded("Skada") then
				SlashCmdList.ACECONSOLE_SKADA('toggle')
			end
		elseif btn == "LeftButton" then
			if IsAddOnLoaded("Omen") then
				SlashCmdList.ACECONSOLE_OMEN('toggle')
			end
		elseif btn == "MiddleButton" then
			ToggleAllBags()
		end
	end)
end

-- chat background
if C.chat.background then
	local width = T.Scale(C.chat.width)
	local height = T.Scale(C.chat.height)
	local adjust = 10
	local chatleftbg = G.Panels.LeftChatBackground
	local chatrightbg = G.Panels.RightChatBackground
	local tabsbgleft = G.Panels.LeftChatTabsBackground
	local tabsbgright = G.Panels.RightChatTabsBackground
	
	-- kill new lines
	TukuiLineToABLeftAlt:Kill()
	TukuiLineToABRightAlt:Kill()
	
	-- left chat background
	chatleftbg:ClearAllPoints()
	chatleftbg:SetSize(width+adjust+1, height+adjust+32)
	chatleftbg:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	
	-- left chat tab
	tabsbgleft:SetWidth(C.chat.width-10)
	
	-- right chat background
	if C.chat.loot then
		-- right chat background
		chatrightbg:ClearAllPoints()
		chatrightbg:SetSize(width+adjust+1, height+adjust+32)
		chatrightbg:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 10)
		
		-- right chat tab
		tabsbgright:SetWidth(C.chat.width-10)
	else
		chatrightbg:Kill()
		tabsbgright:Kill()
	end
end

-- filger
if C.filger.enable == true then
	-- player procs
	local fplayerproc = CreateFrame("Frame", "FilgerPlayerProcMover", UIParent)
	fplayerproc:SetTemplate("Default")
	fplayerproc:Size(C.filger.iconsize*3, C.filger.iconsize)
	fplayerproc:Point("RIGHT", UIParent, "CENTER", -200, C.filger.iconsize)
	fplayerproc:SetMovable(true)
	fplayerproc:SetClampedToScreen(true)
	fplayerproc:SetBackdropBorderColor(1,0,0)
	fplayerproc:FontString("Text", C.media.font, 12)
	fplayerproc.Text:SetPoint("CENTER", FilgerPlayerProcMover, "CENTER", 0, 0)
	fplayerproc.Text:SetText("Player Procs")
	fplayerproc:Hide()
	tinsert(T.AllowFrameMoving, fplayerproc)
	
	-- player buffs
	local fplayerbuff = CreateFrame("Frame", "FilgerPlayerBuffMover", UIParent)
	fplayerbuff:SetTemplate("Default")
	fplayerbuff:Size(C.filger.iconsize*3, C.filger.iconsize)
	fplayerbuff:Point("RIGHT", UIParent, "CENTER", -200, 0)
	fplayerbuff:SetMovable(true)
	fplayerbuff:SetClampedToScreen(true)
	fplayerbuff:SetBackdropBorderColor(1,0,0)
	fplayerbuff:FontString("Text", C.media.font, 12)
	fplayerbuff.Text:SetPoint("CENTER", FilgerPlayerBuffMover, "CENTER", 0, 0)
	fplayerbuff.Text:SetText("Player Buffs")
	fplayerbuff:Hide()
	tinsert(T.AllowFrameMoving, fplayerbuff)

	-- player debuffs
	local fplayerdebuff = CreateFrame("Frame", "FilgerPlayerDebuffMover", UIParent)
	fplayerdebuff:SetTemplate("Default")
	fplayerdebuff:Size(C.filger.iconsize*3, C.filger.iconsize)
	fplayerdebuff:Point("RIGHT", UIParent, "CENTER", -200, -C.filger.iconsize)
	fplayerdebuff:SetMovable(true)
	fplayerdebuff:SetClampedToScreen(true)
	fplayerdebuff:SetBackdropBorderColor(1,0,0)
	fplayerdebuff:FontString("Text", C.media.font, 12)
	fplayerdebuff.Text:SetPoint("CENTER", FilgerPlayerDebuffMover, "CENTER", 0, 0)
	fplayerdebuff.Text:SetText("Player Debuffs")
	fplayerdebuff:Hide()
	tinsert(T.AllowFrameMoving, fplayerdebuff)
	
	-- target procs
	local ftargetproc = CreateFrame("Frame", "FilgerTargetProcMover", UIParent)
	ftargetproc:SetTemplate("Default")
	ftargetproc:Size(C.filger.iconsize*3, C.filger.iconsize)
	ftargetproc:Point("LEFT", UIParent, "CENTER", 200, C.filger.iconsize)
	ftargetproc:SetMovable(true)
	ftargetproc:SetClampedToScreen(true)
	ftargetproc:SetBackdropBorderColor(1,0,0)
	ftargetproc:FontString("Text", C.media.font, 12)
	ftargetproc.Text:SetPoint("CENTER", FilgerTargetProcMover, "CENTER", 0, 0)
	ftargetproc.Text:SetText("Target Procs")
	ftargetproc:Hide()
	tinsert(T.AllowFrameMoving, ftargetproc)
	
	-- target buffs
	local ftargetbuff = CreateFrame("Frame", "FilgerTargetBuffMover", UIParent)
	ftargetbuff:SetTemplate("Default")
	ftargetbuff:Size(C.filger.iconsize*3, C.filger.iconsize)
	ftargetbuff:Point("LEFT", UIParent, "CENTER", 200, 0)
	ftargetbuff:SetMovable(true)
	ftargetbuff:SetClampedToScreen(true)
	ftargetbuff:SetBackdropBorderColor(1,0,0)
	ftargetbuff:FontString("Text", C.media.font, 12)
	ftargetbuff.Text:SetPoint("CENTER", FilgerTargetBuffMover, "CENTER", 0, 0)
	ftargetbuff.Text:SetText("Target Buffs")
	ftargetbuff:Hide()
	tinsert(T.AllowFrameMoving, ftargetbuff)
	
	-- target debuffs
	local ftargetdebuff = CreateFrame("Frame", "FilgerTargetDebuffMover", UIParent)
	ftargetdebuff:SetTemplate("Default")
	ftargetdebuff:Size(C.filger.iconsize*3, C.filger.iconsize)
	ftargetdebuff:Point("LEFT", UIParent, "CENTER", 200, -C.filger.iconsize)
	ftargetdebuff:SetMovable(true)
	ftargetdebuff:SetClampedToScreen(true)
	ftargetdebuff:SetBackdropBorderColor(1,0,0)
	ftargetdebuff:FontString("Text", C.media.font, 12)
	ftargetdebuff.Text:SetPoint("CENTER", FilgerTargetDebuffMover, "CENTER", 0, 0)
	ftargetdebuff.Text:SetText("Target Debuffs")
	ftargetdebuff:Hide()
	tinsert(T.AllowFrameMoving, ftargetdebuff)
end

-- datatext position
local DataTextPosition = function(f, t, o)
	local left = TukuiInfoLeft
	local right = TukuiInfoRight
	
	if o == 1 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("LEFT", left, 10, 0)
	elseif o == 2 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("CENTER", left)
	elseif o == 3 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("RIGHT", left, -10, 0)
	elseif o == 4 then
		t:ClearAllPoints()
		t:SetParent(CyuiInfoPanel)
		t:SetHeight(CyuiInfoPanel:GetHeight())
		t:SetPoint("CENTER", CyuiInfoPanel)
	elseif o == 5 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("LEFT", right, 10, 0)
	elseif o == 6 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("CENTER", right)
	elseif o == 7 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("RIGHT", right, -10, 0)
	elseif o == 8 then
		t:ClearAllPoints()
		t:SetParent(CyMinimapDatatext)
		t:SetHeight(CyMinimapDatatext:GetHeight())
		t:SetPoint("CENTER", CyMinimapDatatext)
	else
		f:Hide()
		t:Hide()
	end
end

local datatext = {
	"Guild",
	"Friends",
	"Gold",
	"FPS",
	"System",
	"Bags",
	"Gold",
	"Time",
	"Durability",
	"Heal",
	"Damage",
	"Power",
	"Haste",
	"Crit",
	"Avoidance",
	"Armor",
	"Currency",
	"Hit",
	"Mastery",
	"MicroMenu",
	"Regen",
	"Talent",
	"CallToArms",
}

for _, data in pairs(datatext) do
	local t = "TukuiStat"
	local frame = _G[t..data]
	local text = _G[t..data.."Text"]

	if frame and frame.Option then
		DataTextPosition(frame, text, frame.Option)
	end
end