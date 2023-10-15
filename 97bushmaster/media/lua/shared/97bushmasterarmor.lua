--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.8

KI5 = KI5 or {};
BUSH = BUSH or {};

function BUSH.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "97bushmaster" )) or
		(vehicle and string.find( vehicle:getScriptName(), "97bushAmbulance" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor", "BUSHBullbar", "HeadlightLeft", "HeadlightRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function BUSH.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "97bushmaster" )) then
					for i, partId in ipairs ({
						"BUSHSpareRight", "BUSHSpareRoof", "BUSHRoofCrates", "GasTank",
						})
					do
						KI5:nukePartCondById(vehicle, partId);
				end
			end

            vanillaExit(self);
        end
end

function KI5:savePartCond(part)
	if part then
		local vehicle = part:getVehicle()
		if vehicle then
			KI5:sendArmorCommandWrapper(getPlayer(), part, "setPartModData", {
				data = {
					saveCond = part:getCondition()
				}
			});
		end
	end
end

function KI5:nukePartCond(part)
	if part then
		local vehicle = part:getVehicle()
		if vehicle then
			KI5:sendArmorCommandWrapper(getPlayer(), part, "setPartModData", {
				data = {
					saveCond = false
				}
			});
		end
	end
end

function KI5:savePartCondById(vehicle, partId)
	if vehicle and partId then
		KI5:savePartCond(vehicle:getPartById(partId))
	end
end

function KI5:nukePartCondById(vehicle, partId)
	if vehicle and partId then
		KI5:nukePartCond(vehicle:getPartById(partId))
	end
end

function KI5:sendVehicleCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "vehicle", methodName, args)
end

function KI5:sendArmorCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "KI5_armor", methodName, args)
end

function BUSH.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "97bushmaster" )) or
		(vehicle and string.find( vehicle:getScriptName(), "97bushAmbulance" )) then

    	--

			for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local tireCond = 25;
					    	if part:getCondition() < tireCond then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = tireCond})
							elseif part:getContainerContentAmount() < 10 then
								KI5:sendVehicleCommandWrapper(player, part, "setContainerContentAmount", {amount = 35})
							end
					end
			end

		--

			for i, viewportPart in ipairs ({"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowMiddleLeft", "WindowMiddleRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear"})
				do
					if vehicle:getPartById(viewportPart) then
						local part = vehicle:getPartById(viewportPart)
						local viewportPart = 49;
					    	if part:getCondition() < viewportPart then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = viewportPart})
							end
					end
			end

		--

			for i, doorPart in ipairs ({"BUSHFenderLeft", "BUSHFenderRight", "BUSHStorageRight", "TrunkDoor", "TrunkHatch", "StorageLid1", "StorageLid2", "StorageLid3"})
				do
					if vehicle:getPartById(doorPart) then
						local part = vehicle:getPartById(doorPart)
						local doorPart = 9;
					    	if part:getCondition() < doorPart then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = doorPart})
							end
					end
			end

		-- 

			local part = vehicle:getPartById("EngineDoor")
				if part:getCondition() < 45 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 45})
				end

		--

			local protection = vehicle:getPartById("BUSHBullbar")
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and protection:getInventoryItem() and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond)
					if protection:getCondition() > 0 and partCond
					then
						if part:getCondition() < partCond
						then
							KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
								condition = partCond
							})
							local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 35 and ZombRandBetween(0,3) or 0);
							KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
								condition = cond
							})
						end
					end
				else
					local protection = vehicle:getPartById("BUSHBullbar")
					local part = vehicle:getPartById("Engine")
						if protection and protection:getInventoryItem() and part and part:getModData()
						then
							local partCond = tonumber(part:getModData().saveCond)
							if protection:getCondition() > 0 and partCond
							then
								if part:getCondition() < partCond
								then
									KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
										condition = partCond
									})
									local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 75 and ZombRandBetween(0,3) or 0);
									KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
										condition = cond
									})
								end
							end
						end
				end

		--

		for i, freezeState in ipairs ({"BUSHSpareRight", "BUSHSpareRoof", "BUSHRoofCrates", "GasTank"})
				do
					if vehicle:getPartById(freezeState) then
						local part = vehicle:getPartById(freezeState)
						local freezeCond = tonumber(part:getModData().saveCond)
					    	if freezeCond and part:getCondition() < freezeCond then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = freezeCond})
							end
					end
			end

		--

			for partId, armorPartId in pairs({
				["HeadlightLeft"] = "BUSHBullbar",
				["HeadlightRight"] = "BUSHBullbar",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
					end
				end
			end

		--

			for i, nodisplay in ipairs ({"TruckBed", "DoorFake", "BUSHStorageLeft"})
				do
					if vehicle:getPartById(nodisplay) then
						local part = vehicle:getPartById(nodisplay)
						local nodisplay = 100;
					    	if part:getCondition() < nodisplay then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = nodisplay})
							end
					end
			end

		--
	end
end

Events.OnGameStart.Add(BUSH.flushCond);
Events.OnEnterVehicle.Add(BUSH.extractCond);
Events.OnPlayerUpdate.Add(BUSH.activeArmor);