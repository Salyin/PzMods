
Distributions = Distributions or {};

local distributionTable = {
--------------------------------------------------
--	50 CALIBER AMMO-CAN CONTENTS		--
--------------------------------------------------
    AmmoCan50_223 = {
        rolls = 10,
        items = {
            "223Box",		20,
            "223Box",		20,
            "223Box",		20,
            "223Box",		20,
            "223Box",		20,
        },
    },
    AmmoCan50_556 = {
        rolls = 10,
        items = {
            "556Box",		20,
            "556Box",		20,
            "556Box",		20,
            "556Box",		20,
            "556Box",		20,
        },
    },
    AmmoCan50_762x39 = {
        rolls = 9,
        items = {
            "762x39Box",	20,
            "762x39Box",	20,
            "762x39Box",	20,
            "762x39Box",	20,
            "762x39Box",	20,
        },
    },
    AmmoCan50_308 = {
        rolls = 8,
        items = {
            "308Box",		20,
            "308Box",		20,
            "308Box",		20,
            "308Box",		20,
            "308Box",		20,
        },
    },
    AmmoCan50_50 = {
        rolls = 6,
        items = {
            "50BMGBox",		20,
            "50BMGBox",		20,
            "50BMGBox",		20,
            "50BMGBox",		20,
            "50BMGBox",		20,
        },
    },
    AmmoCan50_12 = {
        rolls = 5,
        items = {
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 20,
        },
    },
    AmmoCan50_MIX = {
        rolls = 8,
        items = {
            "223Box",		30,
            "308Box",		20,
            "50BMGBox",		15,
            "556Box",		10,
            "762x39Box",	30,
            "ShotgunShellsBox",	10,
        },
    },
    AmmoCan50_HE = {
        rolls = 10,			-- ROUND COUNT 1 = 50
        items = {
            "40HERound",	20,
            "40HERound",	20,
            "40HERound",	20,
            "40HERound",	20,
            "40HERound",	20,
        },
    },
    AmmoCan50_INC = {
        rolls = 10,			-- ROUND COUNT 1 = 50
        items = {
            "40INCRound",	20,
            "40INCRound",	20,
            "40INCRound",	20,
            "40INCRound",	20,
            "40INCRound",	20,
        },
    },
--------------------------------------------------
--	30 CALIBER AMMO-CAN CONTENTS		--
--------------------------------------------------
    AmmoCan30_22 = {
        rolls = 5,
        items = {
            "Bullets22Box",	20,
            "Bullets22Box",	20,
            "Bullets22Box",	20,
            "Bullets22Box",	20,
            "Bullets22Box",	20,
        },
    },
    AmmoCan30_380 = {
        rolls = 5,
        items = {
            "Bullets380Box",	20,
            "Bullets380Box",	20,
            "Bullets380Box",	20,
            "Bullets380Box",	20,
            "Bullets380Box",	20,
        },
    },
    AmmoCan30_9 = {
        rolls = 5,
        items = {
            "Bullets9mmBox",	20,
            "Bullets9mmBox",	20,
            "Bullets9mmBox",	20,
            "Bullets9mmBox",	20,
            "Bullets9mmBox",	20,
        },
    },
    AmmoCan30_38 = {
        rolls = 5,
        items = {
            "Bullets38Box",	20,
            "Bullets38Box",	20,
            "Bullets38Box",	20,
            "Bullets38Box",	20,
            "Bullets38Box",	20,
        },
    },
    AmmoCan30_357 = {
        rolls = 5,
        items = {
            "Bullets357Box",	20,
            "Bullets357Box",	20,
            "Bullets357Box",	20,
            "Bullets357Box",	20,
            "Bullets357Box",	20,
        },
    },
    AmmoCan30_45 = {
        rolls = 5,
        items = {
            "Bullets45Box",	20,
            "Bullets45Box",	20,
            "Bullets45Box",	20,
            "Bullets45Box",	20,
            "Bullets45Box",	20,
        },
    },
    AmmoCan30_44 = {
        rolls = 5,
        items = {
            "Bullets44Box",	20,
            "Bullets44Box",	20,
            "Bullets44Box",	20,
            "Bullets44Box",	20,
            "Bullets44Box",	20,
        },
    },
    AmmoCan30_MIX = {
        rolls = 5,
        items = {
			"Bullets22Box",	30,
			"Bullets357Box",30,
			"Bullets380Box",30,
			"Bullets38Box",	10,
			"Bullets44Box",	20,
			"Bullets45Box",	10,
			"Bullets57Box", 30,
			"Bullets9mmBox",10,
        },
    },
}

table.insert(Distributions, 1, distributionTable);

--for mod compat:
--SuburbsDistributions = distributionTable;
