Basement_addOptions = {}
Basement_addOptions.GlobalVar = {}
--local Basement_addOptions = ISBaseObject:derive("Basement_addOptions");
--local Basement_addOptions = ISBaseObject:derive("Basement_addOptions");
local Basement = require("BasementMod/Basement");
local Basement_addOptions_TimedActions = require("BasementMod/Basement_addOptions_TimedActions");
local Utils = require("BasementMod/Utils");
---------------------------------------------------------------------------------------------------------------------------------------------------------------

Basement_addOptions.optionAdminMenu = {
    assigned   = "assigned", 
    unassigned = "unassigned", 
    pending    = "pending"
};
Basement_addOptions.typeOptionAdminMenu = {
    reassign = "reassign", 
    unassign = "unassign", 
    resume   = "resume",
    remove 	 = "remove"
};
Basement_addOptions.typeSprite = {
	sewer 	 = {
	    small  = { E = "f_AuD_basement_1_0", N = "f_AuD_basement_1_0" },
	    medium = { E = "f_AuD_basement_1_2", N = "f_AuD_basement_1_2" },
	    large  = { E = "f_AuD_basement_1_4", N = "f_AuD_basement_1_4" }
	},
	travel   = {
	    small  = { E = "f_AuD_basement_1_0",  N = "f_AuD_basement_1_0" },
	    medium = { E = "f_AuD_basement_1_2",  N = "f_AuD_basement_1_2" },
	    large  = { E = "f_AuD_basement_1_4" , N = "f_AuD_basement_1_4" }
	},
	basement = {
	    small  = { E = "f_AuD_basement_1_33",  N = "f_AuD_basement_1_33" },
	    medium = { E = "f_AuD_basement_1_34",  N = "f_AuD_basement_1_34" },
	    large  = { E = "f_AuD_basement_1_32" , N = "f_AuD_basement_1_32"}
	},
	playerBasement 	 = {
	    small  = { E = "f_AuD_basement_1_3", N = "f_AuD_basement_1_3" },
	    medium = { E = "f_AuD_basement_1_5", N = "f_AuD_basement_1_5" },
	    large  = { E = "f_AuD_basement_1_1", N = "f_AuD_basement_1_1" }
	},
	exit 	 = {
	    small  = { E = "f_AuD_basement_1_7", N = "f_AuD_basement_1_6" },
	    medium = { E = "f_AuD_basement_1_7", N = "f_AuD_basement_1_6" },
	    large  = { E = "f_AuD_basement_1_7", N = "f_AuD_basement_1_6" }
	}

};
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Basement_addOptions.ExitBasement(playerObj,id)
    local modData = playerObj:getModData();
    if modData.BasementMod and modData.BasementMod.lastHatchPosition then
        playerObj:setX(modData.BasementMod.lastHatchPosition.x + 0.5);
        playerObj:setY(modData.BasementMod.lastHatchPosition.y + 0.5);
        playerObj:setZ(modData.BasementMod.lastHatchPosition.z);
        playerObj:setLx(modData.BasementMod.lastHatchPosition.x + 0.5);
        playerObj:setLy(modData.BasementMod.lastHatchPosition.y + 0.5);
        playerObj:setLz(modData.BasementMod.lastHatchPosition.z);
        modData.BasementMod.lastHatchPosition = nil; --- Clear last hatch position
        print("Player exited basement id = " .. tostring(id) .. " from player moddata!");
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Basement_addOptions.enterBasement(playerObj,basementData,buildingId)
     local x, y, z = playerObj:getX(), playerObj:getY(), playerObj:getZ()
     local var = {}
     if basementData.buildingId ~= -2 and not isAdmin() then
     	playerObj:Say(getText("IGUI_addOption_Say_impossibleEnter")); 
     	print("The hatch is not assigned !") 
     	return 
     elseif buildingId == -1 then
     	    local pos = basementData.exitHatchPosition
     	    if not pos then playerObj:Say(getText("IGUI_addOption_Say_impossibleEnterCoordinateProblem")) ; print("The hatch is not affiliated !") return end
     	    var.toX = pos.x
     	    var.toY = pos.y
     	    var.toZ = pos.z
     	
     elseif buildingId == -2 then
     	    local pos = basementData.hatchPosition
     	    if not pos then playerObj:Say(getText("IGUI_addOption_Say_impossibleEnterCoordinateProblem")) ; print("The hatch is not affiliated !") return end
     	    var.toX = pos.x
     	    var.toY = pos.y
     	    var.toZ = pos.z
     else
     	playerObj:Say(getText("IGUI_addOption_thereIsProblem"));
     	print("The hatch is not affiliated !")
     end
     --local originSquare = playerObj:getSquare()
     local dist = getPlayer():DistTo(var.toX,var.toY)
     local modData = playerObj:getModData();
     modData.BasementMod = modData.BasementMod or {};
     modData.BasementMod.lastHatchPosition = { x = playerObj:getX(), y = playerObj:getY(), z = playerObj:getZ() }; --- Store last hatch position
    
     playerObj:setX(var.toX+ 0.5)
     playerObj:setY(var.toY+ 0.5)
     playerObj:setZ(var.toZ)
     playerObj:setLx(var.toX+ 0.5)
     playerObj:setLy(var.toY+ 0.5)
     playerObj:setLz(var.toZ)
     --- consuption energie

      --- Fall through Patch
     local ticks = 0;
     local function temporaryForceZPosition()
     	 ticks = ticks + 1
     	 if ticks < 300 then
     	   	playerObj:setZ(var.toZ);
     	   	playerObj:setbFalling(false);
     	   	playerObj:setFallTime(0);
     	   	playerObj:setLastFallSpeed(0);
     	 else
     	   	local square = getSquare(var.toX, var.toY, var.toZ);
     	   	if not square or not square:TreatAsSolidFloor() then
     	   	    Basement_addOptions.ExitBasement(playerObj,basementData.basementId);
     	   	    playerObj:Say(getText("IGUI_Basements_map_not_loading"))
     	   	end
     	   	Events.OnTick.Remove(temporaryForceZPosition);
    	   	print("Basements: temporaryForceZPosition completed!");
    	  end
     end
     if var.toZ > 1 then
         print("Basements: temporaryForceZPosition started...");
         Events.OnTick.Add(temporaryForceZPosition);
     else
     	   --- Void map patch
     	   Utils.delayedFunction(function()
     	       local square = getSquare(var.toX, var.toY, var.toZ);
     	       if not square or not square:TreatAsSolidFloor() then
     	           Basement_addOptions.ExitBasement(playerObj,basementData.basementId);
     	           playerObj:Say(getText("IGUI_Basements_map_not_loading"));
     	       end
     	   end, 150);
     end
    if basementData.type and basementData.type == "travel" then
	    Utils.delayedFunction(function()
	    	local lastPosition = modData.BasementMod.lastHatchPosition
	     	if lastPosition and getPlayer():DistTo(lastPosition.x,lastPosition.y) > 50 then 
	     		local txt =	" m"
	     		local distTxt = dist
	     		if dist > 1000 then txt = " klm" ; distTxt = distTxt/1000 end    
	         	local txt = getText("IGUI_addOption_Say_iHaveTraveledDistance") .. math.floor(distTxt) .. txt
	         	playerObj:Say(txt)
	         	if not isAdmin() then 
	         		local sandbox = SandboxVars.BasementAddOptions.statsConsumptionToTraveling
	         		local worldAge =  math.ceil(getGameTime():getWorldAgeHours())
	         		local stats   	= playerObj:getStats()
	         		local hunger 	= stats:getHunger()
	         		local thirst  	= stats:getThirst()
	         		local fatigue 	= stats:getFatigue()
	         		local endurance = stats:getEndurance()
	         		stats:setHunger (hunger+((dist/60000)*sandbox))
	         		stats:setThirst (thirst+((dist/72000)*sandbox))
	         		stats:setFatigue(fatigue+((dist/120)*sandbox))
	         		stats:setEndurance(endurance-((dist/42000)*sandbox))

	         		modData.BasementMod.LastTraveledFromTravelHatch = worldAge
	         	end
	        end
	    end, 300);
	end
     

    print("Player entered basement id = " .. tostring(basementData.basementId) .. "!");
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Basement_addOptions.EnterBasementId(playerObj, basementId, buildingId)
     local basementData = Basement.Data.Basements[basementId]
     if basementData then
          Basement_addOptions.enterBasement(playerObj,basementData,buildingId);
     end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Basement_addOptions.SpecialHatchToBuildWaiting()
	if Basement_addOptions.GlobalVar.CreateSpecialHatchData ~= nil then 
		if getPlayer() then getPlayer():Say(getText("IGUI_addOption_Say_buildOfHatchIsPending")) end
	else
		--if getPlayer() then getPlayer():Say(getText("IGUI_addOption_Say_buildOfHatchIsCancelled")) end
		Events.EveryTenMinutes.Remove(Basement_addOptions.SpecialHatchToBuildWaiting)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Basement_addOptions.CreateSpecialHatch(x,y,z,type,size,facing,buildingId)
    if isServer() then return; end
	local player = getPlayer()
	local square = getSquare(x, y, z);
	if not square then return; end
	 
	local var = {}
	local buildSpecialHatch = Basement_addOptions.GlobalVar and Basement_addOptions.GlobalVar.CreateSpecialHatchData

	--- create entrance hatch
	if buildSpecialHatch and buildingId == -1 then
		local HatchData = Basement_addOptions.GlobalVar.CreateSpecialHatchData
		local ID = HatchData.basementId
		local basementData = Basement.Data.Basements[ID];
		local StatusBuildingId = basementData.buildingId
		var.basementData = {
		    basementId = ID,
		    buildingId = StatusBuildingId,
		    hatchPosition = {
			    x = x, 
			    y = y, 
			    z = z
			},
			exitHatchPosition = {
			    x = HatchData.exitHatchPosition.x, 
			    y = HatchData.exitHatchPosition.y, 
			    z = HatchData.exitHatchPosition.z
			},
			size = size,
			type = type
		};
		var.hatchData = {
		    basementId = ID,
		    buildingId = buildingId,
		    hatchPosition = {
		        x = x, 
		        y = y, 
		        z = z
		    },
		    size = size,
		    type = type
		};
		Basement_addOptions.DisableErosion(square)
		Basement_addOptions.AddHatchOnFloor(player,square,var.hatchData,facing)
		Basement_addOptions.GlobalVar.CreateSpecialHatchData = nil  
		Events.EveryTenMinutes.Remove(Basement_addOptions.SpecialHatchToBuildWaiting)

	elseif buildingId == -1 then 												
		local ID = ZombRand(50000)+ZombRand(50000)+10000
		local basementData = Basement.Data.Basements[ID];
		if basementData ~= nil and (basementData.buildingId == -1 or basementData.buildingId == -2 or basementData.buildingId == -3) then 
			Basement_addOptions.CreateSpecialHatch(x,y,type,size,facing,buildingId) 
			print("The hatch id : "..basement.id.. " exist in data, retry ...") 
			return 
		end
		var.basementData = {
		    basementId = ID,
		    buildingId = buildingId,
		    hatchPosition = {
		        x = x, 
		        y = y, 
		        z = z
		    },
		    size = size,
		    type = type
		};
		Basement_addOptions.DisableErosion(square)
		Basement_addOptions.AddHatchOnFloor(player,square,var.basementData,facing)
		Basement_addOptions.GlobalVar.CreateSpecialHatchData = var.basementData
		Events.EveryTenMinutes.Add(Basement_addOptions.SpecialHatchToBuildWaiting);

	--- Create arrival hatch
	elseif buildingId == -2 and buildSpecialHatch then--or  then 
		--buildingId = -2					
		local HatchData = Basement_addOptions.GlobalVar.CreateSpecialHatchData
		local ID = HatchData.basementId
		local hatchPosition = HatchData.hatchPosition
		var.basementData = {
			basementId = ID,
			buildingId = buildingId,
			hatchPosition = {
			    x = HatchData.hatchPosition.x, 
			    y = HatchData.hatchPosition.y, 
			    z = HatchData.hatchPosition.z
			},
			exitHatchPosition = {
			    x = x, 
			    y = y, 
			    z = z
			},
			size = size,
			type = type
		};
		Basement_addOptions.DisableErosion(square)
		Basement_addOptions.AddHatchOnFloor(player,square,var.basementData,facing)
		Basement_addOptions.GlobalVar.CreateSpecialHatchData = nil  
		Events.EveryTenMinutes.Remove(Basement_addOptions.SpecialHatchToBuildWaiting) 	
	else
		Basement_addOptions.GlobalVar.CreateSpecialHatchData = nil	
		Events.EveryTenMinutes.Remove(Basement_addOptions.SpecialHatchToBuildWaiting) 
		print("Create special hatch is bugged ...")
		return
	end 
	sendClientCommand("BasementMod", "CreateHatch", var.basementData); 	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.DisableErosion = function(square)
	--- Remove removable object on square
	for i = 0, square:getObjects():size() - 1 do
	   	local object = square:getObjects():get(i);
	   	if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
	       square:transmitRemoveItemFromSquare(object)
	       square:RemoveTileObject(object);
	       break
	   	end
	end
	--- Disable erosion
	square:disableErosion();
	if isClient() then
	    local args = { x = x, y = y, z = 0 };
	    sendClientCommand('erosion', 'disableForSquare', args);
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.AddHatchOnFloor = function(player,square,basementData,facing)
	--- Create IsoObject Hatch
	local type = basementData.type
	local size = basementData.size
	local buildingId = basementData.buildingId

	local objToBuild = Basement_addOptions.getObjetcToBuild(type,size,buildingId)
	local hatch = IsoObject.new(getCell(), square, objToBuild[facing]);
	hatch:getModData().BasementMod = basementData;
	square:AddSpecialObject(hatch);
	if isClient() then
	   	hatch:transmitCompleteItemToServer();
	end
	getCell():setDrag(nil, player:getPlayerNum())
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Basement_addOptions.CanCreateHatchOnSquare = function(square)
 	if RVInterior then
        local sandbox = SandboxVars.BasementAddOptions.buildHatchfromRVinteriorIsForbidden
        if sandbox == true and RVInterior.playerInsideInterior(square) then --ISBuildMenu.cheat == false and 
            return false;
        end
    end
    if instanceof(square, "IsoGridSquare") then
		local z = square:getZ()
		for x=square:getX()-2,square:getX()+2 do
			for y=square:getY()-2,square:getY()+2 do    		
				local sq = getWorld():getCell():getGridSquare(x,y,z)
				if Basement.GetHatchOnSquare(sq) then
					return false
				end
			end	
	    end     	
        local x, y = square:getX(), square:getY()
        
        return not Basement.FindByPosition(x, y, z)
    end
    return false;
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.IsObjectHatch = function(obj)
    local spriteName = obj:getSprite():getName() or obj:getSpriteName();
    for _, type in pairs(Basement_addOptions.typeSprite) do
    	for __, size in pairs(Basement.Sizes) do
    	    if spriteName == Basement_addOptions.typeSprite[_][size].E or spriteName == Basement_addOptions.typeSprite[_][size].N then
    	        return true;
    	    end
    	    if spriteName == Basement_addOptions.typeSprite[_][size].E or spriteName == Basement_addOptions.typeSprite[_][size].N then
    	        return true;
    	    end
    	end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.GetHatchOnSquare = function(square)
    if instanceof(square, "IsoGridSquare") then
        local objs = square:getObjects();
        for i = 0, objs:size() - 1 do
            local obj = objs:get(i);
            if Basement_addOptions.IsObjectHatch(obj) or Basement.IsObjectHatch(obj) then
                return obj;
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.getHatchSizeBySprite = function(obj)
	local  spriteName = obj:getSprite():getName() 			
	if 	   spriteName == "f_pert_basement_1_11" then return "small"
	elseif spriteName == "f_pert_basement_1_10" then return "medium"
	elseif spriteName == "f_pert_basement_1_9"  then return "large"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.getObjetcToBuild = function(type,size,buildingId)
	if type ~= "travel" and buildingId == -2 then --== "sewer" or type == "basement" then 
		type = "exit" 
	end
	return Basement_addOptions.typeSprite[type][size]
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.returnHatchModData = function(currentHatch)
	if currentHatch then 
		if currentHatch:getModData() and currentHatch:getModData().BasementMod then
			return currentHatch:getModData().BasementMod
		end 
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.returnSpecialHatchModData = function(currentHatch)
	if currentHatch then 
		if currentHatch:getModData() and currentHatch:getModData().BasementMod and currentHatch:getModData().BasementMod.basementId >= 10000 then
			return currentHatch:getModData().BasementMod
		end 
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.doBuildHatch = function(playerId,type,size,buildingId)
    if type == nil or  size == nil or buildingId == nil then Basement_addOptions.GlobalVar.CreateSpecialHatchData = nil return end --- Cancel arrival build action
    local objToBuild = Basement_addOptions.getObjetcToBuild(type,size,buildingId)   		
    

    local hatch = ISSpecialHatch:new("BasementSpecialHatch", type,size, objToBuild,buildingId);
    hatch.player = playerId;
    hatch.completionSound = "BuildWoodenStructureLarge";
    getCell():setDrag(hatch, playerId)
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.RebuildHatchId = function(playerObj,basementId,buildingId)
	local playerId = playerObj:getPlayerNum()
	local basementData = Basement.Data.Basements[basementId];
	Basement_addOptions.GlobalVar.CreateSpecialHatchData = basementData
	Events.EveryTenMinutes.Add(Basement_addOptions.SpecialHatchToBuildWaiting);

	Basement_addOptions.doBuildHatch(playerId,basementData.type,basementData.size,buildingId)
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.reassignSpecialHatch = function(id,buildingId,x,y,z,x2,y2,z2,type,size)
	local basementData = {
	   basementId = id,
	   buildingId = buildingId,
	   hatchPosition = {
	      x = x,
	      y = y,
	      z = z
	   },
	   exitHatchPosition = {
	      x = x2,
	      y = y2,
	      z = z2
	   },
	   size = size,
	   type = type
	};
   sendClientCommand("BasementMod", "CreateHatch", basementData);
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.reassign = function(currentHatch, ID)
	local square = currentHatch:getSquare()
	local building = square:getBuilding();
	local x, y = square:getX(), square:getY()
	if not building then 
		BuildingID = 0 -- isOutside()
	else
		BuildingID = building:getID()
	end
	local basementData = {
	   basementId = ID,
	   buildingId = BuildingID,
	   hatchPosition = {
	      x = x,
	      y = y,
	      z = 0
	   }
	};
	square:disableErosion();
	currentHatch:getModData().BasementMod = basementData;
   if isClient() then
      local args = { x = x, y = y, z = 0 };
      sendClientCommand('erosion', 'disableForSquare', args);
      currentHatch:transmitCompleteItemToServer();
   end
   sendClientCommand("BasementMod", "CreateHatch", basementData);
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.setFreeBasement = function(playerObj, currentHatch, ID)
	playerObj:Say("No implemented")
   --local basementData = Basement.Data.Basements[currentHatch.id];
   ----Basement.Data.Basements[basementData] = nil;
   --currentHatch:getModData().BasementMod = nil;
	--if isClient() then
   --   currentHatch:transmitCompleteItemToServer();
   --end
   --sendClientCommand("BasementMod", "CreateHatch", nil);
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.PadLockPerform = function(playerObj,currentBasement,id,keyId,state)
	local basementData = Basement.Data.Basements[id];
	local inventory = playerObj:getInventory()
	local square = playerObj:getCurrentSquare()
	local padLock 	= inventory:getItemFromType("Padlock")
	local crowbar 	= inventory:getItemFromType("Crowbar")
	local haveThisKeyId = inventory:haveThisKeyId(keyId)
	local Basement_Key = nil
	for i=1,inventory:getItems():size() do
		local item = inventory:getItems():get(i-1)
		if item:getCategory()=="Key" and item:getType() == "KeyPadlock"  then
			if item:getKeyId() == keyId then
				Basement_Key = item
				break
			end
		end
	end
	----------------------------------------------- add adLock
	if state == 0 then
		if (basementData.PadLock == nil or basementData.PadLock == 0) and (padLock  or isAdmin()) then
			if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_addPadlock", square, 1, 10, 2, true) end
			basementData.PadLock = 1
			local key = inventory:AddItem("Base.KeyPadlock")
			key:setKeyId(keyId)
			if padLock then inventory:Remove(padLock) end
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- lockPadlock
	elseif state == 1 then
		if basementData.PadLock == 1 and ((currentBasement and SandboxVars.BasementAddOptions.lockInsideWithoutKey) or haveThisKeyId or isAdmin()) then
			if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_lockPadlock", square, 1, 10, 2, true) end
			basementData.PadLock = 2
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- takePadlock
	elseif state == -1 then
		if basementData.PadLock == 1 and ((haveThisKeyId and Basement_Key) or isAdmin()) then
			local padlock = inventory:AddItem("Base.Padlock")
			if Basement_Key then inventory:Remove(Basement_Key) end
			if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_takePadlock", square, 1, 10, 2, true) end
			basementData.PadLock = 0
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- unlockPadlock
	elseif state > 1 then
		if basementData.PadLock > 1 and ((currentBasement and SandboxVars.BasementAddOptions.unlockInsideWithoutKey) or haveThisKeyId or isAdmin()) then -- sandboxoption
			if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_unlockPadlock", square, 1, 10, 2, true) end
			basementData.PadLock = 1
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- breakCrowbar
	elseif state == -2 then
		if basementData.PadLock > 1 and crowbar then
			local crowbarDamageConditionMultiplier = SandboxVars.BasementAddOptions.crowbarDamageConditionMultiplier
			local chanceToLoseCrowbarIfIsBroken = SandboxVars.BasementAddOptions.chanceToLoseCrowbarIfIsBroken
			local chanceToSucceedBreakPadlockAction = SandboxVars.BasementAddOptions.chanceToSucceedBreakPadlockAction
			crowbar:setCondition(crowbar:getCondition()-(1*crowbarDamageConditionMultiplier)) --sandboxoption 50
			local crowbarCondition = crowbar:getCondition()
			if (chanceToLoseCrowbarIfIsBroken ~= 0 and crowbarCondition <= 0 and ZombRand(chanceToLoseCrowbarIfIsBroken) == 1) or chanceToLoseCrowbarIfIsBroken == 1 then --sandboxoption 2
				if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_breakCrowbar", square, 1, 10, 2, true) end
				-----------------------------------------------
				playerObj:removeFromHands(crowbar)
				inventory:DoRemoveItem(crowbar)
				-----------------------------------------------------------
				local pdata = getPlayerData(playerObj:getPlayerNum())
				if pdata ~= nil then
					pdata.playerInventory:refreshBackpacks()
					pdata.lootInventory:refreshBackpacks()
				end		
			end
			local rand = ZombRand(chanceToSucceedBreakPadlockAction+1)
			--print(rand) 
			if chanceToSucceedBreakPadlockAction == 0 or rand == 0 then
				basementData.PadLock = 0 ; 
				playerObj:Say(getText("IGUI_addOption_breakWithCrowbarISok")) --sandboxoption 0
				if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_breakPadlockISok", square, 1, 10, 2, true) end
			else playerObj:Say(getText("IGUI_addOption_breakWithCrowbarISfail")) 
					if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_breakPadlockISfail", square, 1, 10, 2, true) end
				  return
			end
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- takePadlock detroye
	elseif state == -3 then
		if basementData.PadLock == 1 then
			if square and not isAdmin() then getSoundManager():PlayWorldSound("basement_takePadlock", square, 1, 10, 2, true) end
			basementData.PadLock = 0
		else
			playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
			return
		end
	----------------------------------------------- problem
	else
		playerObj:Say(getText("IGUI_addOption_thereIsProblem"))
		return
	end
	local basementData = Basement.Data.Basements[id];
   sendClientCommand("BasementMod", "CreateHatch", basementData);
 
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
local function predicateNotBroken(item)
	return not item:isBroken()
