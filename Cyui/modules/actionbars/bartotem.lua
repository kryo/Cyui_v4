local T, C, L, G = unpack(Tukui)

if not T.myclass == "SHAMAN" then return end

local function StyleTotemFlyout(flyout)
	for _, button in ipairs(flyout.buttons) do
		if not InCombatLockdown() then
			button:Size(T.Scale(T.petbuttonsize*1.2),T.Scale(T.petbuttonsize*1.2))
		end
	end
end
hooksecurefunc("MultiCastFlyoutFrame_ToggleFlyout", function(self) StyleTotemFlyout(self) end)

local function StyleTotemOpenButton(button, parent)
	button.visibleBut:Width(button:GetWidth())
end
hooksecurefunc("MultiCastFlyoutFrameOpenButton_Show", function(button, _, parent) StyleTotemOpenButton(button, parent) end)

local function StyleTotemSlotButton(button, index)	
	if not InCombatLockdown() then button:Size(T.Scale(T.petbuttonsize*1.2)) end
	
	if MultiCastActionBarFrame then
		for i = 1, 4 do
			btn = _G["MultiCastSlotButton"..i]
			
			if i == 1 then
				btn:SetPoint("LEFT", MultiCastSummonSpellButton, "RIGHT", 8, 0)
			else
				btn:SetPoint("LEFT", _G["MultiCastActionButton"..(i-1)], "RIGHT", 5, 0)
			end
		end
	end
end
hooksecurefunc("MultiCastSlotButton_Update",function(self, slot) StyleTotemSlotButton(self, tonumber(string.match(self:GetName(), "MultiCastSlotButton(%d)"))) end)

local function StyleTotemSpellButton(button, index)
	if not button then return end
	if not InCombatLockdown() then button:Size(T.Scale(T.petbuttonsize*1.2), T.Scale(T.petbuttonsize*1.2)) end
end
hooksecurefunc("MultiCastSummonSpellButton_Update", function(self) StyleTotemSpellButton(self, 0) end)
hooksecurefunc("MultiCastRecallSpellButton_Update", function(self) StyleTotemSpellButton(self, 5) end)