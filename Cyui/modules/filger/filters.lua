local T, C, L, G = unpack(Tukui)

-- Filger - Copyright (c) 2009, Nils Ruesch. All rights reserved.
if not C.filger.enable then return end

local _, ns = ...

ns.Filger_Settings = {configmode = false}

local iconsize, miconsize, playerprocdirection, playerbuffdirection
iconsize = C.filger.normaliconsize
miconsize = C.filger.misciconsize
playerprocdirection = "LEFT"--C.filger.playerplayerprocdirection
playerbuffdirection = "LEFT"--C.filger.playerbuffdirection

ns.Filger_Spells = {
	["DEATHKNIGHT"] = {
		{ -- Procs
			Name = "DK Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", -5, 0},
			-- Killing Machine
			{spellID = 51124, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Freezing Fog
			{spellID = 59052, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Succor
			{spellID = 101568, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Sudden Doom
			{spellID = 81340, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Crimson Scourge
			{spellID = 81141, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "DK Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", -5, 0},
			-- Lichborne
			{spellID = 49039, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dancing Rune Weapon
			{spellID = 49028, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Blood
			{spellID = 55233, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Anti-Magic Shell
			{spellID = 48707, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Bone Shield
			--{spellID = 49222, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Summon Gargoyle
			{spellID = 49206, size = iconsize, unitId = "target", caster = "player", filter = "DEBUFF"},
			-- Unholy Frenzy
			{spellID = 49016, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Conversion
			{spellID = 119980, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Death's Advance
			{spellID = 96268, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Shadow infusion
			{spellID = 91342, size = iconsize, unitId = "pet", caster = "player", filter = "BUFF"},
			-- Dark Transformation
			{spellID = 63560, size = iconsize, unitId = "pet", caster = "player", filter = "BUFF"},
		},
	},
	["DRUID"] = {
		{ -- Procs
			Name = "Druid Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Eclipse (Lunar)
			{spellID = 48518, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Eclipse (Solar)
			{spellID = 48517, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Shooting Stars
			{spellID = 93400, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Clearcasting
			{spellID = 16870, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Druid Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Ironbark
			{spellID = 102342, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Savage Roar
			{spellID = 52610, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Survival Instincts
			{spellID = 61336, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Innervate
			{spellID = 29166, size = iconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Barkskin
			{spellID = 22812, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Tree of Life
			{spellID = 33891, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Innervate
			{spellID = 29166, size = iconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Incarnation
			{spellID = 102560, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Nature's Vigil
			{spellID = 124974, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Solar Empowerment
			{spellID = 129633, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Lunar Empowerment
			{spellID = 129632, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Astral Empowerment
			{spellID = 130238, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Celestial Alignment
			{spellID = 112071, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Force of Nature
			{spellID = 33831, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Savage Defense
			{spellID = 62606, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["HUNTER"] = {
		{ -- Procs
			Name = "Hunter Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Lock and Load
			{spellID = 56453, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Quick Shots
			{spellID = 6150, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Steady Focus
			{spellID = 53224, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Ready, Set, Aim
			{spellID = 82925, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Priest Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Rapid Fire
			{spellID = 3045, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Roar of Sacrifice
			{spellID = 53480, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["MAGE"] = {
		{ -- Procs
			Name = "Mage Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Brain Freeze
			{spellID = 57761, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Deep Freeze
			{spellID = 44572, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Fingers Of Frost
            {spellID = 44544, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Arcane Missiles
			{spellID = 79683, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Pyroblast!
			{spellID = 48108, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Heating Up
			{spellID = 48107, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Druid Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Arcane Blast
			{spellID = 30451, size = iconsize, unitId = "player", caster = "player", filter = "DEBUFF" },
			-- Water Elemental Freeze
			{spellID = 33395, size = iconsize, filter = "CD" },
			-- Incanter's Ward
			{spellID = 1463, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Icy Veins
			{spellID = 12472, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},
	["MONK"] = {
		{ -- Procs
			Name = "Monk Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Combobreaker: Blackout-Kick
			{spellID = 116768, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Combobreaker: Tigerpalm
			{spellID = 118864, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Spinning Crane Kick
			{spellID = 101546, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Monk Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Zensphere
			{ spellID = 124081, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tigereye Brew
			{ spellID = 125195, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tiger Power
			{ spellID = 125359, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shuffle- 
			{ spellID = 115307, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Might Guard 
			{ spellID = 118636, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guard
			{ spellID = 115295, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elusive Brew
			{ spellID = 128939, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dancing Steel
			{ spellID = 120032, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Windsong
			{ spellID = 104509, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fortifying Brew
			{ spellID = 120954, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Touch of Karma
			{spellID = 125174, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Avert Harm
			{spellID = 115213, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Diffuse Magic
			{spellID = 122783, size = iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},
	["SHAMAN"] = {
		{ -- procs
			Name = "Shaman Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Maelstorm Weapon
			{spellID = 53817, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Clearcasting
			{spellID = 16246, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Shaman Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Spiritwalker's Grace
			{spellID = 79206, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Shamanistic Rage
			{spellID = 30823, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Tidal Waves
			{spellID = 51564, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Storm Strike
			{spellID = 17364, size = iconsize, unitId = "target", caster = "player", filter = "DEBUFF"},
			-- Earth Shock
			{spellID = 8042, size = iconsize, unitId = "target", caster = "player", filter = "DEBUFF"},
			-- Frost Shock
			{spellID = 8056, size = iconsize, unitId = "target", caster = "player", filter = "DEBUFF"},
			-- Flame Shock
			{spellID = 8050, size = iconsize, unitId = "target", caster = "player", filter = "DEBUFF"},
		},
	},
	["PALADIN"] = {
		{ -- Procs
			Name = "Paladin Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Infusion of Light
			{spellID = 54149, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Supplication
			{spellID = 94686, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Art of War
			{spellID = 87138, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Hand of Light
			{spellID = 90174, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Paladin Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Holy Shield
			{spellID = 20925, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Beacon of Light
			{spellID = 53563, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Divine Plea
			{spellID = 54428, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Holy Shield
			{spellID = 20925, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Inquisition
			{spellID = 84963, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Judgements of the Pure
			{spellID = 53657, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Avenging Wrath
			{spellID = 31884, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["PRIEST"] = {
		{ -- Procs
			Name = "Priest Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Serendipity
			{spellID = 63735, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Archangel
			{spellID = 81700, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Evangelism
			{spellID = 81662, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dispersion
			{spellID = 47585, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Archangel
			{spellID = 87153, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Priest Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Guardian Spirit
			{spellID = 47788, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["ROGUE"] = {
		{ -- Procs
			Name = "Rogue Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Blindside
			{spellID = 121153, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			
		},
		{ -- Buffs
			Name = "Rogue Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Sprint
			{spellID = 2983, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Cloak of Shadows
			{spellID = 31224, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Adrenaline Rush
			{spellID = 13750, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Evasion
			{spellID = 5277, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Overkill
			{spellID = 58426, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Tricks of the Trade
			{spellID = 57934, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Recuperate
			{spellID = 73651, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Feint
			{spellID = 1966, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Vendetta
			{spellID = 79140, size = iconsize, unitId = "player", caster = "player", filter = "DEBUFF"},
		},
	},
	["WARLOCK"] = {
		{ -- Procs
			Name = "Warlock Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Backdraft
			{spellID = 117896, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Backlash
			{spellID = 108563, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Sacrifice
			{spellID = 108503, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Decimation
			{spellID = 108869, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Molten Core
			{spellID = 122355, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
		{ -- Buffs
			Name = "Priest Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Twilight Ward
			{spellID = 131623, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Burning Rush
			{spellID = 111400, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Fire and Brimstone
			{spellID = 108683, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Instability
			{spellID = 113858, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Knowledge
			{spellID = 113861, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Bargain
			{spellID = 110913, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- SoulBurn
			{ spellID = 74434, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Kil'jaeden's Cunning
			{ spellID = 119049, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Dark Regeneration
			{ spellID = 108359, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["WARRIOR"] = {
		{ -- Procs
			Name = "Warrior Procs",
			Direction = playerprocdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerProcMover, "RIGHT", 0, 0},
			-- Sudden Death
			{spellID = 52437, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Bloodsurge
			{spellID = 46916, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Sword and Board
			{spellID = 50227, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Blood Reserve
			{spellID = 64568, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Victorious
			{spellID = 32216, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
        { -- Buffs
			Name = "Warrior Buffs",
			Direction = playerbuffdirection,
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerBuffMover, "RIGHT", 0, 0},
			-- Last Stand
			{spellID = 12975, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Shield Wall
			{spellID = 871, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Shield Block
			{spellID = 2565, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Spell Reflection
			{spellID = 23920, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Recklesness
			{spellID = 1719, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Berserker rage
			{spellID = 18499, size = iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["ALL"] = {
		{ -- PvE debuffs
			Name = "PvE Debuffs",
			Direction = "LEFT",
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerDebuffMover, "RIGHT", 0, 0},
			-- Baradin Hold
			-- Meteor Slash
			--[[ {spellID = 88942, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"}, ]]
			
			--[[ -- Bastion of Twilight
			-- Blackout (Valiona & Theralion)
			{spellID = 86788, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Engulfing Magic (Valiona & Theralion)
			{spellID = 86631, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Twilight Meteorite (Valiona & Theralion)
			{spellID = 86013, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Malevolent Strikes (Halfus Wyrmbreaker)
			{spellID = 39171, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Waterlogged (Twilight Ascendant Council)
			{spellID = 82762, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Burning Blood (Twilight Ascendant Council)
			{spellID = 82662, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Heart of Ice (Twilight Ascendant Council)
			{spellID = 82667, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frozen (Twilight Ascendant Council)
			--{spellID = 92503, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Swirling Winds (Twilight Ascendant Council)
			{spellID = 83500, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Magnetic Pull (Twilight Ascendant Council)
			{spellID = 83587, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption: Accelerated (Cho'gall)
			{spellID = 81836, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption: Malformation (Cho'gall)
			{spellID = 82125, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption: Absolute (Cho'gall)
			{spellID = 82170, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Corruption: Sickness (Cho'gall)
			{spellID = 93600, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"}, ]]
			
			-- Blackwing Descent
			-- Constricting Chains (Magmaw)
			--{spellID = 91911, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Parasitic Infection (Magmaw)
			--{spellID = 94679, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Infectious Vomit (Magmaw)
			--{spellID = 91923, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Lightning Conductor (Omnitron Defense System)
			--{spellID = 91433, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shadow Infusion (Omnitron Defense System)
			--{spellID = 92048, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Flash Freeze (Maloriak)
			--{spellID = 77699, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Consuming Flames (Maloriak)
			--{spellID = 77786, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Finkle's Mixture (Chimaeron)
			--{spellID = 82705, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shadow Conductor (Nefarian)
			--{spellID = 92053, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Throne of Four Winds
			-- Wind Chill (Conclave of Wind)
			--{spellID = 93123, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Slicing Gale (Conclave of Wind)
			--{spellID = 93058, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Static Shock (Al'Akir)
			--{spellID = 87873, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Acid Rain (Al'Akir)
			--{spellID = 93679, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			--[[ -- Firelands
			-- Melt Armor (Trash)
			{spellID = 99536, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- The Widow's Kiss (Beth'tilac)
			{spellID = 99476, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Eruption (Lord Rhyolith)
			{spellID = 98492, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Molten Feather (Alysrazor)
			{spellID = 97128, size = 40, unitId = "player", caster = "all", filter = "BUFF"},
			-- Wings of Flame (Alysrazor)
			{spellID = 98619, size = 40, unitId = "player", caster = "all", filter = "BUFF"},
			-- Blazing Power (Alysrazor)
			{spellID = 99461, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Alysra's Razor (Alysrazor)
			{spellID = 100029, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Magma Rupture (Shannox)
			{spellID = 99840, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Crystal Prison Trap (Shannox)
			{spellID = 99837, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Jagged Tear (Shannox)
			{spellID = 99937, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Torment (Baleroc)
			{spellID = 99256, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Tormented (Baleroc)
			{spellID = 99257, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Blaze of Glory (Baleroc)
			{spellID = 99252, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Vital Spark (Baleroc)
			{spellID = 99262, size = 40, unitId = "player", caster = "all", filter = "BUFF"},
			-- Vital Flame (Baleroc)
			{spellID = 99263, size = 40, unitId = "player", caster = "all", filter = "BUFF"},
			-- Searing Seeds (Majordomo Staghelm)
			{spellID = 98450, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Burning Orbs (Majordomo Staghelm)
			{spellID = 98451, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Blazing Heat (Ragnaros)
			{spellID = 100460, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Burning Wound (Ragnaros)
			{spellID = 99399, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"}, ]]
			
			-- End Time
			-- Molten Fists
			-- {spellID = 101867, size = 40, unitId = "player", caster = "all", filter = "BUFF"},
			-- Silenced
			-- {spellID = 103587, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Dragon Soul
			-- Crush Armor (Morchok)
			-- {spellID = 103687, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Stomp (Morchok)
			--{spellID = 109034, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Void Bolt (Yor'sahj)
			-- {spellID = 104849, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Fading Light (Ultraxion)
			-- {spellID = 109075, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Tetanus (Madness of Deathwing)
			-- {spellID = 109603, size = 40, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- MoP
			-- Sleight of Hand
			{ spellID = 118162, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Exhale
			{ spellID = 122760, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Exhale
			{ spellID = 122761, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Convert
			{ spellID = 122740, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Wind Step
			{ spellID = 123180, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Overwhelming Assault
			{ spellID = 123474, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Pheromones
			{ spellID = 122835, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pungency
			{ spellID = 123081, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Corrosive Resin Pool
			{ spellID = 122125, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Prison
			{ spellID = 121885, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Parasitic Growth
			{ spellID = 121949, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cobalt Mine Blast
			{ spellID = 116281, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Wildfire Spark
			{ spellID = 116784, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crossed Over
			{ spellID = 116161, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Fixate
			{ spellID = 118303, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Overcharged
			{ spellID = 117878, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Closed Circuit
			{ spellID = 117949, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devastating Arc
			{ spellID = 116835, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Focused Assault
			{ spellID = 116525, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Prison
			{ spellID = 117436, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Defiled Ground
			{ spellID = 118091, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadow Breath
			{ spellID = 122752, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Spray
			{ spellID = 123121, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Dread Spray
			{ spellID = 119985, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Penetrating Bolt
			{ spellID = 119086, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Voodoodoll
			{ spellID = 122151, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Schreckensangst
			{ spellID = 122768, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Focused Energy
			{ spellID = 116829, size = 60, unitId = "player", caster = "all", filter = "DEBUFF" },
			
		},
		{ -- PvP debuffs player
			Name = "PvP Debuffs",
			Direction = "LEFT",
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerPlayerDebuffMover, "RIGHT", 0, 0},
			-- PVP
			-- Death Knight
			-- Strangulate
			{spellID = 47476, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Asphyxiate
			{spellID = 108194, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Chains of Ice
			{spellID = 45524, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Glyph of Death and Decay
			{spellID = 58629, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Control Undead
			{spellID = 111673, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Necrotic Strike
			{spellID = 73975, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Dark Simulacrum
			{spellID = 77606, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Druid
			-- Cyclone
			{spellID = 33786, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Bear Hug
			{spellID = 102795, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Maim
			{spellID = 22570, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Pounce
			{spellID = 102546, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Feral Charge
			{spellID = 45334, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Infected Wounds
			{spellID = 58180, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Skull Bash
			{spellID = 106839, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 97547, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Hunter
			-- Freezing Trap
			{spellID = 3355, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Scare Beast
			{spellID = 1513, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Scatter Shot
			{spellID = 19503, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Snatch (Bird of Prey)
			{spellID = 50541, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silencing Shot
			{spellID = 34490, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Intimidation
			{spellID = 24394, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Sonic Blast (Bat)
			{spellID = 50519, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Ravage (Ravager)
			{spellID = 50518, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Concussive Barrage
			{spellID = 35101, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Concussive Shot
			{spellID = 5116, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Trap Aura
			{spellID = 80019, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Glyph of Freezing Trap
			{spellID = 61394, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Entrapment
			{spellID = 19185, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Pin (Crab)
			{spellID = 50245, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Venom Web Spray (Silithid)
			{spellID = 54706, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Web (Spider)
			{spellID = 4167, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Froststorm Breath (Chimera)
			{spellID = 95725, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hunter's Mark
			{spellID = 1130, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Bad Manner (Monkey)
			{spellID = 90337, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Mage
			-- Dragon's Breath
			{spellID = 31661, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Polymorph
			{spellID = 118, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Deep Freeze
			{spellID = 44572, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Freeze (Water Elemental)
			{spellID = 33395, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Nova
			{spellID = 122, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Chilled
			{spellID = 6136, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cone of Cold
			{spellID = 120, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Slow
			{spellID = 31589, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cauterize
			{spellID = 86949, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Paladin
			-- Repentance
			{spellID = 20066, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Turn Evil
			{spellID = 10326, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shield of the Templar
			{spellID = 63529, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hammer of Justice
			{spellID = 853, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Holy Wrath
			{spellID = 2812, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Stun (Seal of Justice proc)
			{spellID = 20170, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Priest
			-- Psychic Horror
			{spellID = 64058, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mind Control
			{spellID = 605, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Horror
			{spellID = 64044, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mind Flay
			{spellID = 15407, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Rogue
			-- Dismantle
			{spellID = 51722, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Blind
			{spellID = 2094, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Gouge
			{spellID = 1776, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Sap
			{spellID = 6770, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Garrote - Silence
			{spellID = 1330, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cheap Shot
			{spellID = 1833, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Kidney Shot
			{spellID = 408, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Crippling Poison
			{spellID = 3409, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Deadly Throw
			{spellID = 26679, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Shaman
			-- Hex
			{spellID = 51514, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Earthgrab
			{spellID = 64695, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Freeze
			{spellID = 63685, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Earthbind
			{spellID = 3600, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Shock
			{spellID = 8056, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Warlock
			-- Banish
			{spellID = 710, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Death Coil
			{spellID = 6789, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Fear
			{spellID = 5782, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Spell Lock (Felhunter)
			{spellID = 24259, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Intercept (Felguard)
			{spellID = 30153, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Curse of Exhaustion
			{spellID = 18223, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Warrior
			-- Intimidating Shout
			{spellID = 20511, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Disarm
			{spellID = 676, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silenced (Gag Order)
			{spellID = 18498, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Charge Stun
			{spellID = 7922, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shockwave
			{spellID = 46968, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hamstring
			{spellID = 1715, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Piercing Howl
			{spellID = 12323, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Racials
			-- War Stomp
			{spellID = 20549, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
		},
		{ -- PvP buffs
			Name = "PvP Buffs",
			Direction = "LEFT",
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerTargetBuffMover, "RIGHT", 0, 0},
			-- Death Knight
			-- Anti-Magic Shell
			{spellID = 48707, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Unholy Frenzy
			{spellID = 49016, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Druid
			-- Innervate
			{spellID = 29166, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Beserk
			{spellID = 50334, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Predator's Swiftness
			{spellID = 69369, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Hunter
			-- Deterrence
			{spellID = 19263, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Rapid Fire
			{spellID = 3045, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Mage
			-- Ice Block
			{spellID = 45438, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Arcane Power
			{spellID = 12042, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Paladin
			-- Divine Shield
			{spellID = 642, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Aura Mastery
			{spellID = 31821, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Hand of Freedom
			{spellID = 1044, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Hand of Sacrifice
			{spellID = 6940, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Priest
			-- Inner Focus
			{spellID = 89485, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Dispersion
			{spellID = 47585, size = 40, unitId = "target", caster = "target", filter = "BUFF"},
			
			-- Rogue
			-- Shadow Dance
			{spellID = 51713, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Adrenaline Rush
			{spellID = 13750, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Evasion
			{spellID = 5277, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Cloak of Shadows
			{spellID = 31224, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Combat Readiness
			{spellID = 74002, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Cheap Shot
			{spellID = 1833, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Kidney Shot
			{spellID = 408, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Blind
			{spellID = 2094, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Gouge
			{spellID = 1776, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Dismantle
			{spellID = 51722, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Sap
			{spellID = 6770, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Shaman
			-- Grounding Totem Effect
			{spellID = 8178, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			
			-- Warlock
			
			-- Warrior
			-- Spell Reflection
			{spellID = 23920, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
			-- Recklessness
			{spellID = 1719, size = 40, unitId = "target", caster = "all", filter = "BUFF"},
		},
		{ -- PvP debuffs target
			Name = "PvP Debuffs",
			Direction = "LEFT",
			Interval = 5,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerTargetDebuffMover, "RIGHT", 0, 0},
			-- PVP
			-- Death Knight
			-- Strangulate
			{spellID = 47476, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Asphyxiate
			{spellID = 108194, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Chains of Ice
			{spellID = 45524, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Glyph of Death and Decay
			{spellID = 58629, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Control Undead
			{spellID = 111673, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Necrotic Strike
			{spellID = 73975, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Dark Simulacrum
			{spellID = 77606, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Druid
			-- Cyclone
			{spellID = 33786, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Bear Hug
			{spellID = 102795, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Maim
			{spellID = 22570, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Pounce
			{spellID = 102546, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Feral Charge
			{spellID = 45334, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Infected Wounds
			{spellID = 58180, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Skull Bash
			{spellID = 106839, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 97547, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Hunter
			-- Freezing Trap
			{spellID = 3355, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Scare Beast
			{spellID = 1513, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Scatter Shot
			{spellID = 19503, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Snatch (Bird of Prey)
			{spellID = 50541, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silencing Shot
			{spellID = 34490, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Intimidation
			{spellID = 24394, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Sonic Blast (Bat)
			{spellID = 50519, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Ravage (Ravager)
			{spellID = 50518, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Concussive Barrage
			{spellID = 35101, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Concussive Shot
			{spellID = 5116, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Trap Aura
			{spellID = 80019, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Glyph of Freezing Trap
			{spellID = 61394, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Entrapment
			{spellID = 19185, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Pin (Crab)
			{spellID = 50245, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Venom Web Spray (Silithid)
			{spellID = 54706, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Web (Spider)
			{spellID = 4167, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Froststorm Breath (Chimera)
			{spellID = 95725, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hunter's Mark
			{spellID = 1130, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Bad Manner (Monkey)
			{spellID = 90337, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Mage
			-- Dragon's Breath
			{spellID = 31661, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Polymorph
			{spellID = 118, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Deep Freeze
			{spellID = 44572, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Freeze (Water Elemental)
			{spellID = 33395, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Nova
			{spellID = 122, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Chilled
			{spellID = 6136, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cone of Cold
			{spellID = 120, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Slow
			{spellID = 31589, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cauterize
			{spellID = 86949, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Paladin
			-- Repentance
			{spellID = 20066, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Turn Evil
			{spellID = 10326, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shield of the Templar
			{spellID = 63529, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hammer of Justice
			{spellID = 853, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Holy Wrath
			{spellID = 2812, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Stun (Seal of Justice proc)
			{spellID = 20170, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Priest
			-- Psychic Horror
			{spellID = 64058, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mind Control
			{spellID = 605, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Horror
			{spellID = 64044, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Mind Flay
			{spellID = 15407, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Rogue
			-- Dismantle
			{spellID = 51722, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Blind
			{spellID = 2094, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Gouge
			{spellID = 1776, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Sap
			{spellID = 6770, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Garrote - Silence
			{spellID = 1330, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Cheap Shot
			{spellID = 1833, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Kidney Shot
			{spellID = 408, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Crippling Poison
			{spellID = 3409, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Deadly Throw
			{spellID = 26679, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Shaman
			-- Hex
			{spellID = 51514, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Earthgrab
			{spellID = 64695, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Freeze
			{spellID = 63685, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Earthbind
			{spellID = 3600, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Frost Shock
			{spellID = 8056, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Warlock
			-- Banish
			{spellID = 710, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Death Coil
			{spellID = 6789, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Fear
			{spellID = 5782, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Spell Lock (Felhunter)
			{spellID = 24259, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Intercept (Felguard)
			{spellID = 30153, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Curse of Exhaustion
			{spellID = 18223, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Warrior
			-- Intimidating Shout
			{spellID = 20511, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Disarm
			{spellID = 676, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Silenced (Gag Order)
			{spellID = 18498, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Charge Stun
			{spellID = 7922, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Shockwave
			{spellID = 46968, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Hamstring
			{spellID = 1715, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			-- Piercing Howl
			{spellID = 12323, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
			
			-- Racials
			-- War Stomp
			{spellID = 20549, size = iconsize, unitId = "player", caster = "all", filter = "DEBUFF"},
		},
		{ -- Misc
			Name = "Miscellaneous",
			Direction = "CENTER",
			Interval = 5,
			Mode = "ICON",
			setPoint = {"CENTER", FilgerMiscMover, "CENTER", 0, 0},
			-- Potion of Speed
			{spellID = 53908, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Earthen Potion
			{spellID = 79475, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Golemblood Potion
			{spellID = 79634, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Potion of the Tol'vir
			{spellID = 79633, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Volcanic Potion
			{spellID = 79476, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Firelord's Draught
			{spellID = 94826, size = miconsize, unitId = "player", caster = "player", filter = "BUFF"},
			-- Tricks of the Trade
			{spellID = 57934, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Bloodlust
			{spellID = 2825, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Heroism
			{spellID = 36182, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Time Warp
			{spellID = 80353, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Ancient Hysteria
			{spellID = 90355, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Volcanic Power
			{spellID = 79476, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Virmen's Bite
			{spellID = 105697, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Potion of the Mountains
			{spellID = 105698, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Potion of the Jade Serpent
			{spellID = 105702, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
			-- Potion of Mogu Power
			{spellID = 105706, size = miconsize, unitId = "player", caster = "all", filter = "BUFF"},
		},
	},
}