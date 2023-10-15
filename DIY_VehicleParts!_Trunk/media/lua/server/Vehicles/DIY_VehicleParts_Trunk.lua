function Vehicles.ContainerAccess.TruckBedNew(vehicle, part, chr)
	if not part:getInventoryItem() then return false end
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local trunkDoor = vehicle:getPartById("TrunkDoor") or vehicle:getPartById("DoorRear")
	if trunkDoor and trunkDoor:getDoor() then
	
		if not trunkDoor:getInventoryItem() then return true end
		if not trunkDoor:getDoor():isOpen() then return false end
	end
--	if part:getInventoryItem() and not chr:getInventory():haveThisKeyId(vehicle:getKeyId()) then return false end
	return true
end

function Vehicles.ContainerAccess.TruckBedOpenNew(vehicle, part, chr)
	if not part:getInventoryItem() then return false end
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end