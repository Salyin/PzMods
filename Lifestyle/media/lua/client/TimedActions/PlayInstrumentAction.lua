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



require "TimedActions/ISBaseTimedAction"

local PlayInstrumentAction = ISBaseTimedAction:derive('PlayInstrumentAction');
local Failstate = false
local randomchance = ZombRand(1, 100)
local MusicDoTextHelperUnhappyness = 0
local MusicDoTextHelperBoredom = 0

local function adjustStats(character, tracklevel)

	local characterData = character:getModData()
	local PlayerMusicLevel = character:getPerkLevel(Perks.Music)
	local bodyDamage = character:getBodyDamage()
	local stats = character:getStats()
	local currentBoredom = bodyDamage:getBoredomLevel()
	local currentUnhappyness = bodyDamage:getUnhappynessLevel()
	local currentStress = stats:getStress();
	local currentExhaustion = stats:getEndurance()
	local currentFatigue = stats:getFatigue()
	if character:HasTrait("Smoker") then
		stats:setStressFromCigarettes(0)
	end

	--SANDBOX
	local StrengthMultiplier = 1
	local sandboxMusicStrengthMultiplier = SandboxVars.Music.StrengthMultiplier or 2
	if sandboxMusicStrengthMultiplier ~= nil then
		if sandboxMusicStrengthMultiplier == 1 then
			StrengthMultiplier = 0.5
		elseif sandboxMusicStrengthMultiplier == 2 then
			StrengthMultiplier = 1
		elseif sandboxMusicStrengthMultiplier == 3 then
			StrengthMultiplier = 2
		elseif sandboxMusicStrengthMultiplier == 4 then
			StrengthMultiplier = 4
		end
	end

	--VARIABLES
	--local Party = 0
	local Trait = 0
	local Level = 0
	local varMult = 1
	local reverseBuffs = 0
	--TRAIT
	if character:HasTrait("Virtuoso") then
		Trait = 2
	elseif character:HasTrait("KeenHearing") then
		Trait = 1
	elseif character:HasTrait("HardOfHearing") then
		if varMult > 0.9 then
		varMult = 0.9
		end
	elseif character:HasTrait("ToneDeaf") then
		reverseBuffs = 1
	end
	--LEVEL
	Level = ((tonumber(PlayerMusicLevel))/3) + ((tonumber(tracklevel))/3)
	
	--STRESS
	if currentStress >= 0.8 then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif (characterData.LSMoodles["PartyGood"].Value == 0.4) then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif (characterData.LSMoodles["PartyGood"].Value == 0.2) then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif (characterData.LSMoodles["PartyBad"].Value == 0.6) then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif characterData.LSMoodles["PartyBad"].Value == 0.4 then
		if varMult > 0.15 then
		varMult = 0.15
		end
	elseif characterData.LSMoodles["PartyBad"].Value == 0.2 then
		if varMult > 0.3 then
		varMult = 0.3
		end
	end

	--EMBARRASSED
	if (characterData.LSMoodles["Embarrassed"].Value == 0.8) then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif (characterData.LSMoodles["Embarrassed"].Value == 0.6) then
		if varMult > 0.15 then
		varMult = 0.15
		end
	elseif characterData.LSMoodles["Embarrassed"].Value == 0.4 then
		if varMult > 0.3 then
		varMult = 0.3
		end
	elseif characterData.LSMoodles["Embarrassed"].Value == 0.2 then
		if varMult > 0.5 then
		varMult = 0.5
		end
	end

	--FATIGUE
	if currentFatigue >= 0.8 then
		if varMult > 0.02 then
		varMult = 0.02
		end
	elseif currentFatigue >= 0.7 then
		if varMult > 0.2 then
		varMult = 0.2
		end
	elseif currentFatigue >= 0.5 then
		if varMult > 0.4 then
		varMult = 0.4
		end
	elseif currentFatigue >= 0.4 then
		if varMult > 0.6 then
		varMult = 0.6
		end
	end

	--EXHAUSTION
	if currentExhaustion <= 0.2 then
		if varMult > 0.02 then
		varMult = 0.02
		end
	elseif currentExhaustion <= 0.3 then
		if varMult > 0.2 then
		varMult = 0.2
		end
	elseif currentExhaustion <= 0.4 then
		if varMult > 0.4 then
		varMult = 0.4
		end
	elseif currentExhaustion <= 0.7 then
		if varMult > 0.6 then
		varMult = 0.6
		end
	end

	--RESULT
	local varAdd = Trait + Level + 1
	local varAddRev = Trait + Level + StrengthMultiplier + 1
	local varResult = varAdd * varMult * StrengthMultiplier
	
	if reverseBuffs == 1 then
		if varAddRev >= 6  then
			varAddRev = 5.9
		end
		varResult = (6 - varAddRev)/varMult
	end
	
	--DEFINES
	--ENDURANCE
	stats:setEndurance(currentExhaustion - 0.003)
	stats:setFatigue(currentFatigue + 0.001)
	--BOREDOM 0 - 100
	local boredomChange = 1 * varResult
	--STRESS 0 - 1
	local stressChange = 0.005 * varResult
	--UNHAPPYNESS 0 - 100
	local unhappynessChange = 0.5 * varResult

	--SET
	if reverseBuffs == 1 then
		bodyDamage:setBoredomLevel(currentBoredom + boredomChange)
		stats:setStress(currentStress + stressChange)
		bodyDamage:setUnhappynessLevel(currentUnhappyness + unhappynessChange)
		varResult = varAdd * varMult * StrengthMultiplier * 0.5-- FOR XP
	else	
		bodyDamage:setBoredomLevel(currentBoredom - boredomChange)
		stats:setStress(currentStress - stressChange)
		bodyDamage:setUnhappynessLevel(currentUnhappyness - unhappynessChange)
	end

	--XP
	local xpChange = varResult
	if PlayerMusicLevel == 10 then
		xpChange = 0
	end
	character:getXp():AddXP(Perks.Music, xpChange)

	--HALOTEXT

	if boredomChange >= 10 then
		MusicDoTextHelperBoredom = 3
	elseif boredomChange >= 5 then
		MusicDoTextHelperBoredom = 2
	elseif boredomChange >= 1 then
		MusicDoTextHelperBoredom = 1
	end

	if unhappynessChange >= 5 then
		MusicDoTextHelperUnhappyness = 2
	elseif unhappynessChange >= 1 then
		MusicDoTextHelperUnhappyness = 1
	end

