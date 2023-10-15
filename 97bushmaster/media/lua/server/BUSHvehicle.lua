--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

KI5.Create = {};

BUSH = {
	parts = {
		SpareTire = {
			BUSHSpareRight = {
				Bushspare1 = "BushmasterTire",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		SpareTireRoof = {
			BUSHSpareRoof = {
				Bushspare2 = "BushmasterTire",
			},
			default = "trve_random",
			noPartChance = 85,
		},
		RightStorage = {
			BUSHStorageRight = {
				Bushstorageright0 = "97BushRightStorage0",
				Bushstorageright1 = "BushmasterTire",
				Bushstorageright1b = "BushmasterTire",
			},
			default = "first",
		},
		LeftStorage = {
			BUSHStorageLeft = {
				Bushstorageleft0 = "97BushLeftStorage0",
				BushstorageleftG = "Generator",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		RoofStorage = {
			BUSHRoofCrates = {
				Bushroof0 = "97BushRoofStorage0",
			},
			default = "trve_random",
			noPartChance = 85,
		},
		Bullbar = {
			BUSHBullbar = {
				Bullbar0 = "97BushBullbarSAS",
			},
			default = "trve_random",
			noPartChance = 50,
		},
	},
};

KI5:createVehicleConfig(BUSH);

KI5:addForcedSpawn("Base.97bushmaster", 12598, 939, {
    direction = IsoDirections.S, 
    chance = 75,
    skinIndex = 0,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushAmbulance", 12598, 930, {
    direction = IsoDirections.S, 
    chance = 75,
    skinIndex = 0,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushmaster", 5522, 12487, {
    direction = IsoDirections.N, 
    chance = 65,
    skinIndex = 4,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushmaster", 3004, 5790, {
    direction = IsoDirections.E, 
    chance = 65,
    skinIndex = 3,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushAmbulance", 3006, 5795, {
    direction = IsoDirections.E, 
    chance = 65,
    skinIndex = 3,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushmaster", 10009, 6300, {
    direction = IsoDirections.E, 
    chance = 50,
    sandboxVar = "AllowBushmasterSpawns",
});

KI5:addForcedSpawn("Base.97bushmaster", 11187, 13036, {
    direction = IsoDirections.N, 
    chance = 75,
    skinIndex = 1,
    sandboxVar = "AllowBushmasterSpawns",
});

function BUSH.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat <= 10;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function BUSH.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function BUSH.ContainerAccess.FL(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local StorageLid1 = vehicle:getPartById("StorageLid1")
	if StorageLid1 and StorageLid1:getDoor() then
		if not StorageLid1:getInventoryItem() then return true end
		if not StorageLid1:getDoor():isOpen() then return false end
	end
	--
	return true
end

function BUSH.ContainerAccess.FR(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local StorageLid2 = vehicle:getPartById("StorageLid2")
	if StorageLid2 and StorageLid2:getDoor() then
		if not StorageLid2:getInventoryItem() then return true end
		if not StorageLid2:getDoor():isOpen() then return false end
	end
	--
	return true
end

function BUSH.ContainerAccess.SR(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end

	local Storage = vehicle:getPartById("BUSHStorageRight")
	if Storage:getInventoryItem() == "Base.BushmasterTire" then return false end

	local StorageLid3 = vehicle:getPartById("StorageLid3")
	if StorageLid3 and StorageLid3:getDoor() then
		if not StorageLid3:getInventoryItem() and not Storage:getInventoryItem() == "Base.BushmasterTire" then return true end
		if not StorageLid3:getDoor():isOpen() then return false end
	end
	--
	return true
end

function BUSH.ContainerAccess.SL(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end

	local Storage = vehicle:getPartById("BUSHStorageLeft")
	if Storage:getInventoryItem() == "Base.Generator" then return false end
	--
	return true
end

function BUSH.ContainerAccess.Seat(vehicle, part, chr)
	if not part:getInventoryItem() then return false; end
	local seat = part:getContainerSeatNumber()
	if seat ~= -1 and vehicle:getCharacter(seat) then return false
	end
	if chr:getVehicle() == vehicle then
		return vehicle:canSwitchSeat(vehicle:getSeat(chr), seat) and
				not vehicle:getCharacter(seat)
	elseif chr:getVehicle() then return false
	end
end