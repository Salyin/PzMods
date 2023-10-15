--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISDestroyStuffAction"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISDestroyStuffAction = {}

local function predicateSledgehammer2(item)
	if item:isBroken() then return false end
	local type = item:getType()
	return item:hasTag("Sledgehammer") or type == "Sledgehammer" or type == "Sledgehammer2"
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.isValid = ISDestroyStuffAction.isValid
function ISDestroyStuffAction:isValid()
	upperLayer.ISDestroyStuffAction.isValid(self)

	if ISBuildMenu.cheat then return true end
	-- check sledge	in your hands
	if not self.sledge then
		self.sledge = self.character:getPrimaryHandItem();
	end
	if self.testText == nil and ((self.sledge and self.sledge:isBroken()) or not self.sledge) then self.character:Say(getText("IGUI_sledgeBroken")) ; self.testText = true return false end
	-- check other safeHouse if is forbidden
	if not isAdmin() and self.testText == nil and self.otherSafehouse == true and self.OtherSafeHouseforbidden == true then self.character:Say(getText("IGUI_OtherSafeHouseforbidden")) ; self.testText = true return false end
	-- check skills
	local StrengthSkill = self.character:getPerkLevel(Perks.Strength)
	local skill = SandboxVars.SledgeHammerRules.strenghtSkillNeeded
	if self.testText == nil and StrengthSkill < skill and self.safehousePlayer == false and self.bonus < 700 then self.character:Say(getText("IGUI_notStrongForThat")..skill..getText("IGUI_notStrongForThat2")) ; self.testText = true return false end
	-- second check sledge
	local sledgehammer = self.character:getInventory():getFirstEvalRecurse(predicateSledgehammer2)
	if self.testText == nil and (not sledgehammer or (sledgehammer and sledgehammer:isBroken())) then self.character:Say(getText("IGUI_noSledge")) ; self.testText = true return false end
	-- check fatigue
	local endurance = self.character:getStats():getEndurance()
	if not isAdmin() and self.testText == nil and endurance < 0.1 then self.character:Say(getText("IGUI_imExhausted")) ; self.testText = true return false end
	-- check fatigue
	local Fatigue = self.character:getStats():getFatigue()
	if not isAdmin() and self.testText == nil and Fatigue > 0.9 then self.character:Say(getText("IGUI_imExhausted")) ; self.testText = true return false end  
	if self.testText == true then return false end

    return self.item:getObjectIndex() ~= -1
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.update = ISDestroyStuffAction.update
function ISDestroyStuffAction:update()
	upperLayer.ISDestroyStuffAction.update(self)
	-- check if your sledge is ok
	local sledgehammer = self.character:getInventory():getFirstEvalRecurse(predicateSledgehammer2)
	if not ISBuildMenu.cheat and (not sledgehammer or (sledgehammer and sledgehammer:isBroken())) then self.character:Say(getText("IGUI_noSledge")) ; self:forceStop() end
	-------------------------------------------------------------------------------------
	-- check if you are always in your safeHouse
	if not ISBuildMenu.cheat and not isAdmin() and isClient() and (self.safehousePlayer == true or self.OtherSafeHouseforbidden == true) and self.safeHouseChecked == nil then --and self.playerSquare:DistTo(self.character) > 6 then self.character:Say(getText("IGUI_tooFarSledge")) ; self:forceStop() end 
		self.safeHouseChecked = false
		local square = self.character:getSquare()
		for x=square:getX()-self.SafeHouseRadius,square:getX()+self.SafeHouseRadius do
    	    for y=square:getY()-self.SafeHouseRadius,square:getY()+self.SafeHouseRadius do 
    	    	local z =  self.character:getZ()
    	        local sq = getCell():getGridSquare(x,y,z)
    	        if sq then
    	            local safehouse = SafeHouse.getSafeHouse(sq)
    	            if (safehouse and safehouse:playerAllowed(self.character)) then  
    	            	--true
    	            	self.safeHouseChecked = true    	            	
    	            elseif safehouse then
    	            	self.character:Say(getText("IGUI_tooFarSledge")) 
    	    			self:forceStop() 
    	            end
    	        end
    	    end
    	end
    	if self.safeHouseChecked == false and self.safehousePlayer == true then 
    	    self.character:Say(getText("IGUI_tooFarSledge")) 
    	    self:forceStop() 
    	end
    end
	-------------------------------------------------------------------------------------
	if ISBuildMenu.cheat or isAdmin() or (isClient() and self.safehousePlayer == true) or SandboxVars.SledgeHammerRules.failDuringAction == false then
		--false if nor fails option in during action or in your safeHouse
		--print("no fails")
	else
		if not self.addition then self.addition = 0 end
		self.addition = self.addition +1
		if self.addition == (2800/self.lessPenalty) - (self.skillsWork*25) then self.character:Say(getText("IGUI_noMoreLong")) end
		
		local strength = self.character:getPerkLevel(Perks.Strength)
		local randomBonus = ZombRand(10) - ((strength+self.skillsWork)/10)
		local randomFail = ZombRand(self.addition)
		local sledgeCondition = self.sledge:getCondition()
		sledgeCondition = sledgeCondition*8
	
	    if  self.addition 																			and 
	    	self.addition > 160 + self.bonus + sledgeCondition + (self.skillsWork*60) 			 	and 
	    	self.addition < (2800/self.lessPenalty) - (self.skillsWork*20)							and 
	    	((randomFail == 112 and SandboxVars.SledgeHammerRules.lessGlobalPenalty == false)  		or
	    	(randomFail == 657 and self.bonus < 450 and randomBonus >= 5) 							or 
	    	(randomFail == 1012 and self.bonus < 700 and randomBonus >= 4 and (self.skillsWork < 11 or strength < 8))) then
	
	    	self.character:Say(getText("IGUI_missed"))
	    	self.missed = true
	    	self:forceStop()
	    	return
	    end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.start = ISDestroyStuffAction.start
