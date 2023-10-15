-- MAIN FILE WHERE ALL THE DIFFERENT FUNCTIONS WILL BE CALLED BASED ON THE DIFFERENT EVENTS

-- OnPlayerUpdate Main Method to call others
function DTOnPlayerUpdateMain(player)
    -- INITIALIZATIONS FOR AN EXISTING CHARACTER
    DTBaseGameCharacterDetails.DoExistingCharacterInitializations(player);
end
Events.OnPlayerUpdate.Add(DTOnPlayerUpdateMain);

-- EveryOneMinutes Main Method to call others
function DTEveryOneMinuteMain()

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryOneMinute EVENT
        traitsGainsByBodyConditions(player);
        traitsByMoods(player);
        traitsByRecipes(player);

        if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
            traitsByMovingObjects(player);
        end
        rainTraits(player);

        if player:HasTrait("Agoraphobic") or player:HasTrait("Claustophobic") then
            agoraphobicClaustrophobicTraits(player);
        end

        catsEyes(player);
        outdoorsmanTrait(player);
        alcoholicTrait(player);
        if getActivatedMods():contains("LeGourmetRevolution") then
            addictedToCaffeineTrait(player);
        end

        expandedMoodlesCheckStats(player);
        checkReduceInfectionPower(player);
        DTFoodAllergy.allergyDecrease(player);
        DTFoodAllergy.allergyMoodleLv1(player);
        DTFoodAllergy.allergyMoodleLv2(player);
        DTFoodAllergy.allergyMoodleLv3(player);
        DTFoodAllergy.allergyMoodleLv4(player);

        DTDrugsAllergy.allergyDecrease(player);
        DTDrugsAllergy.allergyMoodleLv1(player);
        DTDrugsAllergy.allergyMoodleLv2(player);
        DTDrugsAllergy.allergyMoodleLv3(player);
        DTDrugsAllergy.allergyMoodleLv4(player);

        fracturesIfHeavyLoad(player);

        tweaksToPlayerMoving(player)
        
    end
end
Events.EveryOneMinute.Add(DTEveryOneMinuteMain);

-- EveryTenMinutes Main Method to call others
function DTEveryTenMinutesMain()

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryTenMinutes EVENT
        if player:HasTrait("Agoraphobic") or player:HasTrait("Claustophobic") then
            luckyUnluckyEffectsForAgoraClaustroTraits(player);
        end
        if player:HasTrait("Anorexy") then
            anorexyTraitHungerSymptoms(player);
        end
        activeSedentaryTraits(player);
        nightmaresTrait(player);
           
        expandedWetnessMoodle(player);
        expandedHasAColdMoodle(player);
        expandedSickMoodle(player);

        DTOverdose.overdoseMoodleLv2(player);
        DTOverdose.overdoseMoodleLv3(player);
        DTOverdose.overdoseMoodleLv4(player);

        if player:HasTrait("Smoker") then
            smokerCough(player);
        end

        if player:HasTrait("Bloodlust") then
            bloodlustTraitEffects(player);
        end
    end
end
Events.EveryTenMinutes.Add(DTEveryTenMinutesMain);

-- EveryHours Main Method to call others
function DTEveryHoursMain()

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryHours EVENT
        if player:HasTrait("Smoker") then
            smokerTrait(player);
        end

        anorexyTrait(player);
        if player:HasTrait("Anorexy") then
            anorexyTraitPassiveSymptoms(player);
        end

        if not getActivatedMods():contains("FWOFitnessWorkoutOverhaul") then
            exerciseMultiplierIfMaxRegularity(player);
        end

        if player:HasTrait("Bloodlust") then
            bloodlustTrait(player);
        end
        if player:getModData().DTisNervousWreck == false or player:getModData().DTisMelancholic == false then
            pillsTraitsDevelopment(player);
        end
        if player:getModData().DTisNervousWreck == true then
            nervousWreckTrait(player);
        end
        if player:getModData().DTisMelancholic == true then
            melancholicTrait(player);
        end
        DTOverdose.overdoseDecrease(player);
    end
end
Events.EveryHours.Add(DTEveryHoursMain);

-- EveryDays Main Method to call others
function DTEveryDaysMain()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);

        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryDays EVENT
        emotionalIntelligenceRecipes(player);
    end
end
Events.EveryDays.Add(DTEveryDaysMain);

-- OnZombieDead Main Method to call others
function DTOnZombieDeadMain(zombie)

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnZombieDead EVENT
        if not player:HasTrait("Bloodlust") then
            traitsGainsByKills(player);
        end
        if player:HasTrait("Bloodlust") then
            bloodlustTraitOnZombieKill(player);
        end
    end
end
Events.OnZombieDead.Add(DTOnZombieDeadMain);

-- LevelPerk Main Method to call others
function DTLevelPerkMain(player, perk, perkLevel, addBuffer)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE LevelPerk EVENT
    traitsGainsByLevel(player, perk, perkLevel);
    recipesByPerksLevel(player, perk, perkLevel);

end
Events.LevelPerk.Add(DTLevelPerkMain);

-- OnWeaponHitTree Main Method to call others
function DTOnWeaponHitTreeMain(player, weapon)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnWeaponHitTree EVENT
    tweaksToOnHitTree(player, weapon);
end
Events.OnWeaponHitTree.Add(DTOnWeaponHitTreeMain);

-- OnWeaponSwingHitPoint Main Method to call others
function DTOnWeaponSwingHitPointMain(player, weapon)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnWeaponSwingHitPoint EVENT
    tweaksToSwingWeapon(player, weapon);
end
Events.OnWeaponSwingHitPoint.Add(DTOnWeaponSwingHitPointMain);

-- OnWeaponHitCharacter Method to call others
function DTOnWeaponHitCharacterMain(player, target, weapon, damage)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE onPlayerHittingAZombie EVENT
    onPlayerHittingAZombie(player, target, weapon, damage);
end
Events.OnWeaponHitCharacter.Add(DTOnWeaponHitCharacterMain);