--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.8.0

KI5 = KI5 or {};
BUSH = BUSH or {};

function BUSH.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "97bushmaster" )) then

				self.character:SetVariable("KI5vehicle", "Sure")
			end
		
				vanillaEnter(self);
				
				local seat = self.seat
		    		if not seat then return end
						if seat == 0 then		
							self.character:SetVariable("BobPosition", "zero")
						elseif seat == 1 then
							self.character:SetVariable("BobPosition", "one")
						elseif seat == 10 then
							self.character:SetVariable("BobPosition", "four")
						elseif seat == 3 or seat == 5 or seat == 7 or seat == 9 then	
							self.character:SetVariable("BobPosition", "two")
						else
							self.character:SetVariable("BobPosition", "three")
					end

			if 	vehicle and (
				string.find( vehicle:getScriptName(), "97bushAmbulance" )) then

				self.character:SetVariable("KI5vehicle", "Sure")
			end
		
				vanillaEnter(self);
				
				local seat = self.seat
		    		if not seat then return end
						if seat == 0 then		
							self.character:SetVariable("BobPosition", "zero")
						elseif seat == 1 then
							self.character:SetVariable("BobPosition", "one")
						elseif seat == 7 then
							self.character:SetVariable("BobPosition", "four")
						elseif seat == 6 then	
							self.character:SetVariable("BobPosition", "two")
						else
							self.character:SetVariable("BobPosition", "three")
					end
	end
end

function BUSH.pvFixSwitch(player)
	local player = getPlayer()
	local vehicle = player:getVehicle()
		if 	vehicle and (
				string.find( vehicle:getScriptName(), "97bushmaster" )) then

			player:SetVariable("KI5vehicle", "Sure")

			local seat = vehicle:getSeat(player)
	    		if not seat then return end
					if seat == 0 then		
						player:SetVariable("BobPosition", "zero")
					elseif seat == 1 then
						player:SetVariable("BobPosition", "one")
					elseif seat == 10 then
						player:SetVariable("BobPosition", "four")
					elseif seat == 3 or seat == 5 or seat == 7 or seat == 9 then		
						player:SetVariable("BobPosition", "two")
					else
						player:SetVariable("BobPosition", "three")
				end

		elseif vehicle and (
				string.find( vehicle:getScriptName(), "97bushAmbulance" )) then

			player:SetVariable("KI5vehicle", "Sure")

			local seat = vehicle:getSeat(player)
	    		if not seat then return end
					if seat == 0 then		
						player:SetVariable("BobPosition", "zero")
					elseif seat == 1 then		
						player:SetVariable("BobPosition", "one")
					elseif seat == 7 then		
						player:SetVariable("BobPosition", "four")
					elseif seat == 6 then		
						player:SetVariable("BobPosition", "two")
					else
						player:SetVariable("BobPosition", "three")
				end
	end
end

function BUSH.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")

end

Events.OnGameStart.Add(BUSH.pvFixCheck);
Events.OnGameStart.Add(BUSH.pvFixSwitch);
Events.OnExitVehicle.Add(BUSH.pvFixClear);
Events.OnSwitchVehicleSeat.Add(BUSH.pvFixSwitch);