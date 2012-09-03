local T, C, L, G = unpack(Tukui)

local target = TukuiTarget
local tot = TukuiTargetTarget
local focus = TukuiFocus

local HPheight = T.Scale(C.ufsize.healthheight)
local PWRheight = T.Scale(C.ufsize.powerheight)
local UFwidth = T.Scale(C.ufsize.unitframewidth)
local UFheight = T.Scale(HPheight+PWRheight+1)
local sHPheight = T.Scale(C.ufsize.smallhealthheight)
local sPWRheight = T.Scale(C.ufsize.smallpowerheight)
local sUFwidth = T.Scale(C.ufsize.smallunitframewidth)
local sUFheight = T.Scale(sHPheight+sPWRheight+1)

-- update buff/debuff position and skin
local function PostCreateAura(self, button)
	button.Glow:Kill()
end
hooksecurefunc(T, "PostCreateAura", PostCreateAura)

if target and C["unitframes"].targetauras then
	local buffs = target.Buffs
	local debuffs = target.Debuffs
	
	buffs:ClearAllPoints()
	buffs:SetHeight(25)
	buffs:SetWidth(UFwidth)
	buffs.size = 25
	buffs.num = 8
	buffs.spacing = 2
	buffs.initialAnchor = "TOPLEFT"
	buffs["growth-y"] = "UP"
	buffs["growth-x"] = "RIGHT"
	buffs:SetPoint("BOTTOMLEFT", target, "TOPLEFT", -2, 5)
	buffs.PostCreateIcon = T.PostCreateAura
	buffs.PostUpdateIcon = T.PostUpdateAura
	
	debuffs:ClearAllPoints()
	debuffs:SetHeight(25)
	debuffs:SetWidth(UFwidth)
	debuffs.size = 25
	debuffs.num = 16
	debuffs.spacing = 2
	debuffs.initialAnchor = "TOPLEFT"
	debuffs["growth-y"] = "UP"
	debuffs["growth-x"] = "RIGHT"
	debuffs:SetPoint("BOTTOMLEFT", buffs, "TOPLEFT", 0, 3)
	debuffs.PostCreateIcon = T.PostCreateAura
	debuffs.PostUpdateIcon = T.PostUpdateAura
	
	buffs.ClearAllPoints = T.dummy
	buffs.SetPoint = T.dummy
	debuffs.ClearAllPoints = T.dummy
	debuffs.SetPoint = T.dummy
end

if tot and C["unitframes"].totdebuffs then
	local debuffs = tot.Debuffs
	
	debuffs:SetWidth(sUFwidth)
	debuffs:SetHeight(sHPheight)
	debuffs.size = sUFheight
	debuffs.spacing = 4.5
	debuffs.num = 4
	
	debuffs:ClearAllPoints()
	debuffs:SetPoint("TOPLEFT", tot, "BOTTOMLEFT", -2, -5)
	debuffs["growth-y"] = "RIGHT"
	debuffs.PostCreateIcon = T.PostCreateAura
	debuffs.PostUpdateIcon = T.PostUpdateAura
	
	debuffs.ClearAllPoints = T.dummy
	debuffs.SetPoint = T.dummy
end

if focus then
	local debuffs = focus.Debuffs
	
	debuffs:ClearAllPoints()
	debuffs:SetHeight(HPheight+PWRheight+1)
	debuffs:SetPoint("TOPRIGHT", focus, "TOPLEFT", -5, 2)
	debuffs.size = HPheight+PWRheight+1
	debuffs.num = 3
	debuffs.PostCreateIcon = T.PostCreateAura
	debuffs.PostUpdateIcon = T.PostUpdateAura
	
	debuffs.ClearAllPoints = T.dummy
	debuffs.SetPoint = T.dummy
end

-- health text update function
T.CyPostUpdateHealth = function(health, unit, min, max)
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_offline.."|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_dead.."|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_ghost.."|r")
		end
	else
		local r, g, b
		
		if (C["unitframes"].unicolor ~= true and C["unitframes"].enemyhcolor and unit == "target" and UnitIsEnemy(unit, "player") and UnitIsPlayer(unit)) or (C["unitframes"].unicolor ~= true and unit == "target" and not UnitIsPlayer(unit) and UnitIsFriend(unit, "player")) then
			local c = T.UnitColor.reaction[UnitReaction(unit, "player")]
			if c then 
				r, g, b = c[1], c[2], c[3]
				health:SetStatusBarColor(r, g, b)
			else
				r, g, b = 75/255,  175/255, 76/255
				health:SetStatusBarColor(r, g, b)
			end					
		end
		
		if min ~= max then
			local r, g, b
			r, g, b = oUFTukui.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
			if (unit == "player" and health:GetAttribute("normalUnit") ~= "pet") or unit == "target" then
				if C["unitframes"].showtotalhpmp == true then
					health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", T.ShortValue(min), T.ShortValue(max))
				else
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", T.ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				end
			elseif unit == "focus" or unit == "focustarget" or unit == "pet" or unit == "targettarget" or (unit and unit:find("arena%d")) or (unit and unit:find("boss%d")) then
				health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
			else
				health.value:SetText("|cff559655"..T.ShortValue(max-min).."|r")
			end
		else
			if (unit == "player" and health:GetAttribute("normalUnit") ~= "pet") or unit == "target" or (unit and unit:find("arena%d")) or unit == "focus"  or unit == "focustarget" then
				health.value:SetText("|cff559655"..T.ShortValue(max).."|r")
			else
				health.value:SetText(" ")
			end
		end
	end
end

-- power text update function
T.CyPostUpdatePower = function(power, unit, min, max)
	local self = power:GetParent()
	local pType, pToken = UnitPowerType(unit)
	local color = T.UnitColor.power[pToken]
	
	if color then
		power.value:SetTextColor(color[1], color[2], color[3])
	end
	
	if not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) or not UnitIsConnected(unit) then
		power.value:SetText()
	elseif UnitIsDead(unit) or UnitIsGhost(unit) then
		power.value:SetText()
	else
		if min ~= max then
			if pType == 0 then
				if unit == "player" or unit == "target" then
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", T.ShortValue(max - (max - min)), T.ShortValue(max))
					else
						power.value:SetFormattedText("%d%% |cffD7BEA5-|r %s", floor(min / max * 100), T.ShortValue(max - (max - min)))
					end
				elseif unit == "focus" or unit == "focustarget" or (unit and unit:find("boss%d")) or (unit and unit:find("boss%d")) then
					power.value:SetText(floor(min / max * 100).."%")
				else
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", T.ShortValue(max - (max - min)), T.ShortValue(max))
					else
						power.value:SetFormattedText("%d%% |cffD7BEA5-|r %d", floor(min / max * 100), max - (max - min))
					end
				end
			else
				power.value:SetText(max - (max - min))
			end
		else
			power.value:SetText(T.ShortValue(min))
		end
	end
end

--[[ -- rogue/druid combo bar
hooksecurefunc(T, "ComboPointsBarUpdate", function(self, parent, points)
	local s = parent.shadow
	local b = parent.Buffs
		
	if (T.myclass == "ROGUE" or T.myclass == "DRUID") and C.unitframes.movecombobar then
		-- always show we this option enabled
		s:Point("TOP", 0, 0)
		self:Show()
	else
		if points > 0 then
			if s then
				s:Point("TOPLEFT", -4, 12)
			end
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 14)
			end
		else
			if s then
				s:Point("TOPLEFT", -4, 1)
			end
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 4)
			end
		end
	end
end) ]]