local T, C, L, G = unpack(Tukui)

if C.actionbar.enable ~= true then return end

local adjust = -(T.buttonspacing*4)
if C.actionbar.dhamphmode == true then adjust = T.buttonspacing*2.5 end

TukuiStance:ClearAllPoints()
TukuiStance:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", T.buttonspacing, adjust)