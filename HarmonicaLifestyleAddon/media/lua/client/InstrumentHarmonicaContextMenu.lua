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


-- first we get the timed actions
local PlayHarmonicaAction = require "TimedActions/PlayHarmonicaAction"
local PlayHarmonicaActionWorld = require "TimedActions/PlayHarmonicaActionWorld"
-- then we define our instrument(s)

local Instrument = { -- HARMONICA
    ['LS.Harmonica'] = true,
}

-- we set the function to call when pressing the option to play,
-- clearing the queue and setting other conditions that we want to apply before the timed action begins

local OnInstrumentMenu = {};
local OnInstrumentEquippedMenu = {};

OnInstrumentMenu.Play = function(player, item, soundFile, length, level, isTraining, isDuet, xp, boredomReduction, stressReduction, actionType)
 
 ISTimedActionQueue.clear(player);

	if player:getVehicle() then 
		return
	end

    if not item:isEquipped() then
        ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false))
    end
    ISTimedActionQueue.add(PlayHarmonicaAction:new(player, item, soundFile, length, level, isTraining, isDuet, xp, boredomReduction, stressReduction, actionType));

end

OnInstrumentEquippedMenu.Play = function(worldobjects, player, equippedInstrument, soundFile, length, level, xp, boredomReduction, stressReduction, actionType)
 
 ISTimedActionQueue.clear(player);

	if player:getVehicle() then 
		return
	end

	if equippedInstrument == nil then
		return
	end

    if player:getPrimaryHandItem():getFullType() ~= equippedInstrument then
        return
    end
    ISTimedActionQueue.add(PlayHarmonicaActionWorld:new(player, equippedInstrument, soundFile, length, level, xp, boredomReduction, stressReduction, actionType));

end

-- then we define the function that will add the options we want to appear in the instrument

