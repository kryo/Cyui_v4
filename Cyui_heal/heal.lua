local T, C, L, G = unpack(Tukui)

if not C.unitframes.enable == true then return end

C.unitframes.gridhealthvertical = true

local bgcolor, normTex, blank, uffont, font, fs, point, columnAnchorPoint, width, height, showParty, showRaid, showPlayer, xOffset, yOffset, columnSpacing, solo
width = T.Scale(58*C["unitframes"].gridscale*T.raidscale)
height = T.Scale(32*C["unitframes"].gridscale*T.raidscale)
showParty = true
showRaid = true
showPlayer = C.unitframes.showplayerinparty
xOffset = T.Scale(5)
yOffset = T.Scale(5)
point = "LEFT"
columnSpacing = T.Scale(5)
columnAnchorPoint = "RIGHT"
bgcolor = C.general.backgroundcolor
normTex = C.media.normTex
blank = C.media.blank
uffont = C.media.uffont
font = C.media.font
fs = 10*C["unitframes"].gridscale*T.raidscale
solo = true -- coding only
	
T.RaidFrameAttributes = function()
	return
	"TukuiRaid",
	nil,
	--"custom [petbattle] hide;show",
	"solo,party,raid",
	"oUF-initialConfigFunction", [[
		local header = self:GetParent()
		self:SetWidth(header:GetAttribute("initial-width"))
		self:SetHeight(header:GetAttribute("initial-height"))
	]],
	"initial-width", T.Scale(width),
	"initial-height", T.Scale(height),
	"showParty", showParty,
	"showRaid", showRaid,
	"showPlayer", showPlayer,
	--"showSolo", solo,
	"xoffset", xOffset,
	"yOffset", yOffset,
	"point", point,
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", columnSpacing,
	"columnAnchorPoint", columnAnchorPoint
end
	