end
Basement_addOptions.GetCrowbarFromInv = function(playerObj)
	--local crowbar = playerObj:getInventory():getItemFromType("Crowbar")
	--and crowbar:getCondition() > 0)
	return playerObj:getInventory():getFirstTagEvalRecurse("Crowbar", predicateNotBroken)
end
Basement_addOptions.TakeCrowbar = function(playerObj)
	if not playerObj:getPrimaryHandItem() or playerObj:getPrimaryHandItem():getType() ~= "Crowbar" then
       	if playerObj:getPrimaryHandItem() then

            	ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getPrimaryHandItem(), 50));
        	end
        	if playerObj:getSecondaryHandItem() and playerObj:getSecondaryHandItem() ~= playerObj:getPrimaryHandItem() then
            	ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getSecondaryHandItem(), 50));
        	end
        	local crowbar = Basement_addOptions.GetCrowbarFromInv(playerObj)
        	if crowbar == nil then return end
        	ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, crowbar, 50, true, crowbar:isTwoHandWeapon()));
    	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Basement_addOptions.PadLock = function(playerObj,currentHatch,currentBasement,id,keyId,state)
	local TimeActionPadLock = 50
	if state == -1 then TimeActionPadLock = 200 +ZombRand(200)
	elseif state == -2 then 
		local timeAction = SandboxVars.BasementAddOptions.timeActionToBreakPadlock
		TimeActionPadLock = timeAction +ZombRand(timeAction/20) --sandboxoption 250
		Basement_addOptions.TakeCrowbar(playerObj)
	elseif state == -3 then
		TimeActionPadLock = 10000 +ZombRand(200)
	end
	local square = playerObj:getSquare()
	if not square then return end
	local squareX, squareY, squareZ = square:getX(), square:getY(), square:getZ();
	local currentBasement = Basement.FindByPosition(squareX, squareY, squareZ);

   if currentBasement then 
   		ISTimedActionQueue.add(ISPathFindAction:pathToLocationF(playerObj, currentBasement.x + currentBasement.exitX + 0.5, currentBasement.y + currentBasement.exitY + 0.5, currentBasement.z))
   		ISTimedActionQueue.add(Basement_addOptions_TimedActions:new(playerObj,currentHatch,currentBasement,id,keyId,state,TimeActionPadLock));
   elseif currentHatch then
   		if luautils.walkAdj(playerObj, currentHatch:getSquare()) then
   			if state == -2 then
   				Basement_addOptions.TakeCrowbar(playerObj)
   			end
   			ISTimedActionQueue.add(Basement_addOptions_TimedActions:new(playerObj,currentHatch,currentBasement,id,keyId,state,TimeActionPadLock));
   		end
   end
end

--return Basement_addOptions