function ISDestroyStuffAction:start()
	upperLayer.ISDestroyStuffAction.start(self)
	if not ISBuildMenu.cheat and not isAdmin() and SandboxVars.SledgeHammerRules.attractZombies == true and self.safehousePlayer == false then
		addSound(self.character, self.character:getX(),self.character:getY(),self.character:getZ(), self.zRadius, 10);
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.stop = ISDestroyStuffAction.stop
function ISDestroyStuffAction:stop()
	upperLayer.ISDestroyStuffAction.stop(self)
	self.character:playSound("SledgeSoundCraft2")
	if ISBuildMenu.cheat or isAdmin()  or (isClient() and self.safehousePlayer == true) or self.missed == false then
		--false if no missed or in your safeHouse
	else
		--set stats
		local playerStats = getSpecificPlayer(0):getStats()
		local playerBody = getSpecificPlayer(0):getBodyDamage()
		local strength = self.character:getPerkLevel(Perks.Strength)
		playerStats:setThirst(playerStats:getThirst()+(0.13/self.lessPenalty))--(0.42/2500) )--0a1 0.42=0.48
		playerStats:setFatigue(playerStats:getFatigue()+(0.07/self.lessPenalty))--(0.3/2500) )--0a1 0.3=0.348
		playerStats:setStress(playerStats:getStress()+(0.06/self.lessPenalty))--(0.3/2500) )--0a1 0.3=0.348
		--playerStats:setEndurancewarn(playerStats:getEndurancewarn()+50)--(0.3/2500) )--0a1 0.3=0.348
		playerBody:setBoredomLevel(playerBody:getBoredomLevel()+(7/self.lessPenalty))--(0.3/2500) )--0a1 0.3=0.348
		playerBody:setWetness(playerBody:getWetness()+(10/self.lessPenalty))--(35/2500)*1.5 )--0a100
		--playerBody:setUnhappynessLevel(playerBody:getUnhappynessLevel()+4)
		playerBody:ReduceGeneralHealth(2/self.lessPenalty)--100a0 10=88.14~9.78
		-------------------------------------------------------------
		-- set endurance related to strength stat
	    local endurance = self.character:getStats():getEndurance()
	    if endurance > 0 then
	    	self.character:getStats():setEndurance(endurance - (((20 - strength)/120)/self.lessPenalty))
	    end
	    -------------------------------------------------------------
	    local sledge = self.character:getPrimaryHandItem()
	    sledge:setCondition(sledge:getCondition() - (ZombRand(3)/self.lessPenalty))
	    -------------------------------------------------------------
	    if SandboxVars.SledgeHammerRules.attractZombies == true then addSound(self.character, self.character:getX(),self.character:getY(),self.character:getZ(), self.zRadius+20, 10) end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.perform = ISDestroyStuffAction.perform
