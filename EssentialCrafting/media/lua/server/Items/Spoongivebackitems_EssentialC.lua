function GetTailorLeftoversSheetRope_OnCreate(items, result, player)
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetTailorLeftoversTarp_OnCreate(items, result, player)
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("LeatherStrips");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("LeatherStrips");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Twine");
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetTailorLeftoversMattress_OnCreate(items, result, player)
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Sheet");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Pillow");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Pillow");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Thread");
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetWoodworkLeftovers_OnCreate(items, result, player)
    player:getInventory():AddItem("TreeBranch");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("TreeBranch");
	player:getInventory():AddItem("Twigs");
	if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetWoodworkLeftoversSmall_OnCreate(items, result, player)
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	player:getInventory():AddItem("Twigs");
	if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetCanOpeningInjury_OnCreate(items, result, player)
    if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(100) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function GetBasicInjury_OnCreate(items, result, player)
    if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function Recipe.OnCreate.UpgradeSpearTwo(items, result, player, selectedItem)
    local conditionMax = 0;
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "SpearCrafted" then
            conditionMax = items:get(i):getCondition()
        end
    end
    
    for i=0,items:size() - 1 do
        if instanceof (items:get(i), "HandWeapon") and items:get(i):getType() ~= "SpearCrafted" then
            conditionMax = conditionMax - ((items:get(i):getConditionMax() - items:get(i):getCondition())/2)
        end
    end
    
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end

    result:setCondition(conditionMax);
end

-- when we reclaim the weapon from a spear we get the weapon back
-- we also want to return the spear with appropriate condition
function Recipe.OnCreate.DismantleSpearTwo(items, result, player, selectedItem)
    local conditionMax = selectedItem:getCondition();

    if conditionMax > selectedItem:getConditionMax() then
        conditionMax = selectedItem:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(200) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    local spear = player:getInventory():AddItem("Base.SpearCrafted");
	local spear = player:getInventory():AddItem("Base.LeatherStripsDirty");
    spear:setCondition(conditionMax);
end

function SRipYarn_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Tailoring)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Yarn");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Yarn");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Yarn");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Yarn");
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end
