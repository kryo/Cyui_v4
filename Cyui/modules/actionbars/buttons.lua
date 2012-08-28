local T, C, L, G = unpack(Tukui)

local font = C.media.pixelfont
local fs = 15

if C.actionbar.dhamphmode == true then return end

TukuiBar2Button:Kill()
TukuiBar6:Kill()
TukuiBar7:Kill()
TukuiBar5ButtonBottom:Kill()

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == TukuiBar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:SetPoint("BOTTOM", TukuiBar3, "TOP", 0, 0)
			button.text:SetFont(font, fs-2)
			button.text:SetPoint("CENTER", 0, 1)
			button.text:SetText("|cffDC143Cv|r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -(T.buttonspacing*2+T.buttonsize*2), 0)
			button.text:SetFont(font, fs+5)
			button.text:SetPoint("CENTER", 0, 1)
			button.text:SetText("|cff66CD00^|r")
		end
	end
	
	if button == TukuiBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button:ClearAllPoints()
			button:SetSize(T.buttonsize, T.buttonsize/1.5)
			button:SetPoint("TOP", TukuiBar4, "BOTTOM", 0, 0)
			button.text:SetPoint("CENTER", 0, 1)
			button.text:SetText("|cffDC143C>|r")
			
			TukuiBar5ButtonTop:ClearAllPoints()
			TukuiBar5ButtonTop:SetPoint("BOTTOM", TukuiBar4, "TOP", 0, 0)
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", bar, "LEFT", 0, 0)
			
			if bar == TukuiBar4 then
				TukuiBar1:SetHeight(T.buttonsize*1+T.buttonspacing*2)
				TukuiBar2:SetHeight(TukuiBar1:GetHeight())
				TukuiBar3:SetHeight(TukuiBar1:GetHeight())
				TukuiBar3Button:SetSize(T.buttonsize*4+T.buttonspacing*3, T.buttonsize/1.5)
				
				if not T.lowversion then
					for i = 7, 12 do
						local left = _G["MultiBarBottomLeftButton"..i]
						local right = _G["MultiBarBottomRightButton"..i]
						left:SetAlpha(1)
						right:SetAlpha(1)
					end
				end
			end
		else
			db.hidebar4 = true
			button:ClearAllPoints()
			button:SetSize(T.buttonsize/1.5, T.buttonsize*5+T.buttonspacing*4)
			button:SetPoint("RIGHT", UIParent, "RIGHT", 0, 0)
			button.text:SetPoint("CENTER", 0, 2)
			button.text:SetText("|cff66CD00<|r")
			
			TukuiBar5ButtonTop:ClearAllPoints()
			TukuiBar5ButtonTop:SetPoint("RIGHT", UIParent, "RIGHT", 1000, 0)
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
			
			if bar == TukuiBar4 then
				TukuiBar1:SetHeight(T.buttonsize*1+T.buttonspacing*2)
				TukuiBar2:SetHeight(TukuiBar1:GetHeight())
				TukuiBar3:SetHeight(TukuiBar1:GetHeight())
				TukuiBar3Button:SetSize(T.buttonsize*4+T.buttonspacing*3, T.buttonsize/1.5)
				
				if not T.lowversion then
					for i = 7, 12 do
						local left = _G["MultiBarBottomLeftButton"..i]
						local right = _G["MultiBarBottomRightButton"..i]
						left:SetAlpha(1)
						right:SetAlpha(1)
					end
				end
			end
		end
	end
	
	if button == TukuiBar5ButtonTop then
		if bar:IsShown() then
			db.hidebar5 = false
			button:ClearAllPoints()
			button:SetSize(T.buttonsize*2+T.buttonspacing, T.buttonsize/1.5)
			button:SetPoint("TOPLEFT", TukuiBar5, "BOTTOMLEFT", T.buttonspacing, 0)
			button.text:SetFont(font, fs)
			button.text:SetPoint("CENTER", 0, 1)
			button.text:SetText("|cffDC143C>|r")
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", TukuiBar5, "LEFT", -T.buttonspacing, 0)
			
			TukuiBar4Button:ClearAllPoints()
			TukuiBar4Button:SetPoint("RIGHT", UIParent, "RIGHT", 150, 0)
		else
			db.hidebar5 = true
			button:ClearAllPoints()
			button:SetSize(T.buttonsize, T.buttonsize/1.5)
			button:SetPoint("BOTTOM", TukuiBar4, "TOP", 0, 0)
			button.text:SetFont(font, fs)
			button.text:SetPoint("CENTER", 0, 2)
			button.text:SetText("|cff66CD00<|r")
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", TukuiBar4, "LEFT", -T.buttonspacing, 0)
			
			if bar == TukuiBar5 then
				if TukuiBar4:IsShown() then
					TukuiBar4Button:ClearAllPoints()
					TukuiBar4Button:SetPoint("TOP", TukuiBar4, "BOTTOM", 0, 0)
				else
					TukuiPetBar:ClearAllPoints()
					TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
				end
			end
		end
	end
end

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	MoveButtonBar(TukuiBar3Button, TukuiBar3)
	MoveButtonBar(TukuiBar4Button, TukuiBar4)
	MoveButtonBar(TukuiBar5ButtonTop, TukuiBar5)
end)

TukuiBar3Button:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar3) end)
TukuiBar3Button.text:SetFont(font, fs)
TukuiBar3Button.text:SetPoint("CENTER", 0, 2)
TukuiBar3Button.text:SetText("|cffDC143Cv|r")

TukuiBar4Button:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar4) end)
TukuiBar4Button.text:SetFont(font, fs)
TukuiBar4Button.text:SetPoint("CENTER", 0, 1)
TukuiBar4Button.text:SetText("|cffDC143C>|r")

TukuiBar5ButtonTop:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar5) end)
TukuiBar5ButtonTop.text:SetFont(font, fs)
TukuiBar5ButtonTop.text:SetPoint("CENTER", 0, 1)
TukuiBar5ButtonTop.text:SetText("|cffDC143C>|r")

TukuiPetBar:ClearAllPoints()
TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
			
TukuiExitVehicleButtonRight:ClearAllPoints()
TukuiExitVehicleButtonRight:SetAllPoints(TukuiBar3Button)
TukuiExitVehicleButtonRight:SetBackdropBorderColor(unpack(C.media.datatextcolor2))
TukuiExitVehicleButtonRight.text:SetFont(font, fs-2)
TukuiExitVehicleButtonRight.text:SetPoint("CENTER", 0, 2)
TukuiExitVehicleButtonRight.text:SetText("|cffDC143Cv|r")

TukuiExitVehicleButtonLeft:ClearAllPoints()
TukuiExitVehicleButtonLeft:SetPoint("BOTTOMRIGHT", UIParent, "TOPLEFT", -150, 150)