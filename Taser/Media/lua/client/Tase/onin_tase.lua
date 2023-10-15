Events.OnWeaponHitCharacter.Add(function(attacker, target, weapon, damage)
	if target:isZombie() then return false end
	if weapon:getFullType() == "Base.Taser" or weapon:getFullType() == "Base.HandTaser" then
		target:setAvoidDamage(true)
    	end
end)


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local function OnWeaponHitCharacter(wielder, character, handWeapon, damage)
	if character:isZombie() then return false end
	if handWeapon:getFullType() == "Base.Taser" then
		OnTaseGun(character)
	end		
	if handWeapon:getFullType() == "Base.HandTaser" then
		OnTaseGun(character)		
	end
end



Events.OnWeaponHitCharacter.Add(OnWeaponHitCharacter)
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function OnTaseGun(character)
    local ticksG = 0
    local delayG = 900

	character:setSecondaryHandItem(nil)
	character:setPrimaryHandItem(nil)
	character:changeState(IdleState.instance())

	local function onTick()
		if ticksG < delayG then
			ticksG = ticksG + 1
			character:changeState(IdleState.instance())
		if ticksG == 30 then
			character:setBlockMovement(true)
			character:playEmote("TaseFall")
			character:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):setAdditionalPain(50.0)
		end
		if ticksG == 150 then
			character:playEmote("TaseDown")
		end
		if ticksG == 600 then
			character:playEmote("TaseGetUp")
		end
			return;
		elseif ticksG >= delayG then
			character:setBlockMovement(false)
			character:playEmote("Cancel")
			ticksG = 0
		end
		Events.OnTick.Remove(onTick)
	end
	Events.OnTick.Add(onTick)	

end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--ZOMBIE TASE FUNCTIONALITY

local function OnHitZombie(zombie, character, bodyPartType, handWeapon)
	if handWeapon:getFullType() == "Base.Taser" or handWeapon:getFullType() == "Base.HandTaser" then
		zombie:setUseless(true)
		OnTaseZ(zombie)	
	end
	if handWeapon:getFullType() == "Base.HandTaserMakeshift" then
		zombie:setUseless(true)
		OnTaseZ(zombie)	
	end
end

Events.OnHitZombie.Add(OnHitZombie)

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function OnTaseZ(zombie)
    local ticksZ = 0
    local delayZ = 800
	local function onTickZ()
		if ticksZ < delayZ then
			ticksZ = ticksZ + 1
		return
		elseif ticksZ >= delayZ then
			zombie:setUseless(false)
			ticksZ = 0
		end
		Events.OnTick.Remove(onTickZ)
	end
	Events.OnTick.Add(onTickZ)	

end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