Events.OnPreFillInventoryObjectContextMenu.Add(function(player, context, items)

    local player = getSpecificPlayer(player);
	local level = -1;
	local soundFile = nil;
	local actionType = nil
	local contextMenu = nil;
	local randomNumberAnim = ZombRand(1, 100)
	local isSitOnGround = player:isSitOnGround()
	
	if player:getVehicle() then 
		return
	end
	
	if player:HasTrait("Deaf") then -- check to keep deaf players from being able to play instruments
		return
	end
	
-- level, base xp, base mood and other defs
	level = player:getPerkLevel(Perks.Music)
	actionType = "Loot"
	local xp = 0
	local XPPerSecond = 0.01
	local boredomReduction = 0
	local stressReduction = 0
	local BoredomPerSecond = 0.12
	local trainingBoredomPerSecond = 0.1
	local StressPerSecond = 0.001

-- we loop the table in case there are more items, we can specify which item we want or apply to all items

    for i = 1, #items do
        if type(items[1]) == 'table' then
		local item = items[1].items[1]
		if Instrument[item:getFullType()] then
		
			if item:isBroken() or
			(item:isInPlayerInventory() == false) or
			(player:getInventory():contains(item) == false)
			then -- check to not allow broken items or not in main inventory - change this for item transfer later
			break
			end
		
            if 'LS.Harmonica' then -- CHANGE THIS LINE
				
			
			
				local PlayHarmonicaTracks = require("TimedActions/PlayHarmonicaTracks")
				local AvailableTracks = {}
	
				-- we get the songs and apply any conditions we may want, in this case skilled players won't play basic beginner songs randomly when they select the Play it option
				for k,v in pairs(PlayHarmonicaTracks) do
					if level > 3 then
						if v.level >= 2 and v.level <= level then
						table.insert(AvailableTracks, v)
						end
					elseif v.level <= level then
						table.insert(AvailableTracks, v)
					end
				end
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
				local randomNumber = ZombRand(#AvailableTracks) + 1
				local randomTrack = AvailableTracks[randomNumber]
				local length = randomTrack.length * 48
				
				-- DEFAULT ANIM TO PLAY WHEN SITTING
				
				if level < 4 then
				actionType = "Bob_PlayHarmonicaDefaultBeginner"
				else
				actionType = "Bob_PlayHarmonicaDefault"
				end

				
				-- CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif randomTrack.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 3 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.2 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = 0.6 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					else
					xp = XPPerSecond * randomTrack.length * (randomTrack.level + 1) -- NO SPECIFIC TRAIT
					end

				-- TRACKS LEVEL 6 OR ABOVE
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 5 * randomTrack.length * (randomTrack.level / level)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.5 * randomTrack.length * (randomTrack.level / level)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = randomTrack.length * (randomTrack.level / level)
				else -- NO SPECIFIC TRAIT
					xp = 2 * randomTrack.length * (randomTrack.level / level)
				end


				-- CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = 3 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = 2 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = StressPerSecond * randomTrack.length * (randomTrack.level + 1)

				end


			-- DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
			
				if randomTrack.level >= 8 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
					
				elseif randomTrack.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				elseif randomTrack.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				elseif randomTrack.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
					
				elseif randomTrack.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end

					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
			

				else
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					end
				
				end
				
			end -- isSitOnGround
				
			-- ADDING THE OPTION TO PLAY RANDOM
				contextMenu = "ContextMenu_Play_Random_Harmonica"
                context:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, false, false, xp, boredomReduction, stressReduction, actionType);

			--2 ADDING THE SUBMENU TO PLAY SONGS YOUR LEVEL BY NAME
	
				if level < 10 then
					contextMenu = "ContextMenu_Play_L" .. level .. "_Harmonica"
				else
					contextMenu = "ContextMenu_Play_Master_Harmonica"
				end
	
				local buildOption = context:addOption(getText(contextMenu));
				local subMenu = ISContextMenu:getNew(context);
				context:addSubMenu(buildOption, subMenu)

			--2 ADDING THE OPTION TO PLAY SONGS YOUR LEVEL BY NAME
				for k,v in pairs(PlayHarmonicaTracks) do
					if v.level == level then
					local length = v.length * 48
			
			--2 CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif v.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
						xp = 3 * XPPerSecond * v.length * (v.level + 1)
					elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
						xp = 0.2 * XPPerSecond * v.length * (v.level + 1)
					elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
						xp = 0.6 * XPPerSecond * v.length * (v.level + 1)
					else
						xp = XPPerSecond * v.length * (v.level + 1) -- NO SPECIFIC TRAIT
					end

				-- TRACKS LEVEL 6 OR ABOVE
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 5 * v.length * (v.level / level)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.5 * v.length * (v.level / level)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = v.length * (v.level / level)
				else -- NO SPECIFIC TRAIT
					xp = 2 * v.length * (v.level / level)
				end
			
			--2 CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
			
			--2 DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
			
				if v.level >= 8 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
					
				elseif v.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
					
				elseif v.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
					
				elseif v.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
					
				elseif v.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
			
				else
				
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					end
				
				end
			end
			
			--2 ADDING THE OPTION IN THE CONTEXT MENU
				contextMenu = v.name
				subMenu:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);

				end --if
	end --for
	
	
	--3 PLAY A SONG FROM GROUP LEVEL - STARTS AT 1 TO AVOID REDUNDANCY
	if level > 0 then
		
	--3 ADDING GROUPS SUBMENU
		contextMenu = "ContextMenu_Play_Group_Harmonica"
		
		local buildOption = context:addOption(getText(contextMenu));
		local parentMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, parentMenu)
		
		--3A ADDING BEGINNER LEVEL GROUP SUBMENU 0-1
		contextMenu = "ContextMenu_Play_Beginner_Harmonica"
		
		local beginnerMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuA = parentMenu:getNew(parentMenu);
		context:addSubMenu(beginnerMenu, subMenuA)
		
		for k,v in pairs(PlayHarmonicaTracks) do
			if v.level <= 1 and v.level <= level then
				local length = v.length * 48

			--3A CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 3 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.2 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = 0.6 * XPPerSecond * v.length * (v.level + 1)
				else
					xp = XPPerSecond * v.length * (v.level + 1) -- NO SPECIFIC TRAIT
				end
			
			--3A CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
				
			--3A DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
				if level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
				
				else
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					end
				end
				end
			
		--3A ADDING THE OPTION FOR BEGINNER SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				subMenuA:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
			end
		end
		
		
		if level > 2 then
		
		--3B ADDING EXPERIENCED LEVEL GROUP SUBMENU 2-3
		contextMenu = "ContextMenu_Play_Experienced_Harmonica"
		
		local experiencedMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuB = parentMenu:getNew(parentMenu);
		context:addSubMenu(experiencedMenu, subMenuB)
		
		for k,v in pairs(PlayHarmonicaTracks) do
			if v.level > 1 and v.level <= 3 and v.level <= level then
				local length = v.length * 48
				
			--3B CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 3 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.2 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = 0.6 * XPPerSecond * v.length * (v.level + 1)
				else
					xp = XPPerSecond * v.length * (v.level + 1) -- NO SPECIFIC TRAIT
				end
			
			--3B CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
			
			--3B DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
			
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
				
			end
			
			--3B ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				subMenuB:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
			end
		end
		
		
		
		if level > 4 then
			
			--3C ADDING INTERMEDIATE LEVEL GROUP SUBMENU 4-5
			contextMenu = "ContextMenu_Play_Intermediate_Harmonica"
			
		local intermediateMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuC = parentMenu:getNew(parentMenu);
		context:addSubMenu(intermediateMenu, subMenuC)
			
		for k,v in pairs(PlayHarmonicaTracks) do
			if v.level > 3 and v.level <= 5 and v.level <= level then
				local length = v.length * 48
				
			--3C CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 3 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.2 * XPPerSecond * v.length * (v.level + 1)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = 0.6 * XPPerSecond * v.length * (v.level + 1)
				else
					xp = XPPerSecond * v.length * (v.level + 1) -- NO SPECIFIC TRAIT
				end
			
			--3C CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
				
			--3C DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
			
			if level > 5 then
			
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
			
			else

					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
			end
		end
				
			--3C ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				subMenuC:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
			end
		end
			
			
			
		if level > 6 then
			
			--3D ADDING PROFICIENT LEVEL GROUP SUBMENU 6-7
			contextMenu = "ContextMenu_Play_Proficient_Harmonica"
			
		local proficientMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuD = parentMenu:getNew(parentMenu);
		context:addSubMenu(proficientMenu, subMenuD)
			
		for k,v in pairs(PlayHarmonicaTracks) do
			if v.level > 5 and v.level <= 7 and v.level <= level then
				local length = v.length * 48
				
			--3D CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 5 * v.length * (v.level / level)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.5 * v.length * (v.level / level)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = v.length * (v.level / level)
				else -- NO SPECIFIC TRAIT
					xp = 2 * v.length * (v.level / level)
				end
			
			--3D CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
				
			--3D DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			if not isSitOnGround then
			
				if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				end
				
			--3D ADDING THE OPTION FOR PROFICIENT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				subMenuD:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
			end
		end
			
			
			
		if level > 8 then
				
			--3E ADDING EXPERT LEVEL GROUP SUBMENU 8-9
			contextMenu = "ContextMenu_Play_Advanced_Harmonica"
			
		local expertMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuE = parentMenu:getNew(parentMenu);
		context:addSubMenu(expertMenu, subMenuE)
			
		for k,v in pairs(PlayHarmonicaTracks) do
			if v.level > 7 and v.level <= 9 and v.level <= level then
				local length = v.length * 48
							
			--3E CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 5 * v.length * (v.level / level)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.5 * v.length * (v.level / level)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = v.length * (v.level / level)
				else -- NO SPECIFIC TRAIT
					xp = 2 * v.length * (v.level / level)
				end
			
			--3E CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
				stressReduction = StressPerSecond * v.length * (v.level + 1)

				end
							
			--3E DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			if not isSitOnGround then
			
				if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				end
							
			--3E ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				subMenuE:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
			end
			end
			end -- if level > 8
			
			

			end -- if level > 6
			end -- if level > 4
		end -- if level > 2


	--3F ------------------------------------------ADDING DUETS GROUP SUBMENU Level > 3 -------------------------------
