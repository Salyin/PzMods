SearchInTreeMenu = {};

function SearchInTreeMenu.doMenu(playerNum, ISContextMenu, worldObjects)
    for i,v in ipairs(worldObjects) do
        if instanceof(v, "IsoTree") then
            local isoTree = worldObjects[i];
            local spriteName = isoTree:getSprite():getName();
            --print("spriteName: " .. spriteName)
            --print("Tree size: " .. isoTree:getSize())
            local player = getSpecificPlayer(playerNum)
            local primary = player:getPrimaryHandItem();
            local listOfKnives = tostring(getScriptManager():getItemsTag("SharpKnife"));
            local listOfAxes = tostring(getScriptManager():getItemsTag("ChopTree"));

            -- First time looting tree
            if isoTree:getSize() >= 2 and isoTree:getModData().THLDepletedLoot == nil then
                local searchTreeOption = ISContextMenu:addOption(getText("ContextMenu_SearchInTree"), isoTree, SearchInTreeMenu.SearchInTree, playerNum);
            else
                if isoTree:getSize() >= 2 and getGametimeTimestamp() - isoTree:getModData().THLDepletedLoot > 86400 then
                    local searchTreeOption = ISContextMenu:addOption(getText("ContextMenu_SearchInTree"), isoTree, SearchInTreeMenu.SearchInTree, playerNum);
                end
            end

            if primary and (string.find(listOfKnives, primary:getType()) or string.find(listOfAxes, primary:getType())) then
                -- First time cutting branches
                if isoTree:getSize() >= 2 and isoTree:getModData().THLBranchWasCut == nil then
                    local cutBranchFromTreeOption = ISContextMenu:addOption(getText("ContextMenu_CutBranchFromTree"), isoTree, SearchInTreeMenu.CutBranchFromTree, playerNum);
                else
                    if isoTree:getSize() >= 2 and getGametimeTimestamp() - isoTree:getModData().THLBranchWasCut > 2592000 then
                        local cutBranchFromTreeOption = ISContextMenu:addOption(getText("ContextMenu_CutBranchFromTree"), isoTree, SearchInTreeMenu.CutBranchFromTree, playerNum);
                    end
                end
            end
        end
        break;
    end
end

function SearchInTreeMenu.SearchInTree(isoTree, playerNum)
    local player = getSpecificPlayer(playerNum)
    if luautils.walkAdj(player, isoTree:getSquare()) then
        ISTimedActionQueue.add(SearchInTreeAction:new(player, isoTree, 150));
    end
end

function SearchInTreeMenu.CutBranchFromTree(isoTree, playerNum)
    local player = getSpecificPlayer(playerNum)
    if luautils.walkAdj(player, isoTree:getSquare()) then
        ISTimedActionQueue.add(CutBranchFromTreeAction:new(player, isoTree, 50));
    end
end

Events.OnPreFillWorldObjectContextMenu.Add(SearchInTreeMenu.doMenu)