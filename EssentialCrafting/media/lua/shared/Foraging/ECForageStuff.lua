require "Foraging/forageSystem"

Events.onAddForageDefs.Add(function()

local CottonBalls = {
	type="Base.CottonBalls",
	minCount=4,
	maxCount=16,
	xp=2,
	skill=5,
	categories = { "Firewood" },
	zones={ Forest=1, DeepForest=2, FarmLand=1, Farm=1, Vegitation=5 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(CottonBalls);

end);
