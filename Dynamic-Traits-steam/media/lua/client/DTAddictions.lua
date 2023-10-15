-- SMOKER TRAIT
function smokerTrait(player)
    --print("DT Logger: running smokerTrait function");
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    if currentTimeSinceLastSmoke == 10 then
        player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + 1;
        if ZombRand(25) == 0 then
            player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
        end
    else
        player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke - 5;
        if ZombRand(25) == 0 then
            player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
        end
    end
    -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
    if player:getModData().DTdaysSinceLastSmoke < 0 then
        player:getModData().DTdaysSinceLastSmoke = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE SMOKER
    if player:getModData().DTdaysSinceLastSmoke >= 1080 then
        player:setTimeSinceLastSmoke(0);
        player:getStats():setStressFromCigarettes(0);
        player:getTraits():remove("Smoker");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Smoker"), false, HaloTextHelper.getColorGreen());
    end
    --print("DT Logger: DTdaysSinceLastSmoke value is " .. player:getModData().DTdaysSinceLastSmoke);
end

function smokerCough(player)
    --print("DT Logger: running smokerCough function");
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    local currentEndurance = player:getStats():getEndurance();
    if (currentEndurance < 0.5 or currentTimeSinceLastSmoke < 2) and ZombRand(10) == 0 then
        player:Say(getText("IGUI_PlayerText_Cough"));
        player:playEmote("dtcough");
        addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
    end
end

