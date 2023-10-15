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

local PlayHarmonicaActionWorld = ISBaseTimedAction:derive('PlayHarmonicaActionWorld');
local Failstate = false
local randomchance = ZombRand(1, 100)

local function adjustStats(character, currentDelta, deltaIncrease, boredomReduction, stressReduction, totalXP)

		
	local boredomChange = currentDelta * boredomReduction

	local bodyDamage = character:getBodyDamage()
	
	bodyDamage:setBoredomLevel(initialBoredom - boredomChange)
	local stressChange = currentDelta * stressReduction
	local UnhappinessChange = currentDelta * stressReduction * 100

	bodyDamage:setUnhappynessLevel(initialUnhappiness - UnhappinessChange)

	character:getStats():setStress(initialStress - stressChange)

	local xpChange = deltaIncrease * totalXP
	
	xpChange = xpChange

	character:getXp():AddXP(Perks.Music, xpChange)
	
end


local function insertTracker(character, lengthSeconds, xp, delta)

	local characterData = character:getModData()
	local TrackerTable = characterData.PlayTracker
	
		
	local Tracker = {}
	Tracker.hoursSince = 0
	Tracker.isTraining = false
	Tracker.length = lengthSeconds / 48 * delta
	Tracker.xp = xp
	table.insert(TrackerTable,Tracker)
end

	
function PlayHarmonicaActionWorld:isValid()

   return true;
end


function PlayHarmonicaActionWorld:waitToStart()
		return false
	end

function PlayHarmonicaActionWorld:update()
	

	local currentequippedInstrument = self.character:getPrimaryHandItem():getFullType()
	
	if currentequippedInstrument ~= self.equippedInstrument then
		self:forceStop()
	end

	if isKeyDown(Keyboard.KEY_E) then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_C) then
		self:forceStop()
	end
	if self.character:isSneaking() then
		self:forceStop()
	end

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
	
	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated
	-- update at every 0.05 delta milestone
	if deltaIncrease > 0.05 then

		adjustStats(self.character, currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction, self.xp)
		
		self.deltaTabulated = currentDelta
		
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
		
		if playerlevel >= tracklevel and
		playerlevel <= 5 then
		
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

