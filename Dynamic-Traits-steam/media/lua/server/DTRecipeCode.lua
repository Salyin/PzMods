function OnEat_Alcohol(food, player)
    --print("DT Logger: running OnEat_Alcohol");
    --print("Hunger change for: " .. food:getDisplayName() .. " is: " .. (food:getHungerChange() * 100) * -1)
    --print("Thirst change for: " .. food:getDisplayName() .. " is: " .. (food:getThirstChange() * 100) * -1)
    local hungerChangeOverdose = food:getHungerChange() * 100 * -1;
    local thirstChangeOverdose = food:getThirstChange() * 100 * -1;

    -- OVERDOSE MECHANIC
    DTOverdose.overdoseIncrease(player, hungerChangeOverdose + thirstChangeOverdose);

    -- ALCOHOLIC TRAIT
    --print("DT Logger: DTalcoholicTrait value is " .. player:getModData().DTalcoholicTrait);
    --print("DT Logger: DTtimeSinceLastDrink value is " .. player:getModData().DTtimeSinceLastDrink);
    player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait - (food:getHungerChange() * 1000) * -1;
    player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait - (food:getThirstChange() * 1000) * -1;
    player:getModData().DTalcoholicTrait = player:getModData().DTalcoholicTrait - (food:getAlcoholPower() * 100)
    --print("Alcohol power for: " .. food:getDisplayName() .. " is: " .. (food:getAlcoholPower() * 100))
    player:getModData().DTtimeSinceLastDrink = 0;
    --print("DT Logger: DTalcoholicTrait value is " .. player:getModData().DTalcoholicTrait);
    --print("DT Logger: DTtimeSinceLastDrink value is " .. player:getModData().DTtimeSinceLastDrink);
end

