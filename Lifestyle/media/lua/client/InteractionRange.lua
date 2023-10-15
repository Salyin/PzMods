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

local justalittlesecond = 50
local justalittlesecondstart = 0

function OnJukeboxTickStart(player, worldobjects, x, y, test)

	local jukelist = require("ListJuke")

	local playerObj = getPlayer()
	if playerObj ~= nil then

	justalittlesecondstart = justalittlesecondstart + 1
    --dontkillfpsStart2 = dontkillfpsStart2 + 1

	if justalittlesecondstart % justalittlesecond == 0 then
	
	justalittlesecondstart = 0

	local JukeboxLightSprite = "LS_JukeboxLight_A_1"
	local JukeboxLightSpritePlay1 = "LS_JukeboxLight_A_2"
	local JukeboxLightSpritePlay2 = "LS_JukeboxLight_A_3"
	local JukeboxLightSpritePlayOverlay = "LS_JukeboxLight_A_4"
	local DiscoBallLightSprite1 = "LS_Discoball_1"
	local DiscoBallLightSprite2 = "LS_Discoball_2"
	local DiscoBallLightSprite3 = "LS_Discoball_3"
	local DiscoBallLightSprite4 = "LS_Discoball_4"

	if #jukelist > 0 then
                
		for i,v in ipairs(jukelist) do
			
			if v:hasModData() and
			v:getModData().OnOff ~= nil then
			
			---
			if v:getModData().JukeinRange ~= nil and 
			v:getModData().JukeinRange ~= "out of range" and 
			v:getModData().OnOff == "on" and
			v:getModData().JukeBckpSquare ~= nil then
				--print("CONDITIONS WORK")
				local sqr = v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()) or v:getModData().JukeBckpSquare
				local Jukebox

				for i=0,sqr:getObjects():size()-1 do
					local thisObject = sqr:getObjects():get(i)
