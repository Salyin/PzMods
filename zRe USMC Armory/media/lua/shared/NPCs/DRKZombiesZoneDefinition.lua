require 'NPCs/ZombiesZoneDefinition'

local function zReUSMCspawn()
	table.insert(ZombiesZoneDefinition.Army, {name = "DRKUSMC1", chance = 10})
	table.insert(ZombiesZoneDefinition.Army, {name = "DRKUSMC2", chance = 10})
	table.insert(ZombiesZoneDefinition.SecretBase, {name = "DRKUSMC1", chance = 10})
	table.insert(ZombiesZoneDefinition.SecretBase, {name = "DRKUSMC2", chance = 10})
	table.insert(ZombiesZoneDefinition.Default,{name = "DRKUSMC1", chance=0.02});
	table.insert(ZombiesZoneDefinition.Default,{name = "DRKUSMC2", chance=0.018});
end
Events.OnPostDistributionMerge.Add(zReUSMCspawn);
Events.OnGameStart.Add(zReUSMCspawn);
Events.OnGameBoot.Add(zReUSMCspawn);