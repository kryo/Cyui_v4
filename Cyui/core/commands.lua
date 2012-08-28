local T, C, L, G = unpack(Tukui)

-- switch to dps layout
SLASH_DPSENABLE1 = "/cydps"
SlashCmdList["DPSENABLE"] = function() if IsAddOnLoaded("CyUI_Raid_Heal") then DisableAddOn("CyUI_Raid_Heal") EnableAddOn("CyUI_Raid") else EnableAddOn("CyUI_Raid") end ReloadUI() end

-- switch to heal layout
SLASH_HEALENABLE1 = "/cyheal"
SlashCmdList["HEALENABLE"] = function() if IsAddOnLoaded("CyUI_Raid") then DisableAddOn("CyUI_Raid") EnableAddOn("CyUI_Raid_Heal") else EnableAddOn("CyUI_Raid_Heal") end ReloadUI() end

-- leave group
SLASH_LEAVEGROUP1 = "/lg"
SLASH_LEAVEGROUP2 = "/leave"
SlashCmdList["LEAVEGROUP"] = function() LeaveParty() end

-- show helm
SLASH_SHOWHELM1 = "/helm"
SlashCmdList["SHOWHELM"] = function() if ShowingHelm() then ShowHelm(false) else ShowHelm() end end

-- show cloak
SLASH_SHOWCLOAK1 = "/cloak"
SlashCmdList["SHOWCLOAK"] = function() if ShowingCloak() then ShowCloak(false) else ShowCloak() end end

-- remove ALL the spells
SLASH_WIPEACTBAR1 = "/wipeactbar"
SlashCmdList["WIPEACTBAR"] = function() StaticPopup_Show("WIPEAACTIONBARS") end
StaticPopupDialogs["WIPEAACTIONBARS"] = {
	text = "This will erase all your spells from the actionbars, are you sure you want to continue?",
	button1 = "Yes",
	button2 = "No",
    OnAccept = function() wipeactbars() end,
    timeout = 0,
    whileDead = 1,
}

function wipeactbars()
	for i = 1, 120 do
		PickupAction(i)
		ClearCursor()
	end
end


local ps = 15
-- reload button
local reloadbutton = CreateFrame("Button", "CyuiReloadButton", UIParent, "SecureActionButtonTemplate")
reloadbutton:Size(ps*2)
reloadbutton:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 15, 200)
reloadbutton:SetTemplate("Default")
reloadbutton:CreateShadow("Default")

reloadbutton:SetAttribute("type", "macro")
reloadbutton:SetAttribute("macrotext", "/rl")

reloadbutton.text = T.SetFontString(CyuiReloadButton, C.media.uffont, 10)
reloadbutton.text:Point("CENTER", reloadbutton, "CENTER")
reloadbutton.text:SetText("RL")

-- arena button
local arenabutton = CreateFrame("Button", "CyuiArenaButton", UIParent, "SecureActionButtonTemplate")
arenabutton:Size(ps*2)
arenabutton:Point("LEFT", reloadbutton, "RIGHT", 5, 0)
arenabutton:SetTemplate("Default")
arenabutton:CreateShadow("Default")

arenabutton:SetAttribute("type", "macro")
arenabutton:SetAttribute("macrotext", "/testui arena")

arenabutton.text = T.SetFontString(CyuiArenaButton, C.media.uffont, 10)
arenabutton.text:Point("CENTER", arenabutton, "CENTER")
arenabutton.text:SetText("Arena")

-- boss button
local bossbutton = CreateFrame("Button", "CyuiBossButton", UIParent, "SecureActionButtonTemplate")
bossbutton:Size(ps*2)
bossbutton:Point("LEFT", arenabutton, "RIGHT", 5, 0)
bossbutton:SetTemplate("Default")
bossbutton:CreateShadow("Default")

bossbutton:SetAttribute("type", "macro")
bossbutton:SetAttribute("macrotext", "/testui boss")

bossbutton.text = T.SetFontString(CyuiBossButton, C.media.uffont, 10)
bossbutton.text:Point("CENTER", bossbutton, "CENTER")
bossbutton.text:SetText("Boss")

-- pet button
local ufbutton = CreateFrame("Button", "CyuiUFButton", UIParent, "SecureActionButtonTemplate")
ufbutton:Size(ps*2)
ufbutton:Point("LEFT", bossbutton, "RIGHT", 5, 0)
ufbutton:SetTemplate("Default")
ufbutton:CreateShadow("Default")

ufbutton:SetAttribute("type", "macro")
ufbutton:SetAttribute("macrotext", "/testui pet")

ufbutton.text = T.SetFontString(CyuiUFButton, C.media.uffont, 10)
ufbutton.text:Point("CENTER", ufbutton, "CENTER")
ufbutton.text:SetText("Pet")

-- pet button
local testuibutton = CreateFrame("Button", "CyuiTestuiButton", UIParent, "SecureActionButtonTemplate")
testuibutton:Size(ps*2)
testuibutton:Point("LEFT", ufbutton, "RIGHT", 5, 0)
testuibutton:SetTemplate("Default")
testuibutton:CreateShadow("Default")

testuibutton:SetAttribute("type", "macro")
testuibutton:SetAttribute("macrotext", "/testui")

testuibutton.text = T.SetFontString(CyuiTestuiButton, C.media.uffont, 10)
testuibutton.text:Point("CENTER", testuibutton, "CENTER")
testuibutton.text:SetText("All")