--				for i=1,sqr:getObjects():size() do
--					local thisObject = sqr:getObjects():get(i-1)

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
				--print("TURNING OFF JUKEBOX")
				v:getModData().OnOff = "off"
				v:getModData().OnPlay = "nothing"
				v:getModData().JukeinRange = "out of range"
			end
			
			---ELECTRICITY
			if Jukebox then
				if not ((SandboxVars.ElecShutModifier > -1 and
				GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
				Jukebox:getSquare():haveElectricity()) then
					--print("jukebox is off no electricity")
					v:getModData().OnOff = "off"
					v:getModData().OnPlay = "nothing"
				end
			end
			---
			
		end
			---

				--local emitterLoop = getWorld():getFreeEmitter(v:getX(), v:getY(), v:getZ())
				--emitterLoop:setPos(v:getX(), v:getY(), v:getZ());
				local playerObj = getPlayer()
				
				local Jukeboxproperties = v:getSprite():getProperties()
				local Jukeboxfacing = nil
				if Jukeboxproperties:Is("Facing") then
				Jukeboxfacing = Jukeboxproperties:Val("Facing")		

					if Jukeboxfacing == "S" then
					--print("facing S")
					JukeboxLightSprite = "LS_JukeboxLight_B_1"
					JukeboxLightSpritePlay1 = "LS_JukeboxLight_B_2"
					JukeboxLightSpritePlay2 = "LS_JukeboxLight_B_3"
					JukeboxLightSpritePlayOverlay = "LS_JukeboxLight_B_4"
					else
					
					JukeboxLightSprite = "LS_JukeboxLight_A_1"
					JukeboxLightSpritePlay1 = "LS_JukeboxLight_A_2"
					JukeboxLightSpritePlay2 = "LS_JukeboxLight_A_3"
					JukeboxLightSpritePlayOverlay = "LS_JukeboxLight_A_4"
					
					end
				end
				
                if playerObj and (playerObj:getX() >= v:getX() - 60 and playerObj:getX() <= v:getX() + 60 and
                playerObj:getY() >= v:getY() - 60 and playerObj:getY() <= v:getY() + 60) then 

					if v:getModData().JukeinRange ~= nil then
					
						if v:getModData().JukeinRange == "out of range" then
						
							--local RepeatStyleChange
							--local RepeatStart
						
							
							if v:getModData().OnOff ~= nil and v:getModData().OnOff == "off" then
								v:getModData().JukeinRange = "in range"
								--print("Juke is in range and off")
							end
							
						--print("was out of range trying to send stylechange")
							if v:getModData().OnPlay ~= nil and
							--v:getModData().OnPlay == "nothing" and
							v:getModData().OnOff == "on" and
							--v:getModData().Length ~= nil and
							--v:getModData().genre ~= nil and
							v:getModData().Style ~= nil then

							v:getModData().JukeinRange = "in range"
							OnJukeboxStart(v:getX(), v:getY(), v:getZ())
							v:getModData().OnPlay = "nothing"
							v:getModData().Length = 3
							v:getModData().genre = "JukeboxAfterTurnOn"
							local style = v:getModData().Style
							local length = v:getModData().Length
							local genre = v:getModData().genre

								OnJukeboxSendSong(v:getX(), v:getY(), v:getZ(), v)
								--OnJukeboxStyleChange(v:getX(), v:getY(), v:getZ(), style, length, genre)
								--print("managed to send stylechange")
								--RepeatStyleChange = true
							end
							

							
						elseif v:getModData().JukeinRange == "in range" then
						
							if v:getModData().JukeNoObject ~= nil and v:getModData().JukeNoObject == true and v:getModData().OnOff == "on" then
								
								--print("in range but no object for jukebox")
								if v:getModData().OnPlay ~= nil and
								--v:getModData().OnPlay == "nothing" and
								--v:getModData().OnOff == "on" and
								--v:getModData().Length ~= nil and
								--v:getModData().genre ~= nil and
								v:getModData().Style ~= nil then

									v:getModData().JukeNoObject = false
									OnJukeboxStart(v:getX(), v:getY(), v:getZ())
									v:getModData().OnPlay = "nothing"
									v:getModData().Length = 3
									v:getModData().genre = "JukeboxAfterTurnOn"
									local style = v:getModData().Style
									local length = v:getModData().Length
									local genre = v:getModData().genre

									OnJukeboxSendSong(v:getX(), v:getY(), v:getZ(), v)
									--OnJukeboxStyleChange(v:getX(), v:getY(), v:getZ(), style, length, genre)
									--print("sending stylechange again")
									--RepeatStyleChange = true
								end
					
							end
						
						else
						
						v:getModData().JukeinRange = "in range"
							if v:getModData().OnOff == "on" then
								OnJukeboxStart(v:getX(), v:getY(), v:getZ())
							end
						--print("undetermined range trying to send stylechange")
							if v:getModData().OnPlay ~= nil and
							--v:getModData().OnPlay ~= "nothing" and
							v:getModData().OnOff == "on" and
							v:getModData().Length ~= nil and
							v:getModData().Style ~= nil and
							v:getModData().genre ~= nil then
							
							v:getModData().OnPlay = "nothing"
							v:getModData().Length = 3
							v:getModData().genre = "JukeboxAfterTurnOn"
							local style = v:getModData().Style
							local length = v:getModData().Length
							local genre = v:getModData().genre

							
								OnJukeboxStyleChange(v:getX(), v:getY(), v:getZ(), style, length, genre)
								--print("managed to send stylechange")
							end
						end
					
					
					
					else
					
						v:getModData().JukeinRange = "in range"
							if v:getModData().OnOff == "on" then
								OnJukeboxStart(v:getX(), v:getY(), v:getZ())
							end
						--print("inrange is nil trying to send stylechange")
							if v:getModData().OnPlay ~= nil and
							--v:getModData().OnPlay ~= "nothing" and
							v:getModData().OnOff == "on" and
							v:getModData().Length ~= nil and
							v:getModData().Style ~= nil and
							v:getModData().genre ~= nil then
							
							v:getModData().OnPlay = "nothing"
							v:getModData().Length = 3
							v:getModData().genre = "JukeboxAfterTurnOn"
							local style = v:getModData().Style
							local length = v:getModData().Length
							local genre = v:getModData().genre

							
								OnJukeboxStyleChange(v:getX(), v:getY(), v:getZ(), style, length, genre)
								--print("managed to send stylechange")
							end
					end
				
				elseif v:getModData().JukeinRange ~= nil and v:getModData().JukeinRange ~= "out of range" then
					--print("jukebox is now out of range")
					v:getModData().JukeinRange = "out of range"
						if v:getModData().OnPlay ~= nil and
						v:getModData().OnPlay ~= "nothing" then
							v:getModData().SilenceMusic = "yes"
					--print("asking to silence music")
						end
					--v:getModData().Cell = v:getCell()
					--local JukeboxCell = v:getModData().Cell
					--local JukeboxSquare = v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ())
					--v:transmitModData();

					--if v:getModData().OnOff == "on" then
					
						--if v:getModData().AudioLoop ~= nil then
						--local audioLoop = v:getModData().AudioLoop
							
							--if v:getModData().CanYouHearTheLoop ~= nil and
							--v:getModData().CanYouHearTheLoop == "no" then
							
							--	print("PLAYING LOOP AGAIN")
								--emitterLoop:playSoundImpl("JukeboxRunning", false, v)
								--v:getModData().AudioLoop = "JukeboxRunning"
								--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)
								--v:getModData().CanYouHearTheLoop = "yes"
								
							--elseif v:getModData().CanYouHearTheLoop ~= nil and
							--v:getModData().CanYouHearTheLoop == "yes" then
							
							--else
								
							--emitterLoop:playSoundImpl("JukeboxRunning", false, v)
							--v:getModData().AudioLoop = "JukeboxRunning"
							--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)
						--	v:getModData().CanYouHearTheLoop = "yes"
							
							--end
						
						--else
						
						--emitterLoop:playSoundImpl("JukeboxRunning", false, v);--SOUND THAT WILL BE PLAYED (SOUND NAME, IF IS WORLDSOUND, ISOOJECT)
						--v:getModData().AudioLoop = "JukeboxRunning"
						--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)

						--end
					
					--elseif v:getModData().OnOff == "off" then
					
						--if v:getModData().AudioLoop ~= nil then
						
							--local audioLoop = v:getModData().AudioLoop
							
								--if v:getModData().CanYouHearTheLoop ~= nil and
								--v:getModData().CanYouHearTheLoop == "yes" then
									
									--emitterLoop:setVolumeAll(0)
									--emitterLoop:stopSoundByName("JukeboxRunning")
									--v:getModData().CanYouHearTheLoop = "no"
								--else
								--print("REMOVING EVENT")
								--emitterLoop:stopSoundByName("JukeboxRunning")
								--elseif v:getModData().CanYouHearTheLoop ~= nil and
								--v:getModData().CanYouHearTheLoop == "no" then
								
								--else
								
								--emitterLoop:setVolumeAll(0)
								--emitterLoop:stopSoundByName("JukeboxRunning")
								--v:getModData().CanYouHearTheLoop = "no"
								
					--			end
						
						--else
						
							--emitterLoop:playSoundImpl("JukeboxRunning", false, v);--SOUND THAT WILL BE PLAYED (SOUND NAME, IF IS WORLDSOUND, ISOOJECT)
							--v:getModData().AudioLoop = "JukeboxRunning"
							
						--end
					--end--OnOff
				
				--elseif playerObj and (playerObj:getX() >= v:getX() - 70 and playerObj:getX() <= v:getX() + 70 and
               -- playerObj:getY() >= v:getY() - 70 and playerObj:getY() <= v:getY() + 70) then 
				
						--if v:getModData().AudioLoop ~= nil then
						
							--local audioLoop = v:getModData().AudioLoop
							
								--if v:getModData().CanYouHearTheLoop ~= nil and
								--v:getModData().CanYouHearTheLoop == "yes" then
									
								--	emitterLoop:setVolumeAll(0)
								--	emitterLoop:stopSoundByName("JukeboxRunning")
								--	v:getModData().CanYouHearTheLoop = "no"
								--else
								--print("REMOVING EVENT")
								--emitterLoop:stopSoundByName("JukeboxRunning")
							--	elseif v:getModData().CanYouHearTheLoop ~= nil and
							--	v:getModData().CanYouHearTheLoop == "no" then
								
							--	else
								
							--	emitterLoop:setVolumeAll(0)
							--	emitterLoop:stopSoundByName("JukeboxRunning")
							--	v:getModData().CanYouHearTheLoop = "no"
								
								--end
						
						--else
						
							--emitterLoop:playSoundImpl("JukeboxRunning", false, v);--SOUND THAT WILL BE PLAYED (SOUND NAME, IF IS WORLDSOUND, ISOOJECT)
							--v:getModData().AudioLoop = "JukeboxRunning"
							
						--end
				
				end--range
			
			--else
			
			--v:getModData().OnOff = "off"
			
			--end--hasModData
			
			------------------------------------
			
					--if v:hasModData() and
					--v:getModData().JukeboxID ~= nil and
					--v:getModData().OnOff ~= nil then
					if v:getModData().Cell == nil then
					v:getModData().Cell = v:getCell()
					end
					if v:getModData().JukeBckpSquare == nil then
					v:getModData().JukeBckpSquare = (v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()))
					end					
					
					local JukeboxCell = v:getModData().Cell
					local JukeboxSquare = v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()) or v:getModData().JukeBckpSquare
					--v:transmitModData();

						if v:getModData().OnOff == "on" and
						playerObj and (playerObj:getX() >= v:getX() - 30 and playerObj:getX() <= v:getX() + 30 and
						playerObj:getY() >= v:getY() - 30 and playerObj:getY() <= v:getY() + 30) then
						
						
						local JukeboxLightOn = false
						local JukeboxLight


						if v:getModData().MainLight ~= nil then
						
							for i=0,JukeboxSquare:getObjects():size()-1 do
								local object = JukeboxSquare:getObjects():get(i);
				
								if object then
									if object:getName() == "JukeLight" then
										JukeboxLightOn = true
										JukeboxLight = object
									end
								end
							end

							if JukeboxSquare~=nil and JukeboxLightSprite ~= nil and JukeboxLightOn == false then
							JukeboxLight = IsoObject.new(JukeboxSquare, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							--JukeboxLight:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							v:getModData().MainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 75, 75, 0, 2)
							local JukeMainLight = v:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
							--v:transmitModData();
							end
						
						else
						
							JukeboxLight = IsoObject.new(JukeboxSquare, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							--JukeboxLight:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							v:getModData().MainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 75, 75, 0, 2)
							local JukeMainLight = v:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
						
						end
						else
						
							if JukeboxCell ~= nil and v:getModData().MainLight ~= nil then
							local JukeMainLight = v:getModData().MainLight
							JukeboxCell:removeLamppost(JukeMainLight)
							end
							if v:getModData().RGBLightOverlay ~= nil then
								local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
								JukeboxCell:removeLamppost(JukeRGBLightOverlay)
							end
							
							if JukeboxSquare~=nil and JukeboxLightSprite ~= nil then
								--for i=1,JukeboxSquare:getObjects():size()-1 do
								for i = JukeboxSquare:getObjects():size()-1, 1, -1 do
								local object = JukeboxSquare:getObjects():get(i);
				
									if object then
										if object:getName() == "JukeLight" then
											local JukeboxLightDelete = object
											--if Jukebox:getModData().AudioRunning ~= nil then
											--isJukeSendSong(v:getModData().JukeboxID, v:getModData().genre, v:getX(), v:getY(), v:getZ(), "stop")
											--end
											JukeboxSquare:RemoveTileObject(JukeboxLightDelete);
										end
									end
								end

								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object2 = JukeboxSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "JukePlayLight1" then
										local JukeboxPlayLight1Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight1Delete);
										end
									end
								end

								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object3 = JukeboxSquare:getObjects():get(i);
				
									if object3 then
										if object3:getName() == "JukePlayLight2" then
										local JukeboxPlayLight2Delete = object3
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight2Delete);
										end
									end
								end

								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object4 = JukeboxSquare:getObjects():get(i);
				
									if object4 then
										if object4:getName() == "JukePlayLightOverlay" then
										JukeboxPlayLightOverlayDelete = object4
										JukeboxSquare:RemoveTileObject(JukeboxPlayLightOverlayDelete);
										end
									end
								end
								

		--JukeboxLight = IsoObject.new(square, JukeboxLightSprite)
							end--STOP
							
						end--ONOFF

					if v:getModData().OnOff == "on" and
						playerObj and (playerObj:getX() >= v:getX() - 30 and playerObj:getX() <= v:getX() + 30 and
						playerObj:getY() >= v:getY() - 30 and playerObj:getY() <= v:getY() + 30) then
						if v:getModData().OnPlay ~= nil and
						v:getModData().OnPlay ~= "nothing" and
						v:getModData().genre ~= "JukeboxAfterTurnOn" then
							local JukeboxLightPlayOn1 = false
							local JukeboxLightPlayOn2 = false
							local JukeboxLightPlayOverlay = false
							for i=0,JukeboxSquare:getObjects():size()-1 do
								local object2 = JukeboxSquare:getObjects():get(i);
								local object3 = JukeboxSquare:getObjects():get(i);
				
								if object2 then
									if object2:getName() == "JukePlayLight1" then
									JukeboxLightPlayOn1 = true
									elseif object2:getName() == "JukePlayLight2" then
									JukeboxLightPlayOn2 = true
									
									end
								end
								if object3 then
									if object3:getName() == "JukePlayLightOverlay" then
									JukeboxLightPlayOverlay = true
									local JukeboxPlayLightOverlay = object3
										
										
										--if dontkillfpsStart2 >= dontkillfpscount2 and
										if v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 1 then
											--dontkillfpsStart2 = 0
											v:getModData().changecolor = 2
											JukeboxPlayLightOverlay:setCustomColor(0, 255, 0, 1)
											--JukeboxPlayLightOverlay:transmitModData();
											if v:getModData().RGBLightOverlay ~= nil then
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:removeLamppost(JukeRGBLightOverlay)
											end
											v:getModData().RGBLightOverlay = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 0, 75, 0, 3)
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:addLamppost(JukeRGBLightOverlay)
											
											--v:transmitModData();
											
										elseif v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 2 then
										
										v:getModData().changecolor = 3
											
										--elseif dontkillfpsStart2 >= dontkillfpscount2 and
										elseif v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 3 then
											--dontkillfpsStart2 = 0
											v:getModData().changecolor = 4
											JukeboxPlayLightOverlay:setCustomColor(0, 0, 255, 1)
											--JukeboxPlayLightOverlay:transmitModData();
											if v:getModData().RGBLightOverlay ~= nil then
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:removeLamppost(JukeRGBLightOverlay)
											end
											v:getModData().RGBLightOverlay = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 0, 0, 75, 3)
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:addLamppost(JukeRGBLightOverlay)
											
											--v:transmitModData();
											
										elseif v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 4 then
										
										v:getModData().changecolor = 5
											
										--elseif dontkillfpsStart2 >= dontkillfpscount2 then
										elseif v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 5 then
											--dontkillfpsStart2 = 0
											v:getModData().changecolor = 0
											JukeboxPlayLightOverlay:setCustomColor(255, 0, 0, 1)
											--JukeboxPlayLightOverlay:transmitModData();
											if v:getModData().RGBLightOverlay ~= nil then
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:removeLamppost(JukeRGBLightOverlay)
											end
											v:getModData().RGBLightOverlay = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 75, 0, 0, 3)
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:addLamppost(JukeRGBLightOverlay)
											
										elseif v:getModData().changecolor ~= nil and
										v:getModData().changecolor == 0 then
										
										v:getModData().changecolor = 1
											
										else
										
											--dontkillfpsStart2 = 0
											v:getModData().changecolor = 1
											JukeboxPlayLightOverlay:setCustomColor(255, 0, 0, 1)
											--JukeboxPlayLightOverlay:transmitModData();
											if v:getModData().RGBLightOverlay ~= nil then
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:removeLamppost(JukeRGBLightOverlay)
											end
											v:getModData().RGBLightOverlay = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 75, 0, 0, 3)
											local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
											JukeboxCell:addLamppost(JukeRGBLightOverlay)
											
											--v:transmitModData();
											
										end
									end
								end
							end

							if JukeboxSquare~=nil and JukeboxLightSpritePlayOverlay ~= nil and JukeboxLightPlayOverlay == false then
							local JukeboxPlayLightOverlay = IsoObject.new(JukeboxSquare, JukeboxLightSpritePlayOverlay)
							JukeboxPlayLightOverlay:setName("JukePlayLightOverlay")
							--JukeboxPlayLightOverlay:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxPlayLightOverlay)
							JukeboxLightPlayOverlay = true

							end



							if JukeboxSquare~=nil and JukeboxLightSpritePlay1 ~= nil and JukeboxLightPlayOn1 == false and JukeboxLightPlayOn2 == false then
							local JukeboxPlayLight1 = IsoObject.new(JukeboxSquare, JukeboxLightSpritePlay1)
							JukeboxPlayLight1:setName("JukePlayLight1")
							if v:getModData().Style == "disco" or v:getModData().Style == "cdisco" then
							JukeboxPlayLight1:setCustomColor(150, 150, 0, 1)
							elseif v:getModData().Style == "metal" or v:getModData().Style == "cmetal" then
							JukeboxPlayLight1:setCustomColor(255, 0, 0, 1)
							elseif v:getModData().Style == "salsa" or v:getModData().Style == "csalsa" then
							JukeboxPlayLight1:setCustomColor(0, 255, 0, 1)
							end
							--JukeboxPlayLight1:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxPlayLight1)
							--isJukeRunning = getSoundManager():PlayWorldSound("JukeboxRunning", v:getSquare(), 3, 30, 0.5, false);
							--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)
							JukeboxLightPlayOn1 = true
							
							
							elseif JukeboxSquare~=nil and JukeboxLightSpritePlay2 ~= nil and JukeboxLightPlayOn1 == true and JukeboxLightPlayOn2 == false then
							
								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object2 = JukeboxSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "JukePlayLight1" then
										local JukeboxPlayLight1Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight1Delete);
										end
									end
								end
							
							local JukeboxPlayLight2 = IsoObject.new(JukeboxSquare, JukeboxLightSpritePlay2)
							JukeboxPlayLight2:setName("JukePlayLight2")
							if v:getModData().Style == "disco" or v:getModData().Style == "cdisco" then
							JukeboxPlayLight2:setCustomColor(150, 150, 0, 1)
							elseif v:getModData().Style == "metal" or v:getModData().Style == "cmetal" then
							JukeboxPlayLight2:setCustomColor(255, 0, 0, 1)
							elseif v:getModData().Style == "salsa" or v:getModData().Style == "csalsa" then
							JukeboxPlayLight2:setCustomColor(0, 255, 0, 1)
							end
							--JukeboxPlayLight2:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxPlayLight2)
							--isJukeRunning = getSoundManager():PlayWorldSound("JukeboxRunning", v:getSquare(), 3, 30, 0.5, false);
							--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)
							JukeboxLightPlayOn2 = true
							JukeboxLightPlayOn1 = false
							
							elseif JukeboxSquare~=nil and JukeboxLightSpritePlay1 ~= nil and JukeboxLightPlayOn2 == true and JukeboxLightPlayOn1 == false then
							
								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object2 = JukeboxSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "JukePlayLight2" then
										local JukeboxPlayLight2Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight2Delete);
										end
									end
								end
							
							local JukeboxPlayLight1 = IsoObject.new(JukeboxSquare, JukeboxLightSpritePlay1)
							JukeboxPlayLight1:setName("JukePlayLight1")
							if v:getModData().Style == "disco" or v:getModData().Style == "cdisco" then
							JukeboxPlayLight1:setCustomColor(150, 150, 0, 1)
							elseif v:getModData().Style == "metal" or v:getModData().Style == "cmetal" then
							JukeboxPlayLight1:setCustomColor(255, 0, 0, 1)
							elseif v:getModData().Style == "salsa" or v:getModData().Style == "csalsa" then
							JukeboxPlayLight1:setCustomColor(0, 255, 0, 1)
							end
							--JukeboxPlayLight1:transmitModData();
							JukeboxSquare:AddTileObject(JukeboxPlayLight1)
							--isJukeRunning = getSoundManager():PlayWorldSound("JukeboxRunning", v:getSquare(), 3, 30, 0.5, false);
							--addSound(v, v:getX(), v:getY(), v:getZ(), 30, 10)
							JukeboxLightPlayOn2 = false
							JukeboxLightPlayOn1 = true
							
							end
					
						elseif v:getModData().OnPlay ~= nil and
						v:getModData().OnPlay == "nothing" then
						
								for i=0,JukeboxSquare:getObjects():size()-1 do
								local object2 = JukeboxSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "JukePlayLight1" then
										local JukeboxPlayLight1Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight1Delete);
										end
										if object2:getName() == "JukePlayLight2" then
										local JukeboxPlayLight2Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight2Delete);
										end
									end
								end
						
						elseif v:getModData().OnPlay ~= nil and
						v:getModData().OnPlay ~= "nothing" and
						v:getModData().genre == "JukeboxAfterTurnOn" then
						
							if v:getModData().RGBLightOverlay ~= nil then
								local JukeRGBLightOverlay = v:getModData().RGBLightOverlay
								JukeboxCell:removeLamppost(JukeRGBLightOverlay)
							end
						
							--for i=1,JukeboxSquare:getObjects():size()-1 do
							for i = JukeboxSquare:getObjects():size()-1, 1, -1 do
								local object2 = JukeboxSquare:getObjects():get(i);
								local object3 = JukeboxSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "JukePlayLight1" then
										local JukeboxPlayLight1Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight1Delete);
										end
										if object2:getName() == "JukePlayLight2" then
										local JukeboxPlayLight2Delete = object2
										JukeboxSquare:RemoveTileObject(JukeboxPlayLight2Delete);
										end
										if object3:getName() == "JukePlayLightOverlay" then
										local JukeboxPlayLightOverlayDelete = object3
										JukeboxSquare:RemoveTileObject(JukeboxPlayLightOverlayDelete);
										end
									end
							end
						
						
						end
						end--ONOFF			

					else
						--v:getModData().JukeboxID = {(tostring(v:getX()) .. "," .. tostring(v:getY()) .. "," .. tostring(v:getZ()))};
						--v:getModData().OnOff = {"off"};
						--v:transmitModData();

					end--HASMODDATA
			
			
			
			
			
			----------------------
			
			
		end--for
		
	end--jukelist
	

	end--justasecond

	else
	--	Events.OnTick.Remove(OnJukeboxTickStart)
	end
end



function startJukeboxTick ()
    --Events.OnTick.Add(OnRenderTickClientCheckJukebox)
	Events.OnTick.Add(OnJukeboxTickStart)
	--Events.OnTick.Add(OnDiscoTickStart)
	--Events.OnTick.Add(checkNearbyJukeboxes)
end

Events.OnGameStart.Add(startJukeboxTick)
