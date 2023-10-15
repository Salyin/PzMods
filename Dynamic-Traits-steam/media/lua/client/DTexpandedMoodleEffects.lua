-- ADDITIONAL EFFECTS TO HEAVY LOAD MOODLE
-- If the player is with a Heavy Load there are minimum chances of getting a fracture.
function fracturesIfHeavyLoad(player)
    --print("DT Logger: running fracturesIfHeavyLoad function");
	
    -- The player has Heavy Load and is not in a vehicle
    if player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 4 and player:getVehicle() == nil then
        --print("Heavy load is Lv4, running chances");
        local baseChance = 15000;
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if Flimsy or Frail are present
        if player:HasTrait("Flimsy") then
            baseChance = baseChance - 1000;
        elseif player:HasTrait("Frail") then
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if Anorexia is present 
        if player:HasTrait("Anorexy") then 
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Increase/Decrease the fracture chance based on the Strength trait present
        if player:HasTrait("Weak") then 
            baseChance = baseChance - 2000;
        elseif player:HasTrait("Feeble") then 
            baseChance = baseChance - 1000;
        elseif player:HasTrait("Stout") then 
            baseChance = baseChance + 1000;
        elseif player:HasTrait("Strong") then 
            baseChance = baseChance + 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Decrease/Increase the fracture chance if Lucky/Unlucky are present 
        if player:HasTrait("Lucky") then
            baseChance = baseChance + 1000;
        elseif player:HasTrait("Unlucky") then
            baseChance = baseChance - 1000;
        end
        --print("baseChance: " .. baseChance);

        -- Decrease the fracture chance if Strong back or Metal strong back from Snake's modpack are present
        if getActivatedMods():contains("AliceSPack") then
            if player:HasTrait("Strongback") or player:HasTrait("Strongback2") then 
                baseChance = baseChance + 1000;
            elseif player:HasTrait("Metalstrongback") or player:HasTrait("Metalstrongback2") then 
                baseChance = baseChance + 2000;
            end
        end
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if the player is moving, running or sprinting 
        if player:isPlayerMoving() and not player:isRunning() and not player:isSprinting() then
            --print("Player is walking");
            -- Player is walking 
            baseChance = baseChance - 500;
        elseif player:isRunning() then 
            --print("Player is running");
            -- Player is running 
            baseChance = baseChance - 1000;
        elseif player:isSprinting() then 
            --print("Player is sprinting");
            -- Player is sprinting 
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        if ZombRand(baseChance) == 0 then
            --print("Fracturing the player");
            local fracturesBodyPart = {"Hand_L", "Hand_R", "ForeArm_L", "ForeArm_R", "UpperArm_L", "UpperArm_R", "Torso_Lower", "Groin", "UpperLeg_L", "UpperLeg_R", "LowerLeg_L", "LowerLeg_R", "Foot_L", "Foot_R"};
	        local randNumber = ZombRand(1, 15);
	        local bodyPart = BodyPartType.FromString(fracturesBodyPart[randNumber]);
	        local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPart);
            playerBodyPart:setFractureTime(ZombRand(30, 50));
        end
    end
end

-- ADDITIONAL EFFECTS TO WETNESS MOODLE
function expandedWetnessMoodle(player)
    --print("DT Logger: running expandedWetnessMoodle function");
    if player:getMoodles():getMoodleLevel(MoodleType.Wet) == 1 then
        player:getModData().DTgenerateAColdChance = player:getModData().DTgenerateAColdChance + 1;
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 2 then
        player:getModData().DTgenerateAColdChance = player:getModData().DTgenerateAColdChance + 2;
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 3 then
        player:getModData().DTgenerateAColdChance = player:getModData().DTgenerateAColdChance + 3;
        generateACold(player, 500, ZombRand(25, 50));
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 4 then
        player:getModData().DTgenerateAColdChance = player:getModData().DTgenerateAColdChance + 4;
        generateACold(player, 300, ZombRand(25, 50));
    else
        player:getModData().DTgenerateAColdChance = player:getModData().DTgenerateAColdChance - 1;
        if player:getModData().DTgenerateAColdChance < 0 then
            player:getModData().DTgenerateAColdChance = 0;
        end
    end
end

-- ADDITIONAL EFFECTS TO HASACOLD MOODLE
function expandedHasAColdMoodle(player)
    --print("DT Logger: running expandedHasAColdMoodle function");
    if player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 1 then
        -- HEADACHE
        DTapplyPain(player, ZombRand(20), "Head", ZombRand(30));
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 2 then
        -- HEADACHE
        DTapplyPain(player, ZombRand(15), "Head", ZombRand(45));
        -- FATIGUE
        DTincreaseFatigue(player, ZombRand(15), 0.05);
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 3 then
        -- HEADACHE
        DTapplyPain(player, ZombRand(10), "Head", ZombRand(60));
        -- FATIGUE
        DTincreaseFatigue(player, ZombRand(13), 0.10);
        -- POISON
        DTincreasePoison(player, ZombRand(7), ZombRand(15));
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 4 then
        -- HEADACHE
        DTapplyPain(player, ZombRand(5), "Head", ZombRand(75));
        -- FATIGUE
        DTincreaseFatigue(player, ZombRand(9), 0.13);
        -- ENDURANCE
        DTdecreaseEndurance(player, ZombRand(9), 0.13);
        -- POISON
        DTincreasePoison(player, ZombRand(5), ZombRand(20));
    end
