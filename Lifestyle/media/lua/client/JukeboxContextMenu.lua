--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

JukeboxMenu = {};
local previousJukeboxVolumeChange

function JukeboxMenu.doBuildMenuTurnOnOff(player, context, worldobjects)

    if getCore():getGameMode()=="LastStand" then
        return;
    end
 
    local thisPlayer = getSpecificPlayer(player)

    if thisPlayer:getVehicle() then
	--print("player in car")
	return; end
    
	local Jukebox = nil
	local spriteName = nil

	local objects = {}
	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						--local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
							spriteName = thisSpriteName;
						end
					end
				end
			end
		end
	end

	if not Jukebox then
	--print("not jukebox")
	return end

	if not ((SandboxVars.ElecShutModifier > -1 and
	GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
	Jukebox:getSquare():haveElectricity()) then
	--print("jukebox is off no electricity")
	return
	end
	
    --ModData.request("LSDATA")
	--local LSDATA = ModData.getOrCreate("LSDATA")
	--local JukeboxData = LSDATA[JukeboxID]

	--if JukeboxData == nil then
  -- The JukeboxID is not in the LSDATA table, so we need to add it.
		--JukeboxData = {}
		--JukeboxData.onOff = "off"
		--LSDATA[JukeboxID] = JukeboxData
		--if isClient() then ModData.transmit("LSDATA") end
	--end

	--if JukeboxData ~= nil then
	--if JukeboxData.onOff == nil then
    --JukeboxData.onOff = "off"
    --if isClient() then ModData.transmit("LSDATA") end
	--end
	--end

	--if JukeboxData ~= nil and JukeboxData.onOff == "off" then

    local JukeboxData = Jukebox:getModData()
    if not JukeboxData.JukeboxID then
	JukeboxData.JukeboxID = {(tostring(Jukebox:getX()) .. "," .. tostring(Jukebox:getY()) .. "," .. tostring(Jukebox:getZ()))};
	Jukebox:transmitModData();
	end
    if not JukeboxData.OnOff then 
	JukeboxData.OnOff = {"off"};
	Jukebox:transmitModData();
	end

	if JukeboxData.OnOff == "on" then

	local soundFile = "JukeboxTurnOff";
	local contextMenu = nil;	
	local soundEnd = "JukeboxAfterTurnOn";

	contextMenu0 = "ContextMenu_Jukebox_TurnOff"

	local JukeboxOffOption = context:addOption(getText(contextMenu0),
		worldobjects,
		JukeboxMenu.onTurnOff,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,
		soundEnd);	
	JukeboxOffOption.iconTexture = getTexture('media/ui/lightbulbOff_icon.png')
	else

	local soundFile = "JukeboxTurnOn";
	local contextMenu = nil;	
	local soundEnd = "JukeboxAfterTurnOn";

	contextMenu0 = "ContextMenu_Jukebox_TurnOn"

	local JukeboxOnOption = context:addOption(getText(contextMenu0),
		worldobjects,
		JukeboxMenu.onTurnOn,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,
		soundEnd);	
	JukeboxOnOption.iconTexture = getTexture('media/ui/lightbulbOn_icon.png')

	--elseif JukeboxData ~= nil and JukeboxData.onOff == "on" then


	--else
	--print("JukeboxData is nil")
	--return
	end

end

JukeboxMenu.walkToFront = function(thisPlayer, thisObject)
	local frontSquare = nil
	local controllerSquare = nil
	local spriteName = thisObject:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = thisObject:getSprite():getProperties()
	
	local facing = nil
	if properties:Is("Facing") then
		facing = properties:Val("Facing")
	else
		return
	end
	
	if facing == "S" then
		frontSquare = thisObject:getSquare():getS()
	elseif facing == "E" then
		frontSquare = thisObject:getSquare():getE()
	elseif facing == "W" then
		frontSquare = thisObject:getSquare():getW()
	elseif facing == "N" then
		frontSquare = thisObject:getSquare():getN()
	end
	
	if not frontSquare then
		return false
	end
	
	if not controllerSquare then
		controllerSquare = thisObject:getSquare()
	end

	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		return true
	end
	return false
end

JukeboxMenu.onEnableDancing = function(worldobjects, player)
	player:getModData().WantsToDance = true
end

JukeboxMenu.onDisableDancing = function(worldobjects, player)
	player:getModData().WantsToDance = false
end

JukeboxMenu.onVolumeChange = function(worldobjects, player, change)

	if previousJukeboxVolumeChange ~= nil then
		if change == previousJukeboxVolumeChange then
			change = change * 2
		end
	end

	local OriginalVolume = tonumber(player:getModData().JukeboxVolumeAll)
	local VolumeChange = tonumber(player:getModData().JukeboxVolumeAll) + change

	if (OriginalVolume - 0.8) > VolumeChange then
	--getWorld():getFreeEmitter():playSound("UI_Speed_DOWN3", false)
	getSoundManager():playUISound("UI_Speed_DOWN3")
	elseif (OriginalVolume - 0.4) > VolumeChange then
	getSoundManager():playUISound("UI_Speed_DOWN2")
	elseif OriginalVolume > VolumeChange then
	getSoundManager():playUISound("UI_Speed_DOWN1")
	elseif (OriginalVolume + 0.8) < VolumeChange then
	getSoundManager():playUISound("UI_Speed_UP3")
	elseif (OriginalVolume + 0.4) < VolumeChange then
	getSoundManager():playUISound("UI_Speed_UP2")
	elseif OriginalVolume < VolumeChange then
	getSoundManager():playUISound("UI_Speed_UP1")
	end

	if VolumeChange < 0.4 then
	VolumeChange = 0.4
	elseif VolumeChange > 3.2 then
	VolumeChange = 3.2
	end

	previousJukeboxVolumeChange = change
	player:getModData().JukeboxVolumeAll = tonumber(VolumeChange)
end

JukeboxMenu.onPlay = function(worldobjects, player, Jukebox, soundFile, soundEnd, Length, Style)
	if JukeboxMenu.walkToFront(player, Jukebox) then
		ISTimedActionQueue.add(JukeboxPlay:new(player, Jukebox, soundFile, soundEnd, Length, Style));
	end
end

JukeboxMenu.onTurnOn = function(worldobjects, player, Jukebox, soundFile, soundEnd)
	if JukeboxMenu.walkToFront(player, Jukebox) then
		ISTimedActionQueue.add(JukeboxOn:new(player, Jukebox, soundFile, soundEnd));
	end
end

JukeboxMenu.onTurnOff = function(worldobjects, player, Jukebox, soundFile, soundEnd)
	if JukeboxMenu.walkToFront(player, Jukebox) then
		ISTimedActionQueue.add(JukeboxOff:new(player, Jukebox, soundFile, soundEnd));
	end
end


Events.OnFillWorldObjectContextMenu.Add(JukeboxMenu.doBuildMenuTurnOnOff);
