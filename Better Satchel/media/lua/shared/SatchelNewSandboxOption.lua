local CurrentWeightReduction = {};
local CurrentCapacity = {};
local CurrentWeight = {};
local Finish = {};

function getContainers()
	local items = getAllItems()
	local sz = items:size()
	for it = sz-1,0,-1 do
		local item = items:get(it)
		local invItem = instanceItem(item)
		if item:getName() == "Bag_Satchel" then
			if Finish[it] == nil then
				CurrentWeightReduction[it] = invItem:getWeightReduction();
				CurrentCapacity[it] = invItem:getCapacity();
				CurrentWeight[it] = invItem:getWeight();
				Finish[it] = it;
			end	
			
			getScriptManager():getItem(item:getFullName()):DoParam("WeightReduction = "..SandboxVars.SatchelFrontNewBag.WeightReduction);

			getScriptManager():getItem(item:getFullName()):DoParam("Capacity = "..SandboxVars.SatchelFrontNewBag.Capacity);

			getScriptManager():getItem(item:getFullName()):DoParam("Weight = "..SandboxVars.SatchelFrontNewBag.Weight);
			
		end
		if item:getName() == "Bag_SatchelBack" then
			if Finish[it] == nil then
				CurrentWeightReduction[it] = invItem:getWeightReduction();
				CurrentCapacity[it] = invItem:getCapacity();
				CurrentWeight[it] = invItem:getWeight();
				Finish[it] = it;
			end	
			
			getScriptManager():getItem(item:getFullName()):DoParam("WeightReduction = "..SandboxVars.SatchelBackNewBag.WeightReduction);

			getScriptManager():getItem(item:getFullName()):DoParam("Capacity = "..SandboxVars.SatchelBackNewBag.Capacity);

			getScriptManager():getItem(item:getFullName()):DoParam("Weight = "..SandboxVars.SatchelBackNewBag.Weight);
			
		end
		if item:getName() == "MysteriousSatchel_New" then
			if Finish[it] == nil then
				CurrentWeightReduction[it] = invItem:getWeightReduction();
				CurrentCapacity[it] = invItem:getCapacity();
				CurrentWeight[it] = invItem:getWeight();
				Finish[it] = it;
			end	
			
			getScriptManager():getItem(item:getFullName()):DoParam("WeightReduction = "..SandboxVars.TacticalSatchelFrontNewBag.WeightReduction);

			getScriptManager():getItem(item:getFullName()):DoParam("Capacity = "..SandboxVars.TacticalSatchelFrontNewBag.Capacity);

			getScriptManager():getItem(item:getFullName()):DoParam("Weight = "..SandboxVars.TacticalSatchelFrontNewBag.Weight);
			
		end
		if item:getName() == "MysteriousSatchelBack" then
			if Finish[it] == nil then
				CurrentWeightReduction[it] = invItem:getWeightReduction();
				CurrentCapacity[it] = invItem:getCapacity();
				CurrentWeight[it] = invItem:getWeight();
				Finish[it] = it;
			end	
			
			getScriptManager():getItem(item:getFullName()):DoParam("WeightReduction = "..SandboxVars.TacticalSatchelBackNewBag.WeightReduction);

			getScriptManager():getItem(item:getFullName()):DoParam("Capacity = "..SandboxVars.TacticalSatchelBackNewBag.Capacity);

			getScriptManager():getItem(item:getFullName()):DoParam("Weight = "..SandboxVars.TacticalSatchelBackNewBag.Weight);
			
		end
	end
end

Events.OnSpawnRegionsLoaded.Add(getContainers)
Events.OnLoad.Add(getContainers)