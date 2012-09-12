local T, C, L, G = unpack(Tukui)

if not C.unitframes.enable then return end

-- local variables
local HPheight, PWRheight, UFwidth, UFheight, sHPheight, sPWRheight, sUFwidth, sUFheight, bgcolor, normTex, uffont, font, fs, player, target, tot, pet, focus, focustar
HPheight = T.Scale(C.ufsize.healthheight)
PWRheight = T.Scale(C.ufsize.powerheight)
UFwidth = T.Scale(C.ufsize.unitframewidth)
UFheight = T.Scale(HPheight+PWRheight+1)
sHPheight = T.Scale(C.ufsize.smallhealthheight)
sPWRheight = T.Scale(C.ufsize.smallpowerheight)
sUFwidth = T.Scale(C.ufsize.smallunitframewidth)
sUFheight = T.Scale(sHPheight+sPWRheight+1)

bgcolor = C.general.backgroundcolor
normTex = C.media.normTex
uffont = C.media.uffont
font = C.media.font
fs = 12

player = TukuiPlayer
target = TukuiTarget
tot = TukuiTargetTarget
pet = TukuiPet
focus = TukuiFocus
focustar = TukuiFocusTarget

-- unitframes
local units = {
	"Player",
	"Target",
	"TargetTarget",
	"Pet",
	"Focus",
	"FocusTarget",
}

