require "Foraging/forageSystem"

Events.onAddForageDefs.Add(function()
local SIHTraceSmall = {
	type="ImmersiveHunting.SIHTraceSmall",
	snowChance = -20,
	rainChance = -20,
	minCount=1,
	maxCount=1,
	xp=10,
	skill=2,
	categories = { "Animals" },
	zones={ Forest=4, DeepForest=8, FarmLand=2, Farm=2, Vegitation=2 },
	bonusMonths = { 6, 7, 8 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(SIHTraceSmall);

end);

Events.onAddForageDefs.Add(function()
local SIHTraceBig = {
	type="ImmersiveHunting.SIHTraceBig",
	snowChance = -20,
	rainChance = -20,
	minCount=1,
	maxCount=1,
	xp=20,
	skill=4,
	categories = { "Animals" },
	zones={ Forest=4, DeepForest=8, FarmLand=2, Farm=2, Vegitation=2 },
	bonusMonths = { 6, 7, 8 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(SIHTraceBig);

end);

Events.onAddForageDefs.Add(function()
local SIHSpottedBird = {
	type="ImmersiveHunting.SIHSpottedBird",
	snowChance = -20,
	rainChance = -20,
	minCount=1,
	maxCount=2,
	xp=10,
	skill=0,
	categories = { "Animals" },
	zones={ Forest=12, DeepForest=24, FarmLand=6, Farm=6, Vegitation=6, TrailerPark=6, TownZone=6, Nav=6 },
	bonusMonths = { 6, 7, 8 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(SIHSpottedBird);

end);
