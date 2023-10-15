require "Foraging/forageSystem"

Events.onAddForageDefs.Add(function()

local SaltRock = {
	type="Base.SaltRock",
	minCount=1,
	maxCount=8,
	xp=10,
	skill=5,
	categories = { "Stones" },
	zones={ Forest=1, DeepForest=2, FarmLand=1, Farm=1, Vegitation=1 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(SaltRock);

end);
