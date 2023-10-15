function DropOreDeposit1(player, character)
		local inv = player:getInventory();
		local ore = inv:getFirstTypeRecurse("SDMOreOne");
		if ore then
			local playerItem = {}
			local BagItem    = {}
			local items2 = getPlayer():getInventory():getItems();

        for i=1, items2:size() do
            if items2:get(i-1).getItemContainer ~= nil then
                innercontainer = items2:get(i-1):getItemContainer():getItems()
                if items2:get(i-1):getItemContainer():getFirstTypeRecurse("SDMOreOne") then
                    items2:get(i-1):getItemContainer():Remove("SDMOreOne")
                end
                for q=0, innercontainer:size() - 1 do
                    table.insert(BagItem,innercontainer:get(q):getType())
                end
            end
            table.insert(playerItem,items2:get(i-1):getType())
        end

        local itemString = table.concat(playerItem, ",")
        local bagString = table.concat(BagItem, ",")

        print(bagString)
		getPlayer():getCurrentSquare():AddWorldInventoryItem("SpoonDM.SDMOreTwo", 0, 0, 0);
		inv:Remove('SDMOreOne');
		getPlayer():Say("Strange little rocks, hmmmm");
			
		end
end

function SDMOneMinuteHealthChecks()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
		if not getPlayer() then return end
		if getPlayer():getHoursSurvived() > 0.005 then
		DropOreDeposit1(player, character);
		end
    end
end
Events.EveryOneMinute.Add(SDMOneMinuteHealthChecks);
