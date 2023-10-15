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

function PlayerIsListeningToDJ(DJlistener, SourceMusiclvl, SourceDJ, SourceIsDJ)

	local SourceDJIsplaying
	local SourceDJMusiclvl = SourceMusiclvl
	SourceDJIsplaying = SourceIsDJ

	if (DJlistener:hasModData()) and
	SourceDJIsplaying == true then

	DJlistener:getModData().SourceDJName = SourceDJ
	DJlistener:getModData().IsListeningToDJ = true

		if (DJlistener:getModData().PlayingInstrument ~= nil) and
		(DJlistener:getModData().PlayingInstrument == false) and
		(DJlistener:getModData().IsListeningToDJ ~= nil) and
		(DJlistener:getModData().IsListeningToDJ == true) and not
		--(DJlistener:getModData().WantsToDance ~= nil) and
		--(DJlistener:getModData().WantsToDance == true) and
		--(DJlistener:getPrimaryHandItem() == nil) and
		--(DJlistener:getSecondaryHandItem() == nil) and
		--(DJlistener:getCurrentState():equals(IdleState.instance())) and not
		--DJlistener:isSitOnGround()) and not
		DJlistener:isSneaking() and not
		DJlistener:isRunning() and not
		--DJlistener:isPerformingAnAction() and not
		DJlistener:isSprinting() then

			if (DJlistener:getCurrentState():equals(IdleState.instance())) and
			(DJlistener:getPrimaryHandItem() == nil) and
			(DJlistener:getSecondaryHandItem() == nil) and not
			(DJlistener:getModData().IsDancingInit) and not
			(DJlistener:isPerformingAnAction()) and not
			(DJlistener:isSitOnGround()) then
				DJlistener:getModData().IsDancingInit = true
				--local PlayerIsDancingToMusic = require("TimedActions/PlayerIsDancingToMusic")
				--local player = DJlistener
				--local actionType = "Bob_PreDancingDefault"
				--ISTimedActionQueue.add(PlayerIsDancingToMusic:new(player, actionType));
			end
			--if not (DJlistener:getModData().IsDancingFull) then
			PlayerIsListeningToMusic(DJlistener, SourceDJMusiclvl)
			--end
		end

	elseif (DJlistener:hasModData()) and
	SourceDJIsplaying == false then

	DJlistener:getModData().IsListeningToDJ = false
	DJlistener:getModData().SourceDJName = "nodj"
	end
end

function PlayerIsListeningToMusic(listener, SourceMusiclvl)
	
		--print("function was called trying to apply effects")
	
	    if (listener:hasModData()) and
		(listener:getModData().PlayingInstrument ~= nil) and
		(listener:getModData().PlayingDJBooth ~= nil) and
		(listener:getModData().PlayingInstrument == false) and
		(listener:getModData().PlayingDJBooth == false) then

		if listener:getVehicle() then 
			return
		end

		getSoundManager():setMusicVolume(0)
		listener:getModData().VanillaMusicResume = listener:getModData().VanillaMusicResume + 1

		local characterData = listener:getModData()
		local HaloCounter = characterData.HaloCooldownCounter
		
				-- local defs - NOTE: Each real minute of consecutive song playing will do a pass on the following stat changes 25 times on average
				    local inventory = listener:getInventory()	
	                local it = inventory:getItems();
					local bodyDamage = listener:getBodyDamage()
					local initialBoredom = bodyDamage:getBoredomLevel()
					local initialUnhappiness = bodyDamage:getUnhappynessLevel()
					local initialStress = listener:getStats():getStress()
					local HasEarProtection = 1
					local SongQuality = ((SourceMusiclvl + 1) * 0.2)
					local args = { id=listener:getOnlineID() }
				--
					local color = HaloTextHelper.getColorGreen();
					local doArrow = 0;

					
				-- jukebox stuff
				local NoBooing = false
				if (listener:getModData().IsListeningToJukebox ~= nil) and
				(listener:getModData().IsListeningToJukebox == true) then
				
				NoBooing = true
				
				end
	-- authentic Z replaces the vanilla ear protectors with their own identical version, so we use this to guarantee compatibility:
	--local AuthenticZCompat = false
