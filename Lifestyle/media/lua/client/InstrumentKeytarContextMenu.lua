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
local PlayInstrumentAction = require "TimedActions/PlayInstrumentAction"
local PlayInstrumentActionWorld = require "TimedActions/PlayInstrumentActionWorld"
-- then we define our instrument(s)

local Instrument = { -- KEYTAR
    ['Base.Keytar'] = true,
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
    ISTimedActionQueue.add(PlayInstrumentAction:new(player, item, soundFile, length, level, isTraining, isDuet, xp, boredomReduction, stressReduction, actionType));

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
    ISTimedActionQueue.add(PlayInstrumentActionWorld:new(player, equippedInstrument, soundFile, length, level, xp, boredomReduction, stressReduction, actionType));

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
			(player:getInventory():contains(item) == false) or
			item:getAttachedSlot() ~= -1
			then -- check to not allow broken items or not in main inventory - change this for item transfer later
			break
			end
		
            if 'Base.Keytar' then -- CHANGE THIS LINE
				
			
			
				local PlayKeytarTracks = require("TimedActions/PlayKeytarTracks")
				local AvailableTracks = {}
	
				-- we get the songs and apply any conditions we may want, in this case skilled players won't play basic beginner songs randomly when they select the Play it option
				for k,v in pairs(PlayKeytarTracks) do
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
				actionType = "Bob_PlayKeytarDefaultBeginner"
				else
				actionType = "Bob_PlayKeytarDefault"
				end

				
				-- CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif randomTrack.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * randomTrack.length * (randomTrack.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif randomTrack.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif randomTrack.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end

					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			

				else
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				
				end
				
			end -- isSitOnGround
				
			-- ADDING THE OPTION TO PLAY RANDOM
				contextMenu = "ContextMenu_Play_Random_Keytar"
                local keytarrandomoption = context:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, false, false, xp, boredomReduction, stressReduction, actionType);
				keytarrandomoption.iconTexture = getTexture('media/ui/keytar_icon.png')

			--2 ADDING THE SUBMENU TO PLAY SONGS YOUR LEVEL BY NAME
	
				if level < 10 then
					contextMenu = "ContextMenu_Play_L" .. level .. "_Keytar"
				else
					contextMenu = "ContextMenu_Play_Master_Keytar"
				end
	
				local buildOption = context:addOption(getText(contextMenu));
				buildOption.iconTexture = getTexture('media/ui/keytar_icon.png')
				local subMenu = ISContextMenu:getNew(context);
				context:addSubMenu(buildOption, subMenu)

			--2 ADDING THE OPTION TO PLAY SONGS YOUR LEVEL BY NAME
				for k,v in pairs(PlayKeytarTracks) do
					if v.level == level then
					local length = v.length * 48
			
			--2 CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif v.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
						xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif v.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			
				else
				
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				
				end
			end
			
			--2 ADDING THE OPTION IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuOption = subMenu:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end

				end --if
	end --for
	
	
	--3 PLAY A SONG FROM GROUP LEVEL - STARTS AT 1 TO AVOID REDUNDANCY
	if level > 0 then
		
	--3 ADDING GROUPS SUBMENU
		contextMenu = "ContextMenu_Play_Group_Keytar"
		
		local buildOption = context:addOption(getText(contextMenu));
		buildOption.iconTexture = getTexture('media/ui/moodles/MusicGood.png')
		local parentMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, parentMenu)
		
		--3A ADDING BEGINNER LEVEL GROUP SUBMENU 0-1
		contextMenu = "ContextMenu_Play_Beginner_Keytar"
		
		local beginnerMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuA = parentMenu:getNew(parentMenu);
		context:addSubMenu(beginnerMenu, subMenuA)
		
		for k,v in pairs(PlayKeytarTracks) do
			if v.level <= 1 and v.level <= level then
				local length = v.length * 48

			--3A CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
				
				else
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				end
				end
			
		--3A ADDING THE OPTION FOR BEGINNER SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuAOption = subMenuA:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuAOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
		
		
		if level > 2 then
		
		--3B ADDING EXPERIENCED LEVEL GROUP SUBMENU 2-3
		contextMenu = "ContextMenu_Play_Experienced_Keytar"
		
		local experiencedMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuB = parentMenu:getNew(parentMenu);
		context:addSubMenu(experiencedMenu, subMenuB)
		
		for k,v in pairs(PlayKeytarTracks) do
			if v.level > 1 and v.level <= 3 and v.level <= level then
				local length = v.length * 48
				
			--3B CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
				
			end
			
			--3B ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuBOption = subMenuB:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuBOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
		
		
		
		if level > 4 then
			
			--3C ADDING INTERMEDIATE LEVEL GROUP SUBMENU 4-5
			contextMenu = "ContextMenu_Play_Intermediate_Keytar"
			
		local intermediateMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuC = parentMenu:getNew(parentMenu);
		context:addSubMenu(intermediateMenu, subMenuC)
			
		for k,v in pairs(PlayKeytarTracks) do
			if v.level > 3 and v.level <= 5 and v.level <= level then
				local length = v.length * 48
				
			--3C CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientA"
					end
			
			else

					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			end
		end
				
			--3C ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuCOption = subMenuC:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuCOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
			
			
			
		if level > 6 then
			
			--3D ADDING PROFICIENT LEVEL GROUP SUBMENU 6-7
			contextMenu = "ContextMenu_Play_Proficient_Keytar"
			
		local proficientMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuD = parentMenu:getNew(parentMenu);
		context:addSubMenu(proficientMenu, subMenuD)
			
		for k,v in pairs(PlayKeytarTracks) do
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				end
				
			--3D ADDING THE OPTION FOR PROFICIENT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuDOption = subMenuD:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuDOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
			
			
			
		if level > 8 then
				
			--3E ADDING EXPERT LEVEL GROUP SUBMENU 8-9
			contextMenu = "ContextMenu_Play_Advanced_Keytar"
			
		local expertMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuE = parentMenu:getNew(parentMenu);
		context:addSubMenu(expertMenu, subMenuE)
			
		for k,v in pairs(PlayKeytarTracks) do
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				end
							
			--3E ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuEOption = subMenuE:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuEOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
			end
			end -- if level > 8
			
			

			end -- if level > 6
			end -- if level > 4
		end -- if level > 2


	--3F ------------------------------------------ADDING DUETS GROUP SUBMENU Level > 3 -------------------------------
	if level > 3 then
	
		if not isSitOnGround then
				

		contextMenu = "ContextMenu_Play_Duet_Keytar"
			
		local duetMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuF = parentMenu:getNew(parentMenu);
		context:addSubMenu(duetMenu, subMenuF)
		
		local DuetTooltip = ISToolTip:new();
		DuetTooltip:initialise();
		DuetTooltip:setVisible(false);
		DuetTooltip.description = getText("ContextMenu_Play_Duet_InstrumentsNeeded")
		
		local PlayKeytarTracksDuet = require("TimedActions/PlayKeytarTracksDuet")
		local AvailableTracksDuet = {}
		for k,v in pairs(PlayKeytarTracksDuet) do
			if v.level <= level then
				table.insert(AvailableTracksDuet, v)
				local length = v.length * 48
				local actionType = v.actionType
			
			--3F CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
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
			
			--3F CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
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

							
			--3F ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local SubMenuFoption = subMenuF:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, true, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				SubMenuFoption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
				local subsubMenu = subMenuF:getNew(subMenuF);
				context:addSubMenu(SubMenuFoption, subsubMenu)
				
				if v.guitaracoustic == 1 then				
				local subsubMenuGA = subsubMenu:addOption(getText("ContextMenu_GuitarAcoustic"))
				subsubMenuGA.iconTexture = getTexture('media/ui/guitaracoustic_icon.png')
				subsubMenuGA.toolTip = DuetTooltip
				end
				if v.guitarelectric == 1 then
				local subsubMenuGE = subsubMenu:addOption(getText("ContextMenu_GuitarElectric"))
				subsubMenuGE.iconTexture = getTexture('media/ui/guitarelectric_icon.png')
				subsubMenuGE.toolTip = DuetTooltip
				end
				if v.guitarelectricbass == 1 then
				local subsubMenuGEB = subsubMenu:addOption(getText("ContextMenu_GuitarElectricBass"))
				subsubMenuGEB.iconTexture = getTexture('media/ui/guitarelectricbass_icon.png')
				subsubMenuGEB.toolTip = DuetTooltip
				end
				if v.flute == 1 then
				local subsubMenuF = subsubMenu:addOption(getText("ContextMenu_Flute"))
				subsubMenuF.iconTexture = getTexture('media/ui/flute_icon.png')
				subsubMenuF.toolTip = DuetTooltip
				end
				if v.trumpet == 1 then
				local subsubMenuT = subsubMenu:addOption(getText("ContextMenu_Trumpet"))
				subsubMenuT.iconTexture = getTexture('media/ui/trumpet_icon.png')
				subsubMenuT.toolTip = DuetTooltip
				end
				if v.saxophone == 1 then
				local subsubMenuS = subsubMenu:addOption(getText("ContextMenu_Saxophone"))
				subsubMenuS.iconTexture = getTexture('media/ui/saxophone_icon.png')
				subsubMenuS.toolTip = DuetTooltip
				end
				if v.banjo == 1 then
				local subsubMenuB = subsubMenu:addOption(getText("ContextMenu_Banjo"))
				subsubMenuB.iconTexture = getTexture('media/ui/banjo_icon.png')
				subsubMenuB.toolTip = DuetTooltip
				end
				if v.violin == 1 then
				local subsubMenuV = subsubMenu:addOption(getText("ContextMenu_Violin"))
				subsubMenuV.iconTexture = getTexture('media/ui/violin_icon.png')
				subsubMenuV.toolTip = DuetTooltip
				end
				--if v.drums == 1 then
				--local subsubMenuD = subsubMenu:addOption(getText("ContextMenu_Drums"))
				--subsubMenuD.iconTexture = getTexture('media/ui/drums_icon.png')
				--subsubMenuD.toolTip = DuetTooltip
				--end
				--if v.piano == 1 then
				--local subsubMenuP = subsubMenu:addOption(getText("ContextMenu_Piano"))
				--subsubMenuP.iconTexture = getTexture('media/ui/piano_icon.png')
				--subsubMenuP.toolTip = DuetTooltip
				--end
				--if v.harmonica == 1 then
				--local subsubMenuH = subsubMenu:addOption(getText("ContextMenu_Harmonica"))
				--subsubMenuH.iconTexture = getTexture('media/ui/harmonica_icon.png')
				--subsubMenuH.toolTip = DuetTooltip
				--end
			end
			end
			end -- if not sitonground
			end -- if level > 3 DUET
		
	end -- if level > 0
	
	
	
	-- TRAINING (DO NOT UNCOMMENT - WAITING FOR ANIMS/SOUNDS NEXT UPDATE)