-- On_Eat function for to detect if there are mushrooms on it
-- MUSHROOMS (NO RECIPE)
function OnEat_Mushroom(food, player)
    --print("DT Logger: running OnEat_Mushroom function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- SALADS
function OnEat_Salad(food, player)
    --print("DT Logger: running OnEat_Salad function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Salad had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- STEWS
function OnEat_PotOfStew(food, player)
    --print("DT Logger: running OnEat_PotOfStew function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pot of Stew had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- SOUPS
function OnEat_PotOfSoup(food, player)
    --print("DT Logger: running OnEat_PotOfSoup function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pot of Soup had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- STIR FRIES
function OnEat_StirFry(food, player)
    --print("DT Logger: running OnEat_StirFry function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Stir Fry had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_StirFry2(food, player)
    --print("DT Logger: running OnEat_StirFry2 function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Stir Fry had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- PASTA
function OnEat_PastaPot(food, player)
    --print("DT Logger: running OnEat_PastaPot function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pasta Pot had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_PastaPan(food, player)
    --print("DT Logger: running OnEat_PastaPan function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pasta Pan had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- RICE
function OnEat_RicePot(food, player)
    --print("DT Logger: running OnEat_RicePot function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Rice Pot had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_RicePan(food, player)
    --print("DT Logger: running OnEat_RicePan function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Rice Pan had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- ROASTED VEGETABLES 
function OnEat_RoastedVegetables(food, player)
    --print("DT Logger: running OnEat_RoastedVegetables function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Roasted Vegetables had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- OMELETTE
function OnEat_OmeletteRecipe(food, player)
    --print("DT Logger: running OnEat_OmeletteRecipe function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Omelette had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- SANDWICH
function OnEat_Sandwich(food, player)
    --print("DT Logger: running OnEat_Sandwich function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Sandwich had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- BURGER
function OnEat_Burger(food, player)
    --print("DT Logger: running OnEat_Burger function")
    if player:HasTrait("WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Burger had a mushroom: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 30);
            end
        end
    end
end

-- On_Eat function for to detect if there are berries on it
-- BERRIES (NO RECIPES)
function OnEat_Berry(food, player)
    --print("DT Logger: running OnEat_Berry function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- SALADS
function OnEat_FruitSalad(food, player)
    --print("DT Logger: running OnEat_FruitSalad function")
    local ingredients = food:getExtraItems();
    if player:HasTrait("WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Fruit salad had a berry: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 15);
            end
        end
    end
end

-- CAKE
function OnEat_CakeRaw(food, player)
    --print("DT Logger: running OnEat_CakeRaw function")
    local ingredients = food:getExtraItems();
    if player:HasTrait("WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Cake Raw had a berry: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 15);
            end
        end
    end
end

-- PANCAKES 
function OnEat_Pancakes(food, player)
    --print("DT Logger: running OnEat_Pancakes function")
    local ingredients = food:getExtraItems();
    if player:HasTrait("WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Pancake had a berry: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 15);
            end
        end
    end
end

-- WAFFLES 
function OnEat_Waffles(food, player)
    --print("DT Logger: running OnEat_Waffles function")
    local ingredients = food:getExtraItems();
    if player:HasTrait("WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Waffles had a berry: " .. ingredients:get(i))
                DTFoodAllergy.allergyIncrease(player, 15);
            end
        end
    end
end

-- VIOLETS
function OnEat_Violets(food, player)
    --print("DT Logger: running OnEat_Violets function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- SUNFLOWER SEEDS
function OnEat_SunFlowerSeeds(food, player)
    --print("DT Logger: running OnEat_SunFlowerSeeds function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- GRAPE LEAVES
function OnEat_GrapeLeaves(food, player)
    --print("DT Logger: running OnEat_GrapeLeaves function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- ROSEHIPS
function OnEat_Rosehips(food, player)
    --print("DT Logger: running OnEat_Rosehips function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- ACORNS
function OnEat_Acorns(food, player)
    --print("DT Logger: running OnEat_Acorns function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- DANDELIONS
function OnEat_Dandelions(food, player)
    --print("DT Logger: running OnEat_Dandelions function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- NETTLES
function OnEat_Nettles(food, player)
    --print("DT Logger: running OnEat_Nettles function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- THISTLE
function OnEat_Thistle(food, player)
    --print("DT Logger: running OnEat_Thistle function")
    if player:HasTrait("WildPlantsAllergy") then
        DTFoodAllergy.allergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- GUM
function OnEat_Gum(food, player)
    --print("DT Logger: running OnEat_Gum function")
    if player:HasTrait("Smoker") then
        player:getStats():setStressFromCigarettes(0);
    end
end

-- COFFEE
function OnEat_Coffee(food, player)
    --print("DT Logger: running OnEat_Coffee function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- HOTDRINKS
function OnEat_HotDrinks(food, player)
    --print("DT Logger: running OnEat_HotDrinks function")
    local ingredients = food:getExtraItems();
    --print(ingredients)
    for i = 0, ingredients:size() - 1 do
        if string.find(ingredients:get(i), "Coffee") or string.find(ingredients:get(i), "Teabag") then
            --print("The HotDrink had Coffe or Tea")
            player:getModData().DTtimeSinceLastCaffeine = 0;
            player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
            player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
        end
    end
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- CHOCOLATECOVEREDCOFFEEBEANS
function OnEat_ChocolateCoveredCoffeeBeans(food, player)
    --print("DT Logger: running OnEat_ChocolateCoveredCoffeeBeans function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- MATE
function OnEat_DTMate(food, player)
    --print("DT Logger: running OnEat_DTMate function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- ENERGY DRINKS
function OnEat_DTEnergyDrinks(food, player)
    --print("DT Logger: running OnEat_DTEnergyDrinks function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- MAXIMUM ENERGY DRINKS
function OnEat_DTMaximumEnergyDrinks(food, player)
    --print("DT Logger: running OnEat_DTMaximumEnergyDrinks function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- COLA DRINK
function OnEat_DTColaBottle(food, player)
    --print("DT Logger: running OnEat_DTColaBottle function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end

-- SODA
function OnEat_DTSoda(food, player)
    --print("DT Logger: running OnEat_DTSoda function")
    player:getModData().DTtimeSinceLastCaffeine = 0;
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. (food:getFatigueChange() * 100) * -1)
    player:getModData().DTcaffeineOnBody = player:getModData().DTcaffeineOnBody + (food:getFatigueChange() * 100 * -1 * 15);
    player:getModData().DTaddictedToCaffeineTrait = player:getModData().DTaddictedToCaffeineTrait + (food:getFatigueChange() * 100 * 10);
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTaddictedToCaffeineTrait);
end