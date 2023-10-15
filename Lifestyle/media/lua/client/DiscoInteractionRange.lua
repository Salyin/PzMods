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

local Discojustalittlesecond = 50
local Discojustalittlesecondstart = 0

function OnDiscoTickStart(player, worldobjects, x, y, test)

	local discolist = require("ListDisco")

	local playerObj = getPlayer()
	if playerObj ~= nil then

	Discojustalittlesecondstart = Discojustalittlesecondstart + 1
    --dontkillfpsStart2 = dontkillfpsStart2 + 1

	if Discojustalittlesecondstart % Discojustalittlesecond == 0 then
	
	Discojustalittlesecondstart = 0

	local JukeboxLightSprite = "LS_JukeboxLight_A_1"
	local JukeboxLightSpritePlay1 = "LS_JukeboxLight_A_2"
	local JukeboxLightSpritePlay2 = "LS_JukeboxLight_A_3"
	local JukeboxLightSpritePlayOverlay = "LS_JukeboxLight_A_4"
	local DiscoBallLightSprite1 = "LS_Discoball_1"
	local DiscoBallLightSprite2 = "LS_Discoball_2"
	local DiscoBallLightSprite3 = "LS_Discoball_3"
	local DiscoBallLightSprite4 = "LS_Discoball_4"

            if #discolist > 0 then
			
                for i,v in ipairs(discolist) do
				
					if v:hasModData() and
					v:getModData().OnOff ~= nil then
					
					---
						if v:getModData().OnOff == "on" and
						v:getModData().DiscoBckpSquare ~= nil then
							--print("CONDITIONS WORK")
							local Dsqr = v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()) or v:getModData().DiscoBckpSquare
							local DiscoBall

							for i=0,Dsqr:getObjects():size()-1 do
								local thisObject = Dsqr:getObjects():get(i)	
							--for i=1,Dsqr:getObjects():size() do
								--local thisObject = Dsqr:getObjects():get(i-1)

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
							--print("TURNING OFF JUKEBOX")
							v:getModData().OnOff = "off"
						end
						
						---ELECTRICITY
						if DiscoBall then
							if not ((SandboxVars.ElecShutModifier > -1 and
							GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
							DiscoBall:getSquare():haveElectricity()) then
								--print("DiscoBall is off no electricity")
								v:getModData().OnOff = "off"
							end
						end
						---
					end
				---
					
					if v:getModData().Cell == nil then
					v:getModData().Cell = v:getCell()
					end
					if v:getModData().DiscoBckpSquare == nil then
					v:getModData().DiscoBckpSquare = (v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()))
					end					
					
					local playerObj = getPlayer()
					--v:getModData().Cell = v:getCell()
					--v:transmitModData();
					local DiscoBallCell = v:getModData().Cell
					local DiscoBallSquare = v:getCell():getGridSquare(v:getX(), v:getY(), v:getZ()) or v:getModData().DiscoBckpSquare

						if v:getModData().OnOff == "on" and
						playerObj and (playerObj:getX() >= v:getX() - 30 and playerObj:getX() <= v:getX() + 30 and
						playerObj:getY() >= v:getY() - 30 and playerObj:getY() <= v:getY() + 30) then
							
							if v:getModData().MainLight ~= nil and
							v:getModData().BallMainLight ~= nil then
								if playerObj:getModData().ActiveDiscoBallNearby == false then
									playerObj:getModData().ActiveDiscoBallNearby = true
								end
							local DiscoMainLight = v:getModData().MainLight
							local DiscoBallMainLight = v:getModData().BallMainLight
							
								if DiscoMainLight == 0 then
								
									if v:getModData().Mode == "default" then
									
									DiscoBallCell:removeLamppost(DiscoBallMainLight)
									v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 255, 0, 255, 2)
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallCell:addLamppost(DiscoBallMainLight)
									v:getModData().MainLight = 1
									--v:transmitModData();
									
									elseif v:getModData().Mode == "valentine" then
									
									DiscoBallCell:removeLamppost(DiscoBallMainLight)
									v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 0, 110, 2)
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallCell:addLamppost(DiscoBallMainLight)
									v:getModData().MainLight = 1
									--v:transmitModData();
									
									end
								
								elseif DiscoMainLight == 1 then
								
									if v:getModData().Mode == "default" then
								
								DiscoBallCell:removeLamppost(DiscoBallMainLight)
								v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 200, 200, 3)
								DiscoBallMainLight = v:getModData().BallMainLight
								DiscoBallCell:addLamppost(DiscoBallMainLight)
								v:getModData().MainLight = 2
								--v:transmitModData();
								
									elseif v:getModData().Mode == "valentine" then
									
									DiscoBallCell:removeLamppost(DiscoBallMainLight)
									v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 0, 110, 3)
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallCell:addLamppost(DiscoBallMainLight)
									v:getModData().MainLight = 2
									--v:transmitModData();
									
									end
								
								elseif DiscoMainLight == 2 then
								
									if v:getModData().Mode == "default" then
								
								DiscoBallCell:removeLamppost(DiscoBallMainLight)
								v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 0, 200, 255, 2)
								DiscoBallMainLight = v:getModData().BallMainLight
								DiscoBallCell:addLamppost(DiscoBallMainLight)
								v:getModData().MainLight = 3
								--v:transmitModData();
								
									elseif v:getModData().Mode == "valentine" then
									
									DiscoBallCell:removeLamppost(DiscoBallMainLight)
									v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 0, 110, 2)
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallCell:addLamppost(DiscoBallMainLight)
									v:getModData().MainLight = 3
									--v:transmitModData();
									
									end
								
								elseif DiscoMainLight == 3 then
								
									if v:getModData().Mode == "default" then
								
								DiscoBallCell:removeLamppost(DiscoBallMainLight)
								v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 200, 200, 3)
								DiscoBallMainLight = v:getModData().BallMainLight
								DiscoBallCell:addLamppost(DiscoBallMainLight)
								v:getModData().MainLight = 0
								--v:transmitModData();
								
									elseif v:getModData().Mode == "valentine" then
									
									DiscoBallCell:removeLamppost(DiscoBallMainLight)
									v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 0, 110, 3)
									DiscoBallMainLight = v:getModData().BallMainLight
									DiscoBallCell:addLamppost(DiscoBallMainLight)
									v:getModData().MainLight = 0
									--v:transmitModData();
									
									end
								
								end
							
							
							else
								if v:getModData().Mode == "default" then
								v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 255, 0, 255, 2)
								local DiscoBallMainLight = v:getModData().BallMainLight
								DiscoBallCell:addLamppost(DiscoBallMainLight)
								v:getModData().MainLight = 1
								--v:transmitModData();
								elseif v:getModData().Mode == "valentine" then
								v:getModData().BallMainLight = IsoLightSource.new(v:getX(), v:getY(), v:getZ(), 200, 0, 110, 2)
								local DiscoBallMainLight = v:getModData().BallMainLight
								DiscoBallCell:addLamppost(DiscoBallMainLight)
								v:getModData().MainLight = 1
								--v:transmitModData();
								end
							end

						elseif DiscoBallCell ~= nil and v:getModData().BallMainLight ~= nil then
							local DiscoBallMainLight = v:getModData().BallMainLight
							DiscoBallCell:removeLamppost(DiscoBallMainLight)
							v:getModData().MainLight = 0
							--v:transmitModData();
							
						end--ONOFF

					if v:getModData().OnOff == "on" and
						playerObj and (playerObj:getX() >= v:getX() - 30 and playerObj:getX() <= v:getX() + 30 and
						playerObj:getY() >= v:getY() - 30 and playerObj:getY() <= v:getY() + 30) then
							
							
							if v:getModData().DiscoBallRGBLight ~= nil then									
							local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
							local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
							local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
							local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
							local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
							local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
							local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
							local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
							end
							if v:getModData().DiscoBallRGBLightA1 ~= nil then
							local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
							end
							
							for i=0,DiscoBallSquare:getObjects():size()-1 do
								local object2 = DiscoBallSquare:getObjects():get(i);
				
								if object2 then
									if object2:getName() == "DiscoLight1" then
									v:getModData().BallColorChange = 1
									local DiscoBallColorChange = v:getModData().BallColorChange
									local DiscoBallTurnedOnDelete = object2
									DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										--if DiscoBallRGBLight ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
										--end
										--if DiscoBallRGBLightA1 ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
										--end
									elseif object2:getName() == "DiscoLight2" then
									v:getModData().BallColorChange = 2
									local DiscoBallColorChange = v:getModData().BallColorChange
									local DiscoBallTurnedOnDelete = object2
									DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										--if DiscoBallRGBLight ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
										--end
										--if DiscoBallRGBLightA1 ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
										--end
									elseif object2:getName() == "DiscoLight3" then
									v:getModData().BallColorChange = 3
									local DiscoBallColorChange = v:getModData().BallColorChange
									local DiscoBallTurnedOnDelete = object2
									DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										--if DiscoBallRGBLight ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
										--end
										--if DiscoBallRGBLightA1 ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
										--end
									elseif object2:getName() == "DiscoLight4" then
									v:getModData().BallColorChange = 0
									local DiscoBallColorChange = v:getModData().BallColorChange
									local DiscoBallTurnedOnDelete = object2
									DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										--if DiscoBallRGBLight ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
										--end
										--if DiscoBallRGBLightA1 ~= nil then
										--	DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
										--end
									end
									--v:transmitModData();
								else
									v:getModData().BallColorChange = 0
									local DiscoBallColorChange = v:getModData().BallColorChange
									--if DiscoBallRGBLight ~= nil then
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
									--	DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
									--	if DiscoBallRGBLightA1 ~= nil then
									--		DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
									--	end
									--end
								--v:transmitModData();
								end
							end--for
							
							if v:getModData().BallColorChange ~= nil then
							local DiscoBallColorChange = v:getModData().BallColorChange
							else
							v:getModData().BallColorChange = 0
							local DiscoBallColorChange = v:getModData().BallColorChange
							--v:transmitModData();
							end
							
							--if DiscoBallSquare ~= nil then
							--print("DiscoBallSquare is not nil")
							--end
							--if DiscoBallLightSprite1 ~= nil then
							--print("DiscoBallLightSprite1 is not nil")
							--end
							--if DiscoBallColorChange == 0 then
							--print("DiscoBallColorChange is 0")
							--end
							--if v:getModData().BallColorChange == 0 then
							--print("v:getModData().BallColorChange is 0")
							--end
							
							if v:getModData().DiscoBallRGBLight ~= nil then
							local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
							DiscoBallCell:removeLamppost(DiscoBallRGBLight)
							v:getModData().DiscoBallRGBLight = nil
							end
							if v:getModData().DiscoBallRGBLight2 ~= nil then
							local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
							DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
							v:getModData().DiscoBallRGBLight2 = nil
							end
							if v:getModData().DiscoBallRGBLight3 ~= nil then
							local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
							DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
							v:getModData().DiscoBallRGBLight3 = nil
							end
							if v:getModData().DiscoBallRGBLight4 ~= nil then
							local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
							DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
							v:getModData().DiscoBallRGBLight4 = nil
							end
							if v:getModData().DiscoBallRGBLight5 ~= nil then
							local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
							DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
							v:getModData().DiscoBallRGBLight5 = nil
							end
							if v:getModData().DiscoBallRGBLight6 ~= nil then
							local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
							DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
							v:getModData().DiscoBallRGBLight6 = nil
							end
							if v:getModData().DiscoBallRGBLight7 ~= nil then
							local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
							DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
							v:getModData().DiscoBallRGBLight7 = nil
							end
							if v:getModData().DiscoBallRGBLight8 ~= nil then
							local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
							DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
							v:getModData().DiscoBallRGBLight8 = nil
							end
							if v:getModData().DiscoBallRGBLightA1 ~= nil then
							local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
							DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
							v:getModData().DiscoBallRGBLightA1 = nil
							end
							
							--v:transmitModData();	
							
							
							if DiscoBallSquare~=nil and DiscoBallLightSprite1 ~= nil and v:getModData().BallColorChange == 0 then
							local DiscoBallTurnedOn = IsoObject.new(DiscoBallSquare, DiscoBallLightSprite1)
							DiscoBallTurnedOn:setName("DiscoLight1")
							--DiscoBallTurnedOn:transmitModData();
							DiscoBallSquare:AddTileObject(DiscoBallTurnedOn)
							
							
								if v:getModData().Mode == "default" then
							
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()+2, v:getY()-3, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()+6, v:getY()+1, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-5, v:getY()+3, v:getZ(), 50, 50, 50, 2)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()+6, v:getY()-2, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()+3, v:getY()+5, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()+4, v:getY()+6, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()-3, v:getY()-1, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()-2, v:getY()-2, v:getZ(), 50, 50, 50, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								--v:transmitModData();
								
								elseif v:getModData().Mode == "valentine" then
								
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-1, v:getY()+1, v:getZ(), 200, 0, 110, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()-1, v:getY()-1, v:getZ(), 200, 0, 110, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-3, v:getY()+2, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()-2, v:getY()+3, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()-3, v:getY()-2, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()-2, v:getY()-3, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+1, v:getY()-1, v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()+1, v:getY()+1, v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								v:getModData().DiscoBallRGBLightA1 = IsoLightSource.new(v:getX()+2, v:getY(), v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
								DiscoBallCell:addLamppost(DiscoBallRGBLightA1)
								
								--v:transmitModData();
								
								end
							
							elseif DiscoBallSquare~=nil and DiscoBallLightSprite2 ~= nil and v:getModData().BallColorChange == 1 then
							local DiscoBallTurnedOn = IsoObject.new(DiscoBallSquare, DiscoBallLightSprite2)
							DiscoBallTurnedOn:setName("DiscoLight2")
							--DiscoBallTurnedOn:transmitModData();
							DiscoBallSquare:AddTileObject(DiscoBallTurnedOn)

								if v:getModData().Mode == "default" then

								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-3, v:getY()-1, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()+4, v:getY()+3, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()+2, v:getY()-6, v:getZ(), 50, 50, 0, 2)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()+1, v:getY()+5, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()-4, v:getY()+1, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()-5, v:getY()+3, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+1, v:getY()+4, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()+5, v:getY()-4, v:getZ(), 0, 50, 50, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								--v:transmitModData();

								elseif v:getModData().Mode == "valentine" then
								
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-1, v:getY()+1, v:getZ(), 200, 0, 110, 3)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()-1, v:getY()-1, v:getZ(), 200, 0, 110, 3)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-3, v:getY()+2, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()-2, v:getY()+3, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()-3, v:getY()-2, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()-2, v:getY()-3, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+1, v:getY()-1, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()+1, v:getY()+1, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								v:getModData().DiscoBallRGBLightA1 = IsoLightSource.new(v:getX()+2, v:getY(), v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
								DiscoBallCell:addLamppost(DiscoBallRGBLightA1)
								
								--v:transmitModData();
								
								end

							elseif DiscoBallSquare~=nil and DiscoBallLightSprite3 ~= nil and v:getModData().BallColorChange == 2 then
							local DiscoBallTurnedOn = IsoObject.new(DiscoBallSquare, DiscoBallLightSprite3)
							DiscoBallTurnedOn:setName("DiscoLight3")
							--DiscoBallTurnedOn:transmitModData();
							DiscoBallSquare:AddTileObject(DiscoBallTurnedOn)
							
								if v:getModData().Mode == "default" then
							
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-3, v:getY()+2, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()+1, v:getY()+6, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()+3, v:getY()-5, v:getZ(), 50, 50, 0, 2)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()-2, v:getY()+6, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()+5, v:getY()+3, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()+6, v:getY()+4, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()-1, v:getY()-3, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()-2, v:getY()-2, v:getZ(), 0, 50, 50, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								--v:transmitModData();
							
								elseif v:getModData().Mode == "valentine" then
								
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-1, v:getY()+1, v:getZ(), 200, 0, 110, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()-1, v:getY()-1, v:getZ(), 200, 0, 110, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-3, v:getY()+2, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()-2, v:getY()+3, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()-3, v:getY()-2, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()-2, v:getY()-3, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+1, v:getY()-1, v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()+1, v:getY()+1, v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								v:getModData().DiscoBallRGBLightA1 = IsoLightSource.new(v:getX()+2, v:getY(), v:getZ(), 150, 0, 0, 2)
								local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
								DiscoBallCell:addLamppost(DiscoBallRGBLightA1)
								
								--v:transmitModData();
								
								end
							
							elseif DiscoBallSquare~=nil and DiscoBallLightSprite4 ~= nil and v:getModData().BallColorChange == 3 then
							local DiscoBallTurnedOn = IsoObject.new(DiscoBallSquare, DiscoBallLightSprite4)
							DiscoBallTurnedOn:setName("DiscoLight4")
							--DiscoBallTurnedOn:transmitModData();
							DiscoBallSquare:AddTileObject(DiscoBallTurnedOn)
								
								if v:getModData().Mode == "default" then
								
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-1, v:getY()-3, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()+3, v:getY()+4, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-6, v:getY()+2, v:getZ(), 50, 50, 0, 2)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()+5, v:getY()+1, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()+1, v:getY()-4, v:getZ(), 0, 75, 0, 2)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()+3, v:getY()-5, v:getZ(), 75, 0, 0, 2)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+4, v:getY()+1, v:getZ(), 0, 0, 75, 2)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()-4, v:getY()+5, v:getZ(), 0, 50, 50, 2)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								--v:transmitModData();
								
								elseif v:getModData().Mode == "valentine" then
								
								v:getModData().DiscoBallRGBLight = IsoLightSource.new(v:getX()-1, v:getY()+1, v:getZ(), 200, 0, 110, 3)
								local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
								DiscoBallCell:addLamppost(DiscoBallRGBLight)
								v:getModData().DiscoBallRGBLight2 = IsoLightSource.new(v:getX()-1, v:getY()-1, v:getZ(), 200, 0, 110, 3)
								local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
								DiscoBallCell:addLamppost(DiscoBallRGBLight2)
								v:getModData().DiscoBallRGBLight3 = IsoLightSource.new(v:getX()-3, v:getY()+2, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
								DiscoBallCell:addLamppost(DiscoBallRGBLight3)
								v:getModData().DiscoBallRGBLight4 = IsoLightSource.new(v:getX()-2, v:getY()+3, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
								DiscoBallCell:addLamppost(DiscoBallRGBLight4)
								v:getModData().DiscoBallRGBLight5 = IsoLightSource.new(v:getX()-3, v:getY()-2, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
								DiscoBallCell:addLamppost(DiscoBallRGBLight5)
								v:getModData().DiscoBallRGBLight6 = IsoLightSource.new(v:getX()-2, v:getY()-3, v:getZ(), 150, 0, 0, 4)
								local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
								DiscoBallCell:addLamppost(DiscoBallRGBLight6)
								v:getModData().DiscoBallRGBLight7 = IsoLightSource.new(v:getX()+1, v:getY()-1, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
								DiscoBallCell:addLamppost(DiscoBallRGBLight7)
								v:getModData().DiscoBallRGBLight8 = IsoLightSource.new(v:getX()+1, v:getY()+1, v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
								DiscoBallCell:addLamppost(DiscoBallRGBLight8)
								
								v:getModData().DiscoBallRGBLightA1 = IsoLightSource.new(v:getX()+2, v:getY(), v:getZ(), 150, 0, 0, 3)
								local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
								DiscoBallCell:addLamppost(DiscoBallRGBLightA1)
								
								--v:transmitModData();
								
								end
								
							end
					
						
						
						else
						
						
							if v:getModData().DiscoBallRGBLight ~= nil then
							local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
							DiscoBallCell:removeLamppost(DiscoBallRGBLight)
							v:getModData().DiscoBallRGBLight = nil
							end
							if v:getModData().DiscoBallRGBLight2 ~= nil then
							local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
							DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
							v:getModData().DiscoBallRGBLight2 = nil
							end
							if v:getModData().DiscoBallRGBLight3 ~= nil then
							local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
							DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
							v:getModData().DiscoBallRGBLight3 = nil
							end
							if v:getModData().DiscoBallRGBLight4 ~= nil then
							local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
							DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
							v:getModData().DiscoBallRGBLight4 = nil
							end
							if v:getModData().DiscoBallRGBLight5 ~= nil then
							local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
							DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
							v:getModData().DiscoBallRGBLight5 = nil
							end
							if v:getModData().DiscoBallRGBLight6 ~= nil then
							local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
							DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
							v:getModData().DiscoBallRGBLight6 = nil
							end
							if v:getModData().DiscoBallRGBLight7 ~= nil then
							local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
							DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
							v:getModData().DiscoBallRGBLight7 = nil
							end
							if v:getModData().DiscoBallRGBLight8 ~= nil then
							local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
							DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
							v:getModData().DiscoBallRGBLight8 = nil
							end
							if v:getModData().DiscoBallRGBLightA1 ~= nil then
							local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
							DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
							v:getModData().DiscoBallRGBLightA1 = nil
							end
							
							--v:transmitModData();	
							
							if DiscoBallSquare ~= nil then
							for i = DiscoBallSquare:getObjects():size()-1, 1, -1 do
							--for i=0,DiscoBallSquare:getObjects():size()-1 do
								
								
							if v:getModData().DiscoBallRGBLight ~= nil then									
							local DiscoBallRGBLight = v:getModData().DiscoBallRGBLight
							local DiscoBallRGBLight2 = v:getModData().DiscoBallRGBLight2
							local DiscoBallRGBLight3 = v:getModData().DiscoBallRGBLight3
							local DiscoBallRGBLight4 = v:getModData().DiscoBallRGBLight4
							local DiscoBallRGBLight5 = v:getModData().DiscoBallRGBLight5
							local DiscoBallRGBLight6 = v:getModData().DiscoBallRGBLight6
							local DiscoBallRGBLight7 = v:getModData().DiscoBallRGBLight7
							local DiscoBallRGBLight8 = v:getModData().DiscoBallRGBLight8
							end
							if v:getModData().DiscoBallRGBLightA1 ~= nil then
							local DiscoBallRGBLightA1 = v:getModData().DiscoBallRGBLightA1
							end

									local object2 = DiscoBallSquare:getObjects():get(i);
				
									if object2 then
										if object2:getName() == "DiscoLight1" then
											v:getModData().BallColorChange = 0
											local DiscoBallColorChange = v:getModData().BallColorChange
											local DiscoBallTurnedOnDelete = object2
												if DiscoBallRGBLight ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLight)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
												end
												if DiscoBallRGBLightA1 ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
												end
											DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										elseif object2:getName() == "DiscoLight2" then
											v:getModData().BallColorChange = 0
											local DiscoBallColorChange = v:getModData().BallColorChange
											local DiscoBallTurnedOnDelete = object2
												if DiscoBallRGBLight ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLight)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
												end
												if DiscoBallRGBLightA1 ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
												end
											DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										elseif object2:getName() == "DiscoLight3" then
											v:getModData().BallColorChange = 0
											local DiscoBallColorChange = v:getModData().BallColorChange
											local DiscoBallTurnedOnDelete = object2
												if DiscoBallRGBLight ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLight)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
												end
												if DiscoBallRGBLightA1 ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
												end
											DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										elseif object2:getName() == "DiscoLight4" then
											v:getModData().BallColorChange = 0
											local DiscoBallColorChange = v:getModData().BallColorChange
											local DiscoBallTurnedOnDelete = object2
												if DiscoBallRGBLight ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLight)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight2)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight3)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight4)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight5)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight6)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight7)
													DiscoBallCell:removeLamppost(DiscoBallRGBLight8)
												end
												if DiscoBallRGBLightA1 ~= nil then
													DiscoBallCell:removeLamppost(DiscoBallRGBLightA1)
												end
											DiscoBallSquare:RemoveTileObject(DiscoBallTurnedOnDelete);
										end
										--v:transmitModData();
									end
								end--for
							end--ifdiscoballsquare

						end--ONOFF			

					else
						--v:getModData().DiscoBallID = {(tostring(v:getX()) .. "," .. tostring(v:getY()) .. "," .. tostring(v:getZ()))};
						--v:getModData().OnOff = {"off"};
						--v:transmitModData();

					end--HASMODDATA
				
				end
			end
	
	end--justasecond

	else
	--	Events.OnTick.Remove(OnJukeboxTickStart)
	end
end

--local justalittlesecond2 = 200
--local justalittlesecondstart2 = 0

function startDiscoTick ()
    --Events.OnTick.Add(OnRenderTickClientCheckJukebox)
	--Events.OnTick.Add(OnJukeboxTickStart)
	Events.OnTick.Add(OnDiscoTickStart)
	--Events.OnTick.Add(checkNearbyJukeboxes)
end

Events.OnGameStart.Add(startDiscoTick)
