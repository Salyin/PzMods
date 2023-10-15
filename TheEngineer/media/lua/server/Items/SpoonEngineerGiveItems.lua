require "Items/SuburbsDistributions";

function GetEngineerInjury_OnCreate(items, result, player)
    if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function DismantleTinyElectronics_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function DismantleBigElectronics_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function DismantleHAM_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Amplifier");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioTransmitter");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
end

function DismantleDefaultRadio_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Amplifier");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
	for i=1,items:size() do
        local item = items:get(i-1)
        if instanceof(item, "Radio") then
            item:getDeviceData():getBattery(player:getInventory())
            item:getDeviceData():getHeadphones(player:getInventory())
            break
        end
    end
end

function DismantleWT_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Amplifier");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioTransmitter");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
	for i=1,items:size() do
        local item = items:get(i-1)
        if instanceof(item, "Radio") then
            item:getDeviceData():getBattery(player:getInventory())
            item:getDeviceData():getHeadphones(player:getInventory())
            break
        end
    end
end

function DismantleTVS_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Amplifier");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(2) == 0 then
        player:getInventory():AddItem("Screws");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleEWire_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
    
end

function DismantleSGenerator_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("SheetMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
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
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleSBlowtorch_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("MetalPipe");
    end
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleSCBC_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("EngineParts");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("SmallSheetMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("SmallSheetMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleSFlashlightBIG_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getType() == "Torch" or item:getType() == "HandTorch" then
			if item:getUsedDelta() > 0 then
				local battery = player:getInventory():AddItem("Base.Battery")
				if battery then
					battery:setUsedDelta(item:getUsedDelta())
				end
			end
			break
		end
	end
end

function DismantleSFlashlightSmall_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("LightBulb");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
    
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getType() == "Torch" or item:getType() == "HandTorch" then
			if item:getUsedDelta() > 0 then
				local battery = player:getInventory():AddItem("Base.Battery")
				if battery then
					battery:setUsedDelta(item:getUsedDelta())
				end
			end
			break
		end
	end
end

function DismantleSRemote_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
    
end

function DismantleSSpeaker_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleSAClock_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end
    
end

function DismantleSHeadphones_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ScrapMetal");
    end
    
end

function GetEngDisBig_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end	
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end   
end

function GetEngDisMed_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end   
end

function GetEngDisLil_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.ElectricWire");
    end
	if ZombRand(0,100)<success then
        player:getInventory():AddItem("Aluminum");
    end
	player:getInventory():AddItem("Screws");
	player:getInventory():AddItem("Screws");
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
    end
	if ZombRand(300) == 0 then
        player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
    end   
end
