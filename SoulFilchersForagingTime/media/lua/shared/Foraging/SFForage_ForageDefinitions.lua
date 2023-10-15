require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

local function doRottenFoodSpawn(_character, _inventory, _itemDef, _items)
	local item;
	for i = 0, _items:size() - 1 do
  		item=_items:get(i)
  			if item then
				--randomAge = ZombRandFloat(item:getOffAge(), item:getOffAgeMax());
				item:setAge(item:getOffAgeMax());
  			end;
	end;

	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

--New items

	local Cigarette = {
	type = "filcher.Cigarette",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	};

	local DeadCrow = {
	type="filcher.SFDeadCrow",
	skill=8,
	xp=10,
	rainChance = -10,
	snowChance = -10,
	categories={ "DeadAnimals" },
	zones={ Forest=2, DeepForest=1, Vegitation=1, FarmLand=2, Farm=2, TrailerPark=1, TownZone=1, Nav=1 },
	months={ 3, 4, 5, 6, 7, 9, 10, 11 },
	malusMonths = { 3, 4 },
        spawnFuncs = { doDeadTrapAnimalSpawn },
        forceOutside = false,
        canBeAboveFloor = true,
	};

	local Hickory = {
	type = "filcher.SFHickoryNut",
	minCount = 3,
	maxCount = 6,
	xp = 5,
        categories = { "WildPlants" },
	zones={ Forest=10, DeepForest=10, FarmLand=10, Farm=10, Vegitation=10 },
	months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 9, 10 },
	malusMonths = { 3, 4, 5, 6, 7 },
        spawnFuncs = { doWildFoodSpawn, doRandomAgeSpawn },
	}

	local Pawpaw = {
	type = "filcher.SFPawpaw",
	minCount = 1,
	maxCount = 2,
	skill = 2,
	xp = 10,
        categories = { "Fruits" },
	zones={ Forest=20, DeepForest=20, FarmLand=5, Farm=5 },
        months = { 8, 9, 10, 11 },
        malusMonths = { 11 },
        spawnFuncs = { doWildFoodSpawn },
	}

	local Raspberry = {
	type = "filcher.SFRaspberry",
	xp = 5,
	snowChance = -10,
        categories = { "Berries" },
	zones={ Forest=10, DeepForest=10, FarmLand=10, Farm=10, Vegitation=10 },
	months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        spawnFuncs = { doWildFoodSpawn },
	altWorldTexture = {
    		{ "f_bushes_1_4", "f_bushes_1_68", "f_bushes_1_84" },
    		{ "f_bushes_1_4", "f_bushes_1_68", "f_bushes_1_88" },
	},
	}

	local Roadkill = {
	type="filcher.Roadkill",
	skill=0,
	xp=10,
	categories={ "DeadAnimals" },
	zones={ Nav=1 },
        spawnFuncs = { doRottenFoodSpawn },
	};

	local Truffles = {
	type = "filcher.SFTruffles",
	skill = 9,
	xp = 20,
	itemTags = { "DigPlow" },
        categories = { "Mushrooms" },
	zones={ Forest=1, DeepForest=2 },
        bonusMonths = { 1, 2, 3 },
        spawnFuncs = { doWildFoodSpawn },
	}

--Vanilla Dead Animals

	local DeadMouse = {
	type="Base.DeadMouse",
	skill=4,
	xp=10,
	rainChance = -10,
	snowChance = -10,
	categories={ "DeadAnimals" },
	zones={ FarmLand=2, Farm=2, TrailerPark=10, TownZone=10, Nav=1 },
        months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        malusMonths = { 3, 4 },
        spawnFuncs = { doDeadTrapAnimalSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	};

--Vanilla Misc


--Vanilla Junk

	local CanOpener ={
	type = "Base.TinOpener",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	};

	local Candle = {
	type = "Base.Candle",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

	local Cone = {
	type = "Base.Cone",
	xp=10,
	zones={ TrailerPark=1, TownZone=1, Nav=1 },
        categories = { "JunkFood" },
	forceOutside = false,
	canBeAboveFloor = true,
	}

	local PaperbagSpiffos = {
	type = "Base.Paperbag_Spiffos",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

	local Wallet = {
	type = "Base.Wallet",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

	local Wallet2 = {
	type = "Base.Wallet2",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

	local Wallet3 = {
	type = "Base.Wallet3",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

	local Wallet4 = {
	type = "Base.Wallet4",
	xp=2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	spawnFuncs = { doGenericItemSpawn },
	forceOutside = false,
	canBeAboveFloor = true,
	itemSizeModifier = 0.5,
	isItemOverrideSize = true,
	}

--Adding them to the foraging system
forageSystem.addItemDef(Cigarette);
forageSystem.addItemDef(DeadCrow);
forageSystem.addItemDef(Hickory);
forageSystem.addItemDef(Pawpaw);
forageSystem.addItemDef(Raspberry);
forageSystem.addItemDef(Roadkill);
forageSystem.addItemDef(Truffles);

forageSystem.addItemDef(DeadMouse);

forageSystem.addItemDef(CanOpener);
forageSystem.addItemDef(Candle);
forageSystem.addItemDef(Cone);
forageSystem.addItemDef(PaperbagSpiffos);
forageSystem.addItemDef(Wallet);
forageSystem.addItemDef(Wallet2);
forageSystem.addItemDef(Wallet3);
forageSystem.addItemDef(Wallet4);

end)

--[[
forageDefs["Honey"] = {
	type = "filcher.SFHoney",
	minCount = 1,
	maxCount = 1,
	skill = 6,
	chance = 5,
	xp = 15,
        snowChance = -10,
        categories = { "Animals" },
        zones = { "Forest", "DeepForest", "FarmLand", "Farm" },
        months = { 1, 2, 3, 4, 5, 9, 10, 11 },
        bonusMonths = { 3, 4, 11 },
        malusMonths = { 5, 9 },
        spawnFuncs = { doWildFoodSpawn },
	}
]]--