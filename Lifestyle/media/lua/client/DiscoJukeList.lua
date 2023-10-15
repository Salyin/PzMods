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

local checkjukeboxordiscoballcount = 150
--local dontkillfpscount2 = 200
--local dontkillfpscount3 = 125
local checkjukeboxordiscoballstart = 0
--local dontkillfpsStart2 = 0
--local dontkillfpsStart3 = 0

function OnRenderTickClientCheckJukebox (player, worldobjects, x, y, test)

	local jukelist = require("ListJuke")
	local discolist = require("ListDisco")

    checkjukeboxordiscoballstart = checkjukeboxordiscoballstart + 1
    --dontkillfpsStart3 = dontkillfpsStart3 + 1

    if checkjukeboxordiscoballstart % checkjukeboxordiscoballcount == 0 then
        checkjukeboxordiscoballstart = 0


--    for playerIndex = 0, getNumActivePlayers()-1 do
--    local thisPlayer = getSpecificPlayer(playerIndex)
	local thisPlayer = getSpecificPlayer(0)
	if thisPlayer ~= nil then

	local DiscoBall
	local Jukebox
	local spriteName
	local DiscoBallX
	local DiscoBallY
	local JukeboxX
	local JukeboxY
	local MusicStyle
	
            for x = thisPlayer:getX()-8,thisPlayer:getX()+8 do
                for y = thisPlayer:getY()-8,thisPlayer:getY()+8 do
                    local square = getCell():getGridSquare(x,y,thisPlayer:getZ());
                    if square then
						for i=0,square:getObjects():size()-1 do
							local thisObject = square:getObjects():get(i)
						--for i=1,square:getObjects():size() do
							--local thisObject = square:getObjects():get(i-1)
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
										JukeboxX = Jukebox:getX()
										JukeboxY = Jukebox:getY()
										spriteName = thisSpriteName;
										local JukeboxWasAdded = false
										--table.insert(jukelist, Jukebox);
										
										if Jukebox and
										#jukelist > 0 then
		
											for i,v in ipairs(jukelist) do
												if v ~= nil and (v:getSquare() ~= nil) then
													if (v:getX() ~= nil and v:getY() ~= nil) then
														if (v:getX() == JukeboxX and v:getY() == JukeboxY) then
															JukeboxWasAdded = true
														end
													end
												end
											end
											
											if JukeboxWasAdded == false then
												--print("adding jukebox to the list")
												table.insert(jukelist, Jukebox);
											end
										
										elseif Jukebox then
		
											--print("adding the first jukebox to the list")
											table.insert(jukelist, Jukebox);
		
										end
									end
									
									if customName == "Disco Ball" then
										DiscoBall = thisObject;
										DiscoBallX = DiscoBall:getX()
										DiscoBallY = DiscoBall:getY()
										spriteName = thisSpriteName;
										local DiscoWasAdded = false
										--table.insert(discolist, DiscoBall);
										
												if DiscoBall and
												#discolist > 0 then
		
													for i,v in ipairs(discolist) do
														if v ~= nil and (v:getSquare() ~= nil) then
															if (v:getX() ~= nil and v:getY() ~= nil) and
															(v:getX() == DiscoBallX and v:getY() == DiscoBallY) then
																DiscoWasAdded = true
															end
														end
													end
													
													if DiscoWasAdded == false then
														--print("adding DiscoBall to the list")
														table.insert(discolist, DiscoBall);
													end
			
			
												elseif DiscoBall then
		
													--print("adding the first DiscoBall to the list")
													table.insert(discolist, DiscoBall);
		
												end
									end
								end--properties
							end--thissprite

                        end
                    end
                end
            end

	if Jukebox and
	Jukebox:hasModData() and
	thisPlayer:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" and
	Jukebox:getModData().OnPlay ~= nil and
	Jukebox:getModData().OnPlay ~= "nothing" and
	tostring(Jukebox:getModData().Style) ~= nil then
	
	if thisPlayer:getModData().IsListeningToDJ == false then
	thisPlayer:getModData().IsListeningToJukebox = true
	
		if thisPlayer:getModData().IsListeningToMusicStyle ~= nil and
		tostring(thisPlayer:getModData().IsListeningToMusicStyle) == tostring(Jukebox:getModData().Style) then

		elseif thisPlayer:getModData().IsListeningToMusicStyle ~= nil and
		tostring(thisPlayer:getModData().IsListeningToMusicStyle) ~= tostring(Jukebox:getModData().Style) then
			MusicStyle = tostring(Jukebox:getModData().Style)
			thisPlayer:getModData().IsListeningToMusicStyle = MusicStyle
		else
			MusicStyle = tostring(Jukebox:getModData().Style)
			thisPlayer:getModData().IsListeningToMusicStyle = MusicStyle
		end
	else
	thisPlayer:getModData().IsListeningToJukebox = false
	end
	else
	thisPlayer:getModData().IsListeningToJukebox = false
	end

	else
		--Events.OnTick.Remove(OnRenderTickClientCheckJukebox)
	end--playernil