--	if not isSitOnGround and level < 6 then
--		local TrainingKeytarTracks = require("TimedActions/TrainingKeytarTracks") -- MAKE SURE ITS REQUESTING THE CORRECT TRACKS
--		local trainingTracks = {}
--		
--		for k,v in pairs(TrainingKeytarTracks) do
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
--		contextMenu = "ContextMenu_Training_Keytar"
--		
--       context:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, true, false, xp, boredomReduction, stressReduction, actionType); --> Create a new option on the context menu
--
--	end -- TRAINING
break;
 -- IF KEYTAR
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
            elseif player:getPrimaryHandItem():getFullType() == 'Base.Keytar' then -- CHANGE THIS LINE

				

				local equippedInstrument = player:getPrimaryHandItem():getFullType()
				local PlayKeytarTracks = require("TimedActions/PlayKeytarTracks")
				local AvailableTracks = {}
	
				-- we get the songs and apply any conditions we may want, in this case skilled players won't play basic beginner songs randomly when they select the Play it option
				for k,v in pairs(PlayKeytarTracks) do
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
				actionType = "Bob_PlayKeytarDefaultBeginner"
				else
				actionType = "Bob_PlayKeytarDefault"
				end
				

				
				-- CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif randomTrack.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * randomTrack.length * (randomTrack.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif randomTrack.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif randomTrack.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end

					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			

				else
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				
				end
				
			end -- isSitOnGround
				
			-- ADDING THE OPTION TO PLAY RANDOM
				contextMenu = "ContextMenu_Play_Random_Keytar"
	local KeytarWorldOption = context:addOption(getText(contextMenu), worldobjects, OnInstrumentEquippedMenu.Play, player, equippedInstrument, randomTrack.sound, length, randomTrack.level, xp, boredomReduction, stressReduction, actionType);
	KeytarWorldOption.iconTexture = getTexture('media/ui/keytar_icon.png')

else
return
end -- END OF INSTRUMENT

end)