for _, frame in pairs(units) do
	local t = "Tukui"
	local self = _G[t..frame]
	local unit = string.lower(frame)
	
	-- set colors
	self.Health.bg:SetTexture(1,1,1)
	self.Health.bg:SetVertexColor(unpack(bgcolor))
	
	-- kill
	if self.shadow then
		self.shadow:Kill()
	end
	
	if unit == "player" or unit == "target" or unit == "pet" then
		self:ClearAllPoints()
		self.panel:Kill()
	elseif unit == "targettarget" then
		self:ClearAllPoints()
		self.panel:Kill()
	end
	
	-- general setup
	if unit == "player" or unit == "target" then
		-- castbar
		if C.unitframes.unitcastbar == true then
			self.Castbar:ClearAllPoints()
			self.Castbar.time:ClearAllPoints()
			self.Castbar.Text:ClearAllPoints()
			
			self.Castbar:SetHeight(HPheight)
			self.Castbar:CreateBorder()
			
			self.Castbar.time:SetFont(font, fs)
			self.Castbar.time:SetPoint("RIGHT", self.Castbar, "RIGHT", -5, 0)
			
			self.Castbar.Text:SetFont(font, fs+2)
			self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 5, 0)
			
			local Castbarbg = CreateFrame("Frame", nil, self.Castbar)
			Castbarbg:SetPoint("TOPLEFT", self.Castbar, "TOPLEFT", 0, 0)
			Castbarbg:SetPoint("BOTTOMRIGHT", self.Castbar, "BOTTOMRIGHT", 0, 0)
			Castbarbg:SetTemplate("Default")
			Castbarbg:SetFrameLevel(self.Castbar:GetFrameLevel()-1)
			self.Castbarbg = Castbarbg
			
			if unit == "player" then
				self.Castbar:SetWidth(T.Scale(T.buttonsize*10+T.buttonspacing*9))
				if C.actionbar.dhamphmode == true then
					self.Castbar:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -(T.buttonsize*5+T.buttonspacing*5), T.buttonspacing*3+T.buttonsize)
				else
					self.Castbar:SetPoint("BOTTOM", TukuiBar3Button, "TOP", 0, T.buttonspacing*2)
				end
			elseif unit == "target" then
				self.Castbar:SetWidth(UFwidth)
				self.Castbar:SetPoint("CENTER", UIParent, "CENTER", 0, -155)
			end
			
			if C.unitframes.cbicons == true then
				self.Castbar.button:ClearAllPoints()
				self.Castbar.button:Size(HPheight)
				self.Castbar.button:SetPoint("RIGHT", self.Castbar, "LEFT", -8, 0)
				self.Castbar.button:CreateBorder()
				
				self.Castbar.icon:ClearAllPoints()
				self.Castbar.icon:Point("TOPLEFT", self.Castbar.button, 0, 0)
				self.Castbar.icon:Point("BOTTOMRIGHT", self.Castbar.button, 0, 0)
			end
			
			if unit == "player" and C.unitframes.cblatency == true then
				self.Castbar.safezone:SetVertexColor(.54,.10,.10,.75)
			end
		end
	
		-- portraits
		if C.unitframes.charportrait == true then
			self.Portrait:ClearAllPoints()
			
			self.Portrait:SetHeight(UFheight+2)
			self.Portrait:SetWidth(UFheight+2)
			self.Portrait:SetAlpha(1)
			self.Portrait:CreateBorder()
			
			if unit == "player" then
				self.Health:SetPoint("TOPRIGHT")
				self.Health:SetPoint("TOPLEFT")
				
				self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
				self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
				
				self.Portrait:SetPoint("TOPRIGHT", self.Health, "TOPLEFT", -7, 0)
			elseif unit == "target" then
				self.Health:SetPoint("TOPLEFT")
				self.Health:SetPoint("TOPRIGHT")
				
				self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
				self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
				
				self.Portrait:SetPoint("TOPLEFT", self.Health, "TOPRIGHT", 7, 0)
			end
		end
		
		-- classicons
		if C.unitframes.classicon == true then
			local classicon = CreateFrame("Frame", self:GetName().."_ClassIconBorder", self)
			classicon:SetTemplate("Default")
			classicon:Size(UFheight+6)
			
			if unit == "player" then
				classicon:SetPoint("RIGHT", self.Health, "LEFT", -5, -4)
			elseif unit == "target" then
				classicon:SetPoint("LEFT", self.Health, "RIGHT", 5, -4)
			end
			
			local class = classicon:CreateTexture(self:GetName().."_ClassIcon", "ARTWORK")
			class:Point("TOPLEFT", 2, -2)
			class:Point("BOTTOMRIGHT", -2, 2)
			self.ClassIcon = class
			
			self:EnableElement("ClassIcon")
		end
		
		-- combat feedback
		if C.unitframes.combatfeedback == true then
			self.CombatFeedbackText:SetFont(font, fs+1, "THINOUTLINE")
		end
		
		-- healcomm
		if C.unitframes.healcomm then
			self.HealPrediction.myBar:SetWidth(UFwidth)
			self.HealPrediction.myBar:SetStatusBarColor(0, 1, 0.5, 0.45)
			self.HealPrediction.otherBar:SetWidth(UFwidth)
			self.HealPrediction.otherBar:SetStatusBarColor(0, 1, 0, 0.45)
		end
	end
	
	-- player frame
	if unit == "player" then
		-- size
		self:Height(HPheight)
		self:Width(UFwidth)
		
		-- healthbar
		self.Health:SetHeight(HPheight)
		self.Health:CreateBorder()
		
		-- health value
		self.Health.value:ClearAllPoints()
		self.Health.value:SetParent(self.Health)
		self.Health.value:SetFont(uffont, fs)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, -1)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- powerbar
		self.Power:ClearAllPoints()
		self.Power:SetHeight(PWRheight)
		self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
		self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
		self.Power:CreateBorder()
		
		-- power value
		self.Power.value:ClearAllPoints()
		self.Power.value:SetParent(self.Health)
		self.Power.value:SetFont(uffont, fs)
		self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, -1)
		self.Power.PostUpdate = T.CyPostUpdatePower
		
		-- combat icon
		self.Combat:ClearAllPoints()
		self.Combat:SetParent(self.Health)
		self.Combat:SetSize(20, 20)
		self.Combat:SetPoint("CENTER", 0, 0)
		
		-- low mana warning
		self.FlashInfo.ManaLevel:ClearAllPoints()
		self.FlashInfo.ManaLevel:SetPoint("CENTER", self.Power, "CENTER", 0, 0)
		self.FlashInfo.ManaLevel:SetFont(uffont, fs)
		
		-- pvp status
		self.Status:ClearAllPoints()
		self.Status:SetParent(self.Health)
		self.Status:SetFont(font, fs+1)
		self.Status:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		
		-- experience
		if T.level ~= MAX_PLAYER_LEVEL then
			self.Experience:ClearAllPoints()
			self.Experience:SetAllPoints(self.Power)
			
			self.Resting:Kill()
		end
		
		-- reputation
		if T.level == MAX_PLAYER_LEVEL then
			self.Reputation:ClearAllPoints()
			self.Reputation:SetParent(self.Power)
			self.Reputation:SetAllPoints(self.Power)
		elseif T.level ~= MAX_PLAYER_LEVEL then
		end
		
		-- druid mana and mushroom bar
		if T.myclass == "DRUID" then
			self.DruidManaText:SetFont(uffont, fs-1)
			
			if C.unitframes.druidmushroombar then
				TukuiWildMushroomBar:ClearAllPoints()
				TukuiWildMushroomBar:SetHeight(PWRheight)
				TukuiWildMushroomBar:SetWidth(UFwidth)
				TukuiWildMushroomBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				TukuiWildMushroomBar:CreateBorder()
				
				for i = 1, 3 do
					TukuiWildMushroomBar[i]:SetHeight(PWRheight)
					
					if i == 1 then
						TukuiWildMushroomBar[i]:SetWidth(UFwidth/3)
						TukuiWildMushroomBar[i]:SetHeight(PWRheight)
					else
						TukuiWildMushroomBar[i]:SetWidth(UFwidth/3-1)
						TukuiWildMushroomBar[i]:SetHeight(PWRheight)
					end
				end
			end
		end
		
		-- mage
		if C.unitframes.mageclassbar and T.myclass == "MAGE" then
			TukuiArcaneBar:ClearAllPoints()
			TukuiArcaneBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
			
			TukuiArcaneBar:SetHeight(PWRheight)
			TukuiArcaneBar:SetWidth(UFwidth)
			TukuiArcaneBar:CreateBorder()
			
			for i = 1, 6 do
				TukuiArcaneBar[i]:SetHeight(PWRheight)
				
				if i == 1 then
					TukuiArcaneBar[i]:SetWidth(UFwidth/6)
				else
					TukuiArcaneBar[i]:SetWidth(UFwidth/6-1)
				end
			end
		end
		
		-- classbar
		if C.unitframes.classbar == true then
			-- druid
			if T.myclass == "DRUID" then
				-- kill manabar
				if C.unitframes.druidmanabar then
					self.DruidMana:Kill()
					self.DruidManaBackground:Kill()
				end
				
				-- eclipsebar
				self.EclipseBar:ClearAllPoints()
				self.EclipseBar:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				self.EclipseBar:SetHeight(PWRheight)
				self.EclipseBar:SetWidth(UFwidth)
				self.EclipseBar:CreateBorder()
				
				self.EclipseBar.SolarBar:SetHeight(PWRheight)
				self.EclipseBar.SolarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())
				
				self.EclipseBar.LunarBar:SetHeight(PWRheight)
				self.EclipseBar.LunarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())
				
				if C.unitframes.eclipsetext == true then
					self.EclipseBar.Text:ClearAllPoints()
					self.EclipseBar.Text:SetParent(self.Health)
					self.EclipseBar.Text:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
					self.EclipseBar.Text:SetFont(uffont, fs+1)
				else
					self.EclipseBar.Text:Kill()
				end
				
				if C.unitframes.eclipsetext == true and self.EclipseBar and self.EclipseBar:IsShown() then
					self.Combat:SetAlpha(0)
					self.FlashInfo.ManaLevel:SetAlpha(0)
				end
			end
			
			-- warlock
			if T.myclass == "WARLOCK" then
				TukuiWarlockSpecBars:ClearAllPoints()
				TukuiWarlockSpecBars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				
				TukuiWarlockSpecBars:SetHeight(PWRheight)
				TukuiWarlockSpecBars:SetWidth(UFwidth)
				TukuiWarlockSpecBars:CreateBorder()
				
				for i = 1, 4 do
					TukuiWarlockSpecBars[i]:SetHeight(PWRheight)
					
					if i == 1 then
						TukuiWarlockSpecBars[i]:SetWidth(UFwidth/4)
					else
						TukuiWarlockSpecBars[i]:SetWidth(UFwidth/4-1)
					end
				end
			end
			
			-- paladin
			if T.myclass == "PALADIN" then
				self.HolyPower:ClearAllPoints()
				self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				
				self.HolyPower:SetHeight(PWRheight)
				self.HolyPower:SetWidth(UFwidth)
				self.HolyPower:CreateBorder()
				
				for i = 1, 5 do
					self.HolyPower[i]:SetHeight(PWRheight)
					
					if i == 1 then
						self.HolyPower[i]:SetWidth(UFwidth/5)
					else
						self.HolyPower[i]:SetWidth(UFwidth/5-1)
					end
				end
			end
			
			-- death knight
			if T.myclass == "DEATHKNIGHT" then
				-- runes
				self.Runes:ClearAllPoints()
				self.Runes:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 5)
				
				self.Runes:SetHeight(PWRheight+1)
				self.Runes:SetWidth(UFwidth)				
				self.Runes:SetBackdrop(nil)
				
				for i = 1, 6 do
					self.Runes[i]:SetHeight(PWRheight)
					self.Runes[i]:CreateBorder()
					
					if i == 1 then
						self.Runes[i]:SetWidth(UFwidth/6)
					else
						self.Runes[i]:SetWidth(UFwidth/6-1)
					end
					
					if (i == 1) then
						self.Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
					else
						self.Runes[i]:SetPoint("TOPLEFT", self.Runes[i-1], "TOPRIGHT", 1, 0)
					end
				end
				
				-- pet timer
				TukuiStatueBar:ClearAllPoints()
				TukuiStatueBar:SetParent(self.Power)
				TukuiStatueBar:SetAllPoints(self.Power)
				TukuiStatueBar:SetWidth(UFwidth)
				TukuiStatueBar:SetHeight(PWRheight)
				TukuiStatueBar:SetScript("OnShow", function(self) end)
				TukuiStatueBar:SetScript("OnHide", function(self) end)
			end
			
			-- monk
			if T.myclass == "MONK" then
				TukuiHarmony:ClearAllPoints()
				TukuiHarmony:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				
				TukuiHarmony:SetHeight(PWRheight)
				TukuiHarmony:SetWidth(UFwidth)
				TukuiHarmony:CreateBorder()
				
				for i = 1, 5 do
					TukuiHarmony[i]:SetHeight(PWRheight)
					
					if i == 1 then
						TukuiHarmony[i]:SetWidth(UFwidth/5)
					else
						TukuiHarmony[i]:SetWidth(UFwidth/5-1)
					end
				end
			end
			
			-- priest
			if T.myclass == "PRIEST" then
				TukuiShadowOrbsBar:ClearAllPoints()
				TukuiShadowOrbsBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				
				TukuiShadowOrbsBar:SetHeight(PWRheight)
				TukuiShadowOrbsBar:SetWidth(UFwidth)
				TukuiShadowOrbsBar:CreateBorder()
				
				for i = 1, 3 do
					TukuiShadowOrbsBar[i]:SetHeight(PWRheight)
					
					if i == 1 then
						TukuiShadowOrbsBar[i]:SetWidth(UFwidth/3)
					else
						TukuiShadowOrbsBar[i]:SetWidth(UFwidth/3-1)
					end
				end
			end
			
			-- rogue/druid
			if (T.myclass == "ROGUE" and not C.unitframes.classiccombo) or T.myclass == "DRUID" then
				TukuiCombo:ClearAllPoints()
				TukuiCombo:Height(PWRheight)
				TukuiCombo:Width(UFwidth)
				TukuiCombo:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
				TukuiCombo:CreateBorder()
				
				for i = 1, 5 do
					TukuiCombo[i]:Height(PWRheight)
					
					if i == 1 then
						TukuiCombo[i]:Width(UFwidth/5)
						TukuiCombo[i]:SetPoint("LEFT", TukuiCombo, "LEFT", 0, 0)
					else
						TukuiCombo[i]:Width(UFwidth/5-1)
						TukuiCombo[i]:Point("LEFT", TukuiCombo[i-1], "RIGHT", 1, 0)
					end
				end
			end
			
			-- shaman
			if T.myclass == "SHAMAN" then
				for i = 1, 4 do
					self.TotemBar[i]:ClearAllPoints()
					self.TotemBar[i]:SetHeight(PWRheight)
					self.TotemBar[i]:CreateBorder()
					
					local fixme
					if (i == 2) then
						self.TotemBar[i]:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 5)
					elseif i == 1 then
						fixme = 53
						self.TotemBar[i]:Point("BOTTOMLEFT", self, "TOPLEFT", fixme + 1, 5)
					else
						fixme = i
						if i == 3 then fixme = i-1 end
						self.TotemBar[i]:Point("TOPLEFT", self.TotemBar[fixme-1], "TOPRIGHT", 1, 0)
					end
					
					if i == 1 then
						self.TotemBar[i]:SetWidth(UFwidth/4-1)
					else
						self.TotemBar[i]:SetWidth(UFwidth/4-1)
					end
				end
			end
		end
	end
	
	-- target frame
	if unit == "target" then
		-- size
		self:Height(HPheight)
		self:Width(UFwidth)
		
		-- healthbar
		self.Health:SetHeight(HPheight)
		self.Health:CreateBorder()
		
		-- powerbar
		self.Power:ClearAllPoints()
		self.Power:SetHeight(PWRheight)
		self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
		self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
		self.Power:CreateBorder()
		
		-- power value
		self.Power.value:ClearAllPoints()
		self.Power.value:SetParent(self.Health)
		self.Power.value:SetFont(uffont, fs)
		self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, -1)
		self.Power.PostUpdate = T.CyPostUpdatePower
		
		-- health value
		self.Health.value:ClearAllPoints()
		self.Health.value:SetParent(self.Health)
		self.Health.value:SetFont(uffont, fs)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, -1)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- name
		self.Name:ClearAllPoints()
		self.Name:SetFont(font, fs+1, "THINOUTLINE")
		self.Name:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -10)
		self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynamelong] [Tukui:diffcolor][level] [shortclassification]')
		self.Name.ClearAllPoints = T.dummy
		self.Name.SetPoint = T.dummy
	end
	
	-- target of target frame
	if unit == "targettarget" then
		-- size
		self:Height(sHPheight)
		self:Width(sUFwidth)
		
		-- healthbar
		self.Health:SetHeight(sHPheight)
		self.Health:CreateBorder()
		
		-- health value
		self.Health.value = T.SetFontString(self.Health, uffont, 10)
		self.Health.value:Point("RIGHT", self.Health, "RIGHT", -5, 0)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- name
		self.Name:ClearAllPoints()
		self.Name:SetFont(uffont, fs-1, "THINOUTLINE")
		self.Name:SetPoint("LEFT", self.Health, "LEFT", 5, 0)
		self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynametiny]')
	end
	
	-- pet frame
	if unit == "pet" then
		-- size
		self:Height(sHPheight)
		self:Width(sUFwidth)
		
		-- healtbar
		self.Health:SetHeight(sHPheight)
		self.Health:CreateBorder()
		
		-- powerbar
		self.Power:Kill()
		
		-- health value
		self.Health.value = T.SetFontString(self.Health, uffont, 10)
		self.Health.value:Point("RIGHT", self.Health, "RIGHT", -5, 0)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- name
		self.Name:ClearAllPoints()
		self.Name:SetFont(uffont, fs-1, "THINOUTLINE")
		self.Name:SetPoint("LEFT", self.Health, "LEFT", 5, 0)
		self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynametiny]')
		
		-- castbar
		if C.unitframes.unitcastbar == true then
			self.Castbar:Kill()
			self.Castbar.time:Kill()
			self.Castbar.Text:Kill()
		end
	end
	
	-- focus frame
	if unit == "focus" then
		self:ClearAllPoints()
		
		-- size
		self:Height(24)
		self:Width(175)
		
		-- healthbar
		self.Health:SetHeight(18)
		self.Health:CreateBorder()
		
		-- powerbar
		self.Power:ClearAllPoints()
		self.Power:SetHeight(3)
		self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
		self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
		self.Power:CreateBorder()
		
		-- health value
		self.Health.value:ClearAllPoints()
		self.Health.value:SetFont(uffont, fs)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, 0)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- power value
		self.Power.value:ClearAllPoints()
		self.Power.value:SetFont(uffont, fs)
		self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, 0)
		self.Power.PostUpdate = T.CyPostUpdatePower
		
		-- name
		self.Name:ClearAllPoints()
		self.Name:SetFont(font, fs, "THINOUTLINE")
		self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynamesmall]')
		
		-- castbar
		if C.unitframes.unitcastbar == true then
			self.Castbar:ClearAllPoints()
			self.Castbar.time:ClearAllPoints()
			self.Castbar.Text:ClearAllPoints()
			self.Castbar.button:ClearAllPoints()
			self.Castbar.icon:ClearAllPoints()
			self.shadow:Kill()
			
			self.Castbar:SetHeight(T.Scale(HPheight*.7))
			self.Castbar:SetWidth(self.Health:GetWidth())
			self.Castbar:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -7)
			self.Castbar:CreateBorder()
			
			self.Castbar.bg:Point("TOPLEFT", 0, 0)
			self.Castbar.bg:Point("BOTTOMRIGHT", 0, 0)
			self.Castbar.bg:SetBackdropBorderColor(bdcr, bdcg, bdcb)
			
			self.Castbar.time:SetFont(font, fs-2)
			self.Castbar.time:SetPoint("RIGHT", self.Castbar, "RIGHT", -5, 0)
			
			self.Castbar.Text:SetFont(font, fs-1)
			self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 5, 0)
			
			self.Castbar.button:SetHeight(self.Castbar:GetHeight())
			self.Castbar.button:SetWidth(self.Castbar:GetHeight())
			self.Castbar.button:SetPoint("RIGHT", self.Castbar, "LEFT", -7, 0)
			self.Castbar.button:SetBackdropBorderColor(bdcr, bdcg, bdcb)
			self.Castbar.button:CreateBorder()
			
			self.Castbar.icon:Point("TOPLEFT", self.Castbar.button, 0, 0)
			self.Castbar.icon:Point("BOTTOMRIGHT", self.Castbar.button, 0, 0)
		end
	end
	
	-- focus target frame
	if unit == "focustarget" then
		self:ClearAllPoints()
		
		-- size
		self:Height(24)
		self:Width(175)
		
		-- healthbar
		self.Health:SetHeight(18)
		self.Health:CreateBorder()
		
		-- powerbar
		self.Power:ClearAllPoints()
		self.Power:SetHeight(3)
		self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
		self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
		self.Power:CreateBorder()
		
		-- health value
		self.Health.value:ClearAllPoints()
		self.Health.value:SetFont(uffont, fs)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, 0)
		self.Health.PostUpdate = T.CyPostUpdateHealth
		
		-- power value
		self.Power.value:ClearAllPoints()
		self.Power.value:SetFont(uffont, fs)
		self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, 0)
		self.Power.PostUpdate = T.CyPostUpdatePower
		
		-- name
		self.Name:ClearAllPoints()
		self.Name:SetFont(font, fs, "THINOUTLINE")
		self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynamesmall]')
		
		-- debuffs
		self.Debuffs:ClearAllPoints()
		self.Debuffs:SetHeight(HPheight+PWRheight+1)
		self.Debuffs:SetPoint("TOPRIGHT", self, "TOPLEFT", -5, 2)
		self.Debuffs.size = HPheight+PWRheight+1
		self.Debuffs.num = 2
		
		-- castbar
		if C.unitframes.unitcastbar == true then
			self.Castbar:ClearAllPoints()
			self.Castbar.time:ClearAllPoints()
			self.Castbar.Text:ClearAllPoints()
			self.Castbar.button:ClearAllPoints()
			self.Castbar.icon:ClearAllPoints()
			self.shadow:Kill()
			
			self.Castbar:SetHeight(T.Scale(HPheight*.7))
			self.Castbar:SetWidth(self.Health:GetWidth())
			self.Castbar:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -7)
			self.Castbar:CreateBorder()
			
			self.Castbar.bg:Point("TOPLEFT", 0, 0)
			self.Castbar.bg:Point("BOTTOMRIGHT", 0, 0)
			self.Castbar.bg:SetBackdropBorderColor(bdcr, bdcg, bdcb)
			
			self.Castbar.time:SetFont(font, fs-2)
			self.Castbar.time:SetPoint("RIGHT", self.Castbar, "RIGHT", -5, 0)
			
			self.Castbar.Text:SetFont(font, fs-1)
			self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 5, 0)
			
			self.Castbar.button:SetHeight(self.Castbar:GetHeight())
			self.Castbar.button:SetWidth(self.Castbar:GetHeight())
			self.Castbar.button:SetPoint("RIGHT", self.Castbar, "LEFT", -7, 0)
			self.Castbar.button:SetBackdropBorderColor(bdcr, bdcg, bdcb)
			self.Castbar.button:CreateBorder()
			
			self.Castbar.icon:Point("TOPLEFT", self.Castbar.button, 0, 0)
			self.Castbar.icon:Point("BOTTOMRIGHT", self.Castbar.button, 0, 0)
		end
	end
	
	-- arena frame
	if C.unitframes.arena == true then
		for i = 1, 5 do
			local self = _G["TukuiArena"..i]
			self.shadow:Kill()
			
			arenaheight = self:GetHeight()+PWRheight+1
			
			-- set colors
			self.Health.bg:SetTexture(1,1,1)
			
			if C["unitframes"].unicolor == true then
				self.Health.bg:SetVertexColor(unpack(bgcolor))
			end
			
			-- size
			self:Height(UFheight)
			self:Width(T.Scale(UFwidth*.8))
			
			-- healthbar
			self.Health:SetHeight(HPheight)
			self.Health:CreateBorder()
			
			-- powerbar
			self.Power:SetHeight(PWRheight)
			self.Power:ClearAllPoints()
			self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
			self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
			self.Power:CreateBorder()
			
			-- health value
			self.Health.value:ClearAllPoints()
			self.Health.value:SetFont(uffont, fs-1)
			self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, 1)
			self.Health.PostUpdate = T.CyPostUpdateHealth
			
			-- power value
			self.Power.value:ClearAllPoints()
			self.Power.value:SetFont(uffont, fs-1)
			self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, 1)
			self.Power.PostUpdate = T.CyPostUpdatePower
			
			-- name
			self.Name:SetFont(font, fs, "THINOUTLINE")
			self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynamemedium]')
			
			-- debuffs
			self.Debuffs:ClearAllPoints()
			self.Debuffs:SetHeight(arenaheight)
			self.Debuffs:SetPoint("RIGHT", self, "LEFT", -5, 2)
			self.Debuffs.size = arenaheight
			self.Debuffs.num = 3
			self.Debuffs.initialAnchor = "RIGHT"
			self.Debuffs["growth-x"] = "LEFT"
			
			-- trinket
			self.Trinket:ClearAllPoints()
			self.Trinket:SetBackdrop(nil)
			self.Trinket:SetWidth(arenaheight)
			self.Trinket:SetHeight(arenaheight)
			self.Trinket:SetPoint("LEFT", self, "RIGHT", 7, -1)
			
			-- spec icon
			--[[ self.specIcon:ClearAllPoints()
			self.specIcon:SetBackdrop(nil)
			self.specIcon:SetWidth(arenaheight)
			self.specIcon:SetHeight(arenaheight)
			self.specIcon:SetPoint("TOPLEFT", self.Trinket, "TOPRIGHT", 5, 0) --]]
			
			-- castbar
			if C.unitframes.unitcastbar == true then
				self.Castbar:ClearAllPoints()
				self.Castbar.time:ClearAllPoints()
				self.Castbar.Text:ClearAllPoints()
				self.Castbar.button:ClearAllPoints()
				self.Castbar.icon:ClearAllPoints()
				
				self.Castbar:SetHeight(T.Scale(HPheight*.7))
				self.Castbar:SetWidth(self.Health:GetWidth())
				self.Castbar:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -7)
				self.Castbar:CreateBorder()
				
				self.Castbar.bg:Kill()
				
				self.Castbar.time:SetFont(font, fs-2)
				self.Castbar.time:SetPoint("RIGHT", self.Castbar, "RIGHT", -5, 0)
				
				self.Castbar.Text:SetFont(font, fs-1)
				self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 5, 1)
				
				if C.unitframes.cbicons == true then
					self.Castbar.button:SetHeight(self.Castbar:GetHeight())
					self.Castbar.button:SetWidth(self.Castbar:GetHeight())
					self.Castbar.button:SetPoint("LEFT", self.Castbar, "RIGHT", 7, 0)
					self.Castbar.button:SetBackdropBorderColor(bdcr, bdcg, bdcb)
					self.Castbar.button:CreateBorder()
					
					self.Castbar.icon:Point("TOPLEFT", self.Castbar.button, 0, 0)
					self.Castbar.icon:Point("BOTTOMRIGHT", self.Castbar.button, 0, 0)
				end
			end
		end	
	end
	
	-- boss frame
	if C.unitframes.showboss == true then
		for i = 1, MAX_BOSS_FRAMES do
			local self = _G["TukuiBoss"..i]
			self.shadow:Kill()
			
			bossheight = self:GetHeight()+PWRheight+1
			
			-- set colors
			self.Health.bg:SetTexture(1,1,1)
			
			if C["unitframes"].unicolor == true then
				self.Health.bg:SetVertexColor(unpack(bgcolor))
			end
			
			-- size
			self:Height(UFheight)
			self:Width(T.Scale(UFwidth*.8))
			
			-- healthbar
			self.Health:SetHeight(HPheight)
			self.Health:CreateBorder()
			
			-- powerbar
			self.Power:SetHeight(PWRheight)
			self.Power:ClearAllPoints()
			self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
			self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
			self.Power:CreateBorder()
			
			-- health value
			self.Health.value:ClearAllPoints()
			self.Health.value:SetFont(uffont, fs-1)
			self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", -5, 1)
			self.Health.PostUpdate = T.CyPostUpdateHealth
			
			-- power value
			self.Power.value:ClearAllPoints()
			self.Power.value:SetFont(uffont, fs-1)
			self.Power.value:SetPoint("LEFT", self.Health, "LEFT", 5, 1)
			self.Power.PostUpdate = T.CyPostUpdatePower
			
			-- name
			self.Name:SetFont(font, fs, "THINOUTLINE")
			self:Tag(self.Name, '[Tukui:getnamecolor][Tukui:cynamemedium]')
			
			-- buffs
			self.Buffs:ClearAllPoints()
			self.Buffs:SetHeight(bossheight)
			self.Buffs:SetPoint("TOPLEFT", self, "TOPRIGHT", 5, 2)
			self.Buffs.size = bossheight
			self.Buffs.num = 2
			self.Buffs.initialAnchor = "LEFT"
			self.Buffs["growth-x"] = "RIGHT"
			
			-- debuffs
			self.Debuffs:ClearAllPoints()
			self.Debuffs:SetHeight(bossheight)
			self.Debuffs:SetPoint("TOPRIGHT", self, "TOPLEFT", -5, 2)
			self.Debuffs.size = bossheight
			self.Debuffs.num = 3
			self.Debuffs.initialAnchor = "RIGHT"
			self.Debuffs["growth-x"] = "LEFT"
			
			-- alt power bar
			self.AltPowerBar:ClearAllPoints()
			self.AltPowerBar:SetHeight(5)
			self.AltPowerBar:SetPoint("LEFT")
			self.AltPowerBar:SetPoint("RIGHT")
			self.AltPowerBar:SetPoint("BOTTOM", self.Health, "BOTTOM")
			
			-- castbar
			if C.unitframes.unitcastbar == true then
				self.Castbar:ClearAllPoints()
				self.Castbar.time:ClearAllPoints()
				self.Castbar.Text:ClearAllPoints()
				self.Castbar.button:ClearAllPoints()
				self.Castbar.icon:ClearAllPoints()
				
				self.Castbar:SetHeight(T.Scale(HPheight*.7))
				self.Castbar:SetWidth(self.Health:GetWidth())
				self.Castbar:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -7)
				self.Castbar:CreateBorder()
				
				self.Castbar.bg:Kill()
				
				self.Castbar.time:SetFont(font, fs-2)
				self.Castbar.time:SetPoint("RIGHT", self.Castbar, "RIGHT", -5, 0)
				
				self.Castbar.Text:SetFont(font, fs-1)
				self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 5, 1)
				
				if C.unitframes.cbicons == true then
					self.Castbar.button:SetHeight(self.Castbar:GetHeight())
					self.Castbar.button:SetWidth(self.Castbar:GetHeight())
					self.Castbar.button:SetPoint("LEFT", self.Castbar, "RIGHT", 7, 0)
					self.Castbar.button:SetBackdropBorderColor(bdcr, bdcg, bdcb)
					self.Castbar.button:CreateBorder()
					
					self.Castbar.icon:Point("TOPLEFT", self.Castbar.button, 0, 0)
					self.Castbar.icon:Point("BOTTOMRIGHT", self.Castbar.button, 0, 0)
				end
			end
		end
	end
	
	-- maintank and mainassist frame
	-- if (self:GetParent():GetName():match"TukuiMainTank" or self:GetParent():GetName():match"TukuiMainAssist") then
	-- end
	
	-- positions
	player:SetPoint("TOPRIGHT", UIParent, "CENTER", -T.Scale(190), -T.Scale(295))
	target:SetPoint("TOPLEFT", UIParent, "CENTER", T.Scale(190), -T.Scale(295))
	tot:SetPoint("TOPRIGHT", target, "BOTTOMRIGHT", 0, -T.Scale((PWRheight+15)))
	pet:SetPoint("TOPLEFT", player, "BOTTOMLEFT", 0, -T.Scale((PWRheight+15)))
	focus:SetPoint("TOPLEFT", UIParent, "TOPLEFT", T.Scale(250), -T.Scale(200))
	focustar:SetPoint("TOPLEFT", focus, "BOTTOMLEFT", 0, -T.Scale(40))

	if C.unitframes.showboss == true then
		for i = 1, MAX_BOSS_FRAMES do
			local self = _G["TukuiBoss"..i]
			self:ClearAllPoints()
			if i == 1 then
				self:SetPoint("RIGHT", UIParent, "RIGHT", -200, -55)
			else
				self:SetPoint("TOP", _G["TukuiBoss"..i-1], "BOTTOM", 0, UFheight+(HPheight*.7)+50)
			end
		end
	end
	
	if C.unitframes.arena == true then
		for i = 1, 5 do
			local self = _G["TukuiArena"..i]
			self:ClearAllPoints()
			if i == 1 then
				self:SetPoint("RIGHT", UIParent, "RIGHT", -200, -55)
			else
				self:SetPoint("TOP", _G["TukuiArena"..i-1], "BOTTOM", 0, UFheight+(HPheight*.7)+50)
			end
		end
	end
end