T.PostUpdateRaidUnit = function(self)
	-- panel
	self.panel:Kill()

	if C["unitframes"].raidunitdebuffwatch == true then
		self.RaidDebuffs:Kill()
		self.RaidDebuffs.icon:Kill()
	end
	
	local panel = CreateFrame("Frame", nil, self)
	panel:SetTemplate("Default")
	panel:Point("TOPRIGHT", self, "TOPRIGHT", 2, 2)
	panel:Point("BOTTOMLEFT", self, "BOTTOMLEFT", -2, -2)
	panel:SetFrameLevel(2)
	panel:SetFrameStrata("MEDIUM")
	self.panel = panel
	
	self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0, 0, 0)
	self:SetFrameLevel(1)
	
	local color = RAID_CLASS_COLORS[T.myclass]
	self:HighlightUnit(color.r,color.g,color.b,1)
	
	-- healthbar
	self.Health:ClearAllPoints()
	self.Health:SetPoint("TOPLEFT")
	self.Health:SetPoint("TOPRIGHT")
	self.Health:SetHeight(28*C["unitframes"].gridscale*T.raidscale)
	self.Health:SetStatusBarTexture(normTex)
	self.Health:SetFrameLevel(1)
	
	self.Health.bg:SetTexture(blank)
	self.Health.bg:SetTexture(1, 1, 1)
	self.Health.bg.multiplier = (0.3)
	
	self.Health.PostUpdate = T.PostUpdateHealthRaid
	self.Health.frequentUpdates = true
	
	if C.unitframes.unicolor == true then
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(.3,.3,.3,1)
		self.Health.bg:SetVertexColor(unpack(bgcolor))
	else
		self.Health.colorDisconnected = true	
		self.Health.colorClass = true
		self.Health.colorReaction = true			
	end
	
	self.Health.value:ClearAllPoints()
	self.Health.value:Point("CENTER", self.Health, "CENTER", 0, 7)
	self.Health.value:SetFont(font, fs-1, "THINOUTLINE")
	self.Health.value:SetTextColor(1,1,1)
	self.Health.value:SetShadowOffset(1.25, -1.25)
	
	self.Power:SetHeight(3*C["unitframes"].gridscale*T.raidscale)
	self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
	self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
	self.Power:SetStatusBarTexture(normTex)
	
	self.Power.bg:SetAllPoints(self.Power)
	self.Power.bg:SetTexture(normTex)
	self.Power.bg:SetAlpha(1)
	self.Power.bg.multiplier = 0.4
	
	if C.unitframes.unicolor == true then
		self.Power.colorClass = true
		self.Power.bg.multiplier = 0.1				
	else
		self.Power.colorPower = true
	end
	
	-- name
	self.Name:ClearAllPoints()
	self.Name:SetParent(self.Health)
	self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, -6)
	self.Name:SetShadowOffset(1.25, -1.25)
	self.Name:SetFont(font, fs, "THINOUTLINE")
	--self:Tag(name, '[Tukui:getnamecolor][Tukui:nameshort] [Tukui:dead][Tukui:afk]')
	
	local leader = self.Health:CreateTexture(nil, "OVERLAY")
	leader:Height(12*T.raidscale)
	leader:Width(12*T.raidscale)
	leader:SetPoint("TOPLEFT", 0, 6)
	self.Leader = leader
	
	local MasterLooter = self.Health:CreateTexture(nil, "OVERLAY")
	MasterLooter:SetHeight(12*T.raidscale)
	MasterLooter:SetWidth(12*T.raidscale)
	self.MasterLooter = MasterLooter
	
	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
    LFDRole:Height(6*T.raidscale)
    LFDRole:Width(6*T.raidscale)
	LFDRole:Point("LEFT", self.Health, "LEFT", 2, 0)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole
	
	self.ReadyCheck:Height(12*T.raidscale)
	self.ReadyCheck:Width(12*T.raidscale)
	self.ReadyCheck:SetPoint("CENTER", health, "CENTER", 0, 5)
	
	if C["unitframes"].showsymbols == true then
		self.RaidIcon:Height(18*T.raidscale)
		self.RaidIcon:Width(18*T.raidscale)
		self.RaidIcon:SetPoint("RIGHT", self.Health, "RIGHT", -5, 0)
		self.RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon.SetTexture = T.dummy
	end
	
	if C["unitframes"].aggro == true then
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
	end
	
	if C.unitframes.showsmooth == true then
		self.Health.Smooth = true
	end
	
	if C.unitframes.showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = C.unitframes.raidalphaoor}
		self.Range = range
	end
	
	if C["unitframes"].raidunitdebuffwatch == true then
		self.RaidDebuffs:Kill()
		
		-- Raid Debuffs (big middle icon)
		local RaidDebuffs = CreateFrame('Frame', nil, self)
		RaidDebuffs:Height(24*C["unitframes"].gridscale)
		RaidDebuffs:Width(24*C["unitframes"].gridscale)
		RaidDebuffs:Point("CENTER", self.Health, 1, 0)
		RaidDebuffs:SetFrameStrata(self.Health:GetFrameStrata())
		RaidDebuffs:SetFrameLevel(self.Health:GetFrameLevel() + 2)
		
		RaidDebuffs:SetTemplate("Default")
		
		RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, "OVERLAY")
		RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
		RaidDebuffs.icon:Point("TOPLEFT", 2, -2)
		RaidDebuffs.icon:Point("BOTTOMRIGHT", -2, 2)
		
		RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
		RaidDebuffs.count:SetFont(font, fs-1, "THINOUTLINE")
		RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		RaidDebuffs.count:SetTextColor(1, .9, 0)
		
		RaidDebuffs:FontString("time", font, fs-1, "THINOUTLINE")
		RaidDebuffs.time:SetPoint("CENTER")
		RaidDebuffs.time:SetTextColor(1, .9, 0)
		
		self.RaidDebuffs = RaidDebuffs
	end
	
	-- if C["unitframes"].healcomm then
		-- local mhpb = CreateFrame("StatusBar", nil, self.Health)
		-- mhpb:SetOrientation("VERTICAL")
		-- mhpb:SetPoint("BOTTOM", self.Health:GetStatusBarTexture(), "TOP", 0, 0)
		-- mhpb:Width(self.Health:GetWidth())
		-- mhpb:Height(self.Health:GetHeight())
		-- mhpb:SetStatusBarTexture(C.media.normTex)
		-- mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)
		
		-- local ohpb = CreateFrame("StatusBar", nil, self.Health)
		-- ohpb:SetOrientation("VERTICAL")
		-- ohpb:SetPoint("BOTTOM", mhpb:GetStatusBarTexture(), "TOP", 0, 0)
		-- ohpb:Width(self.Health:GetWidth())
		-- ohpb:Height(self.Health:GetHeight())
		-- ohpb:SetStatusBarTexture(C.media.normTex)
		-- ohpb:SetStatusBarColor(0, 1, 0, 0.25)
		
		-- self.HealPrediction = {
			-- myBar = mhpb,
			-- otherBar = ohpb,
			-- maxOverflow = 1,
		-- }
	-- end
end

local RaidPosition = CreateFrame("Frame")
RaidPosition:RegisterEvent("PLAYER_LOGIN")
RaidPosition:SetScript("OnEvent", function(self, event)
	local raid = G.UnitFrames.RaidUnits
	
	raid:ClearAllPoints()
	raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 140*T.raidscale)
end)

local MaxGroup = CreateFrame("Frame")
MaxGroup:RegisterEvent("PLAYER_ENTERING_WORLD")
MaxGroup:RegisterEvent("ZONE_CHANGED_NEW_AREA")
MaxGroup:SetScript("OnEvent", function(self)
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()
	if inInstance and instanceType == "raid" and maxPlayers ~= 40 then
		G.UnitFrames.RaidUnits:SetAttribute("groupFilter", "1,2,3,4,5")
	else
		G.UnitFrames.RaidUnits:SetAttribute("groupFilter", "1,2,3,4,5,6,7,8")
	end
end)