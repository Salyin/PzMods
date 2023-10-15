require ("TimedActions/ISBaseTimedAction");

SearchInTreeAction = ISBaseTimedAction:derive("SearchInTreeAction");

function SearchInTreeAction:isValid()
	return true 
end

function SearchInTreeAction:update()
	local player = self.character
	local isoTree = self.isoTree
    player:faceLocation(isoTree:getX(), isoTree:getY())
	player:setMetabolicTarget(Metabolics.LightDomestic);
end

function SearchInTreeAction:start()
	local player = self.character
	local primary = player:getPrimaryHandItem();
	local isoTree = self.isoTree
    player:faceLocation(isoTree:getX(), isoTree:getY())
	isoTree:getSquare():playSound("RemovePlant");
	addSound(player, player:getX(), player:getY(), player:getZ(), 10, 5)
	if isoTree:getSize() >= 4 then
		self:setActionAnim("Loot");
		self:setOverrideHandModels(primary, nil);
		player:clearVariable("LootPosition");
		self:setAnimVariable("LootPosition", "High");
	elseif isoTree:getSize() >= 2 then
		self:setActionAnim("Loot");
		self:setOverrideHandModels(primary, nil);
		player:clearVariable("LootPosition");
		self:setAnimVariable("LootPosition", "");
	end

end

function SearchInTreeAction:stop()
    ISBaseTimedAction.stop(self);
end