------------------------- we use the following to insert the menu on the hotbar and hand slot when the instrument is attached to the player

local function KeytarOnHotbar(player, context, items)

    local player = getSpecificPlayer(player);
	local level = -1;
	local soundFile = nil;
	local actionType = nil
	local contextMenu = nil;
	local HotbarInstrument = nil
	local item = nil
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



	for i,v in ipairs(items) do
        HotbarInstrument = v;
        if not instanceof(v, "InventoryItem") then
			HotbarInstrument = v.items[1];
        end

		if HotbarInstrument:getFullType() == 'Base.Keytar' and
		HotbarInstrument:getAttachedSlot() ~= -1 then
		
			item = HotbarInstrument

			if item:isBroken() or
			(item:isInPlayerInventory() == false) or
			(player:getInventory():contains(item) == false)
			then -- check to not allow broken items or not in main inventory - change this for item transfer later
			break
			end

				local PlayKeytarTracks = require("TimedActions/PlayKeytarTracks")
				local AvailableTracks = {}
	
	
	
	--3 PLAY A SONG FROM GROUP LEVEL - STARTS AT 1 TO AVOID REDUNDANCY
	if level > 0 then
		
	--3 ADDING GROUPS SUBMENU
		contextMenu = "ContextMenu_Play_Group_Keytar"
		
		local buildOption = context:addOptionOnTop(getText(contextMenu));
		buildOption.iconTexture = getTexture('media/ui/moodles/MusicGood.png')
		local parentMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, parentMenu)
		
		--3A ADDING BEGINNER LEVEL GROUP SUBMENU 0-1
		contextMenu = "ContextMenu_Play_Beginner_Keytar"
		
		local beginnerMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuA = parentMenu:getNew(parentMenu);
		context:addSubMenu(beginnerMenu, subMenuA)
		
		for k,v in pairs(PlayKeytarTracks) do
			if v.level <= 1 and v.level <= level then
				local length = v.length * 48

			--3A CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
				
				else
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				end
				end
			
		--3A ADDING THE OPTION FOR BEGINNER SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuAOption = subMenuA:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuAOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
		
		
		if level > 2 then
		
		--3B ADDING EXPERIENCED LEVEL GROUP SUBMENU 2-3
		contextMenu = "ContextMenu_Play_Experienced_Keytar"
		
		local experiencedMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuB = parentMenu:getNew(parentMenu);
		context:addSubMenu(experiencedMenu, subMenuB)
		
		for k,v in pairs(PlayKeytarTracks) do
			if v.level > 1 and v.level <= 3 and v.level <= level then
				local length = v.length * 48
				
			--3B CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
				
			end
			
			--3B ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuBOption = subMenuB:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuBOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
		
		
		
		if level > 4 then
			
			--3C ADDING INTERMEDIATE LEVEL GROUP SUBMENU 4-5
			contextMenu = "ContextMenu_Play_Intermediate_Keytar"
			
		local intermediateMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuC = parentMenu:getNew(parentMenu);
		context:addSubMenu(intermediateMenu, subMenuC)
			
		for k,v in pairs(PlayKeytarTracks) do
			if v.level > 3 and v.level <= 5 and v.level <= level then
				local length = v.length * 48
				
			--3C CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
			
			else

					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			end
		end
				
			--3C ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuCOption = subMenuC:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuCOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
			
			
			
		if level > 6 then
			
			--3D ADDING PROFICIENT LEVEL GROUP SUBMENU 6-7
			contextMenu = "ContextMenu_Play_Proficient_Keytar"
			
		local proficientMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuD = parentMenu:getNew(parentMenu);
		context:addSubMenu(proficientMenu, subMenuD)
			
		for k,v in pairs(PlayKeytarTracks) do
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				end
				
			--3D ADDING THE OPTION FOR PROFICIENT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuDOption = subMenuD:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuDOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
		end
			
			
			
		if level > 8 then
				
			--3E ADDING EXPERT LEVEL GROUP SUBMENU 8-9
			contextMenu = "ContextMenu_Play_Advanced_Keytar"
			
		local expertMenu = parentMenu:addOption(getText(contextMenu));
		
		local subMenuE = parentMenu:getNew(parentMenu);
		context:addSubMenu(expertMenu, subMenuE)
			
		for k,v in pairs(PlayKeytarTracks) do
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				end
							
			--3E ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuEOption = subMenuE:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuEOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
			end
			end
			end -- if level > 8
			
			

			end -- if level > 6
			end -- if level > 4
		end -- if level > 2


	--3F ------------------------------------------ADDING DUETS GROUP SUBMENU Level > 3 -------------------------------
	if level > 3 then
	
		if not isSitOnGround then
				

		contextMenu = "ContextMenu_Play_Duet_Keytar"
			
		local duetMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
		local subMenuF = parentMenu:getNew(parentMenu);
		context:addSubMenu(duetMenu, subMenuF)
		
		local DuetTooltip = ISToolTip:new();
		DuetTooltip:initialise();
		DuetTooltip:setVisible(false);
		DuetTooltip.description = getText("ContextMenu_Play_Duet_InstrumentsNeeded")
		
		local PlayKeytarTracksDuet = require("TimedActions/PlayKeytarTracksDuet")
		local AvailableTracksDuet = {}
		for k,v in pairs(PlayKeytarTracksDuet) do
			if v.level <= level then
				table.insert(AvailableTracksDuet, v)
				local length = v.length * 48
				local actionType = v.actionType
			
			--3F CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
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
			
			--3F CALCULATING BOREDOM AND STRESS REDUCTION BASED ON LENGTH, TRACK LEVEL AND TRAITS
				
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

							
			--3F ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
				contextMenu = v.name
				local SubMenuFoption = subMenuF:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, true, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				SubMenuFoption.iconTexture = getTexture('media/ui/addon_icon.png')
				end
				local subsubMenu = subMenuF:getNew(subMenuF);
				context:addSubMenu(SubMenuFoption, subsubMenu)
				
				if v.guitaracoustic == 1 then				
				local subsubMenuGA = subsubMenu:addOption(getText("ContextMenu_GuitarAcoustic"))
				subsubMenuGA.iconTexture = getTexture('media/ui/guitaracoustic_icon.png')
				subsubMenuGA.toolTip = DuetTooltip
				end
				if v.guitarelectric == 1 then
				local subsubMenuGE = subsubMenu:addOption(getText("ContextMenu_GuitarElectric"))
				subsubMenuGE.iconTexture = getTexture('media/ui/guitarelectric_icon.png')
				subsubMenuGE.toolTip = DuetTooltip
				end
				if v.guitarelectricbass == 1 then
				local subsubMenuGEB = subsubMenu:addOption(getText("ContextMenu_GuitarElectricBass"))
				subsubMenuGEB.iconTexture = getTexture('media/ui/guitarelectricbass_icon.png')
				subsubMenuGEB.toolTip = DuetTooltip
				end
				if v.flute == 1 then
				local subsubMenuF = subsubMenu:addOption(getText("ContextMenu_Flute"))
				subsubMenuF.iconTexture = getTexture('media/ui/flute_icon.png')
				subsubMenuF.toolTip = DuetTooltip
				end
				if v.trumpet == 1 then
				local subsubMenuT = subsubMenu:addOption(getText("ContextMenu_Trumpet"))
				subsubMenuT.iconTexture = getTexture('media/ui/trumpet_icon.png')
				subsubMenuT.toolTip = DuetTooltip
				end
				if v.saxophone == 1 then
				local subsubMenuS = subsubMenu:addOption(getText("ContextMenu_Saxophone"))
				subsubMenuS.iconTexture = getTexture('media/ui/saxophone_icon.png')
				subsubMenuS.toolTip = DuetTooltip
				end
				if v.banjo == 1 then
				local subsubMenuB = subsubMenu:addOption(getText("ContextMenu_Banjo"))
				subsubMenuB.iconTexture = getTexture('media/ui/banjo_icon.png')
				subsubMenuB.toolTip = DuetTooltip
				end
				if v.violin == 1 then
				local subsubMenuV = subsubMenu:addOption(getText("ContextMenu_Violin"))
				subsubMenuV.iconTexture = getTexture('media/ui/violin_icon.png')
				subsubMenuV.toolTip = DuetTooltip
				end
				--if v.drums == 1 then
				--local subsubMenuD = subsubMenu:addOption(getText("ContextMenu_Drums"))
				--subsubMenuD.iconTexture = getTexture('media/ui/drums_icon.png')
				--subsubMenuD.toolTip = DuetTooltip
				--end
				--if v.piano == 1 then
				--local subsubMenuP = subsubMenu:addOption(getText("ContextMenu_Piano"))
				--subsubMenuP.iconTexture = getTexture('media/ui/piano_icon.png')
				--subsubMenuP.toolTip = DuetTooltip
				--end
				--if v.harmonica == 1 then
				--local subsubMenuH = subsubMenu:addOption(getText("ContextMenu_Harmonica"))
				--subsubMenuH.iconTexture = getTexture('media/ui/harmonica_icon.png')
				--subsubMenuH.toolTip = DuetTooltip
				--end
			end
			end
			end -- if not sitonground
			end -- if level > 3 DUET
		
	end -- if level > 0
	

			--2 ADDING THE SUBMENU TO PLAY SONGS YOUR LEVEL BY NAME
	
				if level < 10 then
					contextMenu = "ContextMenu_Play_L" .. level .. "_Keytar"
				else
					contextMenu = "ContextMenu_Play_Master_Keytar"
				end
	
				local buildOption = context:addOptionOnTop(getText(contextMenu));
				buildOption.iconTexture = getTexture('media/ui/keytar_icon.png')
				local subMenu = ISContextMenu:getNew(context);
				context:addSubMenu(buildOption, subMenu)

			--2 ADDING THE OPTION TO PLAY SONGS YOUR LEVEL BY NAME
				for k,v in pairs(PlayKeytarTracks) do
					if v.level == level then
					local length = v.length * 48
			
			--2 CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif v.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
						xp = XPPerSecond * v.length * (v.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif v.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif v.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			
				else
				
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				
				end
			end
			
			--2 ADDING THE OPTION IN THE CONTEXT MENU
				contextMenu = v.name
				local subMenuOption = subMenu:addOption(getText(contextMenu), player, OnInstrumentMenu.Play, item, v.sound, length, v.level, false, false, xp, boredomReduction, stressReduction, actionType);
				if v.isaddon ~= 0 then
				subMenuOption.iconTexture = getTexture('media/ui/addon_icon.png')
				end

				end --if
	end --for

				-- we get the songs and apply any conditions we may want, in this case skilled players won't play basic beginner songs randomly when they select the Play it option
				for k,v in pairs(PlayKeytarTracks) do
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
				actionType = "Bob_PlayKeytarDefaultBeginner"
				else
				actionType = "Bob_PlayKeytarDefault"
				end

				
				-- CALCULATING XP GAINS BY LEVEL AND TRACK LEVEL (PLAYING LOWER LEVEL TRACKS GIVE LESS XP)
				if level >= 10 then
					xp = 0
				elseif randomTrack.level < 6 then -- IF TRACK PLAYED IS UNDER LEVEL 6
					if player:HasTrait("Virtuoso") then -- VIRTUOSO TRAIT
					xp = XPPerSecond * randomTrack.length * (randomTrack.level + 1)
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
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
					
				elseif randomTrack.level >= 6 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 and
				level > 5 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarProficientB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarProficientC"
					end
				
				elseif randomTrack.level >= 4 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarProficientA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedC"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
					
				elseif randomTrack.level >= 2 then
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end

					
				elseif level > 1 then
				
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarExperiencedA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarExperiencedB"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarExperiencedC"
					end
			

				else
					if randomNumberAnim >= 64 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 34 then
						actionType = "Bob_PlayKeytarBeginnerA"
					elseif randomNumberAnim >= 1 then
						actionType = "Bob_PlayKeytarBeginnerA"
					end
				
				end
				
			end -- isSitOnGround
				
			-- ADDING THE OPTION TO PLAY RANDOM
				contextMenu = "ContextMenu_Play_Random_Keytar"
                local keytarrandomoption = context:addOptionOnTop(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, false, false, xp, boredomReduction, stressReduction, actionType);
				keytarrandomoption.iconTexture = getTexture('media/ui/keytar_icon.png')
	
	
	-- TRAINING  (DO NOT UNCOMMENT - WAITING FOR ANIMS/SOUNDS NEXT UPDATE)
--	if not isSitOnGround and level < 6 then
--		local TrainingKeytarTracks = require("TimedActions/TrainingKeytarTracks")
--		local trainingTracks = {}
--		
--		for k,v in pairs(TrainingKeytarTracks) do
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
--		contextMenu = "ContextMenu_Training_Keytar"
--		
--        context:addOptionOnTop(getText(contextMenu), player, OnInstrumentMenu.Play, item, randomTrack.sound, length, randomTrack.level, true, false, xp, boredomReduction, stressReduction, actionType); --> Create a new option on the context menu
--
--	end -- TRAINING
break;

		end--If Keytar
	end

end

Events.OnFillInventoryObjectContextMenu.Add(KeytarOnHotbar)