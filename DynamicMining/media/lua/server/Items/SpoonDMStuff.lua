function SDMOreSpawn_OnCreate(items, result, food, player)
	local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
	end
	local DMRockRoll1 = ZombRand(1,2000);
	if DMRockRoll1 > 0 and DMRockRoll1 < 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreGoldMine1", 0, 0, 0);
		getPlayer():Say("G--OOOOOOOOOOOLD!!!");
	elseif DMRockRoll1 > 5 and DMRockRoll1 < 11 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreGoldMine2", 0, 0, 0);
		getPlayer():Say("G--OOOOOOOOOOOLD!!!");
	elseif DMRockRoll1 > 10 and DMRockRoll1 < 16 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreGoldMine3", 0, 0, 0);
		getPlayer():Say("G--OOOOOOOOOOOLD!!!");
	elseif DMRockRoll1 > 15 and DMRockRoll1 < 21 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSilverMine1", 0, 0, 0);
		getPlayer():Say("Wow, Silver!");
	elseif DMRockRoll1 > 20 and DMRockRoll1 < 26 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSilverMine2", 0, 0, 0);
		getPlayer():Say("Wow, Silver!");
	elseif DMRockRoll1 > 25 and DMRockRoll1 < 31 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSilverMine3", 0, 0, 0);
		getPlayer():Say("Wow, Silver!");
	elseif DMRockRoll1 > 30 and DMRockRoll1 < 61 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSaltMine1", 0, 0, 0);
		getPlayer():Say("SALT!");
	elseif DMRockRoll1 > 60 and DMRockRoll1 < 91 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSaltMine2", 0, 0, 0);
		getPlayer():Say("SALT!");
	elseif DMRockRoll1 > 90 and DMRockRoll1 < 121 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreSaltMine3", 0, 0, 0);
		getPlayer():Say("SALT!");
    elseif DMRockRoll1 > 120 and DMRockRoll1 < 181 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreAluminumMine1", 0, 0, 0);
		getPlayer():Say("Hmmm, looks like its Aluminum.");
	elseif DMRockRoll1 > 180 and DMRockRoll1 < 241 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreAluminumMine2", 0, 0, 0);
		getPlayer():Say("Hmmm, looks like its Aluminum.");
	elseif DMRockRoll1 > 240 and DMRockRoll1 < 301 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreAluminumMine3", 0, 0, 0);
		getPlayer():Say("Hmmm, looks like its Aluminum.");
	elseif DMRockRoll1 > 300 and DMRockRoll1 < 381 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreCoalMine1", 0, 0, 0);
		getPlayer():Say("Ohhh, Coal!");
	elseif DMRockRoll1 > 380 and DMRockRoll1 < 461 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreCoalMine2", 0, 0, 0);
		getPlayer():Say("Ohhh, Coal!");
	elseif DMRockRoll1 > 460 and DMRockRoll1 < 541 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreCoalMine3", 0, 0, 0);
		getPlayer():Say("Ohhh, Coal!");
	elseif DMRockRoll1 > 540 and DMRockRoll1 < 641 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreIronMine1", 0, 0, 0);
		getPlayer():Say("NICE.Iron ore!");
	elseif DMRockRoll1 > 640 and DMRockRoll1 < 741 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreIronMine2", 0, 0, 0);
		getPlayer():Say("NICE.Iron ore!");
	elseif DMRockRoll1 > 740 and DMRockRoll1 < 841 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreIronMine3", 0, 0, 0);
		getPlayer():Say("NICE.Iron ore!");
	elseif DMRockRoll1 > 840 and DMRockRoll1 < 1241 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreRockMine1", 0, 0, 0);
		getPlayer():Say("Seems like just punch of rocks.");
	elseif DMRockRoll1 > 1240 and DMRockRoll1 < 1441 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreRockMine2", 0, 0, 0);
		getPlayer():Say("Seems like just punch of rocks.");
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreRockMine3", 0, 0, 0);
		getPlayer():Say("Seems like just punch of rocks.");
	end
end

function SDMOreRock_OnCreate(items, result, food, player)
	local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 8 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end

function SDMOreIron_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10); 
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 8 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.UnusableMetal", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end

function SDMOreSalt_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 8 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.RockSalt", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end

function SDMOreAluminum_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 8 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Aluminum", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end

function SDMOreCoal_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 5 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.CoalOre", 0, 0, 0);
	end
end


function SDMOreSilver_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.SilverNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.SilverNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.SilverNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 5 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.SilverNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end

function SDMOreGold_OnCreate(items, result, food, player)
    local weaponDMG = ZombRand(7);
	for i=0,items:size() - 1 do
        if weaponDMG == 5 and instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
	for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
			end
			if ZombRand(100) == 0 then
			player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
			end
		addSound(player, player:getX(), player:getY(), player:getZ(), 20, 20);
		player:playSound("miningSound2");
		player:getStats():setFatigue(player:getStats():getFatigue() + 0.1)
		player:getStats():setThirst(player:getStats():getThirst() + 0.2)
		player:getStats():setHunger(player:getStats():getHunger() + 0.1)
		player:getStats():setEndurance(player:getStats():getEndurance() - 0.3)
	end
    local DMRockRoll = ZombRand(1,10);
    if DMRockRoll == 2 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.GoldNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 6 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 4 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	elseif DMRockRoll == 5 then
        getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonMetalworkStuff.GoldNugget", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	else
        getPlayer():getCurrentSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
	end
end