--	end--playerindex

	end--tick
	


end--function


function checkNearbyJukeboxes(player, worldobjects, x, y, test)

	local jukelist = require("ListJuke")
	local discolist = require("ListDisco")

	--justalittlesecondstart2 = justalittlesecondstart2 + 1

	--if justalittlesecondstart2 % justalittlesecond2 == 0 then
	
	--justalittlesecondstart2 = 0

	local thisPlayer = getPlayer()
	
	if thisPlayer ~= nil then
	--print("PLAYER NOT NIL")
	local DiscoBall
	local Jukebox
	local spriteName
	local DiscoBallX
	local DiscoBallY
	local JukeboxX
	local JukeboxY
	
            for x = thisPlayer:getX()-60,thisPlayer:getX()+60 do
                for y = thisPlayer:getY()-60,thisPlayer:getY()+60 do
                    local square = getCell():getGridSquare(x,y,thisPlayer:getZ());
                    if square then
						for i=0,square:getObjects():size()-1 do
							local thisObject = square:getObjects():get(i)
						--for i=1,square:getObjects():size() do
							--local thisObject = square:getObjects():get(i-1)
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
										JukeboxX = Jukebox:getX()
										JukeboxY = Jukebox:getY()
										spriteName = thisSpriteName;
										local JukeboxWasAdded = false
										--table.insert(jukelist, Jukebox);
										
										if Jukebox and
										#jukelist > 0 then
		
											for i,v in ipairs(jukelist) do
			
												if (v:getX() == JukeboxX and v:getY() == JukeboxY) then
													JukeboxWasAdded = true
												end
											end
											
											if JukeboxWasAdded == false then
												--print("adding jukebox to the list")
												table.insert(jukelist, Jukebox);
											end
			
										elseif Jukebox then
		
											--print("adding the first jukebox to the list")
											table.insert(jukelist, Jukebox);
		
										end
									end
									
									if customName == "Disco Ball" then
										DiscoBall = thisObject;
										DiscoBallX = DiscoBall:getX()
										DiscoBallY = DiscoBall:getY()
										spriteName = thisSpriteName;
										local DiscoWasAdded = false
										--table.insert(discolist, DiscoBall);
										
												if DiscoBall and
												#discolist > 0 then
		
													for i,v in ipairs(discolist) do
			
														if (v:getX() == DiscoBallX and v:getY() == DiscoBallY) then
															DiscoWasAdded = true
														end
													end
													
													if DiscoWasAdded == false then
														--print("adding DiscoBall to the list")
														table.insert(discolist, DiscoBall);
													end
			
			
												elseif DiscoBall then
		
													--print("adding the first DiscoBall to the list")
													table.insert(discolist, DiscoBall);
		
												end
									end
								end--properties
							end--thissprite

                        end
                    end
                end
            end

	end--playernil

	if #jukelist > 0 then
       --print("FOUND JUKES")
		for i,v in ipairs(jukelist) do
				
			if v:hasModData() and
			v:getModData().OnOff ~= nil and
			v:getModData().OnOff == "on" then

				--local emitterLoop = getWorld():getFreeEmitter(v:getX(), v:getY(), v:getZ())
				--emitterLoop:setPos(v:getX(), v:getY(), v:getZ());
				--local playerObj = getPlayer()
				
				if v:getModData().JukeinRange ~= nil and
				v:getModData().JukeinRange == "in range" then
					
					OnJukeboxStart(v:getX(), v:getY(), v:getZ())
					
					if v:getModData().OnPlay ~= nil and
					v:getModData().OnPlay ~= "nothing" and
					v:getModData().Style ~= nil then
							
						v:getModData().OnPlay = "nothing"
						v:getModData().Length = 3
						v:getModData().genre = "JukeboxAfterTurnOn"
						local style = v:getModData().Style
						local length = v:getModData().Length
						local genre = v:getModData().genre
						--print("sending music")
						OnJukeboxStyleChange(v:getX(), v:getY(), v:getZ(), style, length, genre)
								
					end
					
				end--range
			end--moddata
		end--for
	end--jukelist
	
	--print("removing the jukebox check event")
	Events.OnTick.Remove(checkNearbyJukeboxes)
	
	--end
end--function



function startJukeboxDiscoListTick ()
    Events.OnTick.Add(OnRenderTickClientCheckJukebox)
	--Events.OnTick.Add(OnJukeboxTickStart)
	--Events.OnTick.Add(OnDiscoTickStart)
	Events.OnTick.Add(checkNearbyJukeboxes)
end

Events.OnGameStart.Add(startJukeboxDiscoListTick)