function PlayHarmonicaActionWorld:start()

    self.character:setSecondaryHandItem(nil);

	local seconds = self.maxTime / 48

	
	local bodyDamage = self.character:getBodyDamage()
	initialBoredom = bodyDamage:getBoredomLevel()
	initialUnhappiness = bodyDamage:getUnhappynessLevel()
	initialStress = self.character:getStats():getStress()

	local characterData = self.character:getModData()
	local TrackerTable = characterData.PlayTracker
	
	if characterData.PlayingInstrument ~= nil
	then
	characterData.PlayingInstrument = true
	else
	characterData.PlayingInstrument = true
	end
	
	local n = #TrackerTable

	local totalTrainingLength = 0
	local totalPlayLength = 0
	local recentXPGains = 0

	for i = 1,n do
		if TrackerTable[i].length then
			totalPlayLength = totalPlayLength + TrackerTable[i].length
			if TrackerTable[i].xp then
				recentXPGains = recentXPGains + TrackerTable[i].xp
			end
		end
	end

		self.action:setUseProgressBar(false)
		if totalPlayLength > 900 then
			self.xp = 0
			if self.character:HasTrait("ToneDeaf") then
			self.boredomReduction = self.boredomReduction * 4
			self.stressReduction = self.stressReduction * 4
			elseif self.character:HasTrait("HardOfHearing") then
			self.boredomReduction = self.boredomReduction * 3
			self.stressReduction = self.stressReduction * 2
			else
			self.boredomReduction = self.boredomReduction * 0.1
			self.stressReduction = self.stressReduction * 0.1
			end
		elseif totalPlayLength > 600 then
			self.xp = self.xp
			if self.character:HasTrait("Virtuoso") then
			self.xp = self.xp * 0.5
			end
			if self.character:HasTrait("ToneDeaf") then
			self.boredomReduction = self.boredomReduction * 3
			self.stressReduction = self.stressReduction * 3
			elseif self.character:HasTrait("HardOfHearing") then
			self.boredomReduction = self.boredomReduction * 2
			self.stressReduction = self.stressReduction * 1.5
			else
			self.boredomReduction = self.boredomReduction * 0.2
			self.stressReduction = self.stressReduction * 0.2
			end
		elseif totalPlayLength > 450 then
			self.xp = self.xp * 5
			if self.character:HasTrait("Virtuoso") then
			self.xp = self.xp
			end
			if self.character:HasTrait("ToneDeaf") then
			self.boredomReduction = self.boredomReduction * 2
			self.stressReduction = self.stressReduction * 2
			elseif self.character:HasTrait("HardOfHearing") then
			self.boredomReduction = self.boredomReduction * 1.5
			self.stressReduction = self.stressReduction
			else
			self.boredomReduction = self.boredomReduction * 0.5
			self.stressReduction = self.stressReduction * 0.5
			end
		elseif totalPlayLength > 200 then
			self.xp = self.xp * 20
			if self.character:HasTrait("Virtuoso") then
			self.xp = self.xp * 5
			end
			if self.character:HasTrait("ToneDeaf") then
			self.boredomReduction = self.boredomReduction * 1.5
			self.stressReduction = self.stressReduction * 1.5
			elseif self.character:HasTrait("HardOfHearing") then
			self.boredomReduction = self.boredomReduction
			self.stressReduction = self.stressReduction * 0.5
			else
			self.boredomReduction = self.boredomReduction * 0.7
			self.stressReduction = self.stressReduction * 0.7
			end
		else
			self.xp = self.xp * 10
			if self.character:HasTrait("Virtuoso") then
			self.xp = self.xp * 3
			end
			if self.character:HasTrait("ToneDeaf") then
			self.boredomReduction = self.boredomReduction
			self.stressReduction = self.stressReduction
			elseif self.character:HasTrait("HardOfHearing") then
			self.boredomReduction = self.boredomReduction * 0.5
			self.stressReduction = self.stressReduction * 0.2
			else
			self.boredomReduction = self.boredomReduction
			self.stressReduction = self.stressReduction
			end
		end
		if recentXPGains > 500 then
			self.xp = 0;
		end

end

function PlayHarmonicaActionWorld:stop()

	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	if Failstate == true then
	
	local failsound = "TrumpetFailstate01"
	local soundrandomiser = ZombRand(1, 100)
	
			if soundrandomiser >=64 then
				failsound = "HarmonicaFailstate01"
			elseif soundrandomiser >=32 then
				failsound = "HarmonicaFailstate02"
			else
				failsound = "HarmonicaFailstate03"
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
		
	Failstate = false
	end

	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated

	adjustStats(self.character, currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction, self.xp)

	self.deltaTabulated = currentDelta

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

	insertTracker(self.character, self.maxTime, self.xp, currentDelta)

	local characterData = self.character:getModData()
	characterData.PlayingInstrument = false

	ISBaseTimedAction.stop(self);
end

function PlayHarmonicaActionWorld:perform()

	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated

	adjustStats(self.character, currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction, self.xp)

	self.deltaTabulated = currentDelta

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

	insertTracker(self.character, self.maxTime, self.xp, 1)

	local characterData = self.character:getModData()
	characterData.PlayingInstrument = false

    ISBaseTimedAction.perform(self);
end

function PlayHarmonicaActionWorld:new(character, equippedInstrument, sound, length, level, xp, boredomReduction, stressReduction, actionType)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
	o.equippedInstrument = equippedInstrument;
	o.soundFile = sound
    o.stopOnWalk = false;
    o.stopOnRun = true;
    o.stopOnAim = false;
	o.ignoreHandsWounds = true;
	o.maxTime = length
	o.gameSound = 0
	o.level = level
	o.xp = xp
	o.boredomReduction = boredomReduction
	o.stressReduction = stressReduction
	o.deltaTabulated = 0
	o.actionType = actionType
    return o;
end

return PlayHarmonicaActionWorld;