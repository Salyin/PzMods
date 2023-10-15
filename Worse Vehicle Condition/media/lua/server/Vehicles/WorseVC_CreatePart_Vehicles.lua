--***********************************************************
--**                    THE INDIE STONE                    **
require "Vehicle/Vehicles"


local old_VehicleUtils_createPartInventoryItem =  VehicleUtils.createPartInventoryItem

function VehicleUtils.createPartInventoryItem(part)
	if not part:getItemType() or part:getItemType():isEmpty() then return nil end
	--print("Part Type: " ..tostring( part:getItemType()))
	--print("Part Type2: " ..tostring(  part:getItemType():get(0)))
	local iType = nil 
	if part:getItemType() and part:getItemType():get(0) then
		iType = part:getItemType():get(0)
	end
	if iType and iType:contains("Muffler")  and ZombRand(0,2) == 0 then
		--print("PART MUFFLER")
		return false
	end
	if iType and iType:contains("Wind")  and ZombRand(0,2) == 0 then
		--print("PART WIND")
		return false
	end
	-- if iType and iType:contains("Radio")  and ZombRand(0,2) == 0 then
		-- --print("PART RADIO")
		-- return false
	-- end
	if iType and iType:contains("Tire")    and ZombRand(0,4) == 0 then
		--print("PART TIRE")
		return false
	end
	return  old_VehicleUtils_createPartInventoryItem(part)
end
