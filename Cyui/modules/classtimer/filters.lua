local T, C, L, G = unpack(Tukui)

if C.classtimer.enable ~= true then return end

local CreateSpellEntry = function(id, castByAnyone, color, unitType, castSpellId)
	return {id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId}
end

TRINKET_FILTER = {
	-- Misc
	CreateSpellEntry(2825, true), CreateSpellEntry(32182, true), CreateSpellEntry(80353, true), CreateSpellEntry(90355, true),	-- Bloodlust/Heroism/Timewarp/Ancient Hysteria
	CreateSpellEntry(57933, true),	-- Tricks of Trade (15% dmg buff)
	CreateSpellEntry(73422),	-- Chaos Bane
	CreateSpellEntry(71905),	-- Soul Fragment
	CreateSpellEntry( 80627 ), -- Stolen Power
	
	-- Quartermasters
	CreateSpellEntry(91828),	-- Impatience of Youth (Thrill of Victory)
	CreateSpellEntry(91192),	-- Mandala of Stirring Patterns (Pattern of Light)
	CreateSpellEntry(92222),	-- Mirror of Broken Images (Image of Immortality)
	CreateSpellEntry(92123),	-- Unsolvable Riddle (Enigma)
	CreateSpellEntry(92233),	-- Bedrock Talisman (Tectonic Shift)
	CreateSpellEntry(91155),	-- Core of Ripeness (Expansive Soul)
	CreateSpellEntry(92104),	-- Fluid Death (River of Death)
	CreateSpellEntry(91810),	-- License to Slay (Slayer)
	CreateSpellEntry(91019),	-- Soul Casket (Soul Power)
	CreateSpellEntry(91047),	-- Stump of Time (Battle Magic)
	CreateSpellEntry(126599),	-- Hawkmaster's Talon
	CreateSpellEntry(129812),	-- Iron Belly Wok
	CreateSpellEntry(126597),	-- Lao-Chin's Liquid Courage
	CreateSpellEntry(126606),	-- Scroll of Revered Ancestors
	CreateSpellEntry(126605),	-- Blossom of Pure Snow
	
	-- Brewfest
	CreateSpellEntry(127915),	-- Thousand-Year Pickled Egg
	CreateSpellEntry(127923),	-- Mithril Wristwatch
	CreateSpellEntry(127928),	-- Coren's Cold Chromium Coaster
	CreateSpellEntry(127967),	-- Brawler's Statue
	
	-- Hour of Twilight
	CreateSpellEntry(102659),	-- Arrow of Time
	CreateSpellEntry(102667),	-- Veil of Lies
	CreateSpellEntry(102664),	-- Varo'then's Brooch
	CreateSpellEntry(102661),	-- Rosary of Light
	CreateSpellEntry(102660),	-- Master Pit Fighter
	CreateSpellEntry(102662),	-- Foul Gift
	
	-- Blackwing Descent
	CreateSpellEntry(91832), CreateSpellEntry(91836),	-- Fury of Angerforge
	CreateSpellEntry(91322), CreateSpellEntry(92331),	-- Jar of Ancient Remedies (Blind Spot)
	CreateSpellEntry(92235), CreateSpellEntry(92355),	-- Symbiotic Worm (Turn of the Worm)
	CreateSpellEntry(92124), CreateSpellEntry(92349),	-- Prestor's Talisman of Machination (Nefarious Plot)
	CreateSpellEntry(91007), CreateSpellEntry(92318),	-- Bell of Enraging Resonance (Dire Magic)
	CreateSpellEntry(91816), CreateSpellEntry(92345),	-- Heart of Rage (Rageheart)
	
	-- The Bastion of Twilight
	CreateSpellEntry(92108),	-- Unheeded Warning (Heedless Carnage)
	CreateSpellEntry(92126), CreateSpellEntry(92351),	-- Essence of the Cyclone (Twisted)
	CreateSpellEntry(92213), CreateSpellEntry(92357),	-- Vial of Stolen Memories (Memory of Invincibility)
	CreateSpellEntry(91024), CreateSpellEntry(92320),	-- Theralion's Mirror (Revelation)
	CreateSpellEntry(91184), CreateSpellEntry(92332),	-- Fall of Mortality (Grounded Soul)
	CreateSpellEntry(91821), CreateSpellEntry(92342),	-- Crushing Weight (Race Against Death)
	CreateSpellEntry(91027), CreateSpellEntry(91041), CreateSpellEntry(92325), CreateSpellEntry(92328),	-- Heart of Ignacious (Heart's Revelation)
	
	-- Firelands
	CreateSpellEntry(96980), CreateSpellEntry(97142), -- Accelerated (Vessel of Acceleration)
	CreateSpellEntry(96911), CreateSpellEntry(97125), -- Devour (The Hungerer)
	CreateSpellEntry(96988), CreateSpellEntry(97145), -- Stay of Execution 
	CreateSpellEntry(96945), CreateSpellEntry(97129), -- Loom of Fate (Spidersilk Spindle)
	CreateSpellEntry(96907), CreateSpellEntry(97120), -- Victorious (Jaws of Defeat)
	
	-- Dragon Soul
	CreateSpellEntry(109785), CreateSpellEntry(108007), CreateSpellEntry(109786), -- Indomitable Pride
	CreateSpellEntry(109802), CreateSpellEntry(107982), CreateSpellEntry(109804), -- Seal of the Seven Signs
	CreateSpellEntry(109742), CreateSpellEntry(107988), CreateSpellEntry(109744), -- Creche of the Final Dragon
	CreateSpellEntry(109748), CreateSpellEntry(107966), CreateSpellEntry(109750), -- Eye of Unmaking
	CreateSpellEntry(109811), CreateSpellEntry(107962), CreateSpellEntry(109813), -- Heart of Unliving
	CreateSpellEntry(109787), CreateSpellEntry(107982), CreateSpellEntry(109789), -- Insignia of the Corrupted Mind
	CreateSpellEntry(109780), CreateSpellEntry(107968), CreateSpellEntry(109782), -- Resolve of Undying
	CreateSpellEntry(109774), CreateSpellEntry(107986), CreateSpellEntry(109776), -- Soulshifter Vortex
	CreateSpellEntry(109709), CreateSpellEntry(107982), CreateSpellEntry(109711), -- Starcatcher Compass
	CreateSpellEntry(109793), CreateSpellEntry(107970), CreateSpellEntry(109795), -- Will of Unbinding
	CreateSpellEntry(109717), CreateSpellEntry(107960), CreateSpellEntry(109719), -- Wrath of Unchaining
	CreateSpellEntry(109791), CreateSpellEntry(107948), CreateSpellEntry(109792), -- Reflection of the Light
	CreateSpellEntry(109746), CreateSpellEntry(107949), CreateSpellEntry(109747), -- Rotting Skull
	CreateSpellEntry(109714), CreateSpellEntry(107947), CreateSpellEntry(109715), -- Kiroptyric Sigil
	CreateSpellEntry(109791), CreateSpellEntry(107948), CreateSpellEntry(109792), -- Bottled Wishes
	CreateSpellEntry(109778), CreateSpellEntry(107951), CreateSpellEntry(109779), -- Fire of the Deep
	CreateSpellEntry(109842), CreateSpellEntry(107804), CreateSpellEntry(109844), -- Slowing the Sands (Ti'tahk, the Steps of Time)
	
	-- MoP heroics
	CreateSpellEntry(126519), -- Lessons of the Darkmaster
	CreateSpellEntry(126483), -- Windswept Pages
	CreateSpellEntry(126513), -- Carbonic Carbuncle
	CreateSpellEntry(126260), -- Heart of Fire
	CreateSpellEntry(126476), -- Vision of the Predator
	CreateSpellEntry(126270), -- Vial of Ichorous Blood
	CreateSpellEntry(126236), -- Iron Protector Talisman
	CreateSpellEntry(126478), -- Flashfrozen Resin Globule
	CreateSpellEntry(126484), -- Flashing Steel Talisman
	CreateSpellEntry(126490), -- Searing Words 
	CreateSpellEntry(126266), -- Empty Fruit Barrel
	CreateSpellEntry(105574), -- Zen Alchemist Stone
	CreateSpellEntry(128896), -- Bloodsoaked Chitin Fragment
	CreateSpellEntry(127577), -- Daelo's Final Words
	CreateSpellEntry(127575), -- Gerp's Perfect Arrow
	
	-- MoP Raids
	CreateSpellEntry(126599), CreateSpellEntry(126599), CreateSpellEntry(126599), -- Jade Charioteer Figurine
	CreateSpellEntry(126597), CreateSpellEntry(126597), CreateSpellEntry(126597), -- Jade Warlord Figurine
	CreateSpellEntry(126606), CreateSpellEntry(126606), CreateSpellEntry(126606), -- Jade Courtesan Figurine
	CreateSpellEntry(126605), CreateSpellEntry(126605), CreateSpellEntry(126605), -- Jade Magistrate Figurine
	CreateSpellEntry(126599), CreateSpellEntry(126599), CreateSpellEntry(126599), -- Jade Bandit Figurine
	CreateSpellEntry(126582), CreateSpellEntry(126582), CreateSpellEntry(126582), -- Lei Shin's Final Orders
	CreateSpellEntry(126577), CreateSpellEntry(126577), CreateSpellEntry(126577), -- Light of the Cosmos
	CreateSpellEntry(126554), CreateSpellEntry(126554), CreateSpellEntry(126554), -- Bottle of Infinite Stars
	CreateSpellEntry(126533), CreateSpellEntry(126533), CreateSpellEntry(126533), -- Vial of Dragon's Blood
	CreateSpellEntry(126588), CreateSpellEntry(126588), CreateSpellEntry(126588), -- Qin-xi's Polarizing Seal
	CreateSpellEntry(126640), CreateSpellEntry(126640), CreateSpellEntry(126640), -- Spirits of the Sun
	CreateSpellEntry(126659), CreateSpellEntry(126659), CreateSpellEntry(126659), -- Essence of Terror
	CreateSpellEntry(126657), CreateSpellEntry(126657), CreateSpellEntry(126657), -- Darkmist Vortex
	CreateSpellEntry(126649), CreateSpellEntry(126649), CreateSpellEntry(126649), -- Terror in the Mists
	CreateSpellEntry(126646), CreateSpellEntry(126646), CreateSpellEntry(126646), -- Stuff of Nightmares
	
	-- Darkmoon Cards
	CreateSpellEntry(89181),	-- Darkmoon Card: Earthquake
	CreateSpellEntry(89182),	-- Darkmoon Card: Tsunami
	CreateSpellEntry(89091),	-- Darkmoon Card: Volcano
	CreateSpellEntry(128985),	-- Relic of Yu'lon
	CreateSpellEntry(128987),	-- Relic of Chi Ji
	CreateSpellEntry(128988),	-- Relic of Niuzao
	CreateSpellEntry(128984),	-- Relic of Xuen (agi)
	CreateSpellEntry(128986),	-- Relic of Xuen (str)
	
	-- Scopes
	CreateSpellEntry(81932),	-- Gnomish X-Ray Scope
	CreateSpellEntry(99623),	-- Flintlocke's Woodchucker
	
	-- PvP S12
	CreateSpellEntry(126697),	-- Malevolent Gladiator's Emblem of Meditation (Tremendous Fortitude)
	CreateSpellEntry(126690),	-- Malevolent Gladiator's Badge of Conquest (Call of Conquest)
	CreateSpellEntry(126707),	-- Malevolent Gladiator's Insignia of Conquest (Surge of Conquest)
	CreateSpellEntry(126700),	-- Malevolent Gladiator's Insignia of Victory (Surge of Victory)
	CreateSpellEntry(126679),	-- Malevolent Gladiator's Badge of Victory (Call of Victory)
	CreateSpellEntry(126683),	-- Malevolent Gladiator's Badge of Dominance (Call of Dominance)
	CreateSpellEntry(126705),	-- Malevolent Gladiator's Insignia of Dominance (Surge of Dominance)
	
	-- Molten Front dailies
	CreateSpellEntry(97008), -- Fiery Quintessence
	CreateSpellEntry(97010), -- Essence of the Eternal Flame
	CreateSpellEntry(97009), -- Ancient Petrified Seed
	CreateSpellEntry(97007), -- Mark of the Firelord (Rune of Zeth)
	
	-- Enchants
	CreateSpellEntry(74245),	-- Landslide
	CreateSpellEntry(74221),	-- Hurricane
	CreateSpellEntry(74224),	-- Heartsong
	CreateSpellEntry(104993),	-- Jade Spirit
	CreateSpellEntry(104440),	-- Colossus
	CreateSpellEntry(104442),	-- River's Song
	CreateSpellEntry(104425),	-- Windsong
	CreateSpellEntry(104434),	-- Dancing Steel
	
	-- Professions
	CreateSpellEntry(74497),	-- Lifeblood (Herbalism)
	CreateSpellEntry(54861),	-- Nitro Boosts (Engineering)
	CreateSpellEntry(82174),	-- Synapse Springs (Engineering)
	CreateSpellEntry(54758),	-- Hyperspeed Acceleration (Engineering)
	CreateSpellEntry(55637),	-- Lightweave (Tayloring)
	CreateSpellEntry(73549),	-- Figurine: Demon Panther (Jewelcrafting)
	CreateSpellEntry(73552),	-- Figurine: Dream Owl (Jewelcrafting)
	CreateSpellEntry(73550),	-- Figurine: Earthen Guardian (Jewelcrafting)
	CreateSpellEntry(73551),	-- Figurine: Jeweled Serpent (Jewelcrafting)
	CreateSpellEntry(73522),	-- Figurine: King of Boars (Jewelcrafting)
	
	-- Racials
	CreateSpellEntry(20954),	-- Stoneform (Dwarf)
	CreateSpellEntry(59752),	-- Every Man for Himself (Human)
	CreateSpellEntry(57901),	-- Gift of the Naaru (Draenei)
	CreateSpellEntry(68992),	-- Darkflight (Worgen)
	CreateSpellEntry(7744),		-- Will of the Forsaken (Undead)
	CreateSpellEntry(26297),	-- Berserking (Troll)
	CreateSpellEntry(33702), CreateSpellEntry(33697), CreateSpellEntry(20572),	-- Blood Fury (Orc)
	
	-- Potions
	CreateSpellEntry(79633),	-- Tol'vir
	CreateSpellEntry(79475),	-- Earthen Armor
	CreateSpellEntry(79634),	-- Golemblood's
	CreateSpellEntry(78993),	-- Concentration
	CreateSpellEntry(79476),	-- Volcanic Power
	CreateSpellEntry(105697),	-- Virmen's Bite
	CreateSpellEntry(105698),	-- Potion of the Mountains
	CreateSpellEntry(105702),	-- Potion of the Jade Serpent	
	CreateSpellEntry(105706),	-- Potion of Mogu Power
	
	-- Weapons
	CreateSpellEntry(109842), CreateSpellEntry(107804), CreateSpellEntry(109844), -- Ti'tahk, the Steps of Time
}

CLASS_FILTERS = {
	DEATHKNIGHT = {
		target = {
			CreateSpellEntry(108194),	-- Asphyxiate
			CreateSpellEntry(111673),	-- Control Undead
			--
			CreateSpellEntry(55095),	-- Frost Fever
			CreateSpellEntry(55078),	-- Blood Plague
			CreateSpellEntry(81130),	-- Scarlet Fever
			CreateSpellEntry(50536),	-- Unholy Blight
			CreateSpellEntry(65142),	-- Ebon Plague
			CreateSpellEntry(51714),	-- Razorice
			CreateSpellEntry(73975),	-- Necrotic Strike
			CreateSpellEntry(47476),	-- Strangulate
			CreateSpellEntry(73975),	-- Necrotic Strike
		},
		player = {
			CreateSpellEntry(115994),	-- Unholy Blight
			CreateSpellEntry(114556),	-- Purgatory
			CreateSpellEntry(96268),	-- Death's Advance
			CreateSpellEntry(119980),	-- Conversion
			CreateSpellEntry(118009),	-- Desecrated Ground
			CreateSpellEntry(115000),	-- Remorseless Winter
			--
			CreateSpellEntry(59052),	-- Freezing Fog
			CreateSpellEntry(51124),	-- Killing Machine
			CreateSpellEntry(49016),	-- Unholy Frenzy
			CreateSpellEntry(57330),	-- Horn of Winter
			CreateSpellEntry(77535),	-- Blood Shield
			CreateSpellEntry(70654),	-- Blood Armor
			CreateSpellEntry(55233),	-- Vampiric Blood
			CreateSpellEntry(81141),	-- Blood Swarm
			CreateSpellEntry(45529),	-- Blood Tap
			CreateSpellEntry(49222),	-- Bone Shield
			CreateSpellEntry(48792),	-- Ice Bound Fortitude
			CreateSpellEntry(49028),	-- Dancing Rune Weapon
			CreateSpellEntry(51271),	-- Pillar of Frost
			CreateSpellEntry(48707),	-- Anti-Magic Shell
			CreateSpellEntry(49039),	-- Lichborne
		},
		procs = {
			CreateSpellEntry(53365),	-- Unholy Strength
			CreateSpellEntry(64856),	-- Blade Barrier
			CreateSpellEntry(81340),	-- Sudden Doom
			CreateSpellEntry(70657),	-- Advantage
		}
	},
	DRUID = { 
		target = { 
			CreateSpellEntry(48438),	-- Wild Growth
			CreateSpellEntry(774),		-- Rejuvenation
			CreateSpellEntry(8936, false, nil, nil, 8936),	-- Regrowth
			CreateSpellEntry(33763),	-- Lifebloom
			CreateSpellEntry(5570),		-- Insect Swarm
			CreateSpellEntry(8921),		-- Moonfire
			CreateSpellEntry(339),		-- Entangling Roots
			CreateSpellEntry(33786),	-- Cyclone
			CreateSpellEntry(2637),		-- Hibernate
			CreateSpellEntry(2908),		-- Soothe
			CreateSpellEntry(50259),	-- Feral Charge (Cat) - daze
			CreateSpellEntry(45334),	-- Feral Charge (Bear) - immobilize
			CreateSpellEntry(58180),	-- Infected Wounds
			CreateSpellEntry(6795),		-- Growl
			CreateSpellEntry(5209),		-- Challenging Roar
			CreateSpellEntry(99),		-- Demoralizing Roar
			CreateSpellEntry(33745),	-- Lacerate
			CreateSpellEntry(5211),		-- Bash
			CreateSpellEntry(80964),	-- Skull Bash (Bear)
			CreateSpellEntry(80965),	-- Skull Bash (Cat)
			CreateSpellEntry(22570),	-- Maim
			CreateSpellEntry(1822),		-- Rake
			CreateSpellEntry(1079),		-- Rip
			CreateSpellEntry(33878, true),	-- Mangle (Bear)
			CreateSpellEntry(33876, true),	-- Mangle (Cat)
			CreateSpellEntry(9007),		-- Pounce bleed
			CreateSpellEntry(9005),		-- Pounce stun
			CreateSpellEntry(91565, true),	-- Faerie Fire (Feral)
			CreateSpellEntry(770, true),	-- Farie Fire
			CreateSpellEntry(467),		-- Thorns
			CreateSpellEntry(78675),	-- Solar Beam
			CreateSpellEntry(93402),	-- Sunfire
			CreateSpellEntry(77758),	-- Thrash
		},
		player = {
			CreateSpellEntry(48505),	-- Starfall
			CreateSpellEntry(29166),	-- Innervate
			CreateSpellEntry(22812),	-- Barkskin
			CreateSpellEntry(16689),	-- Nature's Grasp
			CreateSpellEntry(5215),		-- Prowl
			CreateSpellEntry(17116),	-- Nature's Swiftness
			CreateSpellEntry(5229),		-- Enrage
			CreateSpellEntry(52610),	-- Savage Roar
			CreateSpellEntry(127538),	-- Savage Roar glyphed
			CreateSpellEntry(5217),		-- Tiger's Fury
			CreateSpellEntry(1850),		-- Dash
			CreateSpellEntry(22842),	-- Frenzied Regeneration
			CreateSpellEntry(50334),	-- Berserk
			CreateSpellEntry(61336),	-- Survival Instincts
			CreateSpellEntry(48438),	-- Wild Growth
			CreateSpellEntry(774),		-- Rejuvenation
			CreateSpellEntry(8936, false, nil, nil, 8936),	-- Regrowth
			CreateSpellEntry(33763),	-- Lifebloom
			CreateSpellEntry(467),		-- Thorns
			CreateSpellEntry(80951),	-- Pulverize
			CreateSpellEntry(62600), CreateSpellEntry(62606),	-- Savage Defense
			CreateSpellEntry(33891),	-- Tree of life
			CreateSpellEntry(106922),	-- Might of Ursoc
		},
		procs = {
			CreateSpellEntry(16870),	-- Clearcasting
			CreateSpellEntry(48518),	-- Eclipse Lunar
			CreateSpellEntry(48517),	-- Eclipse Solar
			CreateSpellEntry(69369),	-- Predator's Swiftness
			CreateSpellEntry(93400),	-- Shooting Stars
			--CreateSpellEntry(81006), CreateSpellEntry(81191), CreateSpellEntry(81192),	-- Lunar Shower (Rank 1/2/3)
			CreateSpellEntry(81192),	-- Lunar Shower
			CreateSpellEntry(16886),	-- Nature's Grace (Rank 1/2/3)
		},
	},
	HUNTER = { 
		target = {
			CreateSpellEntry(49050),		-- Aimed Shot
			CreateSpellEntry(53238),		-- Piercing Shots
			CreateSpellEntry(3674),			-- Black Arrow
			CreateSpellEntry(82654),		-- Widow Venom
			CreateSpellEntry(34490),		-- Silencing Shot
			CreateSpellEntry(37506),		-- Scatter Shot
			CreateSpellEntry(88691),		-- Marker for death
			CreateSpellEntry(1130, true),	-- Hunters mark
			CreateSpellEntry(1978),			-- Serpent sting
			CreateSpellEntry(90337),		-- Bad Manner
			CreateSpellEntry(53301),		-- Explosive Shot
			CreateSpellEntry(13809),		-- Ice Trap
			},
		player = {
			CreateSpellEntry(82749),		-- Killing Streak
			CreateSpellEntry(3045),			-- Rapid Fire
			CreateSpellEntry(34471),		-- The Beast Within
			CreateSpellEntry(77769),		-- Trap Launcher
			CreateSpellEntry(19263),		-- Deterrence
			CreateSpellEntry(53434),		-- Call of the Wild
			CreateSpellEntry(64420),		-- Sniper Training
			CreateSpellEntry(64418), CreateSpellEntry(64419), CreateSpellEntry(64420),	-- Sniper Training Rank 1/2/3
		},
		procs = {
			CreateSpellEntry(53257),		-- Cobra Strikes 
			CreateSpellEntry(6150),			-- Quick Shots
			CreateSpellEntry(56453),		-- Lock and Load
			CreateSpellEntry(82692),		-- Focus Fire
			CreateSpellEntry(35099),		-- Rapid Killing Rank 2
			CreateSpellEntry(53220),		-- Improved Steadyshot
			CreateSpellEntry(94007),		-- Killing Streak
			CreateSpellEntry(70893),		-- Culling the herd
			CreateSpellEntry(82925),		-- Master Marksman
			CreateSpellEntry(63087),		-- Glyph of Raptor Strike
			CreateSpellEntry(82926),		-- Fire!
			CreateSpellEntry(89388),		-- Sic'Em
		},
	},
	MAGE = {
		target = { 
			CreateSpellEntry(44457),	-- Living Bomb
			CreateSpellEntry(11366),	-- Pyroblast
			CreateSpellEntry(92315),	-- Pyroblast!
			CreateSpellEntry(118),		-- Polymorph
			CreateSpellEntry(28271),	-- Polymorph Turtle
			CreateSpellEntry(31589),	-- Slow
			CreateSpellEntry(116),		-- Frostbolt
			CreateSpellEntry(120),		-- Cone of Cold
			CreateSpellEntry(122),		-- Frost Nova
			CreateSpellEntry(44614),	-- Frostfire Bolt
			CreateSpellEntry(12654),	-- Ignite
			CreateSpellEntry(22959),	-- Critical Mass
			CreateSpellEntry(83853),	-- Combustion
			CreateSpellEntry(31661),	-- Dragon's Breath
			CreateSpellEntry(83154),	-- Piercing Chill
			CreateSpellEntry(44572),	-- Deep Freeze
			CreateSpellEntry(11113),	-- Blast Wave
			CreateSpellEntry(82691),	-- Ring of Frost
			CreateSpellEntry(12355),	-- Impact
			CreateSpellEntry(102051),	-- Frostjaw
		},
		player = {
			CreateSpellEntry(36032),	-- Arcane Blast
			CreateSpellEntry(12042),	-- Arcane Power
			CreateSpellEntry(32612),	-- Invisibility
			CreateSpellEntry(1463),		-- Mana Shield
			CreateSpellEntry(543),		-- Mage Ward
			CreateSpellEntry(11426),	-- Ice Barrier
			CreateSpellEntry(45438),	-- Ice Block
			CreateSpellEntry(12472),	-- Icy Veins
			CreateSpellEntry(130),		-- Slow Fall
			CreateSpellEntry(57761),	-- Brain Freeze
		},
		procs = {
			CreateSpellEntry(44544),	-- Fingers of Frost
			CreateSpellEntry(79683),	-- Arcane Missiles!
			CreateSpellEntry(48108),	-- Hot Streak
			CreateSpellEntry(64343),	-- Impact
			CreateSpellEntry(83582),	-- Pyromaniac
			CreateSpellEntry(12536),	-- Clearcasting
			CreateSpellEntry(48107),	-- Heating Up
		},
	},
	MONK = {
		target = {
			CreateSpellEntry(107428),	-- Risin Sun Kick
			CreateSpellEntry(123727),	-- Dizzying Haze
			CreateSpellEntry(123725),	-- Breath of Fire
			CreateSpellEntry(115804),	-- Mortal Wounds
		},
		player = {
			CreateSpellEntry(124081),	-- Zensphere
			CreateSpellEntry(125195),	-- Tigereye Brew
			CreateSpellEntry(125359),	-- Tiger Power
			CreateSpellEntry(115307),	-- Shuffle
			CreateSpellEntry(118636),	-- Power Guard
			CreateSpellEntry(115295),	-- Guard
			CreateSpellEntry(128939),	-- Elusive Brew
		},
		procs = {
			CreateSpellEntry(116768),	-- Combobreaker: Blackout-Kick
			CreateSpellEntry(120273),	-- Tiger Strikes
			CreateSpellEntry(118864),	-- Combobreaker: Tigerpalm
		}
	},
	PALADIN = { 
		target = {
			CreateSpellEntry(31803),	-- Censure
			CreateSpellEntry(20066),	-- Repentance
			CreateSpellEntry(853),		-- Hammer of Justice
			CreateSpellEntry(31935),	-- Avenger's Shield
			CreateSpellEntry(20170),	-- Seal of Justice
			CreateSpellEntry(26017),	-- Vindication
			CreateSpellEntry(68055),	-- Judgements of the Just
			CreateSpellEntry(86273),	-- Illuminated Healing
			CreateSpellEntry(20925),	-- Sacred Shield
		},
		player = {
			CreateSpellEntry(642),		-- Divine Shield
			CreateSpellEntry(31850),	-- Ardent Defender
			CreateSpellEntry(498),		-- Divine Protection
			CreateSpellEntry(31884),	-- Avenging Wrath
			CreateSpellEntry(85696),	-- Zealotry
			CreateSpellEntry(25771),	-- Debuff: Forbearance
			CreateSpellEntry(1044),		-- Hand of Freedom
			CreateSpellEntry(1022),		-- Hand of Protection
			CreateSpellEntry(1038),		-- Hand of Salvation
			CreateSpellEntry(53657),	-- Judgements of the Pure
			CreateSpellEntry(53563),	-- Beacon of Light
			CreateSpellEntry(31821),	-- Aura Mastery
			CreateSpellEntry(54428),	-- Divine Plea
			CreateSpellEntry(31482),	-- Divine Favor
			CreateSpellEntry(6940),		-- Hand of Sacrifice
			CreateSpellEntry(84963),	-- Inquisition
		},
		procs = {
			CreateSpellEntry(59578),	-- The Art of War
			CreateSpellEntry(90174),	-- Hand of Light
			CreateSpellEntry(71396),	-- Rage of the Fallen		
			CreateSpellEntry(53672), CreateSpellEntry(54149),	-- Infusion of Light (Rank 1/2)
			CreateSpellEntry(85496),	-- Speed of Light
			CreateSpellEntry(88819),	-- Daybreak
			CreateSpellEntry(20050), CreateSpellEntry(20052), CreateSpellEntry(20053),	-- Conviction (Rank 1/2/3)
		},
	},
	PRIEST = { 
		target = { 
			CreateSpellEntry(17),		-- Power Word: Shield
			CreateSpellEntry(6788, true, nil, 1),	-- Weakened Soul
			CreateSpellEntry(139),		-- Renew
			CreateSpellEntry(33076),	-- Prayer of Mending
			CreateSpellEntry(552),		-- Abolish Disease
			CreateSpellEntry(63877),	-- Pain Suppression
			CreateSpellEntry(34914, false, nil, nil, 34914),	-- Vampiric Touch
			CreateSpellEntry(589),		-- Shadow Word: Pain
			CreateSpellEntry(2944),		-- Devouring Plague
			CreateSpellEntry(48153),	-- Guardian Spirit
			CreateSpellEntry(77489),	-- Echo of Light
		},
		player = {
			CreateSpellEntry(10060),	-- Power Infusion
			CreateSpellEntry(588),		-- Inner Fire
			CreateSpellEntry(73413),	-- Inner Will
			CreateSpellEntry(47585),	-- Dispersion
			CreateSpellEntry(81700),	-- Archangel
			CreateSpellEntry(14751),	-- Chakra
			CreateSpellEntry(81208),	-- Chakra Heal
			CreateSpellEntry(81207),	-- Chakra Renew
			CreateSpellEntry(81209),	-- Chakra Smite
			CreateSpellEntry(81206),	-- Prayer of Healing
		},
		procs = {
			CreateSpellEntry(63735),	-- Serendipity
			CreateSpellEntry(88690),	-- Surge of Light
			CreateSpellEntry(77487),	-- Shadow Orb
			CreateSpellEntry(71572),	-- Cultivated Power
			CreateSpellEntry(81661),	-- Evangelism
			CreateSpellEntry(72418),	-- Kuhlendes Wissen
			CreateSpellEntry(71584),	-- Revitalize
			CreateSpellEntry(59888),	-- Borrowed Time
			CreateSpellEntry(95799),	-- Empowered Shadow
		},
	},
	ROGUE = { 
		target = { 
			CreateSpellEntry(1833),		-- Cheap Shot
			CreateSpellEntry(408),		-- Kidney Shot
			CreateSpellEntry(1776),		-- Gouge
			CreateSpellEntry(2094),		-- Blind
			CreateSpellEntry(8647),		-- Expose Armor
			CreateSpellEntry(51722),	-- Dismantle
			CreateSpellEntry(2818),		-- Deadly Poison
			CreateSpellEntry(13218),	-- Wound Posion
			CreateSpellEntry(3409),		-- Crippling Poison 
			CreateSpellEntry(5760),		-- Mind-Numbing Poison
			CreateSpellEntry(6770),		-- Sap
			CreateSpellEntry(1943),		-- Rupture
			CreateSpellEntry(703),		-- Garrote
			CreateSpellEntry(79140),	-- vendetta
			CreateSpellEntry(16511),	-- Hemorrhage
			CreateSpellEntry(84745),	-- Shallow Insight
			CreateSpellEntry(84746),	-- Moderate Insight
			CreateSpellEntry(84747),	-- Deep Insight
		},
		player = {
			CreateSpellEntry(13750),	-- Adrenaline Rush
			CreateSpellEntry(32645),	-- Envenom
			CreateSpellEntry(2983),		-- Sprint
			CreateSpellEntry(5277),		-- Evasion
			CreateSpellEntry(51713),	-- Shadow Dance
			CreateSpellEntry(1966),		-- Feint
			CreateSpellEntry(73651),	-- Recuperate
			CreateSpellEntry(5171),		-- Slice and Dice
			CreateSpellEntry(13877),	-- Blade Flurry
			CreateSpellEntry(74001),	-- Combat Readiness
			CreateSpellEntry(58426),	-- Overkill
		},
		procs = {
		},
	},
	SHAMAN = {
		target = {
			CreateSpellEntry(974),		-- Earth Shield
			CreateSpellEntry(8050),		-- Flame Shock
			CreateSpellEntry(8056),		-- Frost Shock
			CreateSpellEntry(17364),	-- Storm Strike
			CreateSpellEntry(61295),	-- Riptide
			CreateSpellEntry(51945),	-- Earthliving
			CreateSpellEntry(77657),	-- Searing Flames
			CreateSpellEntry(64701),	-- Elemental Mastery
			CreateSpellEntry(77661),	-- Searing Flame
		},
		player = {
			CreateSpellEntry(324),		-- Lightning Shield
			CreateSpellEntry(52127),	-- Water Shield
			CreateSpellEntry(974),		-- Earth Shield
			CreateSpellEntry(30823),	-- Shamanistic Rage
			CreateSpellEntry(55198),	-- Tidal Force
			CreateSpellEntry(61295),	-- Riptide
		},
		procs = {
			CreateSpellEntry(53817),	-- Maelstrom Weapon
			CreateSpellEntry(16246),	-- Clearcasting
			CreateSpellEntry(53390),	-- Tidal Waves
			CreateSpellEntry( 51562 ), CreateSpellEntry( 51563 ), CreateSpellEntry( 51564 ), -- Tidal Waves Rank 1/2/3
		},
	},
	WARLOCK = { 
		target = {
			
			CreateSpellEntry(32389),	-- Shadow Embrace 
			CreateSpellEntry(172),		-- Corruption
			CreateSpellEntry(80240),	-- Bane of Havoc
			CreateSpellEntry(603),		-- Curse of Doom
			CreateSpellEntry(980),		-- Curse of Agony
			CreateSpellEntry(1490),		-- Curse of the Elements 
			CreateSpellEntry(17962),	-- Conflagration
			CreateSpellEntry(1714),		-- Curse of Tongue
			CreateSpellEntry(18223),	-- Curse of Exhaustion
			CreateSpellEntry(702),		-- Curse of Weakness
			CreateSpellEntry(86105),	-- Jinx: Curse of the Elements
			CreateSpellEntry(5782),		-- Fear
			CreateSpellEntry(710),		-- Banish
			CreateSpellEntry(5484),		-- Howl of Terror
			CreateSpellEntry(6789),		-- Deathcoil
			CreateSpellEntry(17800),	-- Shadow & Flame
			CreateSpellEntry(348, false, nil, nil, 348),		-- Immolate
			CreateSpellEntry(27243, false, nil, nil, 27243),	-- Seed of Corruption
			CreateSpellEntry(48181, false, nil, nil, 48181),	-- Haunt
			CreateSpellEntry(30108, false, nil, nil, 30108),	-- Unstable Affliction
		},
			player = {            
			CreateSpellEntry(17941),	-- Shadow trance 
			CreateSpellEntry(64371),	-- Eradication
			CreateSpellEntry(85383),	-- Improved Soul Fire
			CreateSpellEntry(79459), CreateSpellEntry(79463), CreateSpellEntry(79460), CreateSpellEntry(79462), CreateSpellEntry(79464),	-- Demon Soul
		},
		procs = {
			CreateSpellEntry(86121),	-- Soul Swap
			CreateSpellEntry(71165),	-- Molten Cor
			CreateSpellEntry(63167),	-- Decimation
			CreateSpellEntry(47283),	-- Empowered Imp
			CreateSpellEntry(54274), CreateSpellEntry(54276), CreateSpellEntry(54277),	-- Backdraft rank 1/2/3
		},
	},
	WARRIOR = {
		target = {
			CreateSpellEntry(94009),	-- Rend
			CreateSpellEntry(12294),	-- Mortal Strike
			CreateSpellEntry(1160),		-- Demoralizing Shout
			CreateSpellEntry(64382),	-- Shattering Throw
			CreateSpellEntry(58567),	-- Sunder Armor
			CreateSpellEntry(86346),	-- Colossus Smash
			CreateSpellEntry(7922),		-- Charge (stun)
			CreateSpellEntry(1715),		-- Hamstring
			CreateSpellEntry(50725),	-- Vigilance
			CreateSpellEntry(676),		-- Disarm
			CreateSpellEntry(29703),	-- Daze (Shield Bash)
			CreateSpellEntry(18498),	-- Gag Order
			CreateSpellEntry(12809),	-- Concussion Blow
			CreateSpellEntry(6343),		-- Thunderclap
			CreateSpellEntry(12162), CreateSpellEntry(12850), CreateSpellEntry(12868),	-- Deep Wounds (Rank 1/2/3)
		},
		player = {
			CreateSpellEntry(34428),	-- Victory Rush
			CreateSpellEntry(469),		-- Commanding Shout
			CreateSpellEntry(6673),		-- Battle Shout
			CreateSpellEntry(55694),	-- Enraged Regeneration
			CreateSpellEntry(23920),	-- Spell Reflection
			CreateSpellEntry(871),		-- Shield Wall
			CreateSpellEntry(1719),		-- Recklessness
			CreateSpellEntry(20230),	-- Retaliation
			CreateSpellEntry(2565),		-- Shield Block
			CreateSpellEntry(12976),	-- Last Stand
			CreateSpellEntry(90806),	-- Executioner
			CreateSpellEntry(12292),	-- Death Wish
			CreateSpellEntry(23885),	-- Blood Thirst
			CreateSpellEntry(85738), CreateSpellEntry(85739),	-- Meat Cleaver rank 1/2
			CreateSpellEntry(86662), CreateSpellEntry(86663),	-- Rude interruption rank 1/2
			CreateSpellEntry(84584), CreateSpellEntry(84585), CreateSpellEntry(84586),	-- Slaughter
		},
		procs = {
			CreateSpellEntry(46916),	-- Bloodsurge Slam
			CreateSpellEntry(12964),	-- Battle Trance
			CreateSpellEntry(86627),	-- Incite
		},
	},
}