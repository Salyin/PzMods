require "Items/SuburbsDistributions";

function GetSaucepan_OnCreate(items, result, player)
    player:getInventory():AddItem("Saucepan");
end

function GetPot_OnCreate(items, result, player)
    player:getInventory():AddItem("Pot");
end

function GetEmptyBarrel_OnCreate(items, result, player)
    player:getInventory():AddItem("WoodenBarrel");
end

function MeatIsCookedAlready_OnTest(item)
	local itemType = item:getType()
    if itemType == "FishFillet" or itemType == "SteakSlice" or itemType == "Steak" or itemType == "Smallanimalmeat" or itemType == "Rabbitmeat" or itemType == "Smallbirdmeat" then
        if item:isCooked() then return false; end
    end
	return true;
end

function PoisonA1_OnCreate(item)
	local itemType = item:getType()
    if itemType == "BerryGeneric1" or itemType == "BerryGeneric2" or itemType == "BerryGeneric3" or itemType == "BerryGeneric4" or itemType == "BerryGeneric5" or itemType == "BerryBlack" or itemType == "BerryBlue" then
        if item:getPoisonPower() > 0 then return false; end
    end
	return true;
end

function PoisonA2_OnCreate(item)
	local itemType = item:getType()
    if itemType == "MushroomGeneric1" or itemType == "MushroomGeneric2" or itemType == "MushroomGeneric3" or itemType == "MushroomGeneric4" or itemType == "MushroomGeneric5" or itemType == "MushroomGeneric6" or itemType == "MushroomGeneric7" then
        if item:getPoisonPower() > 0 then return false; end
    end
	return true;
end

function GetSmashedBarrel_OnCreate(items, result, player)
    player:getInventory():AddItem("Plank");
	player:getInventory():AddItem("Plank");
	player:getInventory():AddItem("Plank");
	player:getInventory():AddItem("Plank");
	player:getInventory():AddItem("Plank");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("LeatherStripsDirty");
	player:getInventory():AddItem("Wire");
end

function GetYeast_OnCreate(items, result, player)
    player:getInventory():AddItem("Yeast");
end

function GetSmashedBioGas_OnCreate(items, result, player)
    player:getInventory():AddItem("MetalPipe");
	player:getInventory():AddItem("MetalPipe");
	player:getInventory():AddItem("PropaneTankEmpty");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
end

function GetSmashedBioGasTwo_OnCreate(items, result, player)
    player:getInventory():AddItem("MetalPipe");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("UnusableMetal");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
end

function GetEmptyRefinery_OnCreate(items, result, player)
    player:getInventory():AddItem("BioGasRefinery");
end

function Recipe.OnCreate.OpenJarNahhui(items, result, player)
    local jar = items:get(0);
    local aged = jar:getAge() / jar:getOffAgeMax();

    result:setAge(result:getOffAgeMax() * aged);

    player:getInventory():AddItem("Base.EmptyJar");
	player:getInventory():AddItem("Base.JarLid");

--    print("you're new food have age " .. result:getAge());
end

function Recipe.OnCreate.OpenCanNahhui(items, result, player)
    local jar = items:get(0);
    local aged = jar:getAge() / jar:getOffAgeMax();

    result:setAge(result:getOffAgeMax() * aged);

    player:getInventory():AddItem("Base.TinCanEmpty");

--    print("you're new food have age " .. result:getAge());
end