-- ALCOHOLIC TRAIT
function alcoholicTrait(player)
    --print("DT Logger: running alcoholicTrait function");
    if player:getMoodles():getMoodleLevel(MoodleType.Drunk) == 0 then
        player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait + 1;
        player:getModData().DTtimeSinceLastDrink = player:getModData().DTtimeSinceLastDrink + 1;
        -- Checks if the player has the Alcoholic trait
        if player:HasTrait("Alcoholic") then
            -- Checks if the player haven't drink for at least 24 hours
            if player:getModData().DTtimeSinceLastDrink > 1440 then
                --print("Apply effects for more than 24 hours")
                -- ANGER
                DTincreaseAnger(player, ZombRand(60), 0.20);
                -- STRESS
                DTincreaseStress(player, ZombRand(55), 0.10);
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, ZombRand(60), 3);
            end
            -- Checks if the player haven't drink for at least 48 hours
            if player:getModData().DTtimeSinceLastDrink > 2880 then
                --print("Apply effects for more than 48 hours")
                -- FATIGUE
                DTincreaseFatigue(player, ZombRand(70), 0.05);
                -- HEADACHE
                DTapplyPain(player, ZombRand(180), "Head", ZombRand(75));
            end
            -- Checks if the player haven't drink for at least 72 hours
            if player:getModData().DTtimeSinceLastDrink > 4320 then
                --print("Apply effects for more than 72 hours")
                -- POISON
                DTincreasePoison(player, ZombRand(70), ZombRand(15));
            end
        end
    else
        player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait - (player:getMoodles():getMoodleLevel(MoodleType.Drunk) * 3);
        player:getModData().DTtimeSinceLastDrink = 0;
    end
    if ZombRand(30) == 0 then
        player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait + DTluckyUnluckyModifier(player, 30);
    end

    -- Checks the value too keep it between the limits
    if player:getModData().DTtimeSinceLastDrink > 4500 then
        player:getModData().DTtimeSinceLastDrink = 4500;
    end
    if player:getModData().DTalcoholicTrait > 50000 then
        player:getModData().DTalcoholicTrait = 50000;
    elseif player:getModData().DTalcoholicTrait < -50000 then
        player:getModData().DTalcoholicTrait = -50000;
    end
    -- Checks if the player achieved the requirements to remove/obtain Alcoholic
    if player:HasTrait("Alcoholic") and player:getModData().DTalcoholicTrait > 44640 then
        player:getTraits():remove("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), false, HaloTextHelper.getColorGreen());
    elseif not player:HasTrait("Alcoholic") and player:getModData().DTalcoholicTrait < -44640 then
        player:getTraits():add("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), true, HaloTextHelper.getColorRed());
    end
    --print("DT Logger: DTalcoholicTrait value is " .. player:getModData().DTalcoholicTrait);
    --print("DT Logger: DTtimeSinceLastDrink value is " .. player:getModData().DTtimeSinceLastDrink);
end

-- ADDICTED TO CAFFEINE TRAIT
function addictedToCaffeineTrait(player)
    --print("DT Logger: running addictedToCaffeineTrait function");
    player:getModData().DTtimeSinceLastCaffeine = player:getModData().DTtimeSinceLastCaffeine + 1;
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody - 1;
    -- Caffeine on body, progressing to obtain the trait
    if player:getModData().DTcaffeineOnBody > 0 then
        --print("Caffeine on body")
        player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait - 1;
        -- Caffeine on body and the trait is present, decreasing stress, anger and fatigue.
        if player:HasTrait("AddictedToCaffeine") then
            --print("The trait is present, positively affecting the player")
            DTdecreaseStress(player, 0.01);
            DTdecreaseAnger(player, 0.01);
            DTdecreaseFatigue(player, ZombRand(10), 0.01);
        end
    -- 24 hours without caffeine, progressing to remove the trait
    elseif player:getModData().DTtimeSinceLastCaffeine > 1440 then
        --print("More than 24 hours without caffeine")
        player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + 1;
        -- 24 hours without caffeine and the trait is present, increasing stress, anger and fatigue.
        if player:HasTrait("AddictedToCaffeine") then
            --print("Trait is present, negatively affecting the player")
            DTincreaseStress(player, ZombRand(90),0.15);
            DTincreaseAnger(player, ZombRand(90),0.15);
            -- During the day the fatigue increases
            if getGameTime():getHour() > 6 and getGameTime():getHour() < 20 and
            player:getModData().DTtimeSinceLastCaffeine > 1440 and player:getModData().DTtimeSinceLastCaffeine < 7200 then
                --print("Day hour, increasing fatigue")
                DTincreaseFatigue(player, ZombRand(45), 0.01);
            end
            DTapplyPain(player, ZombRand(360), "Head", ZombRand(75));
        end
    end

    -- Between 24 and 120 hours without caffeine being an addicted. During the night the fatigue decreases (Insomnia).
    if player:HasTrait("AddictedToCaffeine") then
        if (getGameTime():getHour() <= 6 or getGameTime():getHour() >= 20) and
        player:getModData().DTtimeSinceLastCaffeine > 1440 and player:getModData().DTtimeSinceLastCaffeine < 7200 then
            --print("Night hour, decreasing fatigue")
            DTdecreaseFatigue(player, ZombRand(30), 0.01);
        end
    end

    -- Checks the values too keep them between the limits
    if player:getModData().DTcaffeineOnBody < 0 then
        player:getModData().DTcaffeineOnBody = 0;
    end
    if player:getModData().DTtimeSinceLastCaffeine > 7500 then
        player:getModData().DTtimeSinceLastCaffeine = 7500;
    end
    if player:getModData().DTaddictedToCaffeineTrait > 14400 then
        player:getModData().DTaddictedToCaffeineTrait = 14400;
    elseif player:getModData().DTaddictedToCaffeineTrait < -14400 then
        player:getModData().DTaddictedToCaffeineTrait = -14400;
    end

    -- Checks the values to see if the player can obtain or remove the trait
    if player:HasTrait("AddictedToCaffeine") and player:getModData().DTaddictedToCaffeineTrait > 10080 then
        player:getTraits():remove("AddictedToCaffeine");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AddictedToCaffeine"), false, HaloTextHelper.getColorGreen());
    elseif not player:HasTrait("AddictedToCaffeine") and player:getModData().DTaddictedToCaffeineTrait < -10080 then
        player:getTraits():add("AddictedToCaffeine");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AddictedToCaffeine"), true, HaloTextHelper.getColorRed());
    end

    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end