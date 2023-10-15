require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"

	----------------------------------
	--	CASE SMALL	CAP(2)	--
	----------------------------------
	SuburbsDistributions["Case_Small1"] = {		-- 22 (75 pts)
		rolls = 2,
		items = {
			"Base.Buckmark",		45,
			"Base.Buckmark_Long",	30,
			"Base.22Clip",			20,
			"Base.22Clip",			10,
		},
	};
	SuburbsDistributions["Case_Small2"] = {		-- 380 (75 pts)
		rolls = 2,
		items = {
			"Base.Bersa85F",			25,
			"Base.PPK",					25,
			"Base.Colt1903",			25,
			"Base.380Clip",				20,
			"Base.380ExtClip",			10,
			"Base.Suppressor_Pistol",	0.1,
		},
	};
	SuburbsDistributions["Case_Small3"] = {		-- 9mm (75 pts)
		rolls = 2,
		items = {
			"Base.B93R",				7,
			"Base.CZ75",				14,
			"Base.G18",					7,
			"Base.K5",					10,
			"Base.M5906",				10,
			"Base.M9",					14,
			"Base.P226",				10,
			"Base.UZI_Micro",			3,
			"Base.9mmClip",				20,
			"Base.9mmExtClip",			10,
			"Base.Suppressor_Pistol",	0.1,
		},
	};
	SuburbsDistributions["Case_Small4"] = {		-- 38_357 (75 pts)
		rolls = 2,
		items = {
			"Base.GP100_4",			30,
			"Base.GP100_2",			25,
			"Base.GP100_6",			20,
			"Base.38Speed",			20,
			"Base.38Speed",			10,
			"Base.Bullets357Box",	5,
		},
	};
	SuburbsDistributions["Case_Small5"] = {		-- 45SS (75 pts)
		rolls = 2,
		items = {
			"Base.AMT1911",				50,
			"Base.AMT1911_Long",		25,
			"Base.45Clip",				20,
			"Base.45ExtClip",			10,
			"Base.Suppressor_Pistol",	0.1,
		},
	};
	SuburbsDistributions["Case_Small6"] = {		-- 45DS (75 pts)
		rolls = 2,
		items = {
			"Base.G21",					40,
			"Base.M4506",				35,
			"Base.45DSClip",			20,
			"Base.45DSExtClip",			10,
			"Base.Suppressor_Pistol",	0.1,
		},
	};
	SuburbsDistributions["Case_Small7"] = {		-- 44 (75 pts)
		rolls = 2,
		items = {
			"Base.DEagle",			40,
			"Base.Automag",			35,
			"Base.44Clip",			20,
			"Base.Bullets44Box",	10,
		},
	};
	----------------------------------
	--	CASE MEDIUM	CAP(4)	--
	----------------------------------
	SuburbsDistributions["Case_Medium1"] = {	-- 380 (75 pts)
		rolls = 2,
		items = {
			"Base.Vz61_Fixed",		40,
			"Base.Vz61_Stock",		35,
			"Base.380Clip",			20,
			"Base.380ExtClip",		10,
		},
	};
	SuburbsDistributions["Case_Medium2"] = {	-- 9mm (75 pts)
		rolls = 2,
		items = {
			"Base.AUG9",			8,
			"Base.K7_Stock",		9,
			"Base.M1Carbine",		15,
			"Base.M2Carbine",		7,
			"Base.MP5SD6_Fixed",	4,
			"Base.MP5SD6_Stock",	4,
			"Base.MP5_Fixed",		9,
			"Base.MP5_Stock",		9,
			"Base.UZI",				5,
			"Base.UZI_Wood",		5,
			"Base.9mmClip",			20,
			"Base.9mmExtClip",		10,
		},
	};
	SuburbsDistributions["Case_Medium3"] = {	-- 45DS (75 pts)
		rolls = 2,
		items = {
			"Base.MAC10_Stock",		55,
			"Base.M4506",			10,
			"Base.G21",				10,
			"Base.45DSClip",		20,
			"Base.45DSExtClip",		10,
		},
	};
	SuburbsDistributions["Case_Medium4"] = {	-- 556 (75 pts)
		rolls = 2,
		items = {
			"Base.XM117",			21,
			"Base.M85_Fold",		21,
			"Base.AUG",				21,
			"Base.K1_Fold",			6,
			"Base.K1_1",			6,
			"Base.556Clip",			20,
			"Base.556Drum",			10,
		},
	};
	SuburbsDistributions["Case_Medium5"] = {	-- 762x39 (75 pts)
		rolls = 2,
		items = {
			"Base.AKMS_Fold",		20,
			"Base.MD65_Fold",		20,
			"Base.Vz58_Fold",		20,
			"Base.Vz58_Mini_Stock",	15,
			"Base.AKClip",			20,
			"Base.762Drum",			10,
		},
	};
	SuburbsDistributions["Case_Medium6"] = {	-- 12g (75 pts)
		rolls = 2,
		items = {
			"Base.Coachgun_Pistol", 	30,
			"Base.DT11_Pistol",			30,
			"Base.Shorty",				20,
			"Base.M1887_Sawed", 		5,
			"Base.ShotgunShellsBox",	20,
			"Base.ShotgunShellsBox",	10,
		},
	};
	----------------------------------
	--	CASE LARGE	CAP(6)	--
	----------------------------------
	SuburbsDistributions["Case_Large1"] = {		-- MIX (75 pts)
		rolls = 2,
		items = {
			"Base.M40",					3,
			"Base.Marlin_1894",			7,
			"Base.Win_1894",			7,
			"Base.Win_1895",			7,
			"Base.NEF_Handi_38",		6,
			"Base.M870_Express",		7,
			"Base.M870_Wingmaster",		7,	   
			"Base.Sako85",				6,
			"Base.Savage12",			6,
			"Base.SVD",					4,
			"Base.M1",					5,
			"Base.M1903",				5,
			"Base.Mosin",				5,
			"Base.WA2000",				2,
			"Base.Federal_HE_Melee",	2,
		},
	};
	SuburbsDistributions["Case_Large2"] = {		-- 223 (75 pts)
		rolls = 2,
		items = {
			"Base.MINI14",				40,
			"Base.MINI14_T",			35,
			"Base.223StdClip",			20,
			"Base.223ExtClip",			10,
			"Base.Suppressor_Rifle",	0.1,
		},
	};
	SuburbsDistributions["Case_Large3"] = {		-- 556 (75 pts)
		rolls = 2,
		items = {
			"Base.ColtM16",				9,
			"Base.G33",					7,
			"Base.K2",					7,
			"Base.M16A1",				8,
			"Base.M16Tape",				9,
			"Base.M16Wood",				9,
			"Base.K2_1",				7,			
			"Base.M4",					5,
			"Base.M723",				7,
			"Base.M85_Stock",			7,
			"Base.556Clip",				20,
			"Base.556Drum",				10,
			"Base.Suppressor_Rifle",	0.1,
		},
	};
	SuburbsDistributions["Case_Large4"] = {		-- 762x39 (75 pts)
		rolls = 2,
		items = {
			"Base.AK103",				5,
			"Base.AK47",				10,
			"Base.AKM",					10,
			"Base.AKMS_Stock",			10,
			"Base.MD65_Stock",			10,
			"Base.SKS",					10,
			"Base.SKS_PARA",			5,
			"Base.Vz58",				10,
			"Base.Vz58_Stock",			5,
			"Base.AKClip",				20,
			"Base.762Drum",				10,
			"Base.Suppressor_Rifle",	0.1,
		},
	};
	SuburbsDistributions["Case_Large5"] = {		-- 308 (75 pts)
		rolls = 2,
		items = {
			"Base.M14",					25,
			"Base.FAL",					25,
			"Base.FAL_PARA_Stock",		15,
			"Base.G3",					10,
			"Base.308StdClip",			20,
			"Base.308Box",				10,
			"Base.Suppressor_Rifle",	0.1,
		},
	};
	SuburbsDistributions["Case_Large6"] = {		-- PUMP_12g (75 pts)
		rolls = 2,
		items = {
			"Base.Coachgun",				7,
			"Base.DT11",					7,
			"Base.DoubleBarrelShotgun", 	7,
			"Base.M1887",					7,
			"Base.M1897",					7,
			"Base.M870",					7,
			"Base.M870_Express",			7,
			"Base.M870_Police",				6,
			"Base.M870_Wingmaster",			6,
			"Base.R11_87",					7,
			"Base.Shotgun",					7,
			"Base.ShotgunShellsBox",		10,
			"Base.Suppressor_Shotgun",		0.1,
			"Base.Carrier_12g",				0.5,
		},
	};
	SuburbsDistributions["Case_Large7"] = {		-- SEMI_12g (75 pts)
		rolls = 2,
		items = {
			"Base.AA12",				15,
			"Base.CAWS",				15,
			"Base.DAO12",				15,
			"Base.SPAS_15",				15,
			"Base.USAS_12",				15,
			"Base.SPASClip",			20,
			"Base.12gDrum",				10,
			"Base.Suppressor_Shotgun",	0.1,
			"Base.Carrier_12g",			0.5,
		},
	};
	SuburbsDistributions["Case_Cute"] = {		-- 22LR
		rolls = 2,
		items = {
			"Base.Cricket_22",			20,
			"Base.Marlin_M70",			15,
			"Base.Ruger_1022",			15,
			"Base.AR7",					10,
			"Base.Buckmark_Carbine",	10,
			"Base.22Clip",				20,
			"Base.22ExtClip",			15,
			"Base.22Drum",				15,
		},
	};
	----------------------------------
	--	CASE HEAVY	CAP(12)	--
	----------------------------------
	SuburbsDistributions["Case_Heavy1"] = {		-- LAUNCHER (75 pts)
		rolls = 2,
		items = {
			"Base.EX41_HE_Melee",	40,
			"Base.M32_HE_Melee",	35,
			"Base.40HERound",		20,
			"Base.40HERound",		15,
			"Base.40HERound",		10,
			"Base.40HERound",		5,
			"Base.40INCRound",		20,
			"Base.40INCRound",		15,
			"Base.40INCRound",		10,
			"Base.40INCRound",		5,
		},
	};
	SuburbsDistributions["Case_Heavy2"] = {		-- 556_LMG (75 pts)
		rolls = 2,
		items = {
			"Base.M249",			35,
			"Base.K3",				20,
			"Base.K3LMG",			20,
			"Base.556Belt",			20,
			"Base.556Clip",			10,
		},
	};
	SuburbsDistributions["Case_Heavy3"] = {		-- 308_LMG (75 pts)
		rolls = 2,
		items = {
			"Base.M240",			25,
			"Base.PKM",				25,
			"Base.G21LMG",			25,
			"Base.308Belt",			20,
			"Base.308StdClip",		10,
		},
	};
	SuburbsDistributions["Case_Heavy4"] = {		-- 50BMG (75 pts)
		rolls = 2,
		items = {
			"Base.BOAR",			40,
			"Base.M82",				35,
			"Base.M82Clip",			20,
			"Base.M82Clip",			20,
			"Base.50BMGBox",		10,
			"Base.Suppressor_BMG",	0.1,
		},
	};
	----------------------------------
	--	POLYMER CANISTER	--
	----------------------------------
	SuburbsDistributions["PolyCan_Beige"] = {
		rolls = 2,
		items = {
			"Base.9mmClip",			20,
			"Base.9mmClip",			20,
			"Base.9mmExtClip",		20,
			"Base.9mmExtClip",		20,
			"Base.9mmDrum",			10,
			"Base.9mmDrum",			10,
		},
	};
	SuburbsDistributions["PolyCan_Blue"] = {
		rolls = 2,
		items = {
			"Base.45Clip",			20,
			"Base.45Clip",			20,
			"Base.45ExtClip",		20,
			"Base.45ExtClip",		20,
			"Base.45Drum",			10,
			"Base.45Drum",			10,
		},
	};
	SuburbsDistributions["PolyCan_Brown"] = {
		rolls = 2,
		items = {
			"Base.SPASClip",		20,
			"Base.SPASClip",		20,
			"Base.SPASClip",		20,
			"Base.12gDrum",			20,
			"Base.12gDrum",			20,
			"Base.12gDrum",			20,
		},
	};
	SuburbsDistributions["PolyCan_Red"] = {
		rolls = 2,
		items = {
			"Base.AKClip",			20,
			"Base.AKClip",			20,
			"Base.AKClip",			20,
			"Base.AKClip",			20,
			"Base.762Drum",			20,
			"Base.762Drum",			20,
		},
	};
	----------------------------------
	--	BAGS			--
	----------------------------------
	SuburbsDistributions["Bag_Police"] = {
		rolls = 2,
		items = {
			"Base.9mmClip",						8,
			"Base.45DSClip",					8,
			"Base.45Clip",						8,
			"Base.223StdClip",					8,
			"Base.9mmExtClip",					4,
			"Base.45DSExtClip",					4,
			"Base.45ExtClip",					4,
			"Base.223ExtClip",					4,
			"Base.Bullets9mmBox",				10,
			"Base.Bullets45Box",				10,
			"Base.ShotgunShellsBox",			12,
			"Base.223Box",						10,
			"Base.Sling_2",						2,
			"Base.Cleaning",					1,
			"Base.WD",							1,
			"Base.AmmoStrap_Shells",			2,
			"Base.Gloves_LeatherGlovesBlack",	2,
			"Base.Glasses_Shooting",			2,
		},
	};