function ISDestroyStuffAction:perform()
    upperLayer.ISDestroyStuffAction.perform(self)

    if not ISBuildMenu.cheat and not isAdmin()  then

    	local sledge = self.character:getPrimaryHandItem()
		local objSprite = self.item:getSprite()
        local props = objSprite:getProperties()
        local spriteName = self.item:getSprite():getName()
        local hoppable = self.item:isHoppable()
		--------------------------------------------------
        -- base object damage
        self.setConditionDown = ZombRand(3)
        self.malusObJ = 0.8
        -- more damage if object = door ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		if instanceof(self.item, 'IsoDoor') or (instanceof(self.item, 'IsoThumpable') and self.item:isDoor()) then 
			self.barricade = self.item:getBarricadeForCharacter(self.character) ; 
			self.setConditionDown = self.setConditionDown + ZombRand(3)+1 ; 
																																													--self.character:Say("porte") -- debugSay
			self.malusObJ = 1.2
		end
        -- malus si renforcée ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        if spriteName and spriteName == "fixtures_doors_01_32" or spriteName == "fixtures_doors_01_33" or spriteName == "location_community_police_01_4" or spriteName == "location_community_police_01_5" then 
        	self.setConditionDown = self.setConditionDown + ZombRand(3)+3 ; 
        																																											--self.character:Say("porte renforcee") -- debugSay
        	self.malusObJ = 2.2
        	
        end 
       -- if not hoppable and (luautils.stringStarts(spriteName, 'fencing') or luautils.stringStarts(spriteName, 'location_community_police_01') or luautils.stringStarts(spriteName, 'location_military') or luautils.stringStarts(spriteName, 'walls') or luautils.stringStarts(spriteName, 'location_shop_fossoil_01')) then 
    	if not hoppable and props and 
    		(luautils.stringStarts(spriteName, 'walls') or 
    		props:Is("IsPaintable") 					or 
    		props:Is("WallN")       == true 			or 
    		props:Is("WallNW")      == true 			or 
    		props:Is("WallW")       == true 			or 
    		props:Is("WallNWTrans") == true 			or 
    		props:Is("WallNTrans")  == true 			or 
    		props:Is("WallWTrans")  == true)			then --DoorWallN

        		self.setConditionDown = self.setConditionDown + ZombRand(4)+4 ; 
        																																											--self.character:Say("mur") -- debugSay
        		self.malusObJ = 2.5
        		 
        end
        -- malus si barricadée ou verrouillée (window) --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        if instanceof(self.item, "IsoWindow") or self.item:getType() == "Window" then 
        	self.windowsLocked = self.item:getSprite():getProperties():Is("WindowLocked") ; 
        	self.barricade = self.item:getBarricadeForCharacter(self.character) 
        end

		if self.windowsLocked 									then 
		self.malusObJ = 1.3 ; 
		self.setConditionDown = self.setConditionDown + ZombRand(3)+2
																																								--self.character:Say("locked window")  -- debugSay		    
		end
		if self.barricade and self.barricade:getNumPlanks() > 0 then 
			self.malusObJ = 1.3 ; 
			self.setConditionDown = self.setConditionDown + ZombRand(3)+2
																																								--self.character:Say("barricade wood") -- debugSay	   	
		end
		if self.barricade and self.barricade:isMetalBar() 		then 
			self.malusObJ = 1.3 ; 
			self.setConditionDown = self.setConditionDown + ZombRand(3)+2
																																								--self.character:Say("barricade barre metal")  -- debugSay 
		end
		if self.barricade and self.barricade:isMetal() 			then 
			self.malusObJ = 1.3 ; 
			self.setConditionDown = self.setConditionDown + ZombRand(3)+2 
																																								--self.character:Say("barricade metal")  -- debugSay	    
		end

		-- set Global damage to sledgehammer -----------------------------
		self.setConditionDown = self.setConditionDown - (self.skillsWork/5)
		if self.setConditionDown <= 0 then self.setConditionDown = 1 end
		------------------------------------------------------------------
		--safeHouse bonus
		if self.safehousePlayer == true then self.lessPenalty = self.lessPenalty*7 end
		------------------------------------------------------------------
        --set stats
		local playerStats = getSpecificPlayer(0):getStats()
		local playerBody = getSpecificPlayer(0):getBodyDamage()
		local strength = self.character:getPerkLevel(Perks.Strength)
		local malus = (self.malusObJ - (strength/30)) - (self.skillsWork/60)

		playerStats:setThirst(playerStats:getThirst()+((0.20+(self.malusObJ/10))/self.lessPenalty))--(0.42/2500) )--0a1 0.42=0.48
		playerStats:setFatigue(playerStats:getFatigue()+((0.08+(malus/10))/self.lessPenalty))--(0.3/2500) )--0a1 0.3=0.348
		playerBody:setWetness(playerBody:getWetness()+((13+(self.malusObJ/10))/self.lessPenalty))--(35/2500)*1.5 )--0a100
		--playerStats:setStress(playerStats:getStress()+(2+(malus*2)))--(0.3/2500) )--0a1 0.3=0.348
		--playerStats:setEndurancewarn(playerStats:getEndurancewarn()+50)--(0.3/2500) )--0a1 0.3=0.348
		--playerBody:setUnhappynessLevel(playerBody:getUnhappynessLevel()-4)
		playerBody:setBoredomLevel(playerBody:getBoredomLevel()-(7/self.lessPenalty))--(0.3/2500) )--0a1 0.3=0.348
		playerBody:ReduceGeneralHealth((2+malus)/self.lessPenalty)--100a0 10=88.14~9.78
		-------------------------------------------------------------
		-- set endurance related to strangth stat
    	local endurance = self.character:getStats():getEndurance()
    	if endurance > 0 then
    		self.character:getStats():setEndurance(endurance - (((20 - strength)/(70-(malus*10)))/self.lessPenalty))
    	end
		--------------------------------------------------
		-- no damage if your are in your safeHouse
		if self.safehousePlayer ~= true then sledge:setCondition(sledge:getCondition() - (self.setConditionDown/self.lessPenalty)) end
		-- chance to delete sledgehammer if destroyed
		local sledgeCondition = sledge:getCondition()
		if sledgeCondition <= 0 and ZombRand(2) == 0 then
			-----------------------------------------------
			local playerInv = self.character:getInventory()
			self.character:removeFromHands(sledge)
			playerInv:DoRemoveItem(sledge)
			self.character:Say(getText("IGUI_sledgeDestroyed"))
			-----------------------------------------------------------
			local pdata = getPlayerData(self.character:getPlayerNum())
			if pdata ~= nil then
				pdata.playerInventory:refreshBackpacks()
				pdata.lootInventory:refreshBackpacks()
			end		
		end
    	----------------------------------------------------
		ISWorldObjectContextMenu.checkWeapon(self.character)
		----------------------------------------------------
	end  
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDestroyStuffAction.new = ISDestroyStuffAction.new
function ISDestroyStuffAction:new(character, item)
    local o = upperLayer.ISDestroyStuffAction.new(self,character, item)
    local carpSkill = character:getPerkLevel(Perks.Woodwork)
	local metalSkill = character:getPerkLevel(Perks.MetalWelding)
	if SandboxVars.SledgeHammerRules.lessGlobalPenalty == true then
		o.lessPenalty = 2
	else
		o.lessPenalty = 1
	end
	o.zRadius = SandboxVars.SledgeHammerRules.attractZombiesRadius
	o.SafeHouseRadius = SandboxVars.SledgeHammerRules.rulesInSafeHouseRadius
	o.OtherSafeHouseforbidden = SandboxVars.SledgeHammerRules.UseSledgeHammerInOtherSafeHouseIsforbidden
	o.testText = nil
	o.skillsWork = metalSkill+carpSkill
	o.bonus = 700 + (o.skillsWork*4)
	o.missed = false
	o.playerSquare = character:getSquare()
	o.safehousePlayer = false
	o.otherSafehouse = false
   	------------------------------------------------------------------------------------------------
   	-- check safeHouse
	if isClient() then 
		for x=o.playerSquare:getX()-o.SafeHouseRadius,o.playerSquare:getX()+o.SafeHouseRadius do
    	    for y=o.playerSquare:getY()-o.SafeHouseRadius,o.playerSquare:getY()+o.SafeHouseRadius do
    	    	local z = character:getZ()
    	        local sq = getCell():getGridSquare(x,y,z)
    	        if sq then
    	            local safehouse = SafeHouse.getSafeHouse(sq)
    	            if (safehouse and safehouse:playerAllowed(character)) and SandboxVars.SledgeHammerRules.lessPenaltyInYourSafeHouse == true then 
    	            	o.safehousePlayer = true 
    	            end
    	            if (safehouse and safehouse:playerAllowed(character)) then 
    	            	-- true
    	            elseif safehouse then           	
    	            	o.otherSafehouse = true
    	            end
    	        end
    	        if o.otherSafehouse == true then o.safehousePlayer = false break end
    	    end
    	    if o.otherSafehouse == true then o.safehousePlayer = false break end
    	end
   	end
   	------------------------------------------------
    if not ISBuildMenu.cheat and not isAdmin() then 

    	o.maxTime = o.maxTime +(1200/o.lessPenalty)

    	local spriteName = item:getSprite():getName()
        local props = item:getProperties()
        local hoppable = item:isHoppable()
   
    	if not hoppable and props and 
    		(luautils.stringStarts(spriteName, 'walls') or
    		props:Is("IsPaintable") 					or
    		props:Is("WallN") 			== true 		or
    		props:Is("WallNW") 			== true 		or
    		props:Is("WallW") 			== true 		or
    		props:Is("WallNWTrans") 	== true 		or
    		props:Is("WallNTrans") 		== true 		or
    		props:Is("WallWTrans") 		== true)		then --DoorWallN
    			--------------------------------------------------
    			o.maxTime = o.maxTime +1500	- (o.skillsWork*10)
    			o.bonus = 0 + (o.skillsWork*4)
    																									--character:Say("max") -- debugSay    	
    	elseif  spriteName == "fixtures_doors_01_32" 		   	   or 
    			spriteName == "fixtures_doors_01_33" 		   	   or
    			spriteName == "location_community_police_01_4" 	   or
    			spriteName == "location_community_police_01_5" 	   or
    			luautils.stringStarts(spriteName, 'fencing_01_') then
    			-------------------------------------------------
    			o.maxTime = o.maxTime +200 - (o.skillsWork*6)
    			o.bonus = 200 + (o.skillsWork*6)
    																									--character:Say("renforcee") -- debugSay

    	elseif (instanceof(item, 'IsoDoor') 						 or 
    		   (instanceof(item, 'IsoThumpable') and item:isDoor())) or 
    		   (instanceof(item, "IsoWindow") 						 or 
    		   item:getType() == "Window") 							 or 
    		   (luautils.stringStarts(spriteName, 'carpentry_02_'))  then 
    			-------------------------------------------------
    			o.maxTime = o.maxTime +100 - (o.skillsWork*4)
    			o.bonus = 450 + (o.skillsWork*4)
    																									--character:Say("moyen") -- debugSay
    	end
    	if isClient() and o.safehousePlayer == true then 
        	o.maxTime = o.maxTime /10	
    	end
    end
    return o
end






























--local sprite = getSprite(sprite)
    	--local props = sprite:getProperties();
    	--local type = props:Is("MoveType") and props:Val("MoveType") or "Object";
    	--local type = item:getType()
    	--local sprite = item:getSprite();
    	--local props = sprite:getProperties();
    	--if props:Val("MoveType") == "WallObject" or props:Val("MoveType") == "WallOverlay"  then --WallOverlay WallObject