end
	
function PlayInstrumentAction:isValid()

   return true;
end


function PlayInstrumentAction:waitToStart()
		return false
	end

function PlayInstrumentAction:update()
	
	if isKeyDown(Keyboard.KEY_E) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_C) then
		self:forceStop()
	end
	if self.character:isSneaking() then
		self:forceStop()
	end

	--CODE FOR WAITING ANIM AND TRIGGER FOR DUET
	
	if self.character:getPrimaryHandItem() == nil then
		self:forceStop()
	end
	
	if self.character:getPrimaryHandItem():getFullType() == 'Base.Trumpet' then
	
	waitforTime = "Bob_PlayTrumpetWaiting"
	
	elseif self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarAcoustic' then

	waitforTime = "Bob_PlayGuitarWaiting"

	elseif self.character:getPrimaryHandItem():getFullType() == 'Base.Banjo' then

	waitforTime = "Bob_PlayGuitarWaiting"

	elseif self.character:getPrimaryHandItem():getFullType() == 'Base.Keytar' then

	waitforTime = "Bob_PlayKeytarWaiting"
	
	elseif self.character:getPrimaryHandItem():getFullType() == 'Base.Saxophone' then

	waitforTime = "Bob_PlaySaxophoneWaiting"
	
	elseif (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlack') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlue') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassRed')
		then
	
	waitforTime = "Bob_PlayGuitarBassWaiting"
	
	elseif self.character:getPrimaryHandItem():getFullType() == 'Base.Flute' then

	waitforTime = "Bob_PlayFluteWaiting"
	
	elseif (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlack') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlue') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricRed')
		then
	
	waitforTime = "Bob_PlayGuitarBassWaiting"
	
	--------------------------------------------------------------------------------------------------------ADDOTHERINSTRUMENTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	else
	
	waitforTime = "Loot"
	
	end
	
	if self.character:getModData().WaitingDuet == true then
	self:setActionAnim(waitforTime)
	self:resetJobDelta()
	else
	
	--ENDOFDUET
	
	-- panic check
	if not self.character:HasTrait("Desensitized") then
		if self.character:HasTrait("Brave") or self.character:HasTrait("Disciplined") then
			if self.character:getMoodles():getMoodleLevel(MoodleType.Panic) > 3 then
				Failstate = true
			end
		elseif self.character:getMoodles():getMoodleLevel(MoodleType.Panic) > 2 then
				Failstate = true
		end
	end
	
	if Failstate == true then
	self:forceStop()
	end
	
	local playerlevel = self.character:getPerkLevel(Perks.Music)
	local tracklevel = self.level
	
	if self.isTraining and
	playerlevel < 2 then
	
	if self.character:isAiming() then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_LCONTROL) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_A) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_W) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_S) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_D) then
		self:forceStop()
	end
	
	end
	
	local actionType = self.actionType
	self:setActionAnim(actionType)

	local isPlaying = self.gameSound
		and self.gameSound ~= 0
		and self.character:getEmitter():isPlaying(self.gameSound)

	if not isPlaying then
		-- Some examples of radius and volume found in PZ code:
		-- Fishing (20,1)
		-- Remove Grass (10,5)
		-- Remove Glass (20,1)
		-- Destroy Stuff (20,10)
		-- Remove Bush (20,10)
		-- Move Sprite (10,5)
		local soundRadius = 10
		local volume = 5
		
		if self.character:isOutside() then
		soundRadius = 30
		volume = 10
		end

		self.gameSound = self.character:getEmitter():playSound(self.soundFile);
		
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
		
	end
	
	self.actionCount = self.actionCount + 1
	if self.actionCount > self.actionTotal then
		self.actionCount = 0
		adjustStats(self.character, self.level)
		
		local soundRadius = 10
		local volume = 5
		
		if self.character:isOutside() then
		soundRadius = 30
		volume = 10
		end

		-- update for zombies as the character moves

		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
	
	if not self.isTraining then
	
		if playerlevel >= tracklevel and
		playerlevel <= 5 then
		
		if not self.isDuet then

	-- stressCheck
	if not self.character:HasTrait("Disciplined") then
		if self.character:HasTrait("Dextrous") then
			if self.character:getStats():getStress() > 0.8 then
					randomchance = ZombRand(22, 100)
			elseif self.character:getStats():getStress() > 0.5 then
					randomchance = ZombRand(14, 100)
			elseif self.character:getStats():getStress() > 0.2 then
					randomchance = ZombRand(6, 100)
			else
					randomchance = ZombRand(1, 100)
			end
		elseif self.character:HasTrait("Clumsy") then
				if self.character:getStats():getStress() > 0.8 then
				randomchance = ZombRand(48, 100)
				elseif self.character:getStats():getStress() > 0.5 then
					randomchance = ZombRand(36, 100)
				elseif self.character:getStats():getStress() > 0.2 then
					randomchance = ZombRand(24, 100)
				else
					randomchance = ZombRand(16, 100)
				end
		elseif self.character:getStats():getStress() > 0.8 then
				randomchance = ZombRand(31, 100)
		elseif self.character:getStats():getStress() > 0.5 then
				randomchance = ZombRand(21, 100)
		elseif self.character:getStats():getStress() > 0.2 then
				randomchance = ZombRand(11, 100)
		else
				randomchance = ZombRand(1, 100)
		end
	elseif self.character:HasTrait("Clumsy") then
	randomchance = ZombRand(16, 100)
	else
	randomchance = ZombRand(1, 100)
	end
		
			
			if playerlevel > tracklevel + 2
			and randomchance >= 99 then
			Failstate = true
			end
			if playerlevel == tracklevel + 2
			and randomchance >= 97 then
			Failstate = true
			end
			if playerlevel == tracklevel + 1
			and randomchance >= 95 then
			Failstate = true
			end
			if playerlevel == tracklevel
			and randomchance >= 92 then
			Failstate = true
			end
		end
		end
	end
		local HappyOrBored = ZombRand(2)+1
		if Failstate == false and self.character:HasTrait("ToneDeaf") then
			if HappyOrBored == 1 then 
				if MusicDoTextHelperUnhappyness == 2 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Happyness"), false, 255, 75, 75)
				elseif MusicDoTextHelperUnhappyness == 1 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Happyness"), false, 255, 120, 120)
				end
			elseif HappyOrBored == 2 then
				if MusicDoTextHelperBoredom == 3 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), true, 255, 30, 30)
				elseif MusicDoTextHelperBoredom == 2 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), true, 255, 75, 75)
				elseif MusicDoTextHelperBoredom == 1 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), true, 255, 120, 120)
				end
			end
			MusicDoTextHelperUnhappyness = 0
			MusicDoTextHelperBoredom = 0
		elseif Failstate == false then
			if HappyOrBored == 1 then 
				if MusicDoTextHelperUnhappyness == 2 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Happyness"), true, 70, 255, 50)
				elseif MusicDoTextHelperUnhappyness == 1 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Happyness"), true, 170, 255, 150)
				end
			elseif HappyOrBored == 2 then
				if MusicDoTextHelperBoredom == 3 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), false, 70, 255, 50)
				elseif MusicDoTextHelperBoredom == 2 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), false, 170, 255, 150)
				elseif MusicDoTextHelperBoredom == 1 then
					HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), false, 200, 255, 200)
				end
			end
			MusicDoTextHelperUnhappyness = 0
			MusicDoTextHelperBoredom = 0
		end
	
	end