--	if getActivatedMods():contains('Authentic Z - Current') or getActivatedMods():contains('AuthenticZLite') then
--		AuthenticZCompat = true
--	end

		            for j = 0, it:size()-1 do
			            local item = it:get(j);
			            if item:getType() == "Hat_EarMuff_Protectors" or item:getType() == "Hat_EarMuffs" or item:getType() == "Hat_CrashHelmetFULL" or item:getType() == "Hat_EarMuff_Protectors_AZ" or item:getType() == "Authentic_Headphones" or item:getType() == "Authentic_Headphones2" or item:getType() == "Authentic_Headphones3" or item:getType() == "Authentic_Headphones4" then
				            if listener:isEquippedClothing(item) then

						        if item:getType() == "Hat_EarMuff_Protectors" or item:getType() == "Hat_EarMuff_Protectors_AZ" or item:getType() == "Authentic_Headphones" or item:getType() == "Authentic_Headphones2" or item:getType() == "Authentic_Headphones3" or item:getType() == "Authentic_Headphones4" then

							        HasEarProtection = 0.1
									
									if listener:isAsleep() then
										return
									end
								
							    else

							        HasEarProtection = 0.5
									
									if item:getType() == "Hat_EarMuffs" then
										if listener:isAsleep() then
											return
										end
									end
							    end

	                            if listener:HasTrait("Deaf") then
								
									if listener:isAsleep() then
										return
									end
								
                                elseif listener:HasTrait("Virtuoso") then
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01 * HasEarProtection * SongQuality))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * HasEarProtection * SongQuality))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * HasEarProtection * SongQuality))

                                elseif listener:HasTrait("ToneDeaf") then

									listener:getStats():setStress(initialStress + (0.01 * HasEarProtection))
									bodyDamage:setBoredomLevel(initialBoredom + (1 * HasEarProtection))
									bodyDamage:setUnhappynessLevel(initialUnhappiness + (0.5 * HasEarProtection))
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
	                            elseif listener:HasTrait("HardOfHearing") then
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01 * HasEarProtection * SongQuality * 0.2))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * HasEarProtection * SongQuality * 0.2))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * HasEarProtection * SongQuality * 0.2))

								else
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01 * HasEarProtection * SongQuality * 0.5))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * HasEarProtection * SongQuality * 0.5))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * HasEarProtection * SongQuality *0.5))
								
	                            end

								
	                        
							
						-- adjust stats if levels went below
								if (bodyDamage:getBoredomLevel() < 0) then
									bodyDamage:setBoredomLevel(0)
								end
								if (bodyDamage:getUnhappynessLevel() < 0) then
									bodyDamage:setUnhappynessLevel(0)
								end
								if (listener:getStats():getStress() < 0) then
									listener:getStats():setStress(0)
								end

						-- adjust stats if levels went above
								if (bodyDamage:getBoredomLevel() > 100) then
									bodyDamage:setBoredomLevel(100)
								end
								if (bodyDamage:getUnhappynessLevel() > 100) then
									bodyDamage:setUnhappynessLevel(100)
								end
								if (listener:getStats():getStress() > 1) then
									listener:getStats():setStress(1)
								end

						        return
						    end
				        end	
			        end               				
		        --end
		            if HasEarProtection == 1 then
						local MusicianDirectLevel = SourceMusiclvl
						characterData.ListenedToMusic = tonumber(MusicianDirectLevel)
								--listener:Say("NO EAR PROTECTION");

	                            if listener:HasTrait("Deaf") then
								
								color = HaloTextHelper.getColorRed();
								
                                elseif listener:HasTrait("Virtuoso") then
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01  * SongQuality))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * SongQuality))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * SongQuality))
								
									-- halo positive
									color = HaloTextHelper.getColorGreen();
									doArrow = -1;
									--

                                elseif listener:HasTrait("ToneDeaf") then

									listener:getStats():setStress(initialStress + 0.01)
									bodyDamage:setBoredomLevel(initialBoredom + 1)
									bodyDamage:setUnhappynessLevel(initialUnhappiness + 0.5)

									-- halo negative
									color = HaloTextHelper.getColorRed();
									doArrow = 1;
									--

	                            elseif listener:HasTrait("HardOfHearing") then
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01 * SongQuality * 0.2))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * SongQuality * 0.2))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * SongQuality * 0.2))

									-- halo positive
									color = HaloTextHelper.getColorGreen();
									doArrow = -1;
									--

								else
									if listener:HasTrait("Smoker") then
										listener:getStats():setStressFromCigarettes(0)
									end
									listener:getStats():setStress(initialStress - (0.01 * SongQuality * 0.5))
									bodyDamage:setBoredomLevel(initialBoredom - (1 * SongQuality * 0.5))
									bodyDamage:setUnhappynessLevel(initialUnhappiness - (0.5 * SongQuality *0.5))
								
									-- halo positive
									color = HaloTextHelper.getColorGreen();
									doArrow = -1;
									--
	                            end

							--halo adjust and handstoearsanim
							

									if HaloCounter == 5 then

									local Boochance = ZombRand(1, 100)
									if NoBooing == true then
										Boochance = 1
									end
										if doArrow == -1 then
										
										local character = listener
										
										if character:isAsleep() then
											character:setAsleep(false);
											character:setAsleepTime(0.0);
											UIManager.FadeIn(character:getPlayerNum(), 1);
											HaloTextHelper.addText(character, getText("Disturbed Sleep"), HaloTextHelper.getColorRed())
											ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											characterData.TDcomplained = true
											character:getStats():setStress(initialStress + 0.4)
											
										elseif characterData.IsMeditating == true then
											if not character:HasTrait("Disciplined") then
												characterData.TDcomplained = true
												character:getStats():setStress(initialStress + 0.2)
												HaloTextHelper.addText(character, getText("Disturbed Focus"), HaloTextHelper.getColorRed())
												characterData.IsMeditationDisturbed = true
												--ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											end
											
										else
										
											HaloTextHelper.addTextWithArrow(listener, getText("Boredom"), false, HaloTextHelper.getColorGreen());
										
											if SongQuality <= 0.5 then
											
											if (listener:getPrimaryHandItem() == nil) and
											(listener:getSecondaryHandItem() == nil) and
											(listener:getCurrentState():equals(IdleState.instance()) or listener:isSitOnGround()) and not
											listener:isSneaking() and not
											listener:isRunning() and not
											listener:isPerformingAnAction() and not
											listener:isSprinting() then

												if characterData.TDcomplained ~= nil
												then
													if characterData.TDcomplained == true then
													
														if Boochance >= 75 then
															ISTimedActionQueue.add(BooingMusician:new(character))
														end
													elseif NoBooing == false then
												
													ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											
													characterData.TDcomplained = true
												
													end

												elseif NoBooing == false then
											
												ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											
												characterData.TDcomplained = true
												
												end
											
											
											end
											
											elseif SongQuality >= 1.2 then
											
											if (listener:getPrimaryHandItem() == nil) and
											(listener:getSecondaryHandItem() == nil) and
											(listener:getCurrentState():equals(IdleState.instance()) or listener:isSitOnGround()) and not
											listener:isSneaking() and not
											listener:isRunning() and not
											listener:isPerformingAnAction() and not
											listener:isSprinting() then

												if characterData.GaveApplause ~= nil then
													if characterData.GaveApplause == true then
												
													else
														
														if Boochance >= 75 then
													ISTimedActionQueue.add(PraiseMusician:new(character))
											
													characterData.GaveApplause = true
														elseif listener:HasTrait("Virtuoso") and Boochance >= 60 then
													ISTimedActionQueue.add(PraiseMusician:new(character))
											
													characterData.GaveApplause = true
														end
													end

												elseif NoBooing == false then
											
												ISTimedActionQueue.add(PraiseMusician:new(character))
											
												characterData.GaveApplause = true
												
												end
											
											end
											
											else
											
											if listener:HasTrait("Virtuoso") and
											(listener:getPrimaryHandItem() == nil) and
											(listener:getSecondaryHandItem() == nil) and
											(listener:getCurrentState():equals(IdleState.instance()) or listener:isSitOnGround()) and not
											listener:isSneaking() and not
											listener:isRunning() and not
											listener:isPerformingAnAction() and not
											listener:isSprinting() then

												if characterData.GaveApplause ~= nil then
												
													if characterData.GaveApplause == true then
												
													else
												
														if Boochance >= 75 then
													ISTimedActionQueue.add(PraiseMusician:new(character))
											
													characterData.GaveApplause = true
														end
												
													end

												elseif NoBooing == false then
											
												ISTimedActionQueue.add(PraiseMusician:new(character))
											
												characterData.GaveApplause = true
												
												end
											
											end
											end
											end --END OF ASLEEP

											
											
											
										elseif listener:HasTrait("Deaf") then
										
											if listener:isAsleep() then
												return
											end
											HaloTextHelper.addText(listener, getText("Unable to hear"), HaloTextHelper.getColorRed());
											
										else
										
											local character = listener
											if character:isAsleep() then										
											character:setAsleep(false);
											character:setAsleepTime(0.0);
											UIManager.FadeIn(character:getPlayerNum(), 1);
											HaloTextHelper.addText(character, getText("Disturbed Sleep"), HaloTextHelper.getColorRed())
											ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											characterData.TDcomplained = true
											character:getStats():setStress(initialStress + 0.4)
											
											elseif characterData.IsMeditating == true then
												if not character:HasTrait("Disciplined") then
													ISTimedActionQueue.add(ToneDeafSuffering:new(character))
													characterData.TDcomplained = true
													character:getStats():setStress(initialStress + 0.4)
													HaloTextHelper.addText(character, getText("Disturbed Concentration"), HaloTextHelper.getColorRed())
													characterData.IsMeditationDisturbed = true
												end
											
											else
										
											HaloTextHelper.addTextWithArrow(listener, getText("Boredom"), true, HaloTextHelper.getColorRed());
											
											if listener:HasTrait("ToneDeaf") and
											(listener:getPrimaryHandItem() == nil) and
											(listener:getSecondaryHandItem() == nil) and
											(listener:getCurrentState():equals(IdleState.instance()) or listener:isSitOnGround()) and not
											listener:isSneaking() and not
											listener:isRunning() and not
											listener:isPerformingAnAction() and not
											listener:isSprinting() then

											if characterData.TDcomplained ~= nil
											then
												if characterData.TDcomplained == true then
												
													if Boochance >= 25 then
														ISTimedActionQueue.add(BooingMusician:new(character))
													end
												
												elseif NoBooing == false then
												
												ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											
												characterData.TDcomplained = true
												
												end

											elseif NoBooing == false then
											
											ISTimedActionQueue.add(ToneDeafSuffering:new(character))
											
											characterData.TDcomplained = true
												
											end
											
											
											end
											end--ASLEEP
										end--DOARROW

									end
							--

								HasEarProtection = 1
	                
						-- adjust stats if levels went below
								if (bodyDamage:getBoredomLevel() < 0) then
									bodyDamage:setBoredomLevel(0)
								end
								if (bodyDamage:getUnhappynessLevel() < 0) then
									bodyDamage:setUnhappynessLevel(0)
								end
								if (listener:getStats():getStress() < 0) then
									listener:getStats():setStress(0)
								end

						-- adjust stats if levels went above
								if (bodyDamage:getBoredomLevel() > 100) then
									bodyDamage:setBoredomLevel(100)
								end
								if (bodyDamage:getUnhappynessLevel() > 100) then
									bodyDamage:setUnhappynessLevel(100)
								end
								if (listener:getStats():getStress() > 1) then
									listener:getStats():setStress(1)
								end

                    end		
				--print("Im the one playing!")
			        --end
				elseif (listener:getModData().PlayingInstrument == true) then
				return
				--else
				--listener:getModData().PlayingInstrument = true
				--return
				end
                end

function OtherPlayerIsStartingDuet(currentPerformer, SourceWaitingDuet)
	
		--print("function was called trying to apply effects")

	    if (currentPerformer:hasModData()) and
		(currentPerformer:getModData().WaitingDuet ~= nil) then

	    if (currentPerformer:getModData().WaitingDuet ~= true) then
			return
		end

		if SourceWaitingDuet == false then
		
		currentPerformer:getModData().WaitingDuet = false
		
		end
		end
end

