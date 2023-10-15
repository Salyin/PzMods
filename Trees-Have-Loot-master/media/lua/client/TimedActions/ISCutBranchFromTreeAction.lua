require ("TimedActions/ISBaseTimedAction");

CutBranchFromTreeAction = ISBaseTimedAction:derive("CutBranchFromTreeAction");

function CutBranchFromTreeAction:isValid()
    return true
end

function CutBranchFromTreeAction:update()
    local player = self.character
    local isoTree = self.isoTree
    player:faceLocation(isoTree:getX(), isoTree:getY())
    player:setMetabolicTarget(Metabolics.LightDomestic);
end

function CutBranchFromTreeAction:start()
    local player = self.character
    local primary = player:getPrimaryHandItem();
    local isoTree = self.isoTree
    player:faceLocation(isoTree:getX(), isoTree:getY())
    if primary:getCategories():contains("Axe") then
        self:setActionAnim(CharacterActionAnims.Chop_tree);
    else
        if isoTree:getSize() >= 4 then
            self:setActionAnim("Loot");
            player:clearVariable("LootPosition");
            self:setAnimVariable("LootPosition", "High");
        elseif isoTree:getSize() >= 2 then
            self:setActionAnim("Loot");
            player:clearVariable("LootPosition");
            self:setAnimVariable("LootPosition", "");
        end
    end
    self:setOverrideHandModels(primary, nil);
end

function CutBranchFromTreeAction:stop()
    ISBaseTimedAction.stop(self);
end

function CutBranchFromTreeAction:perform()

    ISBaseTimedAction.perform(self);

    -- Player
    local player = self.character
    local currentEndurance = player:getStats():getEndurance();
    local primary = player:getPrimaryHandItem();

    -- Tree
    local isoTree = self.isoTree
    local treeSquare = isoTree:getSquare()
    local spriteName = isoTree:getSprite():getName();

    if primary:getCategories():contains("Axe") then
        treeSquare:AddWorldInventoryItem("Base.TreeBranch", treeSquare:getX() + ZombRand(0, 10)/10, treeSquare:getY() + ZombRand(0, 10)/10, treeSquare:getZ());
        if ZombRand(30 - player:getPerkLevel(Perks.Strength)) == 0 then
            if ZombRand(2) == 0 then
                treeSquare:AddWorldInventoryItem("Base.DeadSquirrel", treeSquare:getX() + ZombRand(0, 10)/10, treeSquare:getY() + ZombRand(0, 10)/10, treeSquare:getZ());
            else
                treeSquare:AddWorldInventoryItem("Base.DeadBird", treeSquare:getX() + ZombRand(0, 10)/10, treeSquare:getY() + ZombRand(0, 10)/10, treeSquare:getZ());
            end
        end
    else
        local item = player:getInventory():AddItem("Base.TreeBranch");
        local textToDisplay = item:getDisplayName();
        HaloTextHelper.addTextWithArrow(player, textToDisplay, true, HaloTextHelper.getColorGreen());
    end

    if ZombRand(isoTree:getSize()) == 0 then
        isoTree:getModData().THLBranchWasCut = getGametimeTimestamp();
    end

    if ZombRand(primary:getConditionLowerChance() * 2 + player:getMaintenanceMod() * 2) == 0 then
        primary:setCondition(primary:getCondition() - 1)
        ISWorldObjectContextMenu.checkWeapon(player);
    end

    player:getStats():setEndurance(currentEndurance - 0.01);
    if player:getStats():getEndurance() < 0 then
        player:getStats():setEndurance(0);
    end

    -- If tree is a pine tree there are chances of pine cones to fall to the floor
    if table.concat(PineTreesDefinitions, ","):find(spriteName) then
        for i=0, isoTree:getSize(), 1 do
            if ZombRand(30 - player:getPerkLevel(Perks.Strength)) == 0 then
                treeSquare:AddWorldInventoryItem("Base.Pinecone", treeSquare:getX() + ZombRand(0, 10)/10, treeSquare:getY() + ZombRand(0, 10)/10, treeSquare:getZ());
                --print("Spawned a Pine cone")
            end
        end
    end
end

function CutBranchFromTreeAction:new(player, isoTree, time)
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