end
end

function PlayInstrumentAction:start()
	
	if self.character:isItemInBothHands(self.item) then
        self.handItem = 'BothHands';
    else
        if self.character:isPrimaryHandItem(self.item) then
            self.handItem = 'PrimaryHand';
        elseif self.character:isSecondaryHandItem(self.item) then
            self.handItem = 'SecundaryHand';
        end
    end
	
	self.character:setPrimaryHandItem(self.item);
    self.character:setSecondaryHandItem(nil);

	local characterData = self.character:getModData()
	
	getSoundManager():setMusicVolume(0)

	if self.isTraining then
	
	if characterData.PlayingInstrument ~= nil
	then
	characterData.PlayingInstrument = false
	else
	characterData.PlayingInstrument = false
	end
	
	else
	
	if characterData.PlayingInstrument ~= nil
	then
	characterData.PlayingInstrument = true
	else
	characterData.PlayingInstrument = true
	end
	
	end

	if self.isDuet then
	
	self.character:Say("Waiting for other players")
	self.character:Say("HOLD X TO START CONCERT")
	
	if characterData.WaitingDuet ~= nil
	then
	characterData.WaitingDuet = true
	else
	characterData.WaitingDuet = true
	end
	
	end
	
	if self.isTraining then
		self.action:setUseProgressBar(true)
	else
		self.action:setUseProgressBar(false)
	end

	if (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassRed') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricRed') then
	local soundrandomiser = ZombRand(1, 100)
	local pickupsound = "Guitar_pickup1"
		if soundrandomiser >=75 then
			pickupsound = "Guitar_pickup4"
		elseif soundrandomiser >=50 then
			pickupsound = "Guitar_pickup3"
		elseif soundrandomiser >=25 then
			pickupsound = "Guitar_pickup2"
		else
			pickupsound = "Guitar_pickup1"
		end
		self.character:getEmitter():playSound(pickupsound);
	end

