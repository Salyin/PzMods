require "HuntingMod"

function Recipe.PrepareFood_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.9);

        result:setLipids(anim:getLipids() * 0.9);
        result:setProteins(anim:getProteins() * 0.9);
        result:setCalories(anim:getCalories() * 0.9);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.9);
    end
end

function Recipe.GetLeatherBear_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
		player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
end

function Recipe.GetLeatherElk_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
		player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
end

function Recipe.GetLeatherDeer_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
		player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
end

function Recipe.GetLeatherPig_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
		player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
	player:getInventory():AddItem("Bones");
end

function Recipe.GetLeatherSmall_OnCreate(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("LeatherStripsDirty");
		player:getInventory():AddItem("Bones");		
end

function Recipe.OnTest.CutSteak(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:getActualWeight() > 1.0
    end
    return true
end

function Recipe.OnCreate.CutSteak(items, result, player)
    local steak = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            steak = items:get(i);
            break;
        end
    end
    if steak then
        local hunger = math.max(steak:getBaseHunger(), steak:getHungChange())
        result:setBaseHunger(hunger / 5);
        result:setHungChange(hunger / 5);
        result:setActualWeight((steak:getActualWeight() * 0.9) / 5)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(steak:getCarbohydrates() / 5);
        result:setLipids(steak:getLipids() / 5);
        result:setProteins(steak:getProteins() / 5);
        result:setCalories(steak:getCalories() / 5);
        result:setCooked(steak:isCooked());
    end
end

function CannedFood_OnCookedNew(cannedFood)
    local aged = cannedFood:getAge() / cannedFood:getOffAgeMax();
    cannedFood:setOffAgeMax(400);
    cannedFood:setOffAge(200);
    cannedFood:setAge(cannedFood:getOffAgeMax() * aged);
--    print("new jared food age " .. cannedFood:getAge() .. " and max age " .. cannedFood:getOffAgeMax());
end

function CannedMeat_OnCookedNew(cannedFood)
    local aged = cannedFood:getAge() / cannedFood:getOffAgeMax();
    cannedFood:setOffAgeMax(2000);
    cannedFood:setOffAge(1000);
    cannedFood:setAge(cannedFood:getOffAgeMax() * aged);
--    print("new jared food age " .. cannedFood:getAge() .. " and max age " .. cannedFood:getOffAgeMax());
end

function SaltedMeat_OnCookedNew(saltedMeat)
    local aged = saltedMeat:getAge() / saltedMeat:getOffAgeMax();
    saltedMeat:setOffAgeMax(25);
    saltedMeat:setOffAge(15);
    saltedMeat:setAge(saltedMeat:getOffAgeMax() * aged);
--    print("new jared food age " .. saltedMeat:getAge() .. " and max age " .. saltedMeat:getOffAgeMax());
end

function SmokedMeat_OnCookedNew(smokedMeat)
    local aged = smokedMeat:getAge() / smokedMeat:getOffAgeMax();
    smokedMeat:setOffAgeMax(12);
    smokedMeat:setOffAge(6);
    smokedMeat:setAge(smokedMeat:getOffAgeMax() * aged);
--    print("new jared food age " .. smokedMeat:getAge() .. " and max age " .. smokedMeat:getOffAgeMax());
end

function MakeSalami_OnCookedNew(homemadeSalami)
    local aged = homemadeSalami:getAge() / homemadeSalami:getOffAgeMax();
    homemadeSalami:setOffAgeMax(15);
    homemadeSalami:setOffAge(10);
    homemadeSalami:setAge(homemadeSalami:getOffAgeMax() * aged);
--    print("new jared food age " .. homemadeSalami:getAge() .. " and max age " .. homemadeSalami:getOffAgeMax());
end

PrepareFood_OnCreate = Recipe.PrepareFood_OnCreate
GetLeatherBear_OnCreate = Recipe.GetLeatherBear_OnCreate
GetLeatherElk_OnCreate = Recipe.GetLeatherElk_OnCreate
GetLeatherDeer_OnCreate = Recipe.GetLeatherDeer_OnCreate
GetLeatherPig_OnCreate = Recipe.GetLeatherPig_OnCreate
GetLeatherSmall_OnCreate = Recipe.GetLeatherSmall_OnCreate
OnTest_CutSteak = Recipe.OnTest.CutSteak
OnCreate_CutSteak = Recipe.OnCreate.CutSteak
