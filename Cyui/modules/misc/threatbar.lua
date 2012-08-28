local T, C, L, G = unpack(Tukui)

if C.utilities.threatbar ~= true then
	TukuiThreatBar:Kill()
	TukuiThreatBar.text:Kill()
	TukuiThreatBar.Title:Kill()
	TukuiThreatBar.bg:Kill()
	
	return
end

TukuiThreatBar:ClearAllPoints()
TukuiThreatBar:SetParent(TukuiInfoRight)
TukuiThreatBar:SetPoint("TOPLEFT", 2, -2)
TukuiThreatBar:SetPoint("BOTTOMRIGHT", -2, 2)

TukuiThreatBar.Title:SetFont(C.media.font, 10, "OUTLINE")
TukuiThreatBar.text:SetFont(C.media.font, 11, "OUTLINE")

TukuiThreatBar.bg:SetTexture(.04,.04,.04,1)