--	if level > 3 then   --(DO NOT UNCOMMENT - WAITING FOR SOUNDS NEXT UPDATE)
--	
--		if not isSitOnGround then
--				
--
--		contextMenu = "ContextMenu_Play_Duet_Harmonica"
--			
--		local duetMenu = parentMenu:addOption(getText(contextMenu));
--		
--		local subMenuF = parentMenu:getNew(parentMenu);
--		context:addSubMenu(duetMenu, subMenuF)
--		
--		local PlayHarmonicaTracksDuet = require("TimedActions/PlayHarmonicaTracksDuet")
--		local AvailableTracksDuet = {}
--		for k,v in pairs(PlayHarmonicaTracksDuet) do
--			if v.level <= level then
--				table.insert(AvailableTracksDuet, v)
--				local length = v.length * 48
--				local actionType = v.actionType
--			
--			--3F CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
--				if level >= 10 then
--					xp = 0
--				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
--					xp = 5 * v.length * (v.level / level)
--				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
--					xp = 0.5 * v.length * (v.level / level)
--				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
--					xp = v.length * (v.level / level)
--				else -- NO SPECIFIC TRAIT
--					xp = 2 * v.length * (v.level / level)
--				end
--			
--			--3F CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
--				
--				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
--				boredomReduction = 3 * BoredomPerSecond * v.length * (v.level + 1)
--				stressReduction = 3 * StressPerSecond * v.length * (v.level + 1)
--				
--				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
--				boredomReduction = 2 * BoredomPerSecond * v.length * (v.level + 1)
--				stressReduction = 2 * StressPerSecond * v.length * (v.level + 1)
--				
--				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
--				boredomReduction = ((-2 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
--				stressReduction = ((-2 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
--				
--				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
--				boredomReduction = ((-1 * BoredomPerSecond * v.length * (v.level + 1)) / (level + 1))
--				stressReduction = ((-1 * StressPerSecond * v.length * (v.level + 1)) / (level + 1))
--				
--				else
--				boredomReduction = BoredomPerSecond * v.length * (v.level + 1)
--				stressReduction = StressPerSecond * v.length * (v.level + 1)
--
--				end
--
--							
--			--3F ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
--				contextMenu = v.name
--				subMenuF:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, true, xp, boredomReduction, stressReduction, actionType);
--			end
--			end
--			end -- if not sitonground
--			end -- if level > 3 DUET
		
	end -- if level > 0
	
	
	
	-- TRAINING  (DO NOT UNCOMMENT - WAITING FOR ANIMS/SOUNDS NEXT UPDATE)
--	if not isSitOnGround and level < 6 then
--		local TrainingHarmonicaTracks = require("TimedActions/TrainingHarmonicaTracks")
--		local trainingTracks = {}
--		
--		for k,v in pairs(TrainingHarmonicaTracks) do
--			if v.level == level then
--				table.insert(trainingTracks, v)
--			end
--		end
--		
--		local randomNumber = ZombRand(#trainingTracks) + 1
--		
--		local randomTrack = trainingTracks[randomNumber]
--		
--		local length = randomTrack.length * 48
--		
--		local actionType = randomTrack.actionType
--		
--		--CALCULATING XP AND BOREDOM GAINS BY LEVEL AND TRACK LEVEL
--		
--		if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
--			xp = 10 * 10 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
--			boredomReduction = -1 * 0.5 * trainingBoredomPerSecond * randomTrack.length
--			stressReduction = 0
--		elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
--			xp = 5 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
--			boredomReduction = -4 * trainingBoredomPerSecond * randomTrack.length
--			stressReduction = -4 * StressPerSecond * randomTrack.length
--		elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
--			xp = 10 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
--			boredomReduction = -2 * trainingBoredomPerSecond * randomTrack.length
--			stressReduction = -2 * StressPerSecond * randomTrack.length
--		else -- NO SPECIFIC TRAIT
--		xp = 10 * 5 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
--		boredomReduction = -1 * trainingBoredomPerSecond * randomTrack.length
--		stressReduction = 0
--				
--		end
--		
--		
--		--ADDING TRAINING OPTION
--		
--		contextMenu = "ContextMenu_Training_Harmonica"
--		
--        context:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, true, false, xp, boredomReduction, stressReduction, actionType); --> Create a new option on the context menu
--
--	end -- TRAINING
break;
 -- IF HARMONICA
 end
end
-----DO NOT ADD AFTER NEXT END
		end
            end
			

end)--FUNCTIONEND

-- we use the next function to add an option to play without going trough the inventory

Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects)

    local player = getSpecificPlayer(player);
	local level = -1;
	local soundFile = nil;
	local actionType = nil
	local contextMenu = nil;
	local randomNumberAnim = ZombRand(1, 100)
	local isSitOnGround = player:isSitOnGround()
	
	if player:getVehicle() then 
		return
	end
	
	if player:HasTrait("Deaf") then -- check to keep deaf players from being able to play instruments
		return
	end
	
-- level, base xp, base mood and other defs
	level = player:getPerkLevel(Perks.Music)
	actionType = "Loot"
	local xp = 0
	local XPPerSecond = 0.01
	local boredomReduction = 0
	local stressReduction = 0
	local BoredomPerSecond = 0.12
	local trainingBoredomPerSecond = 0.1
	local StressPerSecond = 0.001


			if player:getPrimaryHandItem() == nil then
			return
            elseif player:getPrimaryHandItem():getFullType() == 'LS.Harmonica' then -- CHANGE THIS LINE

				

				local equippedInstrument = player:getPrimaryHandItem():getFullType()
				local PlayHarmonicaTracks = require("TimedActions/PlayHarmonicaTracks")
				local AvailableTracks = {}
	
				-- we get the songs and apply any conditions we may want, in this case skilled players won't play basic beginner songs randomly when they select the Play it option
				for k,v in pairs(PlayHarmonicaTracks) do
					if level > 3 then
						if v.level >= 2 and v.level <= level then
						table.insert(AvailableTracks, v)
						end
					elseif v.level <= level then
						table.insert(AvailableTracks, v)
					end
				end
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
				local randomNumber = ZombRand(#AvailableTracks) + 1
				local randomTrack = AvailableTracks[randomNumber]
				local length = randomTrack.length * 48
				
				-- DEFAULT ANIM TO PLAY WHEN SITTING
				
				if level < 4 then
				actionType = "Bob_PlayHarmonicaDefaultBeginner"
				else
				actionType = "Bob_PlayHarmonicaDefault"
				end
				

				
				-- CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif randomTrack.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 3 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.2 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = 0.6 * XPPerSecond * randomTrack.length * (randomTrack.level + 1)
					else
					xp = XPPerSecond * randomTrack.length * (randomTrack.level + 1) -- NO SPECIFIC TRAIT
					end

				-- TRACKS LEVEL 6 OR ABOVE
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = 5 * randomTrack.length * (randomTrack.level / level)
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
					xp = 0.5 * randomTrack.length * (randomTrack.level / level)
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
					xp = randomTrack.length * (randomTrack.level / level)
				else -- NO SPECIFIC TRAIT
					xp = 2 * randomTrack.length * (randomTrack.level / level)
				end


				-- CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
				if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
				boredomReduction = 3 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = 3 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)
				
				elseif player:HasTrait("KeenHearing") then -- KEEN HEARING GETS A BONUS IF NOT VIRTUOSO
				boredomReduction = 2 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = 2 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)
				
				elseif player:HasTrait("ToneDeaf") then -- TONE DEAF TRAIT
				boredomReduction = ((-2 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				stressReduction = ((-2 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				
				elseif player:HasTrait("HardOfHearing") then -- HARD OF HEARING TRAIT
				boredomReduction = ((-1 * BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				stressReduction = ((-1 * StressPerSecond * randomTrack.length * (randomTrack.level + 1)) / (level + 1))
				
				else
				boredomReduction = BoredomPerSecond * randomTrack.length * (randomTrack.level + 1)
				stressReduction = StressPerSecond * randomTrack.length * (randomTrack.level + 1)

				end


			-- DEFINING ANIM FOR EACH COUPLE OF LEVELS TO PLAY DIFFERENTLY AND ADDING A RANDOM FACTOR TO IT
			
			if not isSitOnGround then
			
				if randomTrack.level >= 8 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
					
				elseif randomTrack.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				elseif randomTrack.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaProficientC"
					end
				
				elseif randomTrack.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
					
				elseif randomTrack.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end

					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaExperiencedC"
					end
			

				else
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayHarmonicaBeginnerA"
					end
				
				end
				
			end -- isSitOnGround
				
			-- ADDING THE OPTION TO PLAY RANDOM
				contextMenu = "ContextMenu_Play_Random_Harmonica"
	local HarmonicaWorldOption = context:addOption(getText(contextMenu), worldobjects, OnInstrumentEquippedMenu.Play, player, equippedInstrument, randomTrack.sound, length, randomTrack.level, xp, boredomReduction, stressReduction, actionType);


else
return
end -- END OF INSTRUMENT

end)