local T, C, L, G = unpack(Tukui)

local font = C.media.pixelfont
local fs = 15

if C.actionbar.dhamphmode ~= true then return end

TukuiBar6:Kill()
TukuiBar7:Kill()
TukuiBar2Button:Kill()

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == TukuiBar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:SetPoint("BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", 0, T.buttonspacing)
			button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
			button.text:SetFont(font, fs-2)
			button.text:SetPoint("CENTER", 1, 0)
			button.text:SetText("|cffDC143Cv|r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button:SetPoint("BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", 0, T.buttonspacing)
			button:SetHeight(T.buttonsize)
			button.text:SetFont(font, fs+5)
			button.text:SetPoint("CENTER", 1, 1)
			button.text:SetText("|cff66CD00^|r")
		end
	end
	
	if button == TukuiBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button:ClearAllPoints()
			button:SetPoint("BOTTOMLEFT", TukuiBar2, "BOTTOMRIGHT", 0, T.buttonspacing)
			button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
			button.text:SetFont(font, fs-2)
			button.text:SetPoint("CENTER", 1, 1)
			button.text:SetText("|cffDC143Cv|r")
			
			if bar == TukuiBar4 then
				TukuiBar1:SetHeight(T.buttonsize+T.buttonspacing*2)
				TukuiBar2:SetHeight(T.buttonsize+T.buttonspacing*2)
				TukuiBar3:SetHeight(T.buttonsize+T.buttonspacing)
				if TukuiBar3:IsShown() then
					TukuiBar3Button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
				else
					TukuiBar3Button:SetHeight(T.buttonsize)
				end
				
				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					local right = _G["MultiBarBottomRightButton"..i]
					left:SetAlpha(1)
					right:SetAlpha(1)
				end
			end
		else
			db.hidebar4 = true
			button:ClearAllPoints()
			button:SetPoint("BOTTOMLEFT", TukuiBar2, "BOTTOMRIGHT", 0, T.buttonspacing)
			button:SetHeight(T.buttonsize)
			button.text:SetFont(font, fs+5)
			button.text:SetPoint("CENTER", 1, 1)
			button.text:SetText("|cff66CD00^|r")
			
			if bar == TukuiBar4 then
				TukuiBar1:SetHeight(T.buttonsize+T.buttonspacing*2)
				TukuiBar2:SetHeight(T.buttonsize+T.buttonspacing*2)
				TukuiBar3:SetHeight(T.buttonsize+T.buttonspacing)
				if TukuiBar3:IsShown() then
					TukuiBar3Button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
				else
					TukuiBar3Button:SetHeight(T.buttonsize)
				end

				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					local right = _G["MultiBarBottomRightButton"..i]
					left:SetAlpha(1)
					right:SetAlpha(1)
				end
			end
		end
	end
	
	if button == TukuiBar5ButtonTop or button == TukuiBar5ButtonBottom then		
		local buttontop = TukuiBar5ButtonTop
		local buttonbot = TukuiBar5ButtonBottom
		if bar:IsShown() then
			db.hidebar5 = false
			buttontop:ClearAllPoints()
			buttontop:SetSize(T.buttonsize, T.buttonsize/1.5)
			buttontop:SetPoint("BOTTOM", TukuiBar5, "TOP", 0, 0)
			buttontop.text:SetText("|cffDC143C>|r")
			buttontop.text:SetPoint("CENTER", 2, 1)
			buttonbot:ClearAllPoints()
			buttonbot:SetSize(T.buttonsize, T.buttonsize/1.5)
			buttonbot:SetPoint("TOP", TukuiBar5, "BOTTOM", 0, 0)
			buttonbot.text:SetText("|cffDC143C>|r")
			buttonbot.text:SetPoint("CENTER", 2, 1)
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", TukuiBar5, "LEFT", -T.buttonspacing, 0)
		else
			db.hidebar5 = true
			buttontop:ClearAllPoints()
			buttontop:SetSize(T.buttonsize/1.5, T.buttonsize*5+T.buttonspacing*4)
			buttontop:SetPoint("RIGHT", UIParent, "RIGHT", 0, 0)
			buttontop.text:SetText("|cff66CD00<|r")
			buttonbot:ClearAllPoints()
			buttonbot:SetSize(T.buttonsize/1.5, T.buttonsize*5+T.buttonspacing*4)
			buttonbot:SetPoint("RIGHT", UIParent, "RIGHT", 0, 0)
			buttonbot.text:SetText("|cff66CD00<|r")
			
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
		end
	end
end

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	MoveButtonBar(TukuiBar3Button, TukuiBar3)
	MoveButtonBar(TukuiBar4Button, TukuiBar4)
	MoveButtonBar(TukuiBar5ButtonTop, TukuiBar5)
	MoveButtonBar(TukuiBar5ButtonBottom, TukuiBar5)
end)

TukuiBar3Button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
TukuiBar3Button:SetWidth(T.buttonsize/1.5)
TukuiBar3Button:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar3) end)
TukuiBar3Button.text:SetFont(font, fs)
TukuiBar3Button.text:SetPoint("CENTER", 0, 2)
TukuiBar3Button.text:SetText("|cffDC143Cv|r")

TukuiBar4Button:SetHeight(T.buttonsize*2+T.buttonspacing*2)
TukuiBar4Button:SetWidth(T.buttonsize/1.5)
TukuiBar4Button:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar4) end)
TukuiBar4Button.text:SetFont(font, fs)
TukuiBar4Button.text:SetPoint("CENTER", 0, 1)
TukuiBar4Button.text:SetText("|cffDC143C>|r")

TukuiBar5ButtonTop:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar5) end)
TukuiBar5ButtonTop.text:SetFont(font, fs)
TukuiBar5ButtonTop.text:SetPoint("CENTER", 0, 0)
TukuiBar5ButtonTop.text:SetText("|cffDC143C>|r")

TukuiBar5ButtonBottom:HookScript("OnClick", function(self) MoveButtonBar(self, TukuiBar5) end)
TukuiBar5ButtonBottom.text:SetFont(font, fs)
TukuiBar5ButtonBottom.text:SetPoint("CENTER", 0, 0)
TukuiBar5ButtonBottom.text:SetText("|cffDC143C>|r")

TukuiPetBar:ClearAllPoints()
TukuiPetBar:SetPoint("RIGHT", UIParent, "RIGHT", -T.buttonsize, 0)
			
TukuiExitVehicleButtonRight:ClearAllPoints()
TukuiExitVehicleButtonRight:SetAllPoints(TukuiBar3Button)
TukuiExitVehicleButtonRight:SetBackdropBorderColor(unpack(C.media.datatextcolor2))
TukuiExitVehicleButtonRight.text:SetFont(font, fs-2)
TukuiExitVehicleButtonRight.text:SetPoint("CENTER", 0, 2)
TukuiExitVehicleButtonRight.text:SetText("|cffDC143Cv|r")

TukuiExitVehicleButtonLeft:ClearAllPoints()
TukuiExitVehicleButtonLeft:SetAllPoints(TukuiBar4Button)
TukuiExitVehicleButtonLeft:SetBackdropBorderColor(unpack(C.media.datatextcolor2))
TukuiExitVehicleButtonLeft.text:SetFont(font, fs-2)
TukuiExitVehicleButtonLeft.text:SetPoint("CENTER", 0, 2)
TukuiExitVehicleButtonLeft.text:SetText("|cffDC143Cv|r")