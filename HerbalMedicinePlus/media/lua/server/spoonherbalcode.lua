require "Items/SuburbsDistributions";

function GetEmptySpoonBowl_OnCreate(items, result, player)
    player:getInventory():AddItem("Bowl");
end