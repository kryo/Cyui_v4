local T, C, L, G = unpack(Tukui)

if not C.actionbar.enable == true then return end

-- TukuiBar2 - MultiBarBottomLeft
local bar2 = TukuiBar2
MultiBarBottomLeft:SetParent(bar2)

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar2, T.buttonspacing, T.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
	end
end

-- Tukuibar3 - MultiBarLeft
local bar3 = TukuiBar3
bar3:SetAlpha(1)
MultiBarBottomRight:SetParent(bar3)

for i = 1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if C.actionbar.dhamphmode == true then
		if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar3, T.buttonspacing, 0)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	else
		if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar3, T.buttonspacing, T.buttonspacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	end
end

-- Tukuibar4 - MultiBarRight
local bar4 = TukuiBar4
bar4:SetAlpha(1)
MultiBarLeft:SetParent(bar4)

for i = 1, 12 do
	local b = _G["MultiBarLeftButton"..i]
	local b2 = _G["MultiBarLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if C.actionbar.dhamphmode == true then
		if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar4, T.buttonspacing, 0)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	else
		if i == 1 then
			b:SetPoint("TOPRIGHT", bar4, -T.buttonspacing, -T.buttonspacing)
		else
			b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
		end
	end
end

-- pet
if C.actionbar.petmouseover == true then
	TukuiPetBar:SetAlpha(0)
	for i = 1, NUM_PET_ACTION_SLOTS do
		_G["PetActionButton"..i]:EnableMouse(true)
		_G["PetActionButton"..i]:HookScript("OnEnter", function(self) TukuiPetBar:SetAlpha(1) end)
		_G["PetActionButton"..i]:HookScript("OnLeave", function(self) TukuiPetBar:SetAlpha(0) end)
	end
end

-- extrabuttonbar
TukuiExtraActionBarFrameHolder:ClearAllPoints()
TukuiExtraActionBarFrameHolder:Size(55,55)
TukuiExtraActionBarFrameHolder:SetPoint("BOTTOM", 0, 400)