end

function PlayInstrumentAction:stop()

	local characterData = self.character:getModData()

	if self.isDuet and
	self.character:getModData().WaitingDuet ~= false then
	self.character:getModData().WaitingDuet = false
	end

	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	if Failstate == true then
	
	local failsound = "TrumpetFailstate01"
	local soundrandomiser = ZombRand(1, 100)
	
		if self.character:getPrimaryHandItem():getFullType() == 'Base.Trumpet' then
			if soundrandomiser >=64 then
				failsound = "TrumpetFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "TrumpetFailstate02"
			else
				failsound = "TrumpetFailstate03"
			end
	
		end

		if self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarAcoustic' then
			if soundrandomiser >=64 then
				failsound = "GAFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "GAFailstate02"
			else
				failsound = "GAFailstate03"
			end
	
		end
		
		if self.character:getPrimaryHandItem():getFullType() == 'Base.Banjo' then
			if soundrandomiser >=64 then
				failsound = "BanjoFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "BanjoFailstate02"
			else
				failsound = "BanjoFailstate03"
			end
	
		end

		if self.character:getPrimaryHandItem():getFullType() == 'Base.Keytar' then
			if soundrandomiser >=75 then
				failsound = "KeytarFailstate01"
			elseif soundrandomiser >=50 then
				failsound = "KeytarFailstate02"
			elseif soundrandomiser >=25 then
				failsound = "KeytarFailstate03"
			else
				failsound = "KeytarFailstate04"
			end
	
		end

		if self.character:getPrimaryHandItem():getFullType() == 'Base.Saxophone' then
			if soundrandomiser >=64 then
				failsound = "SaxophoneFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "SaxophoneFailstate02"
			else
				failsound = "SaxophoneFailstate03"
			end
	
		end

		if (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlack') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlue') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassRed')
		then
			if soundrandomiser >=64 then
				failsound = "GuitarElectricBassFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "GuitarElectricBassFailstate02"
			else
				failsound = "GuitarElectricBassFailstate03"
			end
	
		end

		if self.character:getPrimaryHandItem():getFullType() == 'Base.Flute' then
			if soundrandomiser >=64 then
				failsound = "FluteFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "FluteFailstate02"
			else
				failsound = "FluteFailstate03"
			end
	
		end

		if (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlack') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlue') or
		(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricRed')
		then
			if soundrandomiser >=64 then
				failsound = "GuitarElectricFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "GuitarElectricFailstate02"
			else
				failsound = "GuitarElectricFailstate03"
			end
	
		end

	--------------------------------------------------------------------------------------------------------ADDOTHERINSTRUMENTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	local soundRadius = 10
	local volume = 5

		if self.character:isOutside() then
		soundRadius = 30
		volume = 10
		end

		self.character:getEmitter():playSound(failsound);
		
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
		
		if characterData.LSMoodles["Embarrassed"].Value ~= nil then
			characterData.LSMoodles["Embarrassed"].Value = characterData.LSMoodles["Embarrassed"].Value + 0.1
		end
		HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Embarrassed"), true, 255, 120, 120)
		
	Failstate = false
	end

	local bodyDamage = self.character:getBodyDamage()
	-- adjust stats to 0 if levels went below 0
	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end

	-- adjust stats if levels went above
	if (bodyDamage:getBoredomLevel() > 100) then
		bodyDamage:setBoredomLevel(100)
	end
	if (bodyDamage:getUnhappynessLevel() > 100) then
		bodyDamage:setUnhappynessLevel(100)
	end
	if (self.character:getStats():getStress() > 1) then
		self.character:getStats():setStress(1)
	end

	characterData.PlayingInstrument = false
	
    if self.handItem == 'PrimaryHand' then
        self.character:setPrimaryHandItem(self.item);
        self.character:setSecondaryHandItem(nil);
    elseif self.handItem == 'SecundaryHand' then
        self.character:setPrimaryHandItem(nil);
        self.character:setSecondaryHandItem(self.item);
    elseif self.handItem == 'BothHands' then
        self.character:setPrimaryHandItem(self.item);
        self.character:setSecondaryHandItem(self.item);
    end

	if (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassRed') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricRed') then
	local newsoundrandomiser = ZombRand(1, 100)
	local guitarstopsound = "Guitar_stop1"
		if newsoundrandomiser >=66 then
			guitarstopsound = "Guitar_stop3"
		elseif newsoundrandomiser >=33 then
			guitarstopsound = "Guitar_stop2"
		else
			guitarstopsound = "Guitar_stop1"
		end
		self.character:getEmitter():playSound(guitarstopsound);
	end

	getSoundManager():setMusicVolume(self.musicOriginalVolume)

	ISBaseTimedAction.stop(self);
end

function PlayInstrumentAction:perform()

	if self.isDuet and
	self.character:getModData().WaitingDuet ~= false then
	self.character:getModData().WaitingDuet = false
	end

	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	adjustStats(self.character, self.level)

	local bodyDamage = self.character:getBodyDamage()

	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end

	if (bodyDamage:getBoredomLevel() > 100) then
		bodyDamage:setBoredomLevel(100)
	end
	if (bodyDamage:getUnhappynessLevel() > 100) then
		bodyDamage:setUnhappynessLevel(100)
	end
	if (self.character:getStats():getStress() > 1) then
		self.character:getStats():setStress(1)
	end

	local characterData = self.character:getModData()
	characterData.PlayingInstrument = false

    if self.handItem == 'PrimaryHand' then
        self.character:setPrimaryHandItem(self.item);
        self.character:setSecondaryHandItem(nil);
    elseif self.handItem == 'SecundaryHand' then
        self.character:setPrimaryHandItem(nil);
        self.character:setSecondaryHandItem(self.item);
    elseif self.handItem == 'BothHands' then
        self.character:setPrimaryHandItem(self.item);
        self.character:setSecondaryHandItem(self.item);
    end

	if (self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBassRed') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlack') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricBlue') or
	(self.character:getPrimaryHandItem():getFullType() == 'Base.GuitarElectricRed') then
	local newsoundrandomiser = ZombRand(1, 100)
	local guitarstopsound = "Guitar_stop1"
		if newsoundrandomiser >=66 then
			guitarstopsound = "Guitar_stop3"
		elseif newsoundrandomiser >=33 then
			guitarstopsound = "Guitar_stop2"
		else
			guitarstopsound = "Guitar_stop1"
		end
		self.character:getEmitter():playSound(guitarstopsound);
	end

	getSoundManager():setMusicVolume(self.musicOriginalVolume)

    ISBaseTimedAction.perform(self);
end

function PlayInstrumentAction:new(character, item, sound, length, level, isTraining, isDuet, xp, boredomReduction, stressReduction, actionType)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
	o.item = item;
	o.soundFile = sound
    o.stopOnWalk = false;
    o.stopOnRun = true;
    o.stopOnAim = false;
	o.ignoreHandsWounds = true;
	o.maxTime = length
	o.gameSound = 0
	o.level = level
	o.isTraining = isTraining;
	o.isDuet = isDuet;
	o.xp = xp
	o.boredomReduction = boredomReduction
	o.stressReduction = stressReduction
	o.actionType = actionType
	o.handItem = nil;
	o.musicOriginalVolume = tonumber(getSoundManager():getMusicVolume())
	o.actionCount = 0
	o.actionTotal = 600
    return o;
end

return PlayInstrumentAction;