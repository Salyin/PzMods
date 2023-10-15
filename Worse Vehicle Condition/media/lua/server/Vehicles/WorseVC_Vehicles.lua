--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicle/Vehicles"

local old_Vehicles_Create_Battery = Vehicles.Create.Battery

function Vehicles.Create.Battery(vehicle, part)

	if ZombRand(0,2) == 0 then
		--print("Worse Battery!")
		return false
	end
	old_Vehicles_Create_Battery(vehicle, part)

end


local old_Vehicles_Create_GasTank = Vehicles.Create.GasTank

function Vehicles.Create.GasTank(vehicle, part)
	
	old_Vehicles_Create_GasTank(vehicle, part)
	if ZombRand(0,4) == 0 then
		part:setCondition(0)
		vehicle:transmitPartCondition(part)
		--print("Worse Gas Tank!")
	end
	
end


local old_Vehicles_Create_Engine = Vehicles.Create.Engine

function Vehicles.Create.Engine(vehicle, part)
	old_Vehicles_Create_Engine(vehicle, part)
	if ZombRand(0,4) == 0 then
		--print("Worse Engine!")
		part:setCondition(0)
		vehicle:transmitPartCondition(part)
	end	
end


local old_Vehicles_Create_Headlight = Vehicles.Create.Headlight

function Vehicles.Create.Headlight(vehicle, part)

	-- if ZombRand(0,2) == 0 then return false end
	old_Vehicles_Create_Headlight(vehicle, part)
	if ZombRand(0,2) == 0 then
		part:setCondition(0)
		vehicle:transmitPartCondition(part)
	end
end




local old_Vehicles_Create_Brake =  Vehicles.Create.Brake

function Vehicles.Create.Brake(vehicle, part)

	old_Vehicles_Create_Brake(vehicle, part)	
	if ZombRand(0,4) == 0 then
		--print("Worse Brakes")
		part:setCondition(0)
		vehicle:transmitPartCondition(part)
	end
end