function SearchInTreeAction:perform()

    ISBaseTimedAction.perform(self);

	-- Player
	local player = self.character
	local currentEndurance = player:getStats():getEndurance();

	-- Tree
	local isoTree = self.isoTree
	local spriteName = isoTree:getSprite():getName();
	--print("isoTree: " .. isoTree:getSize())

	-- Climate
	local climateManager = getClimateManager();
	local currentTemperature = climateManager:getTemperature();

	local obtainedItem = "";
	local item;

	local randomNumber = ZombRand(13 - player:getPerkLevel(Perks.PlantScavenging) - isoTree:getSize())
	if randomNumber < 0 then
		randomNumber = 0;
	end

	if randomNumber == 0 then
		-- BIG TREES
		if isoTree:getSize() >= 4 then
			-- Very cold (Winter)
			if currentTemperature < 7 then
				randomNumber = ZombRand(1, #BigWinterTreeLoot);
				obtainedItem = BigWinterTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Cold (Autumn)
			elseif currentTemperature >= 7 and currentTemperature < 15 then
				randomNumber = ZombRand(1, #BigAutumnTreeLoot);
				obtainedItem = BigAutumnTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Slightly hot (Spring)
			elseif currentTemperature >= 15 and currentTemperature < 25 then
				randomNumber = ZombRand(1, #BigSpringTreeLoot);
				obtainedItem = BigSpringTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Very hot (Summer)
			elseif currentTemperature >= 25 then
				randomNumber = ZombRand(1, #BigSummerTreeLoot);
				obtainedItem = BigSummerTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);
			end

			-- If no gloves the player may hurt its hands when looting big trees
			local gloves = player:getWornItem("Hands");
			if not gloves then
				if ZombRand(10) == 0 then
					if ZombRand(2) == 0 then
						player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
					else
						player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
					end
				end
			end

			-- Tire the player when a branch or twigs were found (The player has to pluck the branch or twig from the tree)
			if obtainedItem == "Base.TreeBranch" then
				player:getStats():setEndurance(currentEndurance - 0.07);
			elseif obtainedItem == "Base.Twigs" then
				player:getStats():setEndurance(currentEndurance - 0.03);
			end

			-- SMALL TREES
		elseif isoTree:getSize() > 2 then

			-- Very cold (Winter)
			if currentTemperature < 7 then
				randomNumber = ZombRand(1, #SmallWinterTreeLoot);
				obtainedItem = SmallWinterTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Cold (Autumn)
			elseif currentTemperature >= 7 and currentTemperature < 15 then
				randomNumber = ZombRand(1, #SmallAutumnTreeLoot);
				obtainedItem = SmallAutumnTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Slightly hot (Spring)
			elseif currentTemperature >= 15 and currentTemperature < 25 then
				randomNumber = ZombRand(1, #SmallSpringTreeLoot);
				obtainedItem = SmallSpringTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);

				-- Very hot (Summer)
			elseif currentTemperature >= 25 then
				randomNumber = ZombRand(1, #SmallSummerTreeLoot);
				obtainedItem = SmallSummerTreeLoot[randomNumber];
				--print("Item: " .. obtainedItem);
				item = player:getInventory():AddItem(obtainedItem);
			end

			-- Tire the player when a branch or twigs were found (The player has to pluck the branch or twig from the tree)
			if obtainedItem == "Base.TreeBranch" then
				player:getStats():setEndurance(currentEndurance - 0.07);
			elseif obtainedItem == "Base.Twigs" then
				player:getStats():setEndurance(currentEndurance - 0.03);
			end
		end
	end

	if player:getStats():getEndurance() < 0 then
		player:getStats():setEndurance(0);
	end

	if obtainedItem == "Base.DeadBird" or obtainedItem == "Base.DeadSquirrel" or obtainedItem == "Base.DeadMouse" or obtainedItem == "Base.DeadRat" then
		local freshLimit = item:getOffAge() - (item:getOffAge() / 4);
		item:setAge(ZombRandFloat(freshLimit, item:getOffAgeMax()));
	end

	local obtainedItem2 = "";
	local item2;

	if table.concat(FruitTreesDefinitions, ","):find(spriteName) then
		--print("Tree is a fruit tree");
		if isoTree:getModData().THLRecentlyAddedFruit == nil then
			isoTree:getModData().THLRecentlyAddedFruit = 0;
		end
		if isoTree:getSize() >= 4 and currentTemperature > 10 and
		getGametimeTimestamp() - isoTree:getModData().THLRecentlyAddedFruit > 604800 then
			--print("Tree is big and player did not obtained a Branch");
			local randNum = ZombRand(40 - currentTemperature - player:getPerkLevel(Perks.PlantScavenging) - isoTree:getSize());
			if randNum < 0 then
				randNum = 0;
			end
			--print("randNum: " .. randNum)
			if randNum == 0 then
				--print("Roll is success, adding a fruit")
				if isoTree:getModData().THLAssignedFruit == nil then
					--print("New tree, selecting a fruit to assign")
					local randomNumber = ZombRand(1, #FruitsLoot);
					obtainedItem2 = FruitsLoot[randomNumber];
					--print(obtainedItem2)
					item2 = player:getInventory():AddItem(obtainedItem2);
					isoTree:getModData().THLAssignedFruit = obtainedItem2;

					local freshLimit = item2:getOffAge() - (item2:getOffAge() / 4);
					item2:setAge(ZombRandFloat(freshLimit, item2:getOffAgeMax()));

					--print(obtainedItem2 .. " added")
					--print("isoTree:getModData().THLAssignedFruit: " .. isoTree:getModData().THLAssignedFruit)
				else
					--print("Old tree, giving " .. isoTree:getModData().THLAssignedFruit)
					item2 = player:getInventory():AddItem(isoTree:getModData().THLAssignedFruit);
					obtainedItem2 = isoTree:getModData().THLAssignedFruit;

					local freshLimit = item2:getOffAge() - (item2:getOffAge() / 4);
					item2:setAge(ZombRandFloat(freshLimit, item2:getOffAgeMax()));
				end
				if ZombRand(isoTree:getSize()) == 0 then
					isoTree:getModData().THLRecentlyAddedFruit = getGametimeTimestamp();
				end
				--print("isoTree:getModData().THLRecentlyAddedFruit: " .. isoTree:getModData().THLRecentlyAddedFruit)
			end
		end
	end

	-- If tree is a pine tree there are chances of pine cones to fall to the floor
	if table.concat(PineTreesDefinitions, ","):find(spriteName) then
		local treeSquare = isoTree:getSquare()
		for i=0, isoTree:getSize(), 1 do
			if ZombRand(20 - player:getPerkLevel(Perks.Strength)) == 0 then
				treeSquare:AddWorldInventoryItem("Base.Pinecone", treeSquare:getX() + ZombRand(0, 10)/10, treeSquare:getY() + ZombRand(0, 10)/10, treeSquare:getZ());
				--print("Spawned a Pine cone")
			end
		end
	end

	--print("obtainedItem: " .. obtainedItem)
	--print("obtainedItem2: " .. obtainedItem2)
	if obtainedItem ~= "" or obtainedItem2 ~= "" then

		if obtainedItem ~= "" and obtainedItem2 ~= "" then
			--print("Obtained both items")
			if player:getPerkLevel(Perks.PlantScavenging) == 10 then
				local textToDisplay = item:getDisplayName() .. ", " .. item2:getDisplayName();
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			else
				local newXp = ZombRand((player:getPerkLevel(Perks.PlantScavenging) + 1) * ZombRand(5, 10)) / 2
				--print("XP: " .. newXp)
				player:getXp():AddXP(Perks.PlantScavenging, newXp);
				local textToDisplay = item:getDisplayName() .. ", " .. item2:getDisplayName() .. " (" .. getText("IGUI_perks_Foraging") .. ": " .. newXp .. ")";
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			end
		elseif obtainedItem ~= "" then
			--print("Obtained only first item")
			if player:getPerkLevel(Perks.PlantScavenging) == 10 then
				local textToDisplay = item:getDisplayName();
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			else
				local newXp = ZombRand((player:getPerkLevel(Perks.PlantScavenging) + 1) * ZombRand(5, 10)) / 2
				--print("XP: " .. newXp)
				player:getXp():AddXP(Perks.PlantScavenging, newXp);
				local textToDisplay = item:getDisplayName() .. " (" .. getText("IGUI_perks_Foraging") .. ": " .. newXp .. ")";
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			end
		elseif obtainedItem2 ~= "" then
			--print("Obtained only second item")
			if player:getPerkLevel(Perks.PlantScavenging) == 10 then
				local textToDisplay = item2:getDisplayName();
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			else
				local newXp = ZombRand((player:getPerkLevel(Perks.PlantScavenging) + 1) * ZombRand(5, 10)) / 2
				--print("XP: " .. newXp)
				player:getXp():AddXP(Perks.PlantScavenging, newXp);
				local textToDisplay = item2:getDisplayName() .. " (" .. getText("IGUI_perks_Foraging") .. ": " .. newXp .. ")";
				HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
			end
		end

		if ZombRand(isoTree:getSize()) == 0 then
			isoTree:getModData().THLDepletedLoot = getGametimeTimestamp();
			--print("isoTree:getModData().THLDepletedLoot: " .. isoTree:getModData().THLDepletedLoot)
		end

	end
end

function SearchInTreeAction:new(player, isoTree, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = player;
	o.isoTree = isoTree;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end