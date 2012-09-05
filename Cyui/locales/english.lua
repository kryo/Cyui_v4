local T, C, L, G = unpack(Tukui)

L.logon_welcome1 = "|cffDC143CCyui|r v"..GetAddOnMetadata("Cyui", "Version").." loaded. Welcome ".."|cffDC143C"..T.myname.."|r."
--L.logon_welcome2 = "Type |cff00FFFF/uihelp|r or |cff00FFFF/cyhelp|r for details, or visit |cff00FFFFtukui.org|r!"
L.logon_welcome2 = "Type |cff00FFFF/uihelp|r or visit |cff00FFFFtukui.org|r for help!"

L.chat_whisper = "Whisper"
L.chat_trade = "Trade"

-- configui
if IsAddOnLoaded("Tukui_ConfigUI") then
	-- general
	TukuiConfigUILocalization.generalbackgroundcolor = "Health background color"
	TukuiConfigUILocalization.generalwelcomemsg = "Enable welcome message on login"
	--TukuiConfigUILocalization.generalcvars = "Remove custom interface options"
	
	-- unitframe sizes
	TukuiConfigUILocalization.ufsize = "Unitframe size"
	TukuiConfigUILocalization.ufsizehealthheight = "Health bar height"
	TukuiConfigUILocalization.ufsizepowerheight = "Power bar height"
	TukuiConfigUILocalization.ufsizeunitframewidth = "Unitframe width"
	TukuiConfigUILocalization.ufsizesmallhealthheight = "Health bar height (for Target, ToT, Pet frames)"
	TukuiConfigUILocalization.ufsizesmallpowerheight = "Power bar height (for Target, ToT, Pet frames)"
	TukuiConfigUILocalization.ufsizesmallunitframewidth = "Unitframe width (for Target, ToT, Pet frames)"
	--TukuiConfigUILocalization.ufsizeminimapsize = "Minimap size"
	
	-- unitframes
	TukuiConfigUILocalization.unitframeseclipsetext = "Display Eclipse text on unitframe"
	TukuiConfigUILocalization.unitframesclassicon = "Display class icon as portrait"
	
	-- classtimer
	TukuiConfigUILocalization.classtimer = "Classtimer"
	TukuiConfigUILocalization.classtimerenable = "Enable Classtimer"
	TukuiConfigUILocalization.classtimerlayout = "Choose layout (1 - buffs and debuffs on player frame; 2 - debuffs on target frame"
	TukuiConfigUILocalization.classtimerclasscolor = "Enable classcolored bars"
	TukuiConfigUILocalization.classtimerbarheight = "Height of classtimer bars"
	TukuiConfigUILocalization.classtimerbarspacing = "Spacing between bars of the same category"
	TukuiConfigUILocalization.classtimerfontsize = "Font size"
	TukuiConfigUILocalization.classtimerdirection = "Direction, true for left to right"
	TukuiConfigUILocalization.classtimerspark = "Marker on the end of the bar"
	TukuiConfigUILocalization.classtimercastseparator = "Marker to indicate clipping"
	TukuiConfigUILocalization.classtimerplayerbar = "Color for player bar"
	TukuiConfigUILocalization.classtimertargetbar = "Color for target bar"
	TukuiConfigUILocalization.classtimertargetdebuff = "Color of the target debuffs bar"
	TukuiConfigUILocalization.classtimertrinketbar = "Color of the trinket bar"
	TukuiConfigUILocalization.classtimerbackgroundalpha = "Set the background alpha of the bar"
	
	-- filger
	TukuiConfigUILocalization.filger = "Filger"
	TukuiConfigUILocalization.filgerenable = "Enable Filger"
	TukuiConfigUILocalization.filgerconfigmode = "Display placeholder buffs to help position the icons"
	TukuiConfigUILocalization.filgernormaliconsize = "Icon size"
	TukuiConfigUILocalization.filgermisciconsize = "Icon size for special buffs"
	TukuiConfigUILocalization.filgerplayerprocdirection = "Icon direction for Player procs"
	TukuiConfigUILocalization.filgerplayerbuffdirection = "Icon direction for Player buffs"
	TukuiConfigUILocalization.filgerplayerdebuffdirection = "Icon direction for Player debuffs"
	TukuiConfigUILocalization.filgertargetbuffdirection = "Icon direction for Target buffs"
	TukuiConfigUILocalization.filgertargetdebuffdirection = "Icon direction for Target debuffs"
	TukuiConfigUILocalization.filgermiscbuffs = "Icon direction for special buffs (potions, bloodlust, etc)"
	
	-- actionbar
	TukuiConfigUILocalization.actionbarpetmouseover = "Enable pet bar on mouseover"
	TukuiConfigUILocalization.actionbardhamphmode = "Alternative actionbar layout, 4 bottom bars and one on right side"
	TukuiConfigUILocalization.actionbarcubes = "Enable cubes next to bottom actionbar"
	
	-- datatext
	TukuiConfigUILocalization.datatextpanelsize = "Panel size for datatext"
	TukuiConfigUILocalization.datatextwowtime = "Enable time on minimap"
	
	-- chat
	TukuiConfigUILocalization.chatloot = "Create a separate window to display loot"
	TukuiConfigUILocalization.chatheight = "Height of the chat panel"
	TukuiConfigUILocalization.chatwidth = "Width of the chat panel"
	TukuiConfigUILocalization.chatspam = "Hide miscellaneous spam (duels won/lost, auctions)"
	
	-- tooltip
	TukuiConfigUILocalization.tooltiprightpanel = "Parent tooltip to Recount/Skada window (right side of the screen)"
	TukuiConfigUILocalization.tooltipspellid = "Display the icon spellID when mouseovering it"
	
	-- utilities
	TukuiConfigUILocalization.utilities = "Miscellaneous"
	TukuiConfigUILocalization.utilitiesthreatbar = "Enable threat bar on right panel"
	TukuiConfigUILocalization.utilitiesscreenie = "Take a screenshot on every achievement earned"
	TukuiConfigUILocalization.utilitiesbuffreminder = "Buff reminder"
	TukuiConfigUILocalization.utilitiesbuffremindersound = "Plays a sound for buff reminder"
	
	-- announce
	TukuiConfigUILocalization.announcement = "Announcements"
	TukuiConfigUILocalization.announcementinterrupt = "Announce succesfull interrupts to party or raid chat"
	TukuiConfigUILocalization.announcementspells = "Announce important cooldowns to party or raid chat"
	TukuiConfigUILocalization.announcementsap = "Announce when sapped"
	TukuiConfigUILocalization.announcementdown = "Announce when cooldowns are over (not recommended)"
end