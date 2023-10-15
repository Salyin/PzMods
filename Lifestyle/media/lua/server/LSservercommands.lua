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

local LS_Commands = {}

LS_Commands["IsPlayingMusic"] = function(_, arg)

    local listener = getPlayerByOnlineID(arg[1])
    local listener_id = arg[1]
    local SourceMusiclvl = arg[2]
	--print("server received from client and is sending the command")
    sendServerCommand(listener, "LS", "IsListeningToMusic", {listener_id, SourceMusiclvl})

end

LS_Commands["IsStartingDuet"] = function(_, arg)

    local currentPerformer = getPlayerByOnlineID(arg[1])
    local currentPerformer_id = arg[1]
    local SourceWaitingDuet = arg[2]
	--print("server received from client and is sending the command")
    sendServerCommand(currentPerformer, "LS", "IsStartingDuet", {currentPerformer_id, SourceWaitingDuet})

end

LS_Commands["IsPlayingDJ"] = function(_, arg)

    local DJlistener = getPlayerByOnlineID(arg[1])
    local DJlistener_id = arg[1]
    local SourceMusiclvl = arg[2]
	local SourceDJ = arg[3]
	local SourceIsDJ = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand(DJlistener, "LS", "IsListeningToDJ", {DJlistener_id, SourceMusiclvl, SourceDJ, SourceIsDJ})

end

