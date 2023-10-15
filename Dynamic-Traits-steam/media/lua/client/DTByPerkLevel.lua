-- Traits gains based on skills levels are going to be handled in this function.
function traitsGainsByLevel(player, perk, perkLevel)
    --print("DT Logger: running traitsGainsByLevel function");
    -- CALL TO INITIALIZATIONS METHOD TO PREVENT LUA ERRORS WHEN A CHARACTER IS CREATED AND HAS PERK LEVELS (THE LEVEL PERK EVENT IS CALLED WHEN THE ASSIGNING THE STARTING PERK LEVELS)
    if player:getModData().DTSlowFastLearner == nil or player:getModData().DTKeenHardOfHearing == nil then
        DTBaseGameCharacterDetails.DoExistingCharacterInitializations(player);
    end
    
    if perk == Perks.Sprinting then

    elseif perk == Perks.Sneak then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Lightfoot then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Nimble then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Aiming then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Reloading then

    elseif perk == Perks.Maintenance then

    elseif perk == Perks.Axe then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Blunt then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.SmallBlunt then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.LongBlade then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.SmallBlade then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Spear then 
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    elseif perk == Perks.Woodwork then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Cooking then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Farming then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Doctor then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Electricity then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.MetalWelding then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Mechanics then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Tailoring then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Fishing then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.Trapping then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    elseif perk == Perks.PlantScavenging then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    if player:getDescriptor():getProfession() == "unemployed" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then 
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "fireofficer" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 5, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 5, 7);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 5);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "policeofficer" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 5);
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "parkranger" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 5, 5, 5, 5);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 5, 5, 5, 5);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 6, 8);
            addAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 6, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 5);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 5, 5, 5, 5);
            addPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 5);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 6);
            addHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 5, 5, 5, 5);
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addForagerTrait(player, 5);
        end
    elseif player:getDescriptor():getProfession() == "constructionworker" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 5);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 5);
            addHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 3);
            addElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 6);
            addAmateurMechanicTrait(player, 8);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "securityguard" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 5);
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "carpenter" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 5);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 6);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 5);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 3);
            addElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "burglar" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 5);
            addSneakyTrait(player, 6);
            addInconspicuousTrait(player, 8);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 5);
            addLightfootedTrait(player, 6);
            addGymnastTrait(player, 6, 4);
            addGracefulTrait(player, 8);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 6, 4);
            addNimbleTrait(player, 4);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 4);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "chef" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 5);
            addCookTrait(player, 6);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "repairman" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 4);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 5);
            addHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "farmer" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 6, 6, 6, 6);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 6, 6, 6, 6);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 6, 8);
            addAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 6, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 6, 6, 6, 6);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 6);
            addCookTrait(player, 7);
            addNutritionistTrait(player, 8);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 6);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 6, 6, 6, 6);
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addForagerTrait(player, 5);
        end
    elseif player:getDescriptor():getProfession() == "fisherman" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 6, 6, 6, 6);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 6, 6, 6, 6);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 6, 8);
            addAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 6, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 6, 6, 6, 6);
            addPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 5);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 6);
            addCookTrait(player, 7);
            addNutritionistTrait(player, 8);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 6, 6, 6, 6);
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 2, 4);
            addHikerTrait(player, 3, 6);
            addForagerTrait(player, 5);
        end
    elseif player:getDescriptor():getProfession() == "doctor" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "veteran" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 5, 5, 5, 5);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 5, 5, 5, 5);
            addEagleEyeTrait(player, 5);
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 6, 8);
            addAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 6, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 5);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 5, 5, 5, 5);
            addPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 6);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 5, 5, 5, 5);
            addFormerScoutTrait(player, 3, 5);
            addHikerTrait(player, 4, 7);
            addTrapperTrait(player, 5);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 3, 5);
            addHikerTrait(player, 4, 7);
            addForagerTrait(player, 6);
        end
    elseif player:getDescriptor():getProfession() == "nurse" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "lumberjack" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 6, 6, 6, 6);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 6, 6, 6, 6);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 5);
            addBrawlerTrait(player, 5, 7);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 5, 7);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 6, 6, 6, 6);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 6);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 6);
            addHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 6);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 6, 6, 6, 6);
            addFormerScoutTrait(player, 3, 5);
            addHikerTrait(player, 4, 7);
            addTrapperTrait(player, 5);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 3, 5);
            addHikerTrait(player, 4, 7);
            addForagerTrait(player, 6);
        end
    elseif player:getDescriptor():getProfession() == "fitnessInstructor" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 5);
            addCookTrait(player, 6);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "burgerflipper" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 5);
            addCookTrait(player, 6);
            addNutritionistTrait(player, 7);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "electrician" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 6);
            addHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addElectricalTechnicianTrait(player, 4);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 6);
            addAmateurMechanicTrait(player, 8);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "engineer" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 5);
            addHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 2);
            addElectricalTechnicianTrait(player, 4);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 5);
            addAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "metalworker" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 6);
            addHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 3);
            addElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 5);
            addAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    elseif player:getDescriptor():getProfession() == "mechanics" then
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 6);
            addHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 3);
            addElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 5);
            addAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    else
        if perk == Perks.Sprinting then
            addJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then 
            addHunterTrait(player, 7, 7, 7, 7);
            removeConspicuousTrait(player, 7);
            addSneakyTrait(player, 8);
            addInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            removeClumsyTrait(player, 7);
            addLightfootedTrait(player, 8);
            addGymnastTrait(player, 8, 5);
            addGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            addGymnastTrait(player, 8, 5);
            addBurglarTrait(player, 1, 1, 2);
            addNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            addHunterTrait(player, 7, 7, 7, 7);
            addEagleEyeTrait(player, 7);
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            addGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            addDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            addCutterTrait(player, 7);
            addBrawlerTrait(player, 7, 8);
            addAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            addBrawlerTrait(player, 7, 8);
            addBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            addCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            addSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            addHunterTrait(player, 7, 7, 7, 7);
            addPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            addSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            addCarpentryTrait(player, 7);
            addHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            addScullionTrait(player, 7);
            addCookTrait(player, 8);
            addNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            addGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            addFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            addBurglarTrait(player, 1, 1, 2);
            addAmateurElectricianTrait(player, 4);
            addElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            addMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            addBurglarTrait(player, 1, 1, 2);
            addAutoMechanicTrait(player, 7);
            addAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            addSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            addAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            addHunterTrait(player, 7, 7, 7, 7);
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            addFormerScoutTrait(player, 4, 6);
            addHikerTrait(player, 5, 8);
            addForagerTrait(player, 7);
        end
    end

    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
    if player:getModData().DTSlowFastLearner >= 30 and player:HasTrait("SlowLearner") then
        player:getTraits():remove("SlowLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTSlowFastLearner >= 50 and not player:HasTrait("FastLearner") then
        player:getTraits():add("FastLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
    end
    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
    if player:getModData().DTKeenHardOfHearing >= 30 and player:HasTrait("HardOfHearing") then
        player:getTraits():remove("HardOfHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTKeenHardOfHearing >= 50 and not player:HasTrait("KeenHearing") and not player:HasTrait("Deaf") then
        player:getTraits():add("KeenHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
    end
end

function addJoggerTrait(player, sprintingExpectedLevel)
    if not player:HasTrait("Jogger") and player:getPerkLevel(Perks.Sprinting) >= sprintingExpectedLevel then
        player:getTraits():add("Jogger");
        applyXPBoost(player, Perks.Sprinting, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Jogger"), true, HaloTextHelper.getColorGreen());
    end
end

function addHunterTrait(player, sneakExpectedLevel, aimingExpectedLevel, trappingExpectedLevel, smallBladeExpectedLevel)
    if not player:HasTrait("Hunter") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel and 
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        player:getTraits():add("Hunter");
        applyXPBoost(player, Perks.Sneak, 1);
        applyXPBoost(player, Perks.Aiming, 1);
        applyXPBoost(player, Perks.Trapping, 1);
        applyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
    end
end

function removeConspicuousTrait(player, sneakExpectedLevel)
    if player:HasTrait("Conspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():remove("Conspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Conspicuous"), false, HaloTextHelper.getColorGreen());
    end
end

function addSneakyTrait(player, sneakExpectedLevel)
    if not player:HasTrait("Sneaky") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():add("Sneaky");
        applyXPBoost(player, Perks.Sneak, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_sneaky"), true, HaloTextHelper.getColorGreen());
    end
end

function addInconspicuousTrait(player, sneakExpectedLevel)
    if not player:HasTrait("Inconspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():add("Inconspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Inconspicuous"), true, HaloTextHelper.getColorGreen());
    end
end

function removeClumsyTrait(player, lightfootExpectedLevel)
    if player:HasTrait("Clumsy") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():remove("Clumsy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_clumsy"), false, HaloTextHelper.getColorGreen());
    end
end

function addLightfootedTrait(player, lightfootExpectedLevel)
    if not player:HasTrait("Lightfooted") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():add("Lightfooted");
        applyXPBoost(player, Perks.Lightfoot, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lightfooted"), true, HaloTextHelper.getColorGreen());
    end
end

function addGymnastTrait(player, lightfootExpectedLevel, nimbleExpectedLevel)
    if not player:HasTrait("Gymnast") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        player:getTraits():add("Gymnast");
        applyXPBoost(player, Perks.Lightfoot, 1);
        applyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gymnast"), true, HaloTextHelper.getColorGreen());
    end
end

function addGracefulTrait(player, lightfootExpectedLevel)
    if not player:HasTrait("Graceful") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():add("Graceful");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_graceful"), true, HaloTextHelper.getColorGreen());
    end
end

function addBurglarTrait(player, nimbleExpectedLevel, electricityExpectedLevel, mechanicsExpectedLevel)
    if not player:HasTrait("Burglar") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel and 
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("Burglar");
        HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
    end
end

function addNimbleTrait(player, nimbleExpectedLevel)
    if not player:HasTrait("Nimble") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        player:getTraits():add("Nimble");
        applyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nimble"), true, HaloTextHelper.getColorGreen());
    end
end

function addEagleEyeTrait(player, aimingExpectedLevel)
    if not player:HasTrait("EagleEyed") and not player:HasTrait("ShortSighted") and 
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel then
        player:getTraits():add("EagleEyed");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_eagleeyed"), true, HaloTextHelper.getColorGreen());
    end
end

function addGunFanTrait(player, aimingExpectedLevel, reloadingExpectedLevel)
    if not player:HasTrait("Gunfan") and player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and 
    player:getPerkLevel(Perks.Reloading) >= reloadingExpectedLevel then
        player:getTraits():add("Gunfan");
        applyXPBoost(player, Perks.Aiming, 1);
		applyXPBoost(player, Perks.Reloading, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gunfan"), true, HaloTextHelper.getColorGreen());
    end
end

function addDurabileTrait(player, maintenanceExpectedLevel)
    if not player:HasTrait("Durabile") and player:getPerkLevel(Perks.Maintenance) >= maintenanceExpectedLevel then
        player:getTraits():add("Durabile");
        applyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_durabile"), true, HaloTextHelper.getColorGreen());
    end
end

function addCutterTrait(player, axeExpectedLevel)
    if not player:HasTrait("Cutter") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        player:getTraits():add("Cutter");
        applyXPBoost(player, Perks.Axe, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_cutter"), true, HaloTextHelper.getColorGreen());
    end
end

function addBrawlerTrait(player, axeExpectedLevel, longBluntExpectedLevel)
    if not player:HasTrait("Brawler") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel and 
    player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        player:getTraits():add("Brawler");
        applyXPBoost(player, Perks.Axe, 1);
        applyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BarFighter"), true, HaloTextHelper.getColorGreen());
    end
end

function addAxemanTrait(player, axeExpectedLevel)
    if not player:HasTrait("Axeman") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        player:getTraits():add("Axeman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_axeman"), true, HaloTextHelper.getColorGreen());
    end
end

function addBaseballPlayerTrait(player, longBluntExpectedLevel)
    if not player:HasTrait("BaseballPlayer") and player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        player:getTraits():add("BaseballPlayer");
        applyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PlaysBaseball"), true, HaloTextHelper.getColorGreen());
    end
end

function addCrusherTrait(player, shortBluntExpectedLevel)
    if not player:HasTrait("Shortbluntfan") and player:getPerkLevel(Perks.SmallBlunt) >= shortBluntExpectedLevel then
        player:getTraits():add("Shortbluntfan");
        applyXPBoost(player, Perks.SmallBlunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbluntfan"), true, HaloTextHelper.getColorGreen());
    end
end

function addSwordsmanTrait(player, longBladeExpectedLevel)
    if not player:HasTrait("Swordsman") and player:getPerkLevel(Perks.LongBlade) >= longBladeExpectedLevel then
        player:getTraits():add("Swordsman");
        applyXPBoost(player, Perks.LongBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_swordsman"), true, HaloTextHelper.getColorGreen());
    end
end

function addPiercerTrait(player, smallBladeExpectedLevel)
    if not player:HasTrait("Shortbladefan") and player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        player:getTraits():add("Shortbladefan");
        applyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbladefan"), true, HaloTextHelper.getColorGreen());
    end
end

function addSpearmanTrait(player, spearExpectedLevel)
    if not player:HasTrait("Spearman") and player:getPerkLevel(Perks.Spear) >= spearExpectedLevel then
        player:getTraits():add("Spearman");
        applyXPBoost(player, Perks.Spear, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_spearman"), true, HaloTextHelper.getColorGreen());
    end
end

function addCarpentryTrait(player, carpentryExpectedLevel)
    if not player:HasTrait("AMCarpenter") and player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        player:getTraits():add("AMCarpenter");
        applyXPBoost(player, Perks.Woodwork, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcarpenter"), true, HaloTextHelper.getColorGreen());
    end
end

function addHandyTrait(player, carpentryExpectedLevel)
    if not player:HasTrait("Handy") and not player:HasTrait("Handy2") and 
    player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        player:getTraits():add("Handy");
        applyXPBoost(player, Perks.Woodwork, 1);
        applyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_handy"), true, HaloTextHelper.getColorGreen());
    end
end

function addScullionTrait(player, cookingExpectedLevel)
    if not player:HasTrait("AMCook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("AMCook");
        applyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcook"), true, HaloTextHelper.getColorGreen());
    end
end

function addCookTrait(player, cookingExpectedLevel)
    if not player:HasTrait("Cook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("Cook");
        applyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Cook"), true, HaloTextHelper.getColorGreen());
    end
end

function addNutritionistTrait(player, cookingExpectedLevel)
    if not player:HasTrait("Nutritionist") and not player:HasTrait("Nutritionist2") and 
    player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("Nutritionist");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nutritionist"), true, HaloTextHelper.getColorGreen());
    end
end

function addGardenerTrait(player, farmingExpectedLevel)
    if not player:HasTrait("Gardener") and player:getPerkLevel(Perks.Farming) >= farmingExpectedLevel then
        player:getTraits():add("Gardener");
        applyXPBoost(player, Perks.Farming, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gardener"), true, HaloTextHelper.getColorGreen());
    end
end

function addFirstAidTrait(player, firstAidExpectedLevel)
    if not player:HasTrait("FirstAid") and player:getPerkLevel(Perks.Doctor) >= firstAidExpectedLevel then
        player:getTraits():add("FirstAid");
        applyXPBoost(player, Perks.Doctor, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FirstAid"), true, HaloTextHelper.getColorGreen());
    end
end

function addAmateurElectricianTrait(player, electricityExpectedLevel)
    if not player:HasTrait("AmateurElectrician") and not player:HasTrait("AmateurElectrician2") and 
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        player:getTraits():add("AmateurElectrician");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AmateurElectrician"), true, HaloTextHelper.getColorGreen());
        local playerRecipes = player:getKnownRecipes();
        if not playerRecipes:contains("Generator") then
            playerRecipes:add("Generator");
        end
    end
end

function addElectricalTechnicianTrait(player, electricityExpectedLevel)
    if not player:HasTrait("AMElectrician") and player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        player:getTraits():add("AMElectrician");
        applyXPBoost(player, Perks.Electricity, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amelectrician"), true, HaloTextHelper.getColorGreen());
    end
end

function addMetalwelderTrait(player, metalweldingExpectedLevel)
    if not player:HasTrait("AMMetalworker") and player:getPerkLevel(Perks.MetalWelding) >= metalweldingExpectedLevel then
        player:getTraits():add("AMMetalworker");
        applyXPBoost(player, Perks.MetalWelding, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammetalworker"), true, HaloTextHelper.getColorGreen());
    end
end

function addAutoMechanicTrait(player, mechanicsExpectedLevel)
    if not player:HasTrait("AMMechanic") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("AMMechanic");
        applyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammechanic"), true, HaloTextHelper.getColorGreen());
    end
end

function addAmateurMechanicTrait(player, mechanicsExpectedLevel)
    if not player:HasTrait("Mechanics") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("Mechanics");
        applyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Mechanics"), true, HaloTextHelper.getColorGreen());
    end
end

function addSewerTrait(player, tailoringExpectedLevel)
    if not player:HasTrait("Tailor") and player:getPerkLevel(Perks.Tailoring) >= tailoringExpectedLevel then
        player:getTraits():add("Tailor");
        applyXPBoost(player, Perks.Tailoring, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Tailor"), true, HaloTextHelper.getColorGreen());
    end
end

function addAnglerTrait(player, fishingExpectedLevel)
    if not player:HasTrait("Fishing") and player:getPerkLevel(Perks.Fishing) >= fishingExpectedLevel then
        player:getTraits():add("Fishing");
        applyXPBoost(player, Perks.Fishing, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Fishing"), true, HaloTextHelper.getColorGreen());
    end
end

function addFormerScoutTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not player:HasTrait("Formerscout") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("Formerscout");
        applyXPBoost(player, Perks.Trapping, 1);
        applyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Scout"), true, HaloTextHelper.getColorGreen());
    end
end

function addHikerTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not player:HasTrait("Hiker") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("Hiker");
        applyXPBoost(player, Perks.Trapping, 1);
        applyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hiker"), true, HaloTextHelper.getColorGreen());
    end
end

function addTrapperTrait(player, trappingExpectedLevel)
    if not player:HasTrait("AMTrapper") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel then
        player:getTraits():add("AMTrapper");
        applyXPBoost(player, Perks.Trapping, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amtrapper"), true, HaloTextHelper.getColorGreen());
    end
end

function addForagerTrait(player, foragingExpectedLevel)
    if not player:HasTrait("AMForager") and player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("AMForager");
        applyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amforager"), true, HaloTextHelper.getColorGreen());
    end
end