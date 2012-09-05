local T, C, L, G = unpack(Tukui)

local mm = C.ufsize.minimapsize
local font = C.media.font
local ps = T.Scale(C.datatext.panelsize)

-- minimap
G.Maps.Minimap:ClearAllPoints()
G.Maps.Minimap:Size(mm)
G.Maps.Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -8, -8)
Minimap:Size(mm)
TukuiMinimap:Size(mm)

-- coord and zone
TukuiMinimapZone:ClearAllPoints()
TukuiMinimapZone:Size(TukuiMinimap:GetWidth(), ps)
TukuiMinimapZone:SetTemplate("Default")
TukuiMinimapZone:Point("TOP", Minimap, "BOTTOM", 0, -5)
TukuiMinimapZone:SetAlpha(1)
TukuiMinimapZone:SetFrameLevel(G.Maps.Minimap:GetFrameLevel())

TukuiMinimapZoneText:SetFont(font, 12)
TukuiMinimapZoneText:SetAlpha(1)

TukuiMinimapCoord:ClearAllPoints()
TukuiMinimapCoord:SetTemplate("Default")
TukuiMinimapCoord:Size(32, ps)
TukuiMinimapCoord:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 2)
TukuiMinimapCoord:SetParent(Minimap)
TukuiMinimapCoord:SetAlpha(0)

TukuiMinimapCoordText:SetFont(font, 10, "THINOUTLINE")
TukuiMinimapCoordText:Point("Center", 0, 0)
TukuiMinimapCoordText:SetAlpha(0)

-- mouseover scripts
Minimap:SetScript("OnEnter",function()
	TukuiMinimapCoord:SetAlpha(1)
	TukuiMinimapCoordText:SetAlpha(1)
end)

Minimap:SetScript("OnLeave",function()
	TukuiMinimapCoord:SetAlpha(0)
	TukuiMinimapCoordText:SetAlpha(0)
end)

-- ticket frame
TukuiTicket:Kill()

local CyuiTicket = CreateFrame("Frame", "CyuiTicket", TukuiMinimap)
CyuiTicket:SetTemplate()
CyuiTicket:Size(20)
CyuiTicket:SetFrameLevel(Minimap:GetFrameLevel()+4)
CyuiTicket:SetFrameStrata(Minimap:GetFrameStrata())
CyuiTicket:Point("TOPLEFT", 4, -4)
CyuiTicket:FontString("Text", C.media.font, 10)
CyuiTicket.Text:SetPoint("CENTER")
CyuiTicket.Text:SetText("GM")
CyuiTicket:SetBackdropBorderColor(12/255,141/255,215/255)
CyuiTicket.Text:SetTextColor(68/255,167/255,224/255)
CyuiTicket:SetAlpha(0)
G.Maps.Minimap.Ticket = CyuiTicket

HelpOpenTicketButton:SetParent(CyuiTicket)
HelpOpenTicketButton:SetFrameLevel(CyuiTicket:GetFrameLevel() + 1)
HelpOpenTicketButton:SetFrameStrata(CyuiTicket:GetFrameStrata())
HelpOpenTicketButton:ClearAllPoints()
HelpOpenTicketButton:SetAllPoints()
HelpOpenTicketButton:SetHighlightTexture(nil)
HelpOpenTicketButton:SetAlpha(0)
HelpOpenTicketButton:HookScript("OnShow", function(self) CyuiTicket:SetAlpha(1) end)
HelpOpenTicketButton:HookScript("OnHide", function(self) CyuiTicket:SetAlpha(0) end)
G.Maps.Minimap.TicketButton = HelpOpenTicketButton