end

-- ADDITIONAL EFFECTS TO SICK MOODLE
function expandedSickMoodle(player)
    --print("DT Logger: running expandedSickMoodle function");
    for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
        local bodyPart = player:getBodyDamage():getBodyParts():get(i);
        --print("bodyPart:getWoundInfectionLevel(): " .. bodyPart:getWoundInfectionLevel())
        if bodyPart:getWoundInfectionLevel() > 0 then
            if player:getBodyDamage():IsScratched(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a scratch is infected with infection level of " .. bodyPart:getWoundInfectionLevel());
                DTincreasePoisonByWounds(player, ZombRand(3), ZombRand(10));
            elseif player:getBodyDamage():IsCut(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a laceration is infected with infection level of " .. bodyPart:getWoundInfectionLevel());
                DTincreasePoisonByWounds(player, ZombRand(3), ZombRand(13));
            elseif player:getBodyDamage():IsWounded(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a deep wound is infected with infection level of " .. bodyPart:getWoundInfectionLevel());
                DTincreasePoisonByWounds(player, ZombRand(3), ZombRand(15));
            end
        end
        if bodyPart:HasInjury() then
            if player:getBodyDamage():IsScratched(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a scratch is injuried");
                DTincreaseStress(player, ZombRand(5), 0.10);
            elseif player:getBodyDamage():IsCut(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a laceration is injuried");
                DTincreaseStress(player, ZombRand(5), 0.13);
            elseif player:getBodyDamage():IsWounded(bodyPart:getType()) then
                --print("The BodyPart " .. player:getBodyDamage():getBodyPartName(i) .. " with a deep wound is injuried");
                DTincreaseStress(player, ZombRand(5), 0.15);
            end
        end
    end
end

function expandedMoodlesCheckStats(player)
    --print("DT Logger: running expandedMoodlesCheckStats function");

    -- GETTING CURRENT STATS
    local currentDrunkeness = player:getStats():getDrunkenness();
    local currentAnger = player:getStats():getAnger();
    local currentPanic = player:getStats():getPanic();
    local currentStress = player:getStats():getStress();
    
    -- INCREASING ANGRY WHEN BEING DRUNK
    DTincreaseAnger(player, ZombRand(30), currentDrunkeness / 100);

    -- INCREASING STRESS & UNHAPPYNESS WHEN BEING ANGRY
    DTincreaseStress(player, ZombRand(20), currentAnger / 10);
    DTincreaseUnhappyness(player, ZombRand(30), currentAnger * 10);

    -- INCREASING WETNESS WHEN BEING PANICKED
    DTincreaseWetness(player, ZombRand(30), currentPanic / 10);

    -- INCREASING WETNESS WHEN BEING STRESSED
    DTincreaseWetness(player, ZombRand(30), currentStress * 10);

    -- PASSING OUT MECHANIC
    if player:getMoodles():getMoodleLevel(MoodleType.Tired) == 4 and player:getMoodles():getMoodleLevel(MoodleType.Panic) == 0 and
            not player:isAsleep() and player:getMoodles():getMoodleLevel(MoodleType.Hypothermia) < 3 then
        if (ZombRand(3)) == 0 then
            player:getModData().DTpassingOut = player:getModData().DTpassingOut + ZombRand(3) + (DTluckyUnluckyModifier(player, 3) * -1) + 1;
        end
        --print("player:getModData().DTpassingOut: " .. player:getModData().DTpassingOut);
        if player:getModData().DTpassingOut >= 125 then
            --print("Player reached the Pass out threshold");
            -- If the player player is not Running, Sprinting or Walking, then force to sleep
            if not player:isPlayerMoving() and not player:isRunning() and not player:isSprinting() and not player:isAiming() then
                --print("Player is not moving or aiming, increasing quiet time");
                --ISWorldObjectContextMenu.onSleepWalkToComplete(player:getPlayerNum(), nil)
                player:getModData().DTpassingOutQuietTime = player:getModData().DTpassingOutQuietTime + 1;
                --print("player:getModData().DTpassingOutQuietTime: " .. player:getModData().DTpassingOutQuietTime);
                if player:getModData().DTpassingOutQuietTime > 7 then
                    --print("Player is not moving or aiming, and was quiet for a while. Forcing player to sleep");
                    player:setAsleep(true);
                    UIManager.setFadeBeforeUI(player:getPlayerNum(), true)
                    UIManager.FadeOut(player:getPlayerNum(), 1)
                    player:getModData().DTpassingOut = 0;
                    player:getModData().DTpassingOutQuietTime = 0;
                end
            else
                --print("The player is not quiet, can't fall asleep");
                player:getModData().DTpassingOutQuietTime = 0;
                --print("player:getModData().DTpassingOutQuietTime: " .. player:getModData().DTpassingOutQuietTime);
            end
        end
    else
        --print("player:getModData().DTpassingOut: " .. player:getModData().DTpassingOut);
        player:getModData().DTpassingOut = player:getModData().DTpassingOut - 1 - player:getMoodles():getMoodleLevel(MoodleType.Panic);
        if player:getModData().DTpassingOut < 0 then
            player:getModData().DTpassingOut = 0;
        end
    end
end