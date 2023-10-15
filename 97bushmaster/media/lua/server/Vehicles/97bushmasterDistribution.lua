local distributionTable = VehicleDistributions[1]

VehicleDistributions.BushDeadGuys = {
    rolls = 1,
    items ={
        "CorpseMale", 50,
    }
}

VehicleDistributions.BushStorageBox = {
    rolls = 3,
    items ={
        "Disc_Retail", 2,
        "DuctTape", 2,
        "Earbuds", 2,
        "Aerosolbomb", 10,
        "Bag_BigHikingBag", 0.05,
        "Bag_DuffelBagTINT", 0.5,
        "Bag_FoodCanned", 10,
        "Bag_FoodSnacks", 10,
        "Bag_MedicalBag", 10,
        "Bag_NormalHikingBag", 0.1,
        "Bag_ToolBag", 10,
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "FlameTrap", 4,
        "Garbagebag", 6,
        "NoiseTrap", 10,
        "PipeBomb", 6,
        "Plasticbag", 10,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "RubberBand", 6,
        "SmokeBomb", 10,
        "Tarp", 10,
        "Tissue", 10,
        "ToiletPaper", 6,
        "Tote", 6,
        "Twine", 10,
        "WaterBottleEmpty", 4,
        "WaterBottleFull", 10,
        "WhiskeyEmpty", 1,
        "ElectronicsMag1", 2,
        "ElectronicsMag2", 2,
        "ElectronicsMag3", 2,
        "ElectronicsMag4", 2,
        "ElectronicsMag5", 2,
        "ElectronicsScrap", 10,
        "EngineerMagazine1", 2,
        "EngineerMagazine2", 2,
        "BlowTorch", 10,
        "WaterBottleEmpty", 4,
        "WeldingMask", 10,
        "WeldingRods", 20,
        "WeldingRods", 10,
        "CameraFilm", 20,
        "Cigarettes", 8,
        "Lighter", 4,
        "HuntingKnife", 0.1,
        "Bag_ToolBag", 10,
        "BarbedWire", 10,
        "BarbedWire", 10,
        "BucketEmpty", 10,
        "ConcretePowder", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "Camera", 0.03,
            "CameraDisposable", 0.05,
            "CameraExpensive", 0.001,
            "Glasses_Aviators", 0.05,
            "Glasses_Sun", 0.1,
            "Gloves_LeatherGloves", 10,
            "Gloves_LeatherGlovesBlack", 4,
            "HandTorch", 4,
            "HuntingKnife", 10,
            "LouisvilleMap1", 4,
            "LouisvilleMap2", 4,
            "LouisvilleMap3", 4,
            "LouisvilleMap4", 4,
            "LouisvilleMap5", 4,
            "LouisvilleMap6", 4,
            "LouisvilleMap7", 4,
            "LouisvilleMap8", 4,
            "LouisvilleMap9", 4,
            "MarchRidgeMap", 4,
            "Pistol", 8,
            "Pistol2", 6,
            "Pistol3", 4,
            "Radio.CDplayer", 2,
            "Radio.WalkieTalkie2", 2,
            "Radio.WalkieTalkie3", 1,
            "Revolver", 6,
            "Revolver_Long", 4,
            "Revolver_Short", 8,
            "RiversideMap", 4,
            "RosewoodMap", 4,
            "SewingKit", 2,
            "ToiletPaper", 4,
            "Wallet", 4,
            "Wallet2", 4,
            "Wallet3", 4,
            "Wallet4", 4,
            "WestpointMap", 4,
            "WhiskeyFull", 0.5,
        }
    }
}

VehicleDistributions.Bushamster = {

    GloveBox = VehicleDistributions.PoliceGloveBox;
    BUSHFenderLeft = VehicleDistributions.BushStorageBox;
    BUSHFenderRight = VehicleDistributions.BushStorageBox;
    BUSHStorageLeft = VehicleDistributions.TrunkStandard;
    BUSHStorageRight = VehicleDistributions.TrunkHeavy;
    BUSHRoofCrates = VehicleDistributions.BushStorageBox;
    BUSHFloor = VehicleDistributions.BushDeadGuys;
    BUSHAmmoCabinet = VehicleDistributions.PoliceTruckBed;
    SeatDriver = VehicleDistributions.BushDeadGuys;
    SeatSupport = VehicleDistributions.BushDeadGuys;
    SeatCrew2 = VehicleDistributions.BushDeadGuys;
    SeatCrew4 = VehicleDistributions.BushDeadGuys;
    SeatCrew5 = VehicleDistributions.BushDeadGuys;
}

VehicleDistributions.Neenahneenah = {

	GloveBox = VehicleDistributions.AmbulanceGloveBox;
    BUSHFenderLeft = VehicleDistributions.BushStorageBox;
    BUSHFenderRight = VehicleDistributions.BushStorageBox;
    BUSHStorageLeft = VehicleDistributions.TrunkStandard;
    BUSHStorageRight = VehicleDistributions.TrunkHeavy;
    BUSHRoofCrates = VehicleDistributions.BushStorageBox;
    BUSHFloor = VehicleDistributions.BushDeadGuys;
    BUSHMedicCabinet = VehicleDistributions.AmbulanceTruckBed;
    SeatSupport = VehicleDistributions.BushDeadGuys;
    SeatCrew1 = VehicleDistributions.BushDeadGuys;
    SeatCrew2 = VehicleDistributions.BushDeadGuys;
    SeatCrew4 = VehicleDistributions.BushDeadGuys;
}

distributionTable["97bushmaster"] = { Normal = VehicleDistributions.Bushamster; }
distributionTable["97bushAmbulance"] = { Normal = VehicleDistributions.Neenahneenah; }