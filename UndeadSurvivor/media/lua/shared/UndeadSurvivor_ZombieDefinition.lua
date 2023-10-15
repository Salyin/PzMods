
require 'NPCs/ZombiesZoneDefinition'
-- Code to add sandbox settings for spawnchances

local function DoIt() --It does the thing
	local StalkerSpawnrate = SandboxVars.UndeadSurvivor.StalkerChance;
	local NomadSpawnrate = SandboxVars.UndeadSurvivor.NomadChance;
	local PrepperSpawnrate = SandboxVars.UndeadSurvivor.PrepperChance;
	local HeadhunterSpawnrate = SandboxVars.UndeadSurvivor.HeadhunterChance;
	local AmazonaSpawnrate = SandboxVars.UndeadSurvivor.AmazonaChance;

	if StalkerSpawnrate > 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Stalker", chance = StalkerSpawnrate});
	end
	
	if NomadSpawnrate > 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Nomad", chance = NomadSpawnrate});
		table.insert(ZombiesZoneDefinition.Default,{name = "OminousNomad", chance = 0.01});
	end

	if PrepperSpawnrate > 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Prepper", chance = PrepperSpawnrate});
	end

	if HeadhunterSpawnrate > 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Headhunter", chance = HeadhunterSpawnrate});
		table.insert(ZombiesZoneDefinition.Default,{name = "DeadlyHeadhunter", chance = 0.01});
	end

	if AmazonaSpawnrate > 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Amazona", chance = AmazonaSpawnrate});
	end

end
Events.OnPostDistributionMerge.Add(DoIt);