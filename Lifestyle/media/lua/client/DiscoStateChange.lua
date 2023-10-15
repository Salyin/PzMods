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


local function LS_PlayingInstrumentRange(player, worldobjects, x, y, test)

	local thisPlayer = getPlayer()
	if thisPlayer ~= nil then

    for playerIndex = 0, getNumActivePlayers()-1 do
        local playersList = {};--get players
		local playerObj = getSpecificPlayer(playerIndex)
		local SourceMusiclvl = -1;
		local SourceWaitingDuet = true;

	    if (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().IsDancingInit ~= nil) and
		(playerObj:getModData().IsDancingFull ~= nil) and
		(playerObj:getModData().IsDancingFull == false) and
		(playerObj:getModData().IsDancingInit == true) then
			playerObj:getModData().IsDancingInit = false
		end
			
		if (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingInstrument ~= nil) and
		(playerObj:getModData().PlayingInstrument == false) and
		(playerObj:getModData().IsListeningToJukebox ~= nil) and
		(playerObj:getModData().IsListeningToDJ ~= nil) and
		(playerObj:getModData().IsListeningToJukebox == true) and
		(playerObj:getModData().IsListeningToDJ == false) then
		--(playerObj:getModData().IsDancingFull) then
		
			if tostring(playerObj:getModData().IsListeningToMusicStyle) ~= nil and not
			playerObj:HasTrait("Deaf") then

				if (tostring(playerObj:getModData().IsListeningToMusicStyle) == "disco" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cdisco") and playerObj:HasTrait("disco") then
					--playerObj:Say("I love Disco!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "disco" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cdisco") and playerObj:HasTrait("discono") then
					--playerObj:Say("I don't like Disco...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "beach" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cbeach") and playerObj:HasTrait("beach") then
					--playerObj:Say("I love Beach music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "beach" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cbeach") and playerObj:HasTrait("beachno") then
					--playerObj:Say("I don't like Beach music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "country" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "ccountry") and playerObj:HasTrait("country") then
					--playerObj:Say("I love Country music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "country" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "ccountry") and playerObj:HasTrait("countryno") then
					--playerObj:Say("I don't like Country music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "classical" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cclassical") and playerObj:HasTrait("classical") then
					--playerObj:Say("I love Classical music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "classical" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cclassical") and playerObj:HasTrait("classicalno") then
					--playerObj:Say("I don't like Classical music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "metal" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cmetal") and playerObj:HasTrait("metal") then
					--playerObj:Say("I love Metal music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "metal" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cmetal") and playerObj:HasTrait("metalno") then
					--playerObj:Say("I don't like Metal music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "holiday" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "choliday") and playerObj:HasTrait("holiday") then
					--playerObj:Say("I love Holiday music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "holiday" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "choliday") and playerObj:HasTrait("holidayno") then
					--playerObj:Say("I don't like Holiday music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "jazz" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cjazz") and playerObj:HasTrait("jazz") then
					--playerObj:Say("I love Jazz music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "jazz" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cjazz") and playerObj:HasTrait("jazzno") then
					--playerObj:Say("I don't like Jazz music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "muzak" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cmuzak") and playerObj:HasTrait("muzak") then
					--playerObj:Say("I love Muzak music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "muzak" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cmuzak") and playerObj:HasTrait("muzakno") then
					--playerObj:Say("I don't like Muzak music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "pop" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cpop") and playerObj:HasTrait("pop") then
					--playerObj:Say("I love Pop music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "pop" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cpop") and playerObj:HasTrait("popno") then
					--playerObj:Say("I don't like Pop music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rap" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crap") and playerObj:HasTrait("rap") then
					--playerObj:Say("I love Rap music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rap" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crap") and playerObj:HasTrait("rapno") then
					--playerObj:Say("I don't like Rap music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rbsoul" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crbsoul") and playerObj:HasTrait("rbsoul") then
					--playerObj:Say("I love Rb&Soul music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rbsoul" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crbsoul") and playerObj:HasTrait("rbsoulno") then
					--playerObj:Say("I don't like Rb&Soul music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "reggae" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "creggae") and playerObj:HasTrait("reggae") then
					--playerObj:Say("I love Reggae music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "reggae" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "creggae") and playerObj:HasTrait("reggaeno") then
					--playerObj:Say("I don't like Reggae music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rock" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crock") and playerObj:HasTrait("rock") then
					--playerObj:Say("I love Rock music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "rock" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "crock") and playerObj:HasTrait("rockno") then
					--playerObj:Say("I don't like Rock music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "salsa" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "csalsa") and playerObj:HasTrait("salsa") then
					--playerObj:Say("I love Salsa music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "salsa" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "csalsa") and playerObj:HasTrait("salsano") then
					--playerObj:Say("I don't like Salsa music...")
					PlayerIsListeningToMusic(playerObj, 0)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "world" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cworld") and playerObj:HasTrait("world") then
					--playerObj:Say("I love World music!")				
					PlayerIsListeningToMusic(playerObj, 8)
				elseif (tostring(playerObj:getModData().IsListeningToMusicStyle) == "world" or tostring(playerObj:getModData().IsListeningToMusicStyle) == "cworld") and playerObj:HasTrait("worldno") then
					--playerObj:Say("I don't like World music...")
					PlayerIsListeningToMusic(playerObj, 0)

				else
					--playerObj:Say("This style is fine, I guess")
					PlayerIsListeningToMusic(playerObj, 3)
				end
				
			else
				--print("music style is nil or player is deaf")
			end
			
		end
		
	    if (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingDJBooth ~= nil) and
		(playerObj:getModData().PlayingDJBooth == true) then
		local SourceIsDJ
		local SourceDJ = tostring(playerObj:getUsername())
		SourceIsDJ = true
		SourceMusiclvl = playerObj:getPerkLevel(Perks.Music)
            for x = playerObj:getX()-8,playerObj:getX()+8 do
                for y = playerObj:getY()-8,playerObj:getY()+8 do
                    local square = getCell():getGridSquare(x,y,playerObj:getZ());
                    if square then
                        for i = 0,square:getMovingObjects():size()-1 do
                            local moving = square:getMovingObjects():get(i);
                            if instanceof(moving, "IsoPlayer") then
                                table.insert(playersList, moving);
                            end
                        end
                    end
                end
            end
		
            if #playersList > 0 then
                for i,v in ipairs(playersList) do
				
				
				if v:getUsername() ~= playerObj:getUsername() and
				v:isOutside() == playerObj:isOutside() then
				
				sendClientCommand(playerObj, "LS", "IsPlayingDJ", {v:getOnlineID(), SourceMusiclvl, SourceDJ, SourceIsDJ})
				--print("tried to send command")
			        --end
				end
				
				
                end
            end

		elseif (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingInstrument ~= nil) and
		(playerObj:getModData().PlayingInstrument == false) and
		(playerObj:getModData().PlayingDJBooth ~= nil) and
		(playerObj:getModData().PlayingDJBooth == false) and
		(playerObj:getModData().PlayingDJBoothStopped ~= nil) and
		(playerObj:getModData().PlayingDJBoothStopped == true) then
		
		playerObj:getModData().PlayingDJBoothStopped = false
		SourceIsDJ = false
		SourceMusiclvl = playerObj:getPerkLevel(Perks.Music)
            for x = playerObj:getX()-12,playerObj:getX()+12 do
                for y = playerObj:getY()-12,playerObj:getY()+12 do
                    local square = getCell():getGridSquare(x,y,playerObj:getZ());
                    if square then
                        for i = 0,square:getMovingObjects():size()-1 do
                            local moving = square:getMovingObjects():get(i);
                            if instanceof(moving, "IsoPlayer") then
                                table.insert(playersList, moving);
                            end
                        end
                    end
                end
            end
		
            if #playersList > 0 then
                for i,v in ipairs(playersList) do
				
				
				if v:getUsername() ~= playerObj:getUsername() and
				v:isOutside() == playerObj:isOutside() then
				
				sendClientCommand(playerObj, "LS", "IsPlayingDJ", {v:getOnlineID(), SourceMusiclvl, SourceDJ, SourceIsDJ})
				--print("tried to send command")
			        --end
				end
				
				
                end
            end
		

		elseif (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingInstrument ~= nil) and
		(playerObj:getModData().PlayingInstrument == false) and
		(playerObj:getModData().PlayingDJBooth ~= nil) and
		(playerObj:getModData().PlayingDJBooth == false) and
		(playerObj:getModData().IsListeningToDJ ~= nil) and
		(playerObj:getModData().IsListeningToDJ == true) then
		
		local IsListeningCheck = false
		
            for x = playerObj:getX()-8,playerObj:getX()+8 do
                for y = playerObj:getY()-8,playerObj:getY()+8 do
                    local square = getCell():getGridSquare(x,y,playerObj:getZ());
                    if square then
                        for i = 0,square:getMovingObjects():size()-1 do
                            local moving = square:getMovingObjects():get(i);
                            if instanceof(moving, "IsoPlayer") then
                                table.insert(playersList, moving);
                            end
                        end
                    end
                end
            end
		
            if #playersList > 0 then
                for i,v in ipairs(playersList) do
				
				
				if v:getUsername() ~= playerObj:getUsername() and
				v:isOutside() == playerObj:isOutside() then
					if (tostring(v:getUsername()) == tostring(playerObj:getModData().SourceDJName)) then
						IsListeningCheck = true
					end
				end
				
				
                end
				if IsListeningCheck == false then
					playerObj:getModData().IsListeningToDJ = false
					playerObj:getModData().SourceDJName = "nodj"
				end
            end
		
	    elseif (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingInstrument ~= nil) and
		(playerObj:getModData().PlayingInstrument == false) and
		(playerObj:getModData().IsListeningToJukebox ~= nil) and
		(playerObj:getModData().IsListeningToJukebox == true) and
		--(playerObj:getModData().WantsToDance ~= nil) and
		--(playerObj:getModData().WantsToDance == true) and
		(playerObj:getPrimaryHandItem() == nil) and
		(playerObj:getSecondaryHandItem() == nil) and
		(playerObj:getCurrentState():equals(IdleState.instance())) and not
		playerObj:isSitOnGround() and not
		playerObj:isSneaking() and not
		playerObj:isRunning() and not
		playerObj:isPerformingAnAction() and not
		playerObj:isSprinting() then
			if not (playerObj:getModData().IsDancingInit) then
				playerObj:getModData().IsDancingInit = true
				--local PlayerIsDancingToMusic = require("TimedActions/PlayerIsDancingToMusic")
				--local player = playerObj
				--local actionType = "Bob_PreDancingDefault"
				--ISTimedActionQueue.add(PlayerIsDancingToMusic:new(player, actionType));
			end



--	    elseif (playerObj ~= nil) and
--		(playerObj:hasModData()) and
--		(playerObj:getModData().PlayingInstrument ~= nil) and
--		(playerObj:getModData().PlayingInstrument == false) and
--		(playerObj:getModData().IsListeningToJukebox ~= nil) and
--		(playerObj:getModData().IsListeningToJukebox == true) and
--		(playerObj:getPrimaryHandItem() == nil) and
--		(playerObj:getSecondaryHandItem() == nil) and not
--		playerObj:isSitOnGround() and not
--		playerObj:isSneaking() and not
--		playerObj:isRunning() and not
--		playerObj:isSprinting() then
--
--			if not (playerObj:getModData().IsDancingFull) then
--				if (playerObj:getModData().IsDancingInit == true) then
--					if isKeyDown(Keyboard.KEY_X) then
--						local OtherPlayersAround
--						OtherPlayersAround = false
 --           for x = playerObj:getX()-1,playerObj:getX()+1 do
  --              for y = playerObj:getY()-1,playerObj:getY()+1 do
  --                  local square = getCell():getGridSquare(x,y,playerObj:getZ());
   --                 if square then
    --                    for i = 0,square:getMovingObjects():size()-1 do
     --                       local moving = square:getMovingObjects():get(i);
      --                      if instanceof(moving, "IsoPlayer") then
       --                         table.insert(playersList, moving);
        --                    end
       --                 end
      --              end
     --           end
     --       end
	--	
--
 --           if #playersList > 0 then
  --              for i,v in ipairs(playersList) do
--				
--				
--				if v:getUsername() ~= playerObj:getUsername() and
--				v:isOutside() == playerObj:isOutside() then
--					OtherPlayersAround = true
--
--					if #playersList <= 2 then
--					
--					local DanceProposer = tostring(playerObj:getUsername())
--					sendClientCommand(playerObj, "LS", "AskToDance", {v:getOnlineID(), DanceProposer})
--
--					end
--				end
 --               end			
  --          end
--			if OtherPlayersAround == false then
--			--print("changingmoddata FULL TRUE")
--			playerObj:getModData().IsDancingFull = true
--			elseif OtherPlayersAround == true then
--			--print("OTHER PLAYERS")			
--			end
--		end	
--			end
--		end
		
	    elseif (playerObj ~= nil) and
		(playerObj:hasModData()) and
		(playerObj:getModData().PlayingInstrument ~= nil) and
		(playerObj:getModData().PlayingInstrument == true) then--if player is playing an instrument
		SourceMusiclvl = playerObj:getPerkLevel(Perks.Music)
            for x = playerObj:getX()-8,playerObj:getX()+8 do
                for y = playerObj:getY()-8,playerObj:getY()+8 do
                    local square = getCell():getGridSquare(x,y,playerObj:getZ());
                    if square then
                        for i = 0,square:getMovingObjects():size()-1 do
                            local moving = square:getMovingObjects():get(i);
                            if instanceof(moving, "IsoPlayer") then
                                table.insert(playersList, moving);
                            end
                        end
                    end
                end
            end
		

            if #playersList > 0 then
                for i,v in ipairs(playersList) do
				
				
				if v:getUsername() ~= playerObj:getUsername() and
				v:isOutside() == playerObj:isOutside() and
				(playerObj:getModData().WaitingDuet == true) then
				
				
					if isKeyDown(Keyboard.KEY_X) then
						SourceWaitingDuet = false;
				
						sendClientCommand(playerObj, "LS", "IsStartingDuet", {v:getOnlineID(), SourceWaitingDuet})
						--print("tried to send command")
						
					end

				
				elseif v:getUsername() ~= playerObj:getUsername() and
				v:isOutside() == playerObj:isOutside() then
				
				sendClientCommand(playerObj, "LS", "IsPlayingMusic", {v:getOnlineID(), SourceMusiclvl})
				--print("tried to send command")
			        --end
				end
				
				
                end
            end
			if (playerObj:getModData().WaitingDuet == true) and
			isKeyDown(Keyboard.KEY_X) then
				playerObj:getModData().WaitingDuet = false
			end
		end	
	end	
	
	else
		--Events.EveryOneMinute.Remove(LS_PlayingInstrumentRange)
	end
end



function OnJukeboxTurnOff(x, y, z)

	local x = x
	local y = y
	local z = z
	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	if not sqr then return end
			for i=0,sqr:getObjects():size()-1 do
				local thisObject = sqr:getObjects():get(i)	
			--for i=1,sqr:getObjects():size() do
				--local thisObject = sqr:getObjects():get(i-1)

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
	--print("failed")
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

function OnDiscoBallStyleChange(style, x, y, z)

	local style = style
	local x = x
	local y = y
	local z = z
	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	if not sqr then return end
			for i=0,sqr:getObjects():size()-1 do
				local thisObject = sqr:getObjects():get(i)	
			--for i=1,sqr:getObjects():size() do
				--local thisObject = sqr:getObjects():get(i-1)

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
	--print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().Mode = style
	
	else
		return
	end

end

function OnDiscoBallTurnOff(playerDiscoCommand, x, y, z)

	local playerDiscoCommand = playerDiscoCommand
	local x = x
	local y = y
	local z = z
	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	if not sqr then return end
			for i=0,sqr:getObjects():size()-1 do
				local thisObject = sqr:getObjects():get(i)	
			--for i=1,sqr:getObjects():size() do
				--local thisObject = sqr:getObjects():get(i-1)

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
	--print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().OnOff = playerDiscoCommand
	
	else
		return
	end

end


function startInstrumentRange()
	Events.EveryOneMinute.Add(LS_PlayingInstrumentRange);
end

Events.OnGameStart.Add(startInstrumentRange)
