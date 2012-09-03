local T, C, L, G = unpack(Tukui)

-- switch to dps layout
SLASH_DPSENABLE1 = "/dps"
SLASH_DPSENABLE2 = "/cydps"
SlashCmdList["DPSENABLE"] = function()
	DisableAddOn("Cyui_heal")
	EnableAddOn("Cyui_raid")
	ReloadUI()
end

-- switch to heal layout
SLASH_HEALENABLE1 = "/heal"
SLASH_HEALENABLE2 = "/cyheal"
SlashCmdList["HEALENABLE"] = function()
	DisableAddOn("Cyui_raid")
	EnableAddOn("Cyui_heal")
	ReloadUI()
end

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