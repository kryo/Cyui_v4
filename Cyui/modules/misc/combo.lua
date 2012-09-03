local T, C, L, G = unpack(Tukui)
--[[ 
if not C.unitframes.enable then return end
if C.unitframes.classiccombo == false then
	TukuiCombo:Kill()
end

local pwrh = T.Scale(C.ufsize.powerheight)
local ufw = T.Scale(C.ufsize.unitframewidth)
local parent = TukuiTarget
local stick

if (T.myclass == "ROGUE" or T.myclass == "DRUID") and C.unitframes.movecombobar then
	parent = TukuiPlayer
	stick = true
end

if not parent or C.unitframes.classiccombo then return end

local buffs = parent.Buffs
local MAX_COMBO_POINTS = MAX_COMBO_POINTS

local Colors = {
	[1] = {.69, .31, .31, 1},
	[2] = {.65, .42, .31, 1},
	[3] = {.65, .63, .35, 1},
	[4] = {.46, .63, .35, 1},
	[5] = {.33, .63, .33, 1},
}

local function UpdateBuffs(self, points)
	if stick then return end
	
	if points and points > 0 then
		self:Show()
		
		if buffs then
			buffs:ClearAllPoints()
			buffs:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", -2, pwrh+10)
		end
	else
		self:Hide()
		
		if buffs then
			buffs:ClearAllPoints()
			buffs:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", -2, 5)
		end
	end
end

local function OnUpdate(self)
	local points
	
	if UnitHasVehicleUI("player") then
		points = GetComboPoints("vehicle", "target")
	else
		points = GetComboPoints("player", "target")
	end
	
	if points then
		for i = 1, MAX_COMBO_POINTS do
			if i <= points then
				self[i]:SetAlpha(1)
			else
				self[i]:SetAlpha(.2)
			end
		end
	end
	
	UpdateBuffs(self, points)
end

local TukuiCombo = CreateFrame("Frame", "TukuiCombo", parent)
TukuiCombo:Point("BOTTOMLEFT", parent, "TOPLEFT", 0, 5)
TukuiCombo:SetWidth(ufw)
TukuiCombo:SetHeight(pwrh)
TukuiCombo:SetTemplate("Default")
TukuiCombo:CreateBorder()
TukuiCombo:SetBackdropBorderColor(unpack(C.media.backdropcolor))
TukuiCombo:RegisterEvent("PLAYER_ENTERING_WORLD")
TukuiCombo:RegisterEvent("UNIT_COMBO_POINTS")
TukuiCombo:RegisterEvent("PLAYER_TARGET_CHANGED")
TukuiCombo:SetScript("OnEvent", OnUpdate)
TukuiCombo:Show()

for i = 1, 5 do
	TukuiCombo[i] = CreateFrame("StatusBar", "TukuiComboBar"..i, TukuiCombo)
	TukuiCombo[i]:Height(pwrh)
	TukuiCombo[i]:SetStatusBarTexture(C.media.normTex)
	TukuiCombo[i]:GetStatusBarTexture():SetHorizTile(false)
	TukuiCombo[i]:SetFrameLevel(TukuiCombo:GetFrameLevel() + 1)
	TukuiCombo[i]:SetStatusBarColor(unpack(Colors[i]))
	
	if i == 1 then
		TukuiCombo[i]:Point("LEFT", TukuiCombo, "LEFT", 0, 0)
		TukuiCombo[i]:Width(ufw/5)
	else
		TukuiCombo[i]:Point("LEFT", TukuiCombo[i-1], "RIGHT", 1, 0)
		TukuiCombo[i]:Width(ufw/5-1)
	end
end ]]