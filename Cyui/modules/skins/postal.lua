local T, C, L, G = unpack(Tukui)

-- Postal reskin by Cadayron
-- http://www.tukui.org/forums/topic.php?id=14548
if not IsAddOnLoaded("Postal") or C.skin.postal ~= true then return end

function cSkinButton(self)
	T.SkinButton(self)
end

function cSkinNextPrevButton(self)
	T.SkinNextPrevButton(self)
end

function cSkinCheckBox(self)
	T.SkinCheckBox(self)
end

function cDesaturate(f, point)
	for i = 1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end
	
	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

local SkinPostal = CreateFrame("Frame")
	SkinPostal:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPostal:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if not IsAddOnLoaded("Postal") then return end
	
	cSkinButton(_G["PostalSelectOpenButton"])
	cSkinButton(_G["PostalSelectReturnButton"])
	
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G["MailItem"..i.."ExpireTime"]
		b:SetPoint("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
		b.returnicon:SetPoint("TOPRIGHT", b, "TOPRIGHT", 20, 0)	
	end
	
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local cb = _G["PostalInboxCB"..i]
		cb:StripTextures()
		cSkinCheckBox(cb)
	end
	
	InboxPrevPageButton:SetPoint("TOPLEFT", MailItem7, "BOTTOMLEFT", -20, 0)
	
	cSkinNextPrevButton(Postal_ModuleMenuButton)
	Postal_ModuleMenuButton:SetPoint("TOPRIGHT", MailFrame, -58, -16)
	
	cSkinNextPrevButton(Postal_BlackBookButton)
	Postal_BlackBookButton:SetPoint("LEFT", SendMailNameEditBox, "RIGHT", 5, 2)
	
	if not _G["PostalOpenAllButton"] then return else
		cSkinButton(_G["PostalOpenAllButton"])
		PostalOpenAllButton:SetPoint("CENTER", InboxFrame, "TOP", -22, -410)
		Postal_OpenAllMenuButton:SetPoint("LEFT", PostalOpenAllButton, "RIGHT", 5, 0)
		cSkinNextPrevButton(Postal_OpenAllMenuButton)
	end
end)