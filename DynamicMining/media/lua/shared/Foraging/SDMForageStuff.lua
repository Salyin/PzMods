require "Foraging/forageSystem"

Events.onAddForageDefs.Add(function()

local SpoonOre = {
	type="SpoonDM.SDMOreOne",
	minCount=1,
	maxCount=1,
	xp=10,
	skill=5,
	categories = { "Stones" },
	zones={ DeepForest=1 },
	spawnFuncs = { doWildFoodSpawn }
};

forageSystem.addItemDef(SpoonOre);

end);
