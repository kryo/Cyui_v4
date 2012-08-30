local T, C, L = unpack(Tukui)

if not C.tooltip.enable then return end

TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetSize(1,1)
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 0)

local function CyUpdateTooltip(self)
	local owner = self:GetOwner()
	if not owner then return end
	local name = owner:GetName()
	
	local x = T.Scale(5)
	
	if self:GetAnchorType() == "ANCHOR_NONE" and TukuiTooltipAnchor then
		local point = TukuiTooltipAnchor:GetPoint()
		if point == "TOPLEFT" then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", TukuiTooltipAnchor, "BOTTOMLEFT", 0, -x)
		elseif point == "TOP" then
			self:ClearAllPoints()
			self:SetPoint("TOP", TukuiTooltipAnchor, "BOTTOM", 0, -x)
		elseif point == "TOPRIGHT" then
			self:ClearAllPoints()
			self:SetPoint("TOPRIGHT", TukuiTooltipAnchor, "BOTTOMRIGHT", 0, -x)
		elseif point == "BOTTOMLEFT" or point == "LEFT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMLEFT", TukuiTooltipAnchor, "TOPLEFT", 0, x)
		elseif point == "BOTTOMRIGHT" or point == "RIGHT" then
			if TukuiBags and TukuiBags:IsShown() then
				self:ClearAllPoints()
				self:SetPoint("BOTTOMRIGHT", TukuiBags, "TOPRIGHT", 0, x)
			elseif C.chat.background and C.chat.loot and TukuiChatBackgroundRight then
				self:ClearAllPoints()
				self:SetPoint("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, x)
			elseif IsAddOnLoaded("Recount") and Recount_MainWindow:IsShown() and C.tooltip.rightpanel == true then
				self:ClearAllPoints()
				self:SetPoint("BOTTOMRIGHT", Recount_MainWindow, "TOPRIGHT", 0, 0)
			elseif IsAddOnLoaded("Skada") and SkadaBarWindowSkada:IsShown() and C.tooltip.rightpanel == true then
				self:ClearAllPoints()
				self:SetPoint("BOTTOMRIGHT", SkadaBarWindowSkada, "TOPRIGHT", 0, 25)
			else
				self:ClearAllPoints()
				self:SetPoint("BOTTOMRIGHT", TukuiTooltipAnchor, "TOPRIGHT", 0, x)
			end
		else
			self:ClearAllPoints()
			self:SetPoint("BOTTOM", TukuiTooltipAnchor, "TOP", 0, x)		
		end
	end
end

GameTooltip:HookScript("OnUpdate", function(self, ...) CyUpdateTooltip(self) end)

GameTooltipStatusBar:SetHeight(5)
GameTooltipStatusBar:SetScript("OnValueChanged", function(self, value)
	if not value then
		return
	end
	local min, max = self:GetMinMaxValues()
	
	if (value < min) or (value > max) then
		return
	end
	local _, unit = GameTooltip:GetUnit()
	
	-- fix target of target returning nil
	if (not unit) then
		local GMF = GetMouseFocus()
		unit = GMF and GMF:GetAttribute("unit")
	end

	if not self.text then
		self.text = self:CreateFontString(nil, "OVERLAY")
		local position = TukuiTooltipAnchor:GetPoint()
		if position:match("TOP") then
			self.text:Point("CENTER", GameTooltipStatusBar, 0, -3)
		else
			self.text:Point("CENTER", GameTooltipStatusBar, 0, 3)
		end
		
		self.text:SetFont(C["media"].font, 11, "THINOUTLINE")
		self.text:Show()
		if unit then
			min, max = UnitHealth(unit), UnitHealthMax(unit)
			local hp = T.ShortValue(min).." / "..T.ShortValue(max)
			if UnitIsGhost(unit) then
				self.text:SetText(L.unitframes_ouf_ghost)
			elseif min == 0 or UnitIsDead(unit) or UnitIsGhost(unit) then
				self.text:SetText(L.unitframes_ouf_dead)
			else
				self.text:SetText(hp)
			end
		end
	else
		if unit then
			min, max = UnitHealth(unit), UnitHealthMax(unit)
			self.text:Show()
			local hp = T.ShortValue(min).." / "..T.ShortValue(max)
			if UnitIsGhost(unit) then
				self.text:SetText(L.unitframes_ouf_ghost)
			elseif min == 0 or UnitIsDead(unit) or UnitIsGhost(unit) then
				self.text:SetText(L.unitframes_ouf_dead)
			else
				self.text:SetText(hp)
			end
		else
			self.text:Hide()
		end
	end
end)