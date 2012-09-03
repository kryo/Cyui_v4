local T, C, L, G = unpack(Tukui)

if C["unitframes"].raidunitdebuffwatch == true then
	-- Class buffs { spell ID, position [, {r,g,b,a}][, anyUnit] }
	do
		T.buffids = {
			PRIEST = {
				{6788,	"TOPRIGHT",		{1, 0, 0}, true},			-- Weakened Soul
				{33076,	"BOTTOMRIGHT",	{0.2, 0.7, 0.2}},			-- Prayer of Mending
				{139,	"BOTTOMLEFT",	{0.4, 0.7, 0.2}},			-- Renew
				{17,	"TOPLEFT",		{0.81, 0.85, 0.1}, true},	-- Power Word: Shield
				{33206,	"LEFT",			{0.9, 0.1, 0.1}, true},		-- Pain Suppression
				{47788,	"LEFT",			{0.8, 0.8, 0.8}, true},		-- Guardian Spirit
			},
			DRUID = {
				{774,	"TOPRIGHT",		{0.8, 0.4, 0.8}},	-- Rejuvenation
				{8936,	"BOTTOMLEFT",	{0.2, 0.8, 0.2}},	-- Regrowth
				{94447,	"TOPLEFT",		{0.4, 0.8, 0.2}},	-- Lifebloom
				{48438,	"BOTTOMRIGHT",	{0.8, 0.4, 0}},		-- Wild Growth
			},
			PALADIN = {
				{53563,	"TOPRIGHT",		{0.7, 0.3, 0.7}, true},		-- Beacon of Light
				{65148,	"TOPLEFT",		{0.89, 0.1, 0.1}},			-- Sacred Shield
				{1022,	"BOTTOMRIGHT",	{0.2, 0.2, 1}, true},		-- Hand of Protection
				{1044,	"BOTTOMRIGHT",	{0.89, 0.45, 0}, true},		-- Hand of Freedom
				{1038,	"BOTTOMRIGHT",	{0.93, 0.75, 0}, true},		-- Hand of Salvation
				{6940,	"BOTTOMRIGHT",	{0.89, 0.1, 0.1}, true},	-- Hand of Sacrifice
			},
			SHAMAN = {
				{61295,	"TOPRIGHT",		{0.7, 0.3, 0.7}},		-- Riptide
				{974,	"BOTTOMLEFT",	{0.2, 0.7, 0.2}, true},	-- Earth Shield
				{51945,	"BOTTOMRIGHT",	{0.7, 0.4, 0}},			-- Earthliving
			},
			MONK = {
				{119611,	"TOPLEFT",		{0.8, 0.4, 0.8}},	-- Renewing Mist
				{116849,	"TOPRIGHT",		{0.2, 0.8, 0.2}},	-- Life Cocoon
				{124682,	"BOTTOMLEFT",	{0.4, 0.8, 0.2}},	-- Enveloping Mist
				{124081,	"BOTTOMRIGHT",	{0.7, 0.4, 0}},		-- Zen Sphere
			},
			ALL = {
				{14253, "RIGHT", {0, 1, 0}},	-- Abolish Poison
				{23333, "LEFT", {1, 0, 0}},		-- Warsong Flag (Horde)
				{23335, "LEFT", {1, 0, 0}},		-- Warsong Flag (Alliance)
			},
		}
	end
	
	-- Raid debuffs
	do
		local ORD = oUF_RaidDebuffs

		if not ORD then return end
		
		ORD.ShowDispelableDebuff = true
		ORD.FilterDispellableDebuff = true
		ORD.MatchBySpellName = true
		ORD.DeepCorruption = true
		
		local function SpellName(id)
			local name = select(1, GetSpellInfo(id))
			return name	
		end

		T.debuffids = {
			-- Firelands -----------------------------------------------------------
				-- Beth'tilac
				SpellName(99506),	-- Widows Kiss
				SpellName(97202),	-- Fiery Web Spin
				SpellName(49026),	-- Fixate
				SpellName(97079),	-- Seeping Venom
				-- Lord Rhyolith
				-- Alysrazor
				--SpellName(99308),	-- Gushing Wound
				SpellName(100024),	-- Gushing Wound
				SpellName(99389),	-- Imprinted
				SpellName(99844),	-- Blazing Claw
				SpellName(100640),	-- Harsh Winds
				-- Shannox
				SpellName(99837),	-- Crystal Prison
				SpellName(99937),	-- Jagged Tear
				-- Baleroc
				SpellName(99256),	-- Torment
				SpellName(99252),	-- Blaze of Glory
				SpellName(99516),	-- Countdown
				-- Majordomo Staghelm
				SpellName(98450),	-- Searing Seeds
				SpellName(98451),	-- Burning Orb
				-- Ragnaros
				SpellName(99399),	-- Burning Wound
				SpellName(98313),	-- Magma Blast
				SpellName(100675),	-- Dreadflame
				SpellName(99145),	-- Blazing Heat
				SpellName(99613),	-- Molten Blast
				-- Trash
				SpellName(99532),	-- Melt Armor
			-- Dragon Soul -----------------------------------------------------------
				-- Morchok
				SpellName(103687),	-- Crush Armor
				SpellName(103536),	-- Warning
				SpellName(103534),	-- Danger
				SpellName(103785),	-- Black Blood of the Earth
				-- Warlord Zon'ozz
				SpellName(103434),	-- Disrupting Shadows
				-- Yor'sahj the Unsleeping
				SpellName(103628),	-- Deep Corruption
				-- Hagara the Stormbinder
				SpellName(104451),	-- Ice Tomb
				SpellName(105259),	-- Watery Entrenchment
				SpellName(109325),	-- Frostflake
				SpellName(105289),	-- Shattered Ice
				SpellName(105285),	-- Target
				-- Ultraxion
				SpellName(105925),	-- Fading Light
				-- Warmaster Blackhorn
				SpellName(108043),	-- Sunder Armor
				SpellName(107567),	-- Brutal Strike
				SpellName(107558),	-- Degeneration
				SpellName(110214),	-- Consuming Shroud
				-- Spine of Deathwing
				SpellName(105479),	-- Searing Plasma
				SpellName(105490),	-- Fiery Grip
				SpellName(106199),	-- Blood Corruption: Death
				-- Madness of Deathwing
				SpellName(106444),	-- Impale
				SpellName(105841),	-- Degenerative Bite
				SpellName(105445),	-- Blistering Heat
				SpellName(106730),	-- Tetanus
				SpellName(108649),	-- Corrupting Parasite
			-- Kun-Lai Summit -----------------------------------------------------------
				-- Sha of Anger
				SpellName(119626),	-- Aggressive Behavior
				SpellName(119488),	-- Unleashed Wrath
				-- Salyis's Warband
				SpellName(121787),  -- Stomp
			-- Mogu'shan Vaults -----------------------------------------------------------
				-- The Stone Guard
				SpellName(116281),	-- Cobalt Mine Blast
				SpellName(130395),  -- Jasper Chains
				SpellName(125206),  -- Rend Flesh
				-- Feng the Accursed
				SpellName(116784),	-- Wildfire Spark
				SpellName(116417),	-- Arcane Resonance
				SpellName(131790),  -- Arcane Shock
				SpellName(116942),  -- Flaming Spear
				SpellName(131788),  -- Lightning Lash
				-- Gara'jal the Spiritbinder
				SpellName(116161),	-- Crossed Over
				SpellName(116000),  -- Voodoo Dolls
				-- The Spirit Kings
				SpellName(117708),	-- Maddening Shout
				SpellName(118303),	-- Fixate
				SpellName(118048),	-- Pillaged
				SpellName(118135),	-- Pinned Down
				-- Elegon
				SpellName(117878),	-- Overcharged
				SpellName(117949),	-- Closed Circuit
				-- Will of the Emperor
				SpellName(116835),	-- Devastating Arc
				SpellName(116778),	-- Focused Defense
				SpellName(116525),	-- Focused Assault
				SpellName(116829),  -- Focused Energy
			-- Heart of Fear -----------------------------------------------------------
				-- Imperial Vizier Zor'lok
				SpellName(122761),	-- Exhale
				SpellName(122760), -- Exhale
				SpellName(122740),	-- Convert
				SpellName(123812),	-- Pheromones of Zeal
				-- Blade Lord Ta'yak
				SpellName(123180),	-- Wind Step
				SpellName(123474),	-- Overwhelming Assault
				-- Garalon
				SpellName(122835),	-- Pheromones
				SpellName(123081),	-- Pungency
				-- Wind Lord Mel'jarak
				SpellName(122125),	-- Corrosive Resin Pool
				SpellName(121885), 	-- Amber Prison
				SpellName(131813),  -- Wind Bomb   
				-- Amber-Shaper Un'sok
				SpellName(121949),	-- Parasitic Growth
				-- Grand Empress Shek'zeer
				SpellName(123707),  -- Eyes of the Empress
			-- Terrace of Endless Spring -----------------------------------------------------------
				-- Protectors of the Endless
				SpellName(117436),	-- Lightning Prison
				SpellName(117398),	-- Lightning Prison
				SpellName(118091),	-- Defiled Ground
				SpellName(117519),	-- Touch of Sha
				-- Tsulong
				SpellName(122752),	-- Shadow Breath
				SpellName(123011),	-- Terrorize
				SpellName(122777),	-- Nightmares
				-- Lei Shi
				SpellName(123121),	-- Spray
				SpellName(123705),  -- Scary Fog  
				-- Sha of Fear
				SpellName(119985),	-- Dread Spray
				SpellName(119086),	-- Penetrating Bolt
				SpellName(119775),	-- Reaching Attack
		}

		T.ReverseTimer = {
			[92956] = true, -- Sinestra (Wrack)
		},
		
		ORD:RegisterDebuffs(T.debuffids)
	end
end