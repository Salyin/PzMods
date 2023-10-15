Distributions = Distributions or {};

local distributionTable = {
	------------------------------------------
	--	GUNSTORE			--
	--	NO LAUNCHER, SUPPRESSOR, LMG	--
	------------------------------------------
	gunstore = {
		------------------------------------------
		--	ATTACHMENT, MAG, AMMO BOX	--
		------------------------------------------
		counter = {
			rolls = 1,
			items = {
				"Base.Compensator",			2,
				"Base.GhostRing",			1,
				"Base.Laser_Green",			2,
				"Base.Light_Small",			3,
				"Base.Sight_EOTech",		2,
				"Base.Sight_MicroDot",		3,
				"Base.Sight_RaceDot",		2,
				"Base.Sight_SRS",			2,
				"Base.Suppressor_Pistol",	2,
				"Base.380Clip",				2,
				"Base.380ExtClip",			2,
				"Base.38Speed",				2,
				"Base.44Speed",				2,
				"Base.45DSExtClip",			4,
				"Base.45Drum",				2,
				"Base.45ExtClip",			4,
				"Base.9mmDrum",				2,
				"Base.9mmExtClip",			5,
				"Base.BB177Box",			2,
				"Base.Bullets357Box",		2,
				"Base.Bullets357Box",		2,
				"Base.Bullets380Box",		2,
				"Base.Bullets380Box",		2,
				"Base.Bullets38Box",		2,
				"Base.Bullets44Box",		2,
				"Base.Bullets45Box",		2,
				"Base.Bullets9mmBox",		2,
			},
		},
		------------------------------------------
		--	HANDGUN (PARTS, MAGS, BOX-ONLY)	--
		--	1-5 GUNS PER CASE		--
		------------------------------------------
		displaycase = {
			rolls = 1,						-- LESS ROLLS CUZ MORE DISPLAY THAN LOCKER
			items = {
				"Base.Compensator",			4,
				"Base.GhostRing",			3,
				"Base.Laser_Green",			4,
				"Base.Light_Small",			5,
				"Base.Sight_EOTech",		4,
				"Base.Sight_MicroDot",		4,
				"Base.Sight_RaceDot",		4,
				"Base.Sight_SRS",			4,
				"Base.Suppressor_Pistol",	2,
				"Base.380Clip",				3,
				"Base.380ExtClip",			3,
				"Base.38Speed",				3,
				"Base.44Speed",				3,
				"Base.45DSExtClip",			4,
				"Base.45Drum",				2,
				"Base.45ExtClip",			4,
				"Base.9mmDrum",				2,
				"Base.9mmExtClip",			4,
				"Base.BB177Box",			2,
				"Base.Bullets357Box",		2,
				"Base.Bullets357Box",		2,
				"Base.Bullets380Box",		2,
				"Base.Bullets380Box",		2,
				"Base.Bullets38Box",		2,
				"Base.Bullets44Box",		2,
				"Base.Bullets45Box",		1,
				"Base.Bullets9mmBox",		1,
				"Base.AMT1911",				1,
				"Base.AMT1911_Long",		0.5,	-- RARE
				"Base.Automag",				0.5,	-- RARE
				"Base.B93R", 				0.5,	-- RARE
				"Base.Bersa85F",			1,
				"Base.Buckmark",			1,
				"Base.Buckmark_Long",		1,
				"Base.CZ75",				1,
				"Base.Colt1903",			1,
				"Base.Colt_Navy_1851", 		1,	
				"Base.Colt_Service38", 		1,	
				"Base.Colt_Service45", 		1,	
				"Base.DEagle",				1,
				"Base.G18",					1,
				"Base.G21",					1,
				"Base.GP100_2",				1,
				"Base.GP100_4",				1,
				"Base.GP100_6",				1,
				"Base.K5",					1,
				"Base.M1911_Carbine", 		0.5,	-- RARE
				"Base.M29_44",				1,
				"Base.M29_44Carbine",		0.5,	-- RARE
				"Base.M4506",				1,
				"Base.M5238", 				0.5,	-- RARE
				"Base.M5906",				1,
				"Base.M9",					1,
				"Base.MAC10_Fold",			0.5,	-- RARE
				"Base.P226",				1,
				"Base.PPK",					1,
				"Base.Shorty",				0.5,	-- RARE
				"Base.Vz61_Fixed",			0.5,	-- RARE
				"Base.Vz61_Fold",			0.5,	-- RARE
			},
		},
		------------------------------------------
		--	RIFLE (PARTS, MAGS, BOX-ONLY)	--
		--	3-7 GUNS PER CASE FEWER LOCKERS	--
		------------------------------------------
		locker ={
			rolls = 2,
			items = {
				"Base.Bayonet_AK",			1,
				"Base.Bayonet_M1917",		1,
				"Base.Bayonet_M4",			1,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			2,
				"Base.ForeGrip",			2,
				"Base.Laser_Red",			2,
				"Base.Light_Large",			3,
				"Base.MuzzleBrake",			2,
				"Base.Pad",					5,
				"Base.Scope_1-4x",			2,
				"Base.Scope_12xPSO",		2,
				"Base.Scope_20x",			2,
				"Base.Scope_4xPSO",			2,
				"Base.Sight_3xEOTech",		2,
				"Base.Sight_4xACOG",		2,
				"Base.Sight_6xELCAN",		2,
				"Base.Sight_KOBRA",			2,
				"Base.Sling_1",				1,
				"Base.Sling_2",				1,
				"Base.Sling_3",				1,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
				"Base.12gDrum",				2,
				"Base.1903Clip",			4,
				"Base.223ExtClip",			3,
				"Base.22Clip",				2,
				"Base.22Drum",				2,
				"Base.22ExtClip",			2,
				"Base.308StdClip",			2,
				"Base.556Drum",				2,
				"Base.762Drum",				2,
				"Base.AKClip",				4,
				"Base.K14Clip",				2,
				"Base.M1Clip",				2,
				"Base.M82Clip",				1,
				"Base.SKSClip",				4,
				"Base.SPASClip",			2,
				"Base.SVDClip",				2,
				"Base.223Box",				2,
				"Base.308Box",				2,
				"Base.50BMGBox",			1,
				"Base.556Box",				2,
				"Base.762x39Box",			2,
				"Base.762x39Box",			2,
				"Base.Bullets22Box",		2,
				"Base.Bullets22Box",		2,
				"Base.ShotgunShellsBox",	2,
				"Base.AA12",				1,
				"Base.AK103",				4,
				"Base.AKMS_Stock",			3,
				"Base.AR7",					2,
				"Base.ASVAL",				1,
				"Base.AUG",					2,
				"Base.AUG9",				2,
				"Base.BOAR",				0.5,
				"Base.Buckmark_Carbine",	1,
				"Base.CAWS",				1,
				"Base.Coachgun",			4,
				"Base.ColtM16",				4,
				"Base.Cricket",				1,
				"Base.DAO12",				1,
				"Base.DT11",				4,
				"Base.DoubleBarrelShotgun",	4,
				"Base.FAL",					3,
				"Base.FAL_PARA_Stock",		1,
				"Base.G3",					3,
				"Base.G33",					3,
				"Base.K14",					1,
				"Base.K1_Stock",			2,
				"Base.K2",					3,
				"Base.K7_Stock",			2,
				"Base.M1",					2,
				"Base.M14",					3,
				"Base.M16A1",				4,
				"Base.M16A2",				4,
				"Base.M16A3",				4,
				"Base.M16Tape",				3,
				"Base.M16Wood",				3,
				"Base.M1897",				3,
				"Base.M1903",				3,
				"Base.M1Carbine",			3,
				"Base.M2Carbine",			1,
				"Base.M40",					1,
				"Base.M723",				2,
				"Base.M82",					0.5,
				"Base.M85_Stock",			2,
				"Base.M870",				4,
				"Base.M870_Express",		3,
				"Base.M870_Police",			3,
				"Base.M870_Wingmaster",		3,
				"Base.MD65_Stock",			3,
				"Base.MINI14",				4,
				"Base.MINI14_T",			3,
				"Base.MP5_Fixed",			2,
				"Base.MP5_Fold",			2,
				"Base.Marlin_1894",			4,
				"Base.Marlin_M70",			2,
				"Base.Mosin",				4,
				"Base.R11_87",				3,
				"Base.Ruger_1022",			2,
				"Base.SKS", 				4,
				"Base.SKS_PARA",			1,
				"Base.SPAS12_Fixed",		2,
				"Base.SPAS12_Fold",			2,
				"Base.SPAS_15",				1,
				"Base.SVD",					1,
				"Base.Sako85",				4,
				"Base.Savage12",			4,
				"Base.Shotgun",				4,
				"Base.USAS_12",				1,
				"Base.UZI", 				1,
				"Base.UZI_Micro", 			1,
				"Base.UZI_Wood", 			1,
				"Base.VSS",					1,
				"Base.Vz58", 				3,
				"Base.Vz58_Fold", 			2,
				"Base.Vz58_Mini_Fold", 		1,
				"Base.Vz58_Stock",			3,
				"Base.WA2000",				1,
				"Base.Win_1894",			3,
				"Base.Win_1895",			4,
				"Base.XM117",				2,
			},
		},
		------------------------------------------
		--	INEXPENSIVE ITEMS		--
		------------------------------------------
	        shelves = {
			rolls = 3,
			items = {
				"Base.BB177Box",	5,	-- FEW SHELVES HIGHER CHANCE
				"Base.Cleaning",	5,
				"Base.Cleaning",	3,
				"Base.WD",			5,
				"Base.WD",			3,
				"Base.Bipod", 		3,
				"Base.ForeGrip",	4,
				"Base.Pad", 		4,
				"Base.Sling_1", 	3,
				"Base.Sling_2", 	5,
				"Base.Sling_3", 	4,
				"Base.Carrier_12g",	5,
			},
		},
		------------------------------------------
		--	AMMO (BOTH ALL BOX & CAN)	--
		------------------------------------------
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.Cleaning",		2,	-- REDUCE TO LET AMMO SPAWN
				"Base.WD",				2,
				"Base.AmmoCan30_357",	3,
				"Base.AmmoCan30_38",	3,
				"Base.AmmoCan30_380",	3,	-- MORE CANS THAN BOXES ALL SAME CHANCE
				"Base.AmmoCan30_44",	3,
				"Base.AmmoCan30_45",	3,
				"Base.AmmoCan30_9",		3,
				"Base.223Box",			1,
				"Base.308Box",			1,
				"Base.50BMGBox",		0.5,
				"Base.556Box",			1,
				"Base.762x39Box",		1,
				"Base.762x39Box",		1,
				"Base.BB177Box",		1,
				"Base.Bullets22Box",	1,
				"Base.Bullets22Box",	1,	-- DOUBLE NON-VANILLA BOXES
				"Base.Bullets357Box",	1,
				"Base.Bullets357Box",	1,	-- DOUBLE NON-VANILLA BOXES
				"Base.Bullets380Box",	1,
				"Base.Bullets380Box",	1,	-- DOUBLE NON-VANILLA BOXES
				"Base.Bullets38Box",	1,
				"Base.Bullets44Box",	1,
				"Base.Bullets45Box",	1,
				"Base.Bullets57Box",	1,
				"Base.Bullets9mmBox",	1,
				"Base.AmmoCan30_22",	3,	-- MORE CANS THAN BOXES ALL SAME CHANCE
				"Base.AmmoCan50_12",	3,
				"Base.AmmoCan50_223",	3,
				"Base.AmmoCan50_308",	3,
				"Base.AmmoCan50_50",	1,
				"Base.AmmoCan50_556",	3,
				"Base.AmmoCan50_762x39",3,
				"Base.ShotgunShellsBox",1,
			},
		},
	},
	----------------------------------
	--	GUNSTORE STORAGE	--
	--	USES ALL FOR CONTAINERS	--
	--	AMMO, MAGS, PARTS	--
	----------------------------------
	gunstorestorage = {
		------------------------------------------
		--	PARTS, MAGS, MISC, RARE CASE	--
		------------------------------------------
		crate = {
			rolls = 1,
			items = {
				"Base.Case_Medium2",	0.2,	-- 9mm
				"Base.Case_Medium3",	0.1,	-- 45DS
				"Base.Case_Medium4",	0.2,	-- 556
				"Base.Case_Medium5",	0.1,	-- 762
				"Base.Case_Medium6",	0.1,	-- 12g
				"Base.Case_Large3",		0.2,	-- 556
				"Base.Case_Large4",		0.1,	-- 762
				"Base.Case_Large5",		0.1,	-- 308
				"Base.Case_Large7",		0.1,	-- 12g SEMI
				"Base.Case_Heavy1",		0.1,	-- LAUNCHER
				"Base.Case_Heavy2",		0.2,	-- LMG 556
				"Base.Case_Heavy3",		0.1,	-- LMG 308
				"Base.Case_Heavy4",		0.1,	-- BMG
				"Base.Bayonet_AK",			1,
				"Base.Bayonet_M1917",		1,
				"Base.Bayonet_M4",			1,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			2,
				"Base.Compensator",			2,
				"Base.ForeGrip",			2,
				"Base.GhostRing",			1,
				"Base.Laser_Green",			2,
				"Base.Laser_Red",			2,
				"Base.Light_Large",			3,
				"Base.Light_Small",			3,
				"Base.MuzzleBrake",			2,
				"Base.Pad",					5,
				"Base.Scope_1-4x",			2,
				"Base.Scope_12xPSO",		2,
				"Base.Scope_20x",			2,
				"Base.Scope_4xPSO",			2,
				"Base.Sight_3xEOTech",		2,
				"Base.Sight_4xACOG",		2,
				"Base.Sight_6xELCAN",		2,
				"Base.Sight_EOTech",		2,
				"Base.Sight_KOBRA",			2,
				"Base.Sight_MicroDot",		3,
				"Base.Sight_RaceDot",		2,
				"Base.Sight_SRS",			2,
				"Base.Sling_1",				1,
				"Base.Sling_2",				1,
				"Base.Sling_3",				1,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Pistol",	2,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
				"Base.12gDrum",				2,
				"Base.223ExtClip",			3,
				"Base.308StdClip",			2,
				"Base.45DSExtClip",			4,
				"Base.45Drum",				2,
				"Base.45ExtClip",			4,
				"Base.556Drum",				2,
				"Base.762Drum",				2,
				"Base.9mmDrum",				2,
				"Base.9mmExtClip",			5,
				"Base.AKClip",				4,
				"Base.K14Clip",				2,
				"Base.M82Clip",				1,
				"Base.SPASClip",			2,
			--	"Base.22Clip", 2,
			--	"Base.22ExtClip", 2,
			--	"Base.SKSClip", 4,
			--	"Base.1903Clip", 4,
			--	"Base.SVDClip", 2,
			--	"Base.M1Clip", 2,
			--	"Base.22Drum", 2,
			--	"Base.38Speed", 2,
			--	"Base.44Speed", 2,
			--	"Base.380Clip", 2,
			--	"Base.380ExtClip", 2,
			},
		},
		--------------------------------------------------
		--	WEAPONS (MIL) *REDSTONE & RAVEN* 	--
		--------------------------------------------------
		locker ={
			rolls = 3,
			items = {
				"Base.AA12",			2,
				"Base.AK103",			2,
				"Base.AKM",				2,
				"Base.AKMS_Stock",		1,
				"Base.AMT1911",			5,
				"Base.AMT1911_Long",	1,
				"Base.B93R",			3,
				"Base.CAWS",			2,
				"Base.ColtM16",			2,
				"Base.DAO12",			2,
				"Base.EX41_Melee",		1,
				"Base.FAL",				3,
				"Base.FAL_PARA_Stock",	1,
				"Base.FN_P90",			2,
				"Base.Federal_Melee",	1,
				"Base.G18",				5,
				"Base.G21",				4,
				"Base.G21LMG",			2,
				"Base.G3",				2,
				"Base.G33",				2,
				"Base.K14",				1,
				"Base.K1_1",			2,
				"Base.K1_Stock",		2,
				"Base.K2",				2,
				"Base.K2_1",			2,
				"Base.K3",				1,
				"Base.K3LMG",			2,
				"Base.K5",				3,
				"Base.K7_Stock",		2,
				"Base.M14",				1,
				"Base.M16A2",			2,
				"Base.M16A3",			2,
				"Base.M16Tape",			2,
				"Base.M249",			2,
				"Base.M32_Melee",		1,
				"Base.M40A2",			1,
				"Base.M4506",			2,
				"Base.M4A1",			1,
				"Base.M5906",			2,
				"Base.M723",			1,
				"Base.M82",				2,
				"Base.M85_Stock",		2,
				"Base.M870",			1,
				"Base.M9",				5,
				"Base.MD65_Stock",		1,
				"Base.MP5SD6_Fixed",	2,
				"Base.MP5SD6_Fold",		2,
				"Base.MP5_Fixed",		2,
				"Base.MP5_Fold",		2,
				"Base.MilitaryBaton",	0.1,
				"Base.P226",			3,
				"Base.PKM",				1,
				"Base.Savage12",		1,
				"Base.UZI", 			2,
				"Base.UZI_Micro", 		3,
				"Base.UZI_Wood", 		2,
				"Base.Vz58",			2,
				"Base.Vz58_Fold",		2,
				"Base.Vz58_Mini_Fold",	1,
				"Base.Vz58_Stock",		2,
				"Base.WA2000",			1,
				"Base.XM117",			1,
				"Base.12gDrum",			2,
				"Base.223ExtClip",		3,
				"Base.308Belt",			1,
				"Base.308StdClip",		1,
				"Base.308StdClip",		3,
				"Base.45DSExtClip",		4,
				"Base.45Drum",			2,
				"Base.45ExtClip",		4,
				"Base.556Belt",			1,
				"Base.556Clip",			1,
				"Base.556Clip",			2,
				"Base.556Drum",			2,
				"Base.762Drum",			2,
				"Base.9mmDrum",			2,
				"Base.9mmExtClip",		5,
				"Base.AKClip",			1,
				"Base.AKClip",			4,
				"Base.K14Clip",			2,
				"Base.M82Clip",			1,
				"Base.M82Clip",			2,
				"Base.P90Clip",			5,
				"Base.SPASClip",		1,
				"Base.SPASClip",		2,
			},
		},
		------------------------------------------
		--	AMMO (MIL) *REDSTONE & RAVEN* 	--
		------------------------------------------
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.Bayonet_AK",			2,
				"Base.Bayonet_M4",			2,
				"Base.Bipod",				1,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			1,
				"Base.Compensator",			1,
				"Base.ForeGrip",			2,
				"Base.Laser_Green",			2,
				"Base.Laser_Red",			2,
				"Base.Launcher",			2,
				"Base.Light_Large",			2,
				"Base.Light_Small",			2,
				"Base.MuzzleBrake",			2,
				"Base.Pad",					1,
				"Base.Scope_1-4x",			2,
				"Base.Scope_20x",			1,
				"Base.Sight_3xEOTech",		2,
				"Base.Sight_4xACOG",		2,
				"Base.Sight_6xELCAN",		2,
				"Base.Sight_EOTech",		2,
				"Base.Sight_SRS",			2,
				"Base.Sling_1",				1,
				"Base.Sling_2",				2,
				"Base.Sling_3",				2,
				"Base.Suppressor_BMG",		2,
				"Base.Suppressor_Pistol",	2,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	2,
				"Base.AmmoCan30_45",		3,
				"Base.AmmoCan30_9",			3,	-- MORE CANS THAN BOXES
				"Base.AmmoCan30_MIX",		3,
				"Base.AmmoCan50_12",		4,
				"Base.AmmoCan50_308",		4,
				"Base.AmmoCan50_50",		2,
				"Base.AmmoCan50_50",		4,
				"Base.AmmoCan50_556",		2,
				"Base.AmmoCan50_556",		4,
				"Base.AmmoCan50_762x39",	2,
				"Base.AmmoCan50_762x39",	4,
				"Base.AmmoCan50_HE",		2,
				"Base.AmmoCan50_HE",		4,
				"Base.AmmoCan50_INC",		2,
				"Base.AmmoCan50_INC",		4,
			},
		},
	},
	------------------------------------------
	--	POLICE STORAGE 			--
	--	USE LOCKER, METAL SHELF		--
	------------------------------------------
	policestorage = {
		counter = {
			rolls = 3,
			items = {
				"Base.Cleaning",	2,
				"Base.Cleaning",	2,
				"Base.WD",			2,
				"Base.WD",			2,
			},
		},
		------------------------------------------
		--	GUNS ALL			--
		------------------------------------------
		locker = {
			rolls = 3,
			items = {
				"Base.CZ75",			4,
				"Base.ColtM16",			2,
				"Base.M4",				1,
				"Base.G18",				4,
				"Base.G21",				3,
				"Base.GP100_4",			3,
				"Base.M14", 			3,
				"Base.M16A1",			4,
				"Base.M4506",			3,
				"Base.M5906",			3,
				"Base.M723",			3,
				"Base.M870",			5,
				"Base.M870_Police",		5,
				"Base.M9",				3,
				"Base.MINI14",			3,
				"Base.MINI14_T",		5,
				"Base.MP5SD6_Fixed",	3,
				"Base.MP5SD6_Fold",		3,
				"Base.MP5_Fixed",		3,
				"Base.MP5_Fold",		3,
				"Base.P226",			3,
				"Base.SPAS12_Fixed",	4,
				"Base.SPAS12_Fold",		4,
				"Base.Savage12",		3,
				"Base.XM117",			3,
				"Base.223ExtClip",		4,
				"Base.38Speed",			3,
				"Base.45DSExtClip",		4,
				"Base.9mmExtClip",		4,
			},
		},
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.Bipod",				1,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			1,
				"Base.Compensator",			1,
				"Base.ForeGrip",			1,
				"Base.Laser_Green",			2,
				"Base.Laser_Red",			2,
				"Base.Light_Large",			2,
				"Base.Light_Small",			2,
				"Base.MuzzleBrake",			1,
				"Base.Pad",					0.5,
				"Base.Scope_1-4x",			1,
				"Base.Scope_20x",			0.5,
				"Base.Sight_3xEOTech",		0.5,
				"Base.Sight_4xACOG",		0.5,
				"Base.Sight_6xELCAN",		0.5,
				"Base.Sight_EOTech",		0.5,
				"Base.Sight_SRS",			0.5,
				"Base.Sling_1",				0.3,
				"Base.Sling_2",				0.5,
				"Base.Sling_3",				0.4,
				"Base.Suppressor_BMG",		0.1,
				"Base.Suppressor_Pistol",	0.3,
				"Base.Suppressor_Rifle",	0.3,
				"Base.Suppressor_Shotgun",	0.2,
				"Base.223Box",				1,
				"Base.308Box",				1,
				"Base.556Box",				1,
				"Base.Bullets357Box",		1,
				"Base.Bullets38Box",		1,
				"Base.Bullets45Box",		1,
				"Base.Bullets9mmBox",		1,
				"Base.ShotgunShellsBox",	1,
				"Base.AmmoCan30_45",		5,
				"Base.AmmoCan30_9",			5,
				"Base.AmmoCan30_MIX",		5,
				"Base.AmmoCan50_12",		5,
				"Base.AmmoCan50_223",		5,
				"Base.AmmoCan50_308", 		4,
				"Base.AmmoCan50_556",		4,
				"Base.Cleaning",			1,
				"Base.Cleaning",			1,
				"Base.WD",					1,
				"Base.WD",					1,
			},
		},
		filingcabinet = {
			rolls = 1,
			items = {
				"Base.Cleaning",	3,
				"Base.Cleaning",	2,
				"Base.Cleaning",	1,
				"Base.WD",			3,
				"Base.WD",			2,
				"Base.WD",			1,
			},
		},
		crate = {				-- NO CRATES IN VANILLA POLICE ARMORY
			rolls = 3,
			items = {
				"Base.Cleaning",	3,
				"Base.Cleaning",	2,
				"Base.Cleaning",	1,
				"Base.WD",			3,
				"Base.WD",			2,
				"Base.WD",			1,
			},
		},
	},
	----------------------------------
	--	ARMY STORAGE		--
	--	LOCKER & SHELF		--
	----------------------------------
	armystorage = {
		------------------------------------------
		--	GUNS AND PARTS			--
		------------------------------------------
		locker = {
			rolls = 3,
			items = {
				"Base.AA12",				2,
				"Base.AK103",				2,
				"Base.AK47",				2,
				"Base.AKM",					2,
				"Base.AKMS_Stock",			1,
				"Base.AMT1911",				5,
				"Base.AMT1911_Long",		1,
				"Base.B93R",				3,
				"Base.CAWS",				2,
				"Base.ColtM16",				2,
				"Base.DAO12",				2,
				"Base.FN_P90",				2,
				"Base.EX41_Melee",			1,
				"Base.FAL",					3,
				"Base.FAL_PARA_Stock",		1,
				"Base.Federal_Melee",		1,
				"Base.G18",					5,
				"Base.G21",					4,
				"Base.G21LMG",				2,
				"Base.G3",					2,
				"Base.G33",					2,
				"Base.K14",					1,
				"Base.K1_1",				2,
				"Base.K1_Stock",			2,
				"Base.K2",					2,
				"Base.K2_1",				2,
				"Base.K3",					1,
				"Base.K3LMG",				2,
				"Base.K5",					3,
				"Base.K7_Stock",			2,
				"Base.M14",					1,
				"Base.M16A1",				2,
				"Base.M16A2",				2,
				"Base.M16A3",				2,
				"Base.M16Tape",				2,
				"Base.M16Wood",				2,
				"Base.M249",				2,
				"Base.M32_Melee",			1,
				"Base.M4",					1,
				"Base.M40",					2,
				"Base.M40A1",				1,
				"Base.M40A2",				1,
				"Base.M4506",				2,
				"Base.M4A1",				1,
				"Base.M5906",				2,
				"Base.M723",				1,
				"Base.M82",					2,
				"Base.M85_Stock",			2,
				"Base.M870",				1,
				"Base.M9",					5,
				"Base.MD65_Stock",			1,
				"Base.MP5SD6_Fixed",		2,
				"Base.MP5SD6_Fold",			2,
				"Base.MP5_Fixed",			2,
				"Base.MP5_Fold",			2,
				"Base.MilitaryBaton",		1,
				"Base.P226",				3,
				"Base.PKM",					1,
				"Base.Savage12",			1,
				"Base.UZI", 				2,
				"Base.UZI_Micro", 			3,
				"Base.UZI_Wood", 			2,
				"Base.Vz58",				2,
				"Base.Vz58_Fold",			2,
				"Base.Vz58_Mini_Fold",		1,
				"Base.Vz58_Stock",			2,
				"Base.WA2000",				1,
				"Base.XM117",				1,
				"Base.Bayonet_M4",			3,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			1,
				"Base.Compensator",			3,
				"Base.ForeGrip",			2,
				"Base.GhostRing",			2,
				"Base.Laser_Green",			3,
				"Base.Laser_Red",			3,
				"Base.Launcher",			1,
				"Base.Light_Large",			4,
				"Base.Light_Small",			3,
				"Base.MuzzleBrake",			4,
				"Base.Pad",					2,
				"Base.Scope_1-4x",			3,
				"Base.Scope_20x",			1,
				"Base.Sight_3xEOTech",		2,
				"Base.Sight_4xACOG",		3,
				"Base.Sight_6xELCAN",		2,
				"Base.Sight_EOTech",		3,
				"Base.Sight_SRS",			3,
				"Base.Sling_1",				3,
				"Base.Sling_2",				3,
				"Base.Sling_3",				3,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Pistol",	2,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
			},
		},
		------------------------------------------
		--	AMMO AND MAGS			--
		------------------------------------------
		metal_shelves = {
			rolls = 2,
			items = {
				"Base.Case_Medium2",	2,	-- 9mm
				"Base.Case_Medium3",	1,	-- 45DS
				"Base.Case_Medium4",	2,	-- 556
				"Base.Case_Medium6",	1,	-- 12g
				"Base.Case_Large3",		2,	-- 556
				"Base.Case_Large5",		1,	-- 308
				"Base.Case_Large7",		1,	-- 12g SEMI
				"Base.Case_Heavy1",		1,	-- LAUNCHER
				"Base.Case_Heavy2",		2,	-- LMG 556
				"Base.Case_Heavy3",		1,	-- LMG 308
				"Base.Case_Heavy4",		2,	-- BMG
				"Base.AmmoCan30_45",	2,
				"Base.AmmoCan30_45",	4,
				"Base.AmmoCan30_9",		2,
				"Base.AmmoCan30_9",		4,
				"Base.AmmoCan30_MIX",	2,
				"Base.AmmoCan50_12",	2,
				"Base.AmmoCan50_12",	4,
				"Base.AmmoCan50_308",	2,
				"Base.AmmoCan50_308",	4,
				"Base.AmmoCan50_50",	5,
				"Base.AmmoCan50_50",	5,
				"Base.AmmoCan50_556",	3,
				"Base.AmmoCan50_556",	5,
				"Base.AmmoCan50_HE",	2,
				"Base.AmmoCan50_HE",	5,
				"Base.AmmoCan50_INC",	2,
				"Base.AmmoCan50_INC",	5,
				"Base.12gDrum",			5,
				"Base.45DSExtClip",		4,
				"Base.45Drum",			2,
				"Base.45ExtClip",		4,
				"Base.556Drum",			5,
				"Base.9mmDrum",			2,
				"Base.9mmExtClip",		5,
				"Base.K14Clip",			2,
				"Base.M14Clip",			2,
				"Base.M82Clip",			5,
				"Base.SPASClip",		2,
				"Base.P90Clip",			3,
				"Base.308Box",			2,
				"Base.50BMGBox",		2,
				"Base.556Box",			1,
				"Base.Bullets45Box",	2,
				"Base.Bullets9mmBox",	2,	-- MORE CANS THAN BOX
				"Base.ShotgunShellsBox",1,
				"Base.Cleaning",		0.1,		-- REDUCE TO LET AMMO SPAWN
				"Base.WD",				0.1,
			},
		},
		------------------------------------------
		--	AMMO CANISTERS, RARE CASES	--
		------------------------------------------
		crate = {
			rolls = 1,
			items = {
				"Base.Case_Medium2",	0.2,	-- 9mm
				"Base.Case_Medium3",	0.1,	-- 45DS
				"Base.Case_Medium4",	0.2,	-- 556
				"Base.Case_Medium6",	0.1,	-- 12g
				"Base.Case_Large3",		0.2,	-- 556
				"Base.Case_Large5",		0.1,	-- 308
				"Base.Case_Large7",		0.1,	-- 12g SEMI
				"Base.Case_Heavy1",		0.1,	-- LAUNCHER
				"Base.Case_Heavy2",		0.2,	-- LMG 556
				"Base.Case_Heavy3",		0.1,	-- LMG 308
				"Base.Case_Heavy4",		0.2,	-- BMG
				"Base.AmmoCan30_45",	1,
				"Base.AmmoCan30_45",	1,
				"Base.AmmoCan30_9",		1,
				"Base.AmmoCan30_9",		1,		-- NOT MUCH SECONDARY
				"Base.AmmoCan30_MIX",	1,
				"Base.AmmoCan50_12",	1,
				"Base.AmmoCan50_12",	1,
				"Base.AmmoCan50_308",	1,
				"Base.AmmoCan50_308",	3,
				"Base.AmmoCan50_50",	2,
				"Base.AmmoCan50_50",	4,		-- THIS IS WHAT THEY CAME FOR
				"Base.AmmoCan50_556",	1,
				"Base.AmmoCan50_556",	4,	-- GOOD AMOUNT OF PRIMARY
				"Base.AmmoCan50_HE",	2,
				"Base.AmmoCan50_HE",	3,		-- THIS IS WHAT THEY CAME FOR
				"Base.AmmoCan50_INC",	2,
				"Base.AmmoCan50_INC",	3,		-- THIS IS WHAT THEY CAME FOR
				"Base.Cleaning",		0.1,
				"Base.WD",				0.1,
			},
		},
	},
	armyhanger = {
		metal_shelves = {
			rolls = 1,
			items = {
				"Base.Suppressor_Oil",		2,
				"Base.Suppressor_Oil",		1,
				"Base.Cleaning",			1,		-- REDUCE TO LET OTHER ITEMS SPAWN
				"Base.Cleaning",			1,
				"Base.WD",					1,
				"Base.WD",					1,
			},
		},
	},
	------------------------------------------
	--	SECURITY			--
	--	NO LAUNCHER, SUPPRESSOR, LMG	--
	------------------------------------------
	security = {
		counter = {
			rolls = 3,
			items = {
				"Base.AMT1911",			1,
				"Base.AMT1911_Long",	1,
				"Base.Colt_Service38", 	2,	
				"Base.Colt_Service45", 	2,	
				"Base.CZ75",			2,
				"Base.G18",				2,
				"Base.G21",				3,
				"Base.GP100_2",			1,
				"Base.GP100_4",			2,
				"Base.GP100_6",			3,
				"Base.K5",				1,
				"Base.M4506",			3,
				"Base.M5238",			1,
				"Base.M5906",			1,
				"Base.M9",				1,
				"Base.P226",			2,
			},
		},
		locker = {
			rolls = 3,
			items = {
				"Base.M16A1",			1,
				"Base.M870",			3,
				"Base.M870_Express",	3,
				"Base.M870_Wingmaster",	3,
				"Base.MINI14_T",		2,
				"Base.MP5_Fixed",		1,
				"Base.MP5_Fold",		1,
				"Base.SPAS12_Fixed",	2,
				"Base.SPAS12_Fold",		2,
				"Base.Shotgun",			3,
			},
		},
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.223Box",			1,
				"Base.556Box",			2,
				"Base.Bullets357Box",	3,
				"Base.Bullets380Box",	1,
				"Base.Bullets38Box",	1,
				"Base.Bullets44Box",	2,
				"Base.Bullets45Box",	3,
				"Base.Bullets9mmBox",	2,
				"Base.ShotgunShellsBox",3,
				"Base.AmmoCan30_357",	3,
				"Base.AmmoCan30_45",	3,
				"Base.AmmoCan30_9",		2,
				"Base.AmmoCan50_12",	3,
				"Base.AmmoCan50_223",	1,
				"Base.AmmoCan50_556",	2,
				"Base.Cleaning",		2,
				"Base.WD",				2,
			},
		},
		crate = {
			rolls = 3,
			items = {
				"Base.Cleaning",	5,
				"Base.WD",			3,
			},
		},
	},
	------------------------------------------
	--	HUNTING STORE			--
	--	USE LOCKER & METAL SHELF	--
	--	NO LAUNCHER, SUPPRESSOR, LMG	--
	------------------------------------------
	hunting = {
		counter = {
			rolls = 3,
			items = {
				"Base.Choke_Full",			4,
				"Base.Compensator",			2,
				"Base.Laser_Green",			1,
				"Base.Light_Small",			3,
				"Base.Pad",					3,
				"Base.Sling_1",				3,
				"Base.Sling_2",				3,
				"Base.Sling_3",				3,
				"Base.Suppressor_Pistol", 	2,
				"Base.22Clip",				2,
				"Base.22ExtClip",			2,
				"Base.38Speed",				2,
				"Base.44Speed",				2,
				"Base.K14Clip",				2,
				"Base.M1Clip",				2,
				"Base.M82Clip",				1,
				"Base.SVDClip",				2,
				"Base.Automag",				1,
				"Base.BGMachete",			0.5,
				"Base.Buckmark",			2,
				"Base.Buckmark_Long",		2,
				"Base.DEagle",				1,
				"Base.GP100_2", 			1,
				"Base.GP100_4", 			2,
				"Base.GP100_6", 			3,
				"Base.M29_44", 				4,
				"Base.M29_44Carbine", 		2,
				"Base.RamboKnife",			0.5,
				"Base.RussianMachete",		0.5,
				"Base.Tactical_Axe",		0.5,
			},
		},
		displaycase = {
			rolls = 1,
			items = {
				"Base.Bayonet_AK",			1,
				"Base.Bayonet_M1917",		1,
				"Base.Bayonet_M4",			1,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			3,
				"Base.Choke_Full",			4,
				"Base.Compensator",			2,
				"Base.Laser_Green",			1,
				"Base.Laser_Red",			1,
				"Base.Light_Large",			4,
				"Base.Light_Small",			3,
				"Base.MuzzleBrake",			3,
				"Base.Pad",					3,
				"Base.Scope_1-4x",			2,
				"Base.Scope_12xPSO",		3,
				"Base.Scope_20x",			3,
				"Base.Scope_4xPSO",			2,
				"Base.Sight_3xEOTech",		1,
				"Base.Sight_4xACOG",		1,
				"Base.Sight_6xELCAN",		3,
				"Base.Sight_EOTech",		2,
				"Base.Sight_KOBRA",			1,
				"Base.Sight_SRS",			2,
				"Base.Sling_1",				3,
				"Base.Sling_2",				3,
				"Base.Sling_3",				3,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Pistol",	2,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
				"Base.22Clip",				2,
				"Base.22ExtClip",			2,
				"Base.38Speed",				2,
				"Base.44Speed",				2,
				"Base.K14Clip",				2,
				"Base.M1Clip",				2,
				"Base.M82Clip",				1,
				"Base.SVDClip",				2,
				"Base.Automag",				1,
				"Base.BGMachete",			0.5,
				"Base.Buckmark",			2,
				"Base.Buckmark_Long",		2,
				"Base.DEagle",				1,
				"Base.GP100_2",				1,
				"Base.GP100_4",				2,
				"Base.GP100_6",				3,
				"Base.M29_44",				4,
				"Base.M29_44Carbine",		2,
				"Base.RamboKnife",			0.5,
				"Base.RussianMachete",		0.5,
				"Base.Tactical_Axe",		0.5,
			},
		},
		locker = {
			rolls = 2,
			items = {
				"Base.Bayonet_AK",			1,
				"Base.Bayonet_M1917",		1,
				"Base.Bayonet_M4",			1,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			3,
				"Base.Laser_Red",			1,
				"Base.Light_Large",			4,
				"Base.MuzzleBrake",			3,
				"Base.Scope_1-4x",			2,
				"Base.Scope_12xPSO",		3,
				"Base.Scope_20x",			3,
				"Base.Scope_4xPSO",			2,
				"Base.Sight_3xEOTech",		1,
				"Base.Sight_4xACOG",		1,
				"Base.Sight_6xELCAN",		3,
				"Base.Sight_EOTech",		2,
				"Base.Sight_KOBRA",			1,
				"Base.Sight_SRS",			2,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
				"Base.BOAR",				0.5,
				"Base.Coachgun",			3,
				"Base.DT11",				4,
				"Base.DoubleBarrelShotgun",	4,
				"Base.K14",					1,
				"Base.M1",					2,
				"Base.M1887",				3,
				"Base.M1897",				3,
				"Base.M1903",				2,
				"Base.M40",					2,
				"Base.M40A1",				1,
				"Base.M40A2",				1,
				"Base.M82",					0.5,
				"Base.MINI14",				4,
				"Base.MINI14_T",			2,
				"Base.Marlin_1894",			3,
				"Base.Mosin",				4,
				"Base.R11_87",				3,
				"Base.SVD",					1,
				"Base.Sako85",				4,
				"Base.Savage12",			4,
				"Base.Shotgun",				4,
				"Base.WA2000",				1,
				"Base.Win_1894",			2,
				"Base.Win_1895",			2,
			},
		},
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.223Box",			3,
				"Base.308Box",			4,
				"Base.50BMGBox",		2,
				"Base.556Box",			2,
				"Base.BB177Box",		2,
				"Base.Bullets22Box",	4,
				"Base.Bullets357Box",	2,
				"Base.Bullets44Box",	3,
				"Base.ShotgunShellsBox",4,
				"Base.AmmoCan30_44",	3,
				"Base.AmmoCan30_44",	4,
				"Base.AmmoCan30_45",	4,
				"Base.AmmoCan30_9",		4,
				"Base.AmmoCan50_12",	3,
				"Base.AmmoCan50_12",	4,
				"Base.AmmoCan50_223",	3,
				"Base.AmmoCan50_223",	4,
				"Base.AmmoCan50_308",	3,
				"Base.AmmoCan50_308",	4,
				"Base.AmmoCan50_50",	1,
				"Base.AmmoCan50_50",	2,
				"Base.AmmoCan50_556",	4,
				"Base.Cleaning",		3,
				"Base.Cleaning",		2,
				"Base.WD",				3,
				"Base.WD",				2,
			},
		},
		crate = {
			rolls = 3,
			items = {
				"Base.Cleaning",	4,
				"Base.Cleaning",	3,
				"Base.WD",			4,
				"Base.WD",			3,
			},
		},
	},
	------------------------------------------
	--	ARMY SURPLUS STORE		--
	--	NO LAUNCHER, SUPPRESSOR, LMG	--
	------------------------------------------
	armysurplus = {
		counter = {
			rolls = 3,
			items = {
				"Base.Bayonet_AK",			4,
				"Base.Bayonet_M1917",		4,
				"Base.Bayonet_M4",			4,
				"Base.Bipod",				2,
				"Base.Carrier_12g",			2,
				"Base.Choke_Full",			3,
				"Base.Compensator",			2,
				"Base.GhostRing",			1,
				"Base.Laser_Green",			3,
				"Base.Laser_Red",			3,
				"Base.Light_Large",			3,
				"Base.Light_Small",			3,
				"Base.MuzzleBrake",			3,
				"Base.Pad",					3,
				"Base.Scope_1-4x",			3,
				"Base.Scope_12xPSO",		2,
				"Base.Scope_20x",			2,
				"Base.Scope_4xPSO",			2,
				"Base.Sight_KOBRA",			2,
				"Base.Sling_1",				3,
				"Base.Sling_2",				3,
				"Base.Sling_3",				3,
				"Base.Suppressor_BMG",		1,
				"Base.Suppressor_Pistol",	2,
				"Base.Suppressor_Rifle",	2,
				"Base.Suppressor_Shotgun",	1,
				"Base.12gDrum",				1,
				"Base.1903Clip",			4,
				"Base.223ExtClip",			2,
				"Base.223StdClip",			3,
				"Base.22Clip",				2,
				"Base.22Drum",				1,
				"Base.22ExtClip",			2,
				"Base.308StdClip",			3,
				"Base.380Clip",				2,
				"Base.380ExtClip",			2,
				"Base.38Speed",				2,
				"Base.44Clip",				2,
				"Base.44Speed",				2,
				"Base.45Clip",				4,
				"Base.45DSClip",			4,
				"Base.45DSExtClip",			3,
				"Base.45Drum",				1,
				"Base.45ExtClip",			3,
				"Base.556Clip",				4,
				"Base.556Drum",				1,
				"Base.762Drum",				1,
				"Base.9mmClip",				4,
				"Base.9mmDrum",				1,
				"Base.9mmExtClip",			3,
				"Base.AKClip",				4,
				"Base.ASVALClip",			1,
				"Base.K14Clip",				2,
				"Base.M1Clip",				2,
				"Base.M82Clip",				1,
				"Base.SKSClip",				4,
				"Base.SVDClip",				2,
				"Base.VSSClip",				1,
			},
		},
		displaycase = {
			rolls = 3,
			items = {
				"Base.AMT1911",				4,
				"Base.AMT1911_Long",		1,
				"Base.Automag",				1,
				"Base.BGMachete",			0.4,
				"Base.Bersa85F",			3,
				"Base.Buckmark",			2,
				"Base.Buckmark_Long",		1,
				"Base.Butterfly",			0.2,
				"Base.CZ75",				4,
				"Base.Colt1903",			1,
				"Base.Colt_Navy_1851", 		2,
				"Base.Colt_Service38", 		2,	
				"Base.Colt_Service45", 		2,	
				"Base.DEagle",				2,
				"Base.GP100_2",				2,
				"Base.GP100_4",				2,
				"Base.GP100_6",				2,
				"Base.Karambit",			0.1,
				"Base.M1911_Carbine",		1,
				"Base.M29_44",				2,
				"Base.M29_44Carbine",		1,
				"Base.M4506",				3,
				"Base.M5238",				1,
				"Base.M5906",				3,
				"Base.M9",					4,
				"Base.MAC10_Fold",			3,
				"Base.MilitaryBaton",		0.1,
				"Base.PPK",					2,
				"Base.PushDagger",			0.2,
				"Base.RamboKnife",			0.8,
				"Base.RussianMachete",		0.6,
				"Base.Shorty",				1,
				"Base.Tactical_Axe",		0.6,
				"Base.Tactical_Sickle",		0.2,
				"Base.Vz61_Fixed",			1,
				"Base.Vz61_Fold",			1,
			},
		},
		locker = {
			rolls = 3,
			items = {
				"Base.AA12",				2,
				"Base.AK103",				4,
				"Base.AK47",				4,
				"Base.AKM",					4,
				"Base.AKMS_Stock",			4,
				"Base.AR7",					2,
				"Base.ASVAL",				1,
				"Base.BOAR",				1,
				"Base.Buckmark_Carbine",	1,
				"Base.CAWS",				2,
				"Base.Coachgun",			4,
				"Base.ColtM16",				4,
				"Base.Cricket",				1,
				"Base.DAO12",				2,
				"Base.DT11",				4,
				"Base.DoubleBarrelShotgun", 3,
				"Base.FAL",					4,
				"Base.FAL_PARA_Stock",		2,
				"Base.M1",					4,
				"Base.M14",					4,
				"Base.M16A1",				4,
				"Base.M1897",				4,
				"Base.M1903",				4,
				"Base.M1Carbine",			4,
				"Base.M2Carbine",			2,
				"Base.M4",					4,
				"Base.M723",				1,
				"Base.M82",					1,
				"Base.M85_Stock",			2,
				"Base.M870",				2,
				"Base.MD65_Stock",			4,
				"Base.MINI14",				3,
				"Base.MINI14_T",			1,
				"Base.Marlin_1894",			3,
				"Base.Marlin_M70",			2,
				"Base.Mosin",				4,
				"Base.R11_87",				2,
				"Base.Ruger_1022",			2,
				"Base.SKS",					4,
				"Base.SKS_PARA",			1,
				"Base.SVD",					1,
				"Base.Sako85",				2,
				"Base.Savage12",			2,
				"Base.Shotgun",				2,
				"Base.UZI", 				1,
				"Base.UZI_Wood", 			1,
				"Base.VSS",					1,
				"Base.Vz58",				3,
				"Base.Vz58_Fold",			2,
				"Base.Vz58_Mini_Fold",		1,
				"Base.Vz58_Stock",			2,
				"Base.WA2000",				1,
				"Base.Win_1894",			3,
				"Base.Win_1895",			3,
				"Base.XM117",				1,
			},
		},
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.223Box",				3,
				"Base.308Box",				3,
				"Base.50BMGBox",			3,
				"Base.556Box",				3,
				"Base.762x39Box",			3,
				"Base.762x39Box",			4,
				"Base.BB177Box",			1,
				"Base.Bullets22Box",		4,
				"Base.Bullets22Box",		4,
				"Base.Bullets357Box",		3,
				"Base.Bullets357Box",		4,
				"Base.Bullets380Box",		4,
				"Base.Bullets380Box",		4,
				"Base.Bullets38Box",		3,
				"Base.Bullets44Box",		3,
				"Base.Bullets45Box",		3,
				"Base.Bullets9mmBox",		3,
				"Base.ShotgunShellsBox",	4,
				"Base.AmmoCan30_22",		2,
				"Base.AmmoCan30_45",		2,
				"Base.AmmoCan30_9",			2,
				"Base.AmmoCan50_12",		3,
				"Base.AmmoCan50_223",		2,
				"Base.AmmoCan50_308",		4,
				"Base.AmmoCan50_50",		3,
				"Base.AmmoCan50_556",		4,
				"Base.AmmoCan50_762x39",	4,
				"Base.Suppressor_Oil",		2,
				"Base.Cleaning",			2,
				"Base.WD",					2,
			},
		},
		crate = {
			rolls = 3,
			items = {
				"Base.Cleaning",5,
				"Base.WD",		5,
			},
		},
	},
	------------------------------------------
	--	CAMPING	STORE			--
	--	NO LAUNCHER, SUPPRESSOR, LMG	--
	------------------------------------------
	camping = {
--		counter = {
--			rolls = 3,
--			items = {
--
--			},
--		},
		displaycase = {
			rolls = 3,
			items = {
				"Base.223StdClip",		2,
				"Base.22Clip",			2,
				"Base.22ExtClip",		2,
				"Base.38Speed",			2,
				"Base.44Speed",			2,
				"Base.BGMachete",		2,
				"Base.Buckmark",		2,
				"Base.Buckmark_Long",	2,
				"Base.GP100_2",			2,
				"Base.GP100_4",			4,
				"Base.GP100_6",			3,
				"Base.M29_44",			2,
				"Base.M29_44Carbine",	1,
				"Base.RamboKnife",		5,
				"Base.RussianMachete",	2,
				"Base.Tactical_Axe",	2,
			},
		},
		locker = {
			rolls = 3,
			items = {
				"Base.AR7",					2,
				"Base.Buckmark_Carbine",	1,
				"Base.Coachgun",			4,
				"Base.Cricket",				1,
				"Base.DT11",				4,
				"Base.DoubleBarrelShotgun", 1,
				"Base.M1897",				1,
				"Base.M1887",				1,
				"Base.M870",				2,
				"Base.MINI14",				4,
				"Base.Marlin_1894",			4,
				"Base.Marlin_M70",			2,
				"Base.R11_87",				3,
				"Base.Ruger_1022",			2,
				"Base.Sako85",				4,
				"Base.Savage12",			4,
				"Base.Shotgun",				1,
				"Base.Win_1894",			4,
				"Base.Win_1895",			4,
			},
		},
		metal_shelves = {
			rolls = 3,
			items = {
				"Base.223Box",				4,
				"Base.308Box",				4,
				"Base.556Box",				4,
				"Base.BB177Box",			1,
				"Base.Bullets22Box",		4,
				"Base.Bullets357Box",		4,
				"Base.Bullets38Box",		4,
				"Base.Bullets44Box",		4,
				"Base.Bullets9mmBox",		4,
				"Base.ShotgunShellsBox",	4,
				"Base.AmmoCan30_22",		4,
				"Base.AmmoCan30_357",		3,
				"Base.AmmoCan30_38",		2,
				"Base.AmmoCan30_44",		3,
				"Base.AmmoCan50_12",		4,
				"Base.AmmoCan50_223",		3,
				"Base.AmmoCan50_308",		2,
				"Base.Cleaning",			3,
				"Base.WD",					3,
			},
		},
		crate = {
			rolls = 3,
			items = {
				"Base.Cleaning",3,
				"Base.WD",		3,
			},
		},
	},
	------------------------------------------
	--	TOOL STORE			--
	------------------------------------------
	toolstore = {
		shelves = {
			rolls = 3,
			items = {
				"Base.Bayonet_AK",		0.5,
				"Base.Bayonet_M1917",	0.5,
				"Base.BB177Box",		1,
				"Base.BGMachete",		0.2,
				"Base.DingDong",		0.2,
				"Base.RamboKnife",		0.5,
				"Base.RussianMachete",	0.2,
				"Base.Tactical_Axe",	0.2,
				"Base.Tactical_Sickle",	0.2,
				"Base.Suppressor_Oil",	2,
				"Base.Cleaning",		2,
				"Base.WD",				2,
			},
		},
		counter = {
			rolls = 2,
			items = {
				"Base.Bayonet_AK",		0.5,
				"Base.Bayonet_M1917",	0.5,
				"Base.BGMachete",		0.2,
				"Base.DingDong",		0.2,
				"Base.RamboKnife",		0.5,
				"Base.RussianMachete",	0.2,
				"Base.Tactical_Axe",	0.2,
				"Base.Tactical_Sickle",	0.2,
				"Base.Suppressor_Oil",	2,
				"Base.Cleaning",		2,
				"Base.WD",				2,
			},
		},
	},
	------------------------------------------
	--	MISC STORE COUNTERS		--
	------------------------------------------
	bar = {
		counter = {
			rolls = 1,
			items = {
				"Base.ShotgunShellsBox",5,
				"Base.Coachgun_Pistol",	2,
				"Base.Coachgun_Sawed",	1,
				"Base.DT11_Pistol",		2,
				"Base.DT11_Sawed",		1,
				"Base.M1887", 			1,
				"Base.M1887_Sawed", 	1,
			},
		},
	},
	zippeestore = {
		counter = {
			rolls = 1,
			items = {
				"Base.WD", 3,
			},
			fillRand=3,
		},
	},
	gigamart = {
		counter = {
			rolls = 1,
			items = {
				"Base.WD", 3,
			},
		},
	},
	fossoil = {
		counter = {
			rolls = 1,
			items = {
				"Base.Suppressor_Oil", 2,
				"Base.Suppressor_Oil", 2,
				"Base.WD", 2,
			},
		},
	},
	loggingfactory = {
		counter = {
			rolls = 1,
			items = {
				"Base.WD", 3,
			},
		},
		crate = {
			rolls = 1,
			items = {
				"Base.Suppressor_Oil", 2,
				"Base.Cleaning", 3,
				"Base.WD", 3,
			},
		},
	},
	toystore = {
		counter = {
			rolls = 1,
			items = {
				"Base.BB177Box", 4,
			},
		},
		shelves = {
			rolls = 1,
			items = {
				"Base.BB177Box", 4,
			},
		},
	},
	------------------------------------------
	--	RESIDENTIAL HOME AREAS		--
	------------------------------------------
	bedroom = {
		sidetable = {
			rolls = 1,
			items = {
				"Base.Case_Small1",	0.01,	-- 22
				"Base.Case_Small2",	0.01,	-- 380
				"Base.Case_Small3",	0.01,	-- 38/357
				"Base.Case_Small4",	0.01,	-- 9mm
				"Base.Case_Small5",	0.01,	-- 45SS
				"Base.Case_Small6",	0.01,	-- 45DS
				"Base.Case_Small7",	0.01,	-- 44
			},
		},
		all = {						-- SUPER RARE RANDOM
			rolls = 1,
			items = {
				"Base.Case_Cute",		0.01,	-- 22
				"Base.Case_Medium1",	0.01,	-- 380
				"Base.Case_Medium2",	0.01,	-- 9
				"Base.Case_Medium3",	0.01,	-- 45DS
				"Base.Case_Medium4",	0.01,	-- 556
				"Base.Case_Medium5",	0.01,	-- 762
				"Base.Case_Medium6",	0.01,	-- 12g
				"Base.Case_Large1",		0.01,	-- MIX
				"Base.Case_Large2",		0.01,	-- 223
				"Base.Case_Large3",		0.01,	-- 556
				"Base.Case_Large4",		0.01,	-- 762
				"Base.Case_Large5",		0.01,	-- 308
				"Base.Case_Large6",		0.01,	-- 12g PUMP
				"Base.AmmoCan30_MIX",	0.01,
				"Base.AmmoCan50_MIX",	0.01,
			},
		},
	},
	garagestorage = {
		other = {
			rolls = 2,
			items = {
				"Base.BB177Box",		0.5,
				"Base.Bayonet_AK",		0.5,
				"Base.Bayonet_M1917",	0.5,
				"Base.BGMachete",		0.2,
				"Base.Butterfly",		0.2,
				"Base.DingDong",		0.1,
				"Base.Karambit",		0.1,
				"Base.PushDagger",		0.2,
				"Base.RamboKnife",		0.5,
				"Base.RussianMachete",	0.2,
				"Base.Tactical_Axe",	0.2,
				"Base.Tactical_Sickle", 0.2,
				"Base.Case_Small3",		0.1,	-- 9
				"Base.Case_Small5",		0.1,	-- 45SS
				"Base.Case_Small6",		0.1,	-- 45DS
				"Base.Case_Large1",		0.1,	-- MIX
				"Base.AmmoCan30_MIX",	0.1,
				"Base.AmmoCan50_MIX",	0.1,
				"Base.Suppressor_Oil",	2,
				"Base.Cleaning",		2,
				"Base.WD",				2,
			},
		},
	},
	garage = {
		metal_shelves = {
			rolls = 2,
			items = {
				"Base.BB177Box",		0.5,
				"Base.Bayonet_AK",		0.5,
				"Base.Bayonet_M1917",	0.5,
				"Base.BGMachete",		0.2,
				"Base.Butterfly",		0.2,
				"Base.DingDong",		0.2,
				"Base.Karambit",		0.1,
				"Base.PushDagger",		0.2,
				"Base.RamboKnife",		0.5,
				"Base.RussianMachete",	0.2,
				"Base.Tactical_Axe",	0.2,
				"Base.Tactical_Sickle",	0.2,
				"Base.AmmoCan30_MIX",	0.1,
				"Base.AmmoCan50_MIX",	0.1,
				"Base.Suppressor_Oil",	2,
				"Base.Cleaning",		2,
				"Base.WD",				2,
			},
		},
	},
	shed = {
		metal_shelves = {
			rolls = 2,
			items = {
				"Base.BB177Box",		0.5,
				"Base.Bayonet_AK",		0.5,
				"Base.Bayonet_M1917",	0.5,
				"Base.BGMachete",		0.2,
				"Base.Butterfly",		0.2,
				"Base.DingDong",		0.2,
				"Base.Karambit",		0.1,
				"Base.PushDagger",		0.2,
				"Base.RamboKnife",		0.5,
				"Base.RussianMachete",	0.2,
				"Base.Tactical_Axe",	0.2,
				"Base.Tactical_Sickle", 0.2,
				"Base.AmmoCan30_MIX",	0.1,
				"Base.AmmoCan50_MIX",	0.1,
				"Base.Suppressor_Oil",	1,
				"Base.Cleaning",		1,
				"Base.WD",				1,
			},
		},
	},
	farmstorage = {
		locker = {
			rolls = 3,
			items = {
				"Base.Case_Cute",		0.1,	-- 22LR
				"Base.Case_Small1",		0.1,	-- 22
				"Base.Case_Small4",		0.1,	-- 357
				"Base.Case_Small7",		0.1,	-- 44
				"Base.Case_Medium6",	0.1,	-- 12g
				"Base.Case_Large1",		0.1,	-- MIX
				"Base.Case_Large2",		0.1,	-- 223
				"Base.Case_Large4",		0.1,	-- 762
			},
		},
		all = {
			rolls = 1,
			items = {
				"Base.BB177Box",		0.5,
				"Base.AmmoCan30_MIX",	0.1,
				"Base.AmmoCan50_MIX",	0.1,
				"Base.Suppressor_Oil",	0.5,
			},
		},
	},
	gasstorage = {
		all = {
			rolls = 1,
			items = {
				"Base.Suppressor_Oil", 0.5,
			},
		},
	},
	mechanic = {
		all = {
			rolls = 1,
			items = {
				"Base.Suppressor_Oil", 2,
			},
		},
	},
	storageunit = {
		----------------------------------
		--	RARE ITEMS IN SAFE	--
		----------------------------------
		locker = {
			rolls = 3,
			items = {
				"Base.Suppressor_BMG",		0.2,	-- ILLEGAL
				"Base.Suppressor_Pistol",	0.3,	-- ILLEGAL
				"Base.Suppressor_Rifle",	0.3,	-- ILLEGAL
				"Base.Suppressor_Shotgun",	0.2,	-- ILLEGAL
			},
		},
		----------------------------------
		--	MIGHT NEED TO DO 0.01	--
		----------------------------------
		all ={
			rolls = 1,
			items = {
				"Base.Case_Cute",			0.1,	-- 22 LR
				"Base.Case_Small1",			0.1,	-- 22LR
				"Base.Case_Small2",			0.1,	-- 380
				"Base.Case_Small3",			0.1,	-- 9mm
				"Base.Case_Small4",			0.1,	-- 38/357
				"Base.Case_Small5",			0.1,	-- 45SS
				"Base.Case_Small6",			0.1,	-- 45DS
				"Base.Case_Small7",			0.1,	-- 44
				"Base.Case_Medium1",		0.1,	-- 380
				"Base.Case_Medium2",		0.1,	-- 9mm
				"Base.Case_Medium3",		0.1,	-- 45DS
				"Base.Case_Medium4",		0.1,	-- 556
				"Base.Case_Medium5",		0.1,	-- 762
				"Base.Case_Medium6",		0.1,	-- 12g
				"Base.Case_Large1",			0.1,	-- MIX
				"Base.Case_Large2",			0.1,	-- 223
				"Base.Case_Large3",			0.1,	-- 556
				"Base.Case_Large4",			0.1,	-- 762
				"Base.Case_Large5",			0.1,	-- 308
				"Base.Case_Large6",			0.1,	-- 12g PUMP
				"Base.Case_Large7",			0.1,	-- 12g SEMI
				"Base.Case_Heavy2",			0.05,	-- LMG 556
				"Base.Case_Heavy3",			0.05,	-- LMG 308
				"Base.Case_Heavy4",			0.01,	-- BMG
				"Base.AmmoCan30_MIX",		0.1,	-- PISTOL AMMO
				"Base.AmmoCan50_MIX",		0.1,	-- RIFLE  AMMO
				"Base.Suppressor_Oil",		0.2,
			},
		},
--		metal_shelves ={
--			rolls = 1,
--			items = {
--
--			},
--		},
	},
	----------------------------------
	--	TAKE DOWN FIREARMS	--
	----------------------------------
	Guitarcase = {
		rolls = 1,
		items = {
			"Base.AR7_Fold",		2,	-- SURPRISE
			"Base.ASVAL_Fold",		2,	-- SURPRISE
			"Base.MAC10_Fold",		2,	-- REPLACE SUB2000
		},
	},
	----------------------------------
	--	USEFUL RELATED ITEMS	--
	----------------------------------
	Toolbox = {
		rolls = 1,
		items = {
			"Base.Suppressor_Oil",	5,
			"Base.Cleaning",		5,
			"Base.WD",				5,
		},
	},
	----------------------------------
	--	BB GUNS			--
	----------------------------------
	Bag_Schoolbag = {
		rolls = 1,
		items = {
			"Base.BB177Box",	5,
			"Base.BB177Box",	5,
		},
	},
	----------------------------------
	--	MIXED COMMON FIREARMS	--
	----------------------------------
	Bag_WeaponBag = {				-- 40 PTS
		rolls = 3,
		items = {
			"Base.308Box",			5,
			"Base.308Box",			5,
			"Base.Bullets357Box",	5,
			"Base.Bullets357Box",	5,
			"Base.1903Clip",		5,
			"Base.1903Clip",		5,
			"Base.M1Clip",			5,
			"Base.M1Clip",			5,
			"Base.M1",				5,
			"Base.M1903",			5,
			"Base.Marlin_1894",		5,
			"Base.Mosin",			5,
			"Base.NEF_Handi_38",	5,
			"Base.Savage12",		5,
			"Base.Win_1894",		5,
			"Base.Win_1895",		5,
		},
	},
	----------------------------------
	--	AK PATTERN		--
	----------------------------------
	Bag_SurvivorBag = {				-- 35 PTS
		rolls = 1,
		items = {
			"Base.762x39Box",		5,
			"Base.762x39Box",		5,
			"Base.762Drum",			2,
			"Base.AKClip",			5,
			"Base.SKSClip",			5,
			"Base.SKSClip",			5,
			"Base.AK103",			5,
			"Base.AKMS_Stock",		5,
			"Base.MD65_Stock",		5,
			"Base.SKS",				5,
			"Base.SKS_PARA",		5,
			"Base.Vz58",			5,
			"Base.Vz58_Stock",		5,
		},
	},
	----------------------------------
	--	PUMP OR BREAK SHOTGUNS	--
	--	NO NEED FOR MAGAZINE	--
	----------------------------------
	ShotgunCache1 = {				-- 40 PTS
		ShotgunBox = {
			rolls = 1,
			items = {
				"Base.Suppressor_Shotgun",	0.1,
				"Base.Carrier_12g",			2,
				"Base.Coachgun",			5,
				"Base.DT11",				5,
				"Base.DoubleBarrelShotgun",	5,
				"Base.M1897",				5,
				"Base.M870",				5,
				"Base.R11_87",				5,
				"Base.Shorty",				5,
				"Base.Shotgun",				5,
			}
		},
		Bag_DuffelBagTINT = {
			rolls = 1,
			items = {
				"Base.Suppressor_Shotgun",	0.1,
				"Base.Carrier_12g",			2,
				"Base.Coachgun",			5,
				"Base.DT11",				5,
				"Base.DoubleBarrelShotgun",	5,
				"Base.M1897",				5,
				"Base.M870",				5,
				"Base.R11_87",				5,
				"Base.Shorty",				5,
				"Base.Shotgun",				5,
			},
		},
	},
	----------------------------------
	--	PUMP OR BREAK SHOTGUNS	--
	--	NO NEED FOR MAGAZINE	--
	----------------------------------
	ShotgunCache2 = {				-- 40 PTS
		ShotgunBox = {
			rolls = 1,
			items = {
				"Base.Suppressor_Shotgun",	0.1,
				"Base.Carrier_12g",			2,
				"Base.Coachgun",			5,
				"Base.DT11",				5,
				"Base.DoubleBarrelShotgun",	5,
				"Base.M1897",				5,
				"Base.M870",				5,
				"Base.R11_87",				5,
				"Base.Shorty",				5,
				"Base.Shotgun",				5,
			}
		},
		counter = {
			rolls = 1,
			items = {
				"Base.Choke_Full",			5,
				"Base.Suppressor_Shotgun",	0.1,
				"Base.Carrier_12g",			5,
				"Base.Coachgun",			2,
				"Base.DT11",				2,
				"Base.DoubleBarrelShotgun",	2,
				"Base.M1897",				2,
				"Base.M870",				2,
				"Base.R11_87",				2,
				"Base.Shorty",				2,
				"Base.Shotgun",				2,
			},
		},
	},
	----------------------------------
	--	MIXED 9,38,45,44	--
	--	TO MATCH VANILLA AMMO	--
	--	SPAWN FOR CONTAINER	--
	----------------------------------
	GunCache1 = {				-- 100 PTS
		GunBox = {
			rolls = 1,
			items = {
				"Bullets357Box",	10,
				"Base.AMT1911",		25,	-- 45
				"Base.CZ75",		25,	-- 9
				"Base.DEagle",		25,	-- 44
				"Base.M5238",		25,	-- 38/357
			},
		dontSpawnAmmo = true,
		},
		counter = {
			rolls = 1,
			items = {
				"Base.38Clip",		25,	-- 38/357
				"Base.44Clip",		25,	-- 44
				"Base.45Clip",		15,	-- 45
				"Base.45ExtClip",	10,	-- 45
				"Base.9mmClip",		15,	-- 9
				"Base.9mmExtClip",	10,	-- 9
			},
		},
		Bag_DuffelBagTINT = {
			rolls = 1,
			items = {
				"Bullets357Box",	10,
				"Base.AMT1911_Long",25,	-- 45
				"Base.M1Carbine",	25,	-- 9
				"Base.Marlin_1894",	25,	-- 38/357
				"Base.Win_1894",	25,	-- 44
			},
		},
	},
	----------------------------------
	--	MIXED 9,38,45,44	--
	--	TO MATCH VANILLA AMMO	--
	--	SPAWN FOR CONTAINER	--
	----------------------------------
	GunCache2 = {				-- 100 PTS
		GunBox = {
			rolls = 1,
			items = {
				"Bullets357Box",	10,
				"Base.GP100_4",		25,	-- 38/357
				"Base.M29_44",		25,	-- 44
				"Base.M4506",		25,	-- 45
			},
		},
		Bag_DuffelBagTINT = {
			rolls = 1,
			items = {
				"Bullets357Box",		10,
				"Base.UZI_Micro",		25,	-- 9
				"Base.M29_44Carbine",	25,	-- 44
				"Base.MAC10_Fold",		25,	-- 45
				"Base.NEF_Handi_38",	25,	-- 38/357
			},
		},
	},
}

table.insert(Distributions, 1, distributionTable);

--for mod compat:
--SuburbsDistributions = distributionTable;