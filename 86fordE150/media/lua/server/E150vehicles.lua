--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

E150 = {
	parts = {
		Bumper = {
			E150Bumper = {
				FrontBumper1 = "E150FrontBumper2",
				FrontBumper2 = "E150FrontBumperWithBullbar2",
				FrontBullbar3 = "E150FrontBullbar2",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		DoorLeftArmor = {
			E150LeftDoorArmor = {
				E150leftdoora = "E150DoorArmor",
			},
		},
		DoorRightArmor = {
			E150RightDoorArmor = {
				E150rightdoora = "E150DoorArmor",
			},
		},
		WindshieldArmor = {
			E150WindshieldArmor = {
				WindshieldArmor1 = "E150WindshieldArmor",
			},
		},
		WindshieldRearArmor = {
			E150WindshieldRearArmor = {
				E150windra = "E150WindshieldRearArmor",
			},
		},
		WindshieldRearLongArmor = {
			E150WindshieldRearLongArmor = {
				E150windrla = "E150WindshieldRearArmor",
			},
		},
	},
};

KI5:createVehicleConfig(E150);


function E150.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 5 or seat == 4 or seat == 3 or seat == 2 or seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor") or vehicle:getPartById("DoorRearRight")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function E150.ContainerAccess.PaydayTrunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 4 or seat == 3 or seat == 2;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor") or vehicle:getPartById("DoorRearRight")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function E150.UninstallComplete.TrunkDoor(vehicle, part, chr)
		KI5:sendClientCommand("vehicle", "setDoorOpen", {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = true
		});
end