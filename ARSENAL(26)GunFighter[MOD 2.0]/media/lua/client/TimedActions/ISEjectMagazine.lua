--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISEjectMagazine = ISBaseTimedAction:derive("ISEjectMagazine")

function ISEjectMagazine:isValid()
	return self.character:getPrimaryHandItem() == self.gun
end

function ISEjectMagazine:start()
	if not self.gun:isContainsClip() then
		self:forceStop()
		return
	end
	self:setAnimVariable("WeaponReloadType", self.gun:getWeaponReloadType())
	self:setAnimVariable("isUnloading", true)
	self:setOverrideHandModels(self.gun, nil)
	self:setActionAnim(CharacterActionAnims.Reload)
	self.character:reportEvent("EventReloading");
	self:initVars()
end

function ISEjectMagazine:update()
	-- FIXME: jobDelta is always zero since maxTime is -1
	self.gun:setJobDelta(self:getJobDelta())
end

function ISEjectMagazine:initVars()
	ISReloadWeaponAction.setReloadSpeed(self.character, false)
end

function ISEjectMagazine:unloadAmmo()
	-- get back the magazine if there was one in the gun
	if self.gun:isContainsClip() then
----------------------------------------------------------------------------------
--  PREVENTS EJECTING FIXED MAG, EJECTS MAG INSTEAD OF STRIPPER IN CLIP-MODE	--
----------------------------------------------------------------------------------
		local	Clip = self.gun:getModData().ClipType
		local	Mag = self.gun:getModData().MagType
		local	Fixed = self.gun:getModData().FixedMagType
		local	newMag = nil
		
		if	self.gun:getMagazineType() == Clip then					-- IF USING CLIPS, CREATE DETACHBLE LIKE M14
			if (Mag == nil) or (Fixed ~= nil) then
				newMag = nil
			else	newMag = InventoryItemFactory.CreateItem(Mag)
			end
		else	newMag = InventoryItemFactory.CreateItem(self.gun:getMagazineType())	-- OTHERWISE CREATE ORIGNAL MAGTYPE
		end

		if	newMag ~= nil then
			newMag:setCurrentAmmoCount(self.gun:getCurrentAmmoCount())

			self.character:getInventory():AddItem(newMag)
			self.gun:setContainsClip(false)
			self.gun:setCurrentAmmoCount(0)
		else
			if Mag == nil then
				self.gun:setContainsClip(false)
				self.character:addLineChatElement(getText("ContextMenu_ALTLoad_Integral"))
			else	self.character:addLineChatElement(getText("ContextMenu_ALTLoad_Fixed"))
			end
		end
		------------------------------------------------------------------
		--	SHOW MAG CODE LOCATED IN GunFighter_Function.lua	--
		------------------------------------------------------------------
		showMag(self.gun)
	end
end


function ISEjectMagazine:animEvent(event, parameter)
	if event == 'playReloadSound' then
		if parameter == 'unload' then
			if self.gun:getEjectAmmoSound() then
				self.character:playSound(self.gun:getEjectAmmoSound())
			end
		elseif parameter == 'ejectAmmoStart' then
			if self.gun:getEjectAmmoStartSound() then
				self.character:playSound(self.gun:getEjectAmmoStartSound());
			end
		end
	end
	if event == 'unloadFinished' then
		self:unloadAmmo()
		self:forceComplete()
	end
end

function ISEjectMagazine:stop()
	if self.gun:getEjectAmmoStopSound() then
		self.character:playSound(self.gun:getEjectAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	self.character:clearVariable("isUnloading")
	self.character:clearVariable("WeaponReloadType")
	ISBaseTimedAction.stop(self)
end

function ISEjectMagazine:perform()
	if self.gun:getEjectAmmoStopSound() then
		self.character:playSound(self.gun:getEjectAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	self.character:clearVariable("isUnloading")
	self.character:clearVariable("WeaponReloadType")
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISEjectMagazine:new(character, gun)
	local o = ISBaseTimedAction.new(self, character)
	o.stopOnWalk = false
	o.stopOnRun = true
	o.stopOnAim = false
	o.maxTime = -1
	o.gun = gun
	o.useProgressBar = false
	return o
end

