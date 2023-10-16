local group = BodyLocations.getGroup("Human")
group:getOrCreateLocation("VestChestRig")
group:getOrCreateLocation("TorsoRigPlus2")
group:setExclusive("VestChestRig", "TorsoRigPlus2")

--[[	
Пример того, как добавленный слот может конфликтовать с определёнными позициями:
group:getOrCreateLocation("DutyBelt")			- DutyBelt - ремень из STR

group:setExclusive("DutyBelt", "Belt")			- Belt - ванильный ремень
group:setExclusive("DutyBelt", "BeltExtra")		- BeltExtra - ванильная кобура, двойная кобура
]]