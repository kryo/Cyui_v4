local T, C, L, G = unpack(Tukui)

if not C.unitframes.enable == true then return end

local bgcolor, normTex, blank, uffont, font, fs, point, columnAnchorPoint, width, height, showParty, showRaid, showPlayer, xOffset, yOffset, columnSpacing, solo
width = T.Scale(90*C["unitframes"].gridscale*T.raidscale)
height = T.Scale(16*C["unitframes"].gridscale*T.raidscale)
showParty = true
showRaid = true
showPlayer = C.unitframes.showplayerinparty
xOffset = T.Scale(0)
yOffset = T.Scale(7)
point = "BOTTOM"
columnSpacing = T.Scale(5)
columnAnchorPoint = "TOPLEFT"
bgcolor = C.general.backgroundcolor
normTex = C.media.normTex
blank = C.media.blank
uffont = C.media.uffont
font = C.media.font
fs = 11
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
	self.Health.value:Kill()
	self.Power:Kill()
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
	
	self:SetBackdropColor(0, 0, 0, 0)
	self:SetFrameLevel(1)
	
	local color = RAID_CLASS_COLORS[T.myclass]
	self:HighlightUnit(color.r,color.g,color.b,1)
	
	-- healthbar
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture(normTex)
	self.Health:CreateBackdrop("Default")
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
	
	-- name
	self.Name:ClearAllPoints()
	self.Name:SetParent(self.Health)
	self.Name:SetPoint("LEFT", self.Health, "LEFT", 10, 0)
	self.Name:SetShadowOffset( 1.25, -1.25 )
	self.Name:SetFont(font, fs)
	self:Tag(name, '[Tukui:getnamecolor][Tukui:nameshort] [Tukui:dead][Tukui:afk]')
	
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
	LFDRole:Point("LEFT", self.Health, "LEFT", 3, 0)
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
end

local RaidPosition = CreateFrame("Frame")
RaidPosition:RegisterEvent("PLAYER_LOGIN")
RaidPosition:SetScript("OnEvent", function(self, event)
	local raid = G.UnitFrames.RaidUnits
	
	raid:ClearAllPoints()
	raid:SetPoint("LEFT", UIParent, "LEFT", 15, 150)
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