local C = {}

C.general = {
	backdropcolor = {.04,.04,.04},
	bordercolor = {.15,.15,.15},
	backgroundcolor = {.3,0,.01,1},
	welcomemsg = true,
}

C.ufsize = {
	healthheight = 22,
	powerheight = 5,
	unitframewidth = 210,
	smallhealthheight = 15,
	smallpowerheight = 4,
	smallunitframewidth = 90,
	minimapsize = 140,
}

C.unitframes = {
	cblatency = true,
	unicolor = true,
	bordercolor = {.2,.2,.2},
	weakenedsoulbar = false,
	targetpowerpvponly = false,
	showtotalhpmp = false,
	totdebuffs = true,
	targetauras = true,
	-- unitframes
	--altlayout = true,
	charportrait = false,
	classicon = true,
	combatfeedback = false,
	-- classbar
	classbar = true,
	classiccombo = false,
	movecombobar = true,
	eclipsetext = true,
	druidmanabar = false,
	druidmushroombar = true,
	-- raidframes
	healcomm = true,
	showplayerinparty = true,
	gridhealthvertical = false,
	showrange = true,
	maintank = false, -- NYI
	mainassist = false, -- NYI
	showraidpets = false, -- NYI
}

C.auras = {
	flash = true,
	classictimer = true,
}

C.classtimer = {
	enable = true,
	layout = 1,
	classcolor = false,
	barheight = 13,
	barspacing = 1,
	fontsize = 11,
	direction = true,
	spark = false,
	castseparator = true,
	-- color
	backgroundalpha = 1,
	playerbar = {.2,.6,0},
	targetbar = {.33,.59,.33},
	targetdebuff = {.54,.10,.10},
	trinketbar = {1,.75,.14},
}

C.filger = {
	enable = false,
	configmode = false,
	normaliconsize = 36,
	misciconsize = 28,
	playerprocdirection = "LEFT",
	playerbuffdirection = "LEFT",
	playerdebuffdirection = "LEFT",
	targetbuffdirection = "RIGHT",
	targetdebuffdirection = "RIGHT",
	miscbuffs = "CENTER",
}

C.actionbar = {
	buttonsize = 24,
	petbuttonsize = 18,
	buttonspacing = 4,
	ownshdbar = true,
	cubes = true,
	petmouseover = false,
	dhamphmode = false,
	ownmetabar = false,
	ownwarstancebar = true,
}

C.cooldown = {
	treshold = 1,
}

C.datatext = {
	fps_ms = 5,
	system = 6,
	bags = 0,
	gold = 7,
	wowtime = 8,
	guild = 1,
	dur = 3,
	friends = 2,
	dps_text = 0,
	hps_text = 0,
	power = 0,
	haste = 0,
	crit = 0,
	avd = 0,
	armor = 0,
	currency = 0,
	hit = 0,
	mastery = 0,
	micromenu = 0,
	regen = 0,
	talent = 4,
	calltoarms = 0,
	
	battleground = true,
	time24 = true,
	localtime = true,
	fontsize = 10,
	panelsize = 18,
}

C.chat = {
	height = 125,
	width = 375,
	background = false,
	loot = false,
	whispersound = false,
	spam = true,
}

C.nameplate = {
	enhancethreat = true,
}

C.tooltip = {
	rightpanel = false,
	spellid = false,
}

C.utilities = {
	threatbar = true,
	screenie = true,
	--repbar = false, NYI
	buffreminder = true,
}

C.announcement = {
	interrupt = true,
	bg = false,
	spells = false,
	down = false,
	--sap = true, NYI
}

C.media = {
	uffont = [[Interface\Addons\CyUI\media\fonts\expresswayfree.ttf]],
	font = [[Interface\Addons\CyUI\media\fonts\ptsansnarrow.ttf]],
	dmgfont = [[Interface\AddOns\CyUI\media\fonts\ptsansnarrow.ttf]],
	pxfont = [[Interface\AddOns\CyUI\media\fonts\visitor.ttf]],
	datatextcolor1 = {.9,.9,.9},
	datatextcolor2 = {.95,.20,.20},
}

TukuiEditedDefaultConfig = C