LS_Commands["AskIfIsDancing"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
    local DanceProposer = arg[2]
	--print("server received AskToDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "WasAskedIfIsDancing", {DanceTarget_id, DanceProposer})

end

LS_Commands["OtherPlayerIsDancing"] = function(_, arg)

    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DanceProposer_id = arg[1]
    local IsDancing = arg[2]
	--print("server received AcceptedDance from client and is sending the command")
    sendServerCommand(DanceProposer, "LS", "OtherPlayerIsDancingResponse", {DanceProposer_id, IsDancing})

end

LS_Commands["AskToDance"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
    local DanceProposer = arg[2]
	--print("server received AskToDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "WasAskedToDance", {DanceTarget_id, DanceProposer})

end

LS_Commands["AcceptedDance"] = function(_, arg)

    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DanceProposer_id = arg[1]
    local DancePartner = arg[2]
	local PartnerX = arg[3]
	local PartnerY = arg[4]
	--print("server received AcceptedDance from client and is sending the command")
    sendServerCommand(DanceProposer, "LS", "DanceWasAccepted", {DanceProposer_id, DancePartner, PartnerX, PartnerY})

end

LS_Commands["StopDance"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
	--print("server received StopDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "PartnerStoppedDancing", {DanceTarget_id})

end

LS_Commands["FaceDanceProposer"] = function(_, arg)

    local DancePartner = getPlayerByOnlineID(arg[1])
    local DancePartner_id = arg[1]
    local ProposerX = arg[2]
	local ProposerY = arg[3]
	print("server received FaceDanceProposer from client and is sending the command")
    sendServerCommand(DancePartner, "LS", "FaceDancingProposer", {DancePartner_id, ProposerX, ProposerY})

end

LS_Commands["ChangeDiscoStyle"] = function(_, arg)

    local style = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "ChangeDiscoStyle", {style, x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end
					
						if customName == "Disco Ball" then
							DiscoBall = thisObject;
						end
					end
				end
			end


	if not DiscoBall then
	print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().Mode = style
	
	else
		return
	end


end

LS_Commands["TurnDiscoBallOff"] = function(_, arg)

    local playerDiscoCommand = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "TurnDiscoBallOff", {playerDiscoCommand, x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Disco Ball" then
							DiscoBall = thisObject;
						end
					end
				end
			end


	if not DiscoBall then
	print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().OnOff = playerDiscoCommand
	
	else
		return
	end


end

LS_Commands["JukeboxStart"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "JukeboxStart", {x, y, z})

end

LS_Commands["TurnJukeboxOff"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "TurnJukeboxOff", {x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
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
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" then
	
		Jukebox:getModData().OnOff = "off"
		Jukebox:getModData().OnPlay = "nothing"
	
	else
		return
	end


end


LS_Commands["JukeboxStyleChange"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "JukeboxStyleChange", {x, y, z, style, length, genre})

	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
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
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" then
	
		Jukebox:getModData().OnPlay = "playing"
		Jukebox:getModData().Style = style
	else
		return
	end


end

LS_Commands["StopJukeSong"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "StopJukeSong", {x, y, z})

end

LS_Commands["isPlayingJuke"] = function(_, arg)

	--local isPlayingJukeSong = nil;
	local genre = arg[2]
	local JukeReusableID = arg[1]
	local playercommand = arg[6]
	
--	print("server received from client and is sending the command")
--	if sqr then
--	print("is sqr")

--			for i=1,sqr:getObjects():size() do
--				local thisObject = sqr:getObjects():get(i-1)
--
--				local thisSprite = thisObject:getSprite()
--				
--				if thisSprite ~= nil then
--				
--					local properties = thisObject:getSprite():getProperties()
--
--					if properties ~= nil then
--						local groupName = nil
--						local customName = nil
--						local thisSpriteName = nil
--					
--						--local thisSprite = thisObject:getSprite()
--						if thisSprite:getName() then
--							thisSpriteName = thisSprite:getName()
--						end
--					
--						if properties:Is("GroupName") then
--							groupName = properties:Val("GroupName")
--						end
--					
--						if properties:Is("CustomName") then
--							customName = properties:Val("CustomName")
--						end
--
--						if customName == "Jukebox" then
--							Jukebox = thisObject;
--							spriteName = thisSpriteName;
--						end
--					end
--				end
--			end


--	if not Jukebox then
--	print("failed")
--	return end

	local x = arg[3]
	local y = arg[4]
	local z = arg[5]
	
--    local emitter = getWorld():getFreeEmitter();
--	emitter:setPos(x, y, 0);

			if playercommand == "beforeplay" then
			print("trying to send beforeplay")
			sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			end

			if playercommand == "stop" then
			print("trying to send stop")
			sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			end

    --sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})
	--isPlayingJukeSong = getSoundManager():playSound(genre, sqr, 5, 75, 0.7, true);
	--addSound(Jukebox, x, y, z, 30, 10)


	--end
end

LS_Commands["JukeTurnedOn"] = function(_, arg)

	--local isPlayingJukeSong = nil;
	local genre = arg[1]
	local x = arg[2]
	local y = arg[3]
	local z = arg[4]
	local JukeReusableID = arg[5]
	local playercommand = arg[6]
	local sqr = getCell():getGridSquare(x, y, z);
--	print("server received from client and is sending the command")
	if sqr then
	print("is sqr")

			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

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


	if not Jukebox then
	print("failed")
	return end

local JukeboxLightSprite = "LS_JukeboxLight_A_1"
local JukeboxCell = Jukebox:getCell()

				if JukeboxLightOn ~= nil then
					if JukeboxLightOn == false then
							local JukeboxLight = IsoObject.new(sqr, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							JukeboxLight:transmitModData();
							sqr:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							Jukebox:getModData().MainLight = IsoLightSource.new(Jukebox:getX(), Jukebox:getY(), Jukebox:getZ(), 75, 75, 0, 2)
							local JukeMainLight = Jukebox:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
							Jukebox:transmitModData();
							print("LIGHTS ON")
					else
							print("LIGHTS ALREADY ON")
					return
					end
				else
							local JukeboxLight = IsoObject.new(sqr, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							JukeboxLight:transmitModData();
							sqr:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							Jukebox:getModData().MainLight = IsoLightSource.new(Jukebox:getX(), Jukebox:getY(), Jukebox:getZ(), 75, 75, 0, 2)
							local JukeMainLight = Jukebox:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
							Jukebox:transmitModData();
							print("LIGHTS ON")
				end
	
--    local emitter = getWorld():getFreeEmitter();
--	emitter:setPos(x, y, 0);

			--if playercommand == "beforeplay" then
			--print("trying to send beforeplay")
			--sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			--end

			--if playercommand == "stop" then
			--print("trying to send stop")
			--sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			--end

    --sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})
	--isPlayingJukeSong = getSoundManager():playSound(genre, sqr, 5, 75, 0.7, true);
	--addSound(Jukebox, x, y, z, 30, 10)


	end
end

---------- GLOBAL MODDATA

function LS_OnInitGlobalModData()
    ModData.getOrCreate("LSDATA")
end

Events.OnInitGlobalModData.Add(LS_OnInitGlobalModData)

LS_Commands.OnClientCommand = function(module, command, playerObj, args)

    if module == 'LS' and LS_Commands[command] then
        LS_Commands[command](playerObj, args)
    end
end

Events.OnClientCommand.Add(LS_Commands.OnClientCommand)


LS_Commands.ChangePlayerState = function(playerObj, args)
    ModData.get("LSDATA")[playerObj:getUsername()] = args
    ModData.transmit("LSDATA")
end