function NewProfMetalist()
local metalworker = ProfessionFactory.addProfession("metalworker", getText("UI_prof_MetalWorker"), "profession_metalworker", -6);
	metalworker:addXPBoost(Perks.MetalWelding, 3);
	metalworker:addXPBoost(Perks.Mechanics, 1);
	metalworker:addXPBoost(Perks.Woodwork, 1);
    metalworker:getFreeRecipes():add("Build Furnace");
	metalworker:getFreeRecipes():add("Build Anvil");
	metalworker:getFreeRecipes():add("Build Grindstone");
	metalworker:getFreeRecipes():add("Craft Bellows");
	metalworker:getFreeRecipes():add("Melt Anvil");
	metalworker:getFreeRecipes():add("Prepare Wood for Charcoal Pit");
	metalworker:getFreeRecipes():add("Build Charcoal Pit");
	metalworker:getFreeRecipes():add("Craft Mold");
	metalworker:getFreeRecipes():add("Fill Mold");
	metalworker:getFreeRecipes():add("Craft Tongs");
	metalworker:getFreeRecipes():add("Forge Tongs");
	metalworker:getFreeRecipes():add("Forge Hand Drill");
	metalworker:getFreeRecipes():add("Forge Metal Cutter");
	metalworker:getFreeRecipes():add("Melt Metal");
	metalworker:getFreeRecipes():add("Forge Iron Ingot");
	metalworker:getFreeRecipes():add("Make Metal Walls");
    metalworker:getFreeRecipes():add("Make Metal Fences");
    metalworker:getFreeRecipes():add("Make Metal Containers");
    metalworker:getFreeRecipes():add("Make Metal Sheet");
    metalworker:getFreeRecipes():add("Make Small Metal Sheet");
    metalworker:getFreeRecipes():add("Make Metal Roof");
	metalworker:getFreeRecipes():add("Forge Metal Sheet");
    metalworker:getFreeRecipes():add("Forge Metal Pipe");
    metalworker:getFreeRecipes():add("Forge Metal Bar");
	
    local profList = ProfessionFactory.getProfessions()
    for i = 1, profList:size() do
        local prof = profList:get(i - 1);
        BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

Events.OnGameBoot.Add(NewProfMetalist);
Events.OnPlayerDeath.Add(NewProfMetalist);
Events.OnCreatePlayer.Add(NewProfMetalist);
Events.OnCreateSurvivor.Add(NewProfMetalist);
Events.OnNewGame.Add(NewProfMetalist);
Events.OnPreGameStart.Add(NewProfMetalist);
Events.OnGameStart.Add(NewProfMetalist);
Events.OnCreateLivingCharacter.Add(NewProfMetalist);
Events.OnLoginState.Add(NewProfMetalist);
Events.OnPreMapLoad.Add(NewProfMetalist);