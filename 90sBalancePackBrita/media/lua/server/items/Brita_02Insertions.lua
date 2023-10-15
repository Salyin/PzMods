require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"

--------------------------------------------------
--		POLICE VEHICLE			--
--------------------------------------------------
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Bag_Police");
table.insert(VehicleDistributions.Police["TruckBed"].items, 8);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.M870");
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.MINI14_T");
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Case_Small3");	-- 9mm
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Case_Large2");	-- 223
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Case_Medium2");	-- 9mm
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Vest_BulletPolice");
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
table.insert(VehicleDistributions.Police["TruckBed"].items, "Base.Shoes_ArmyBoots");
table.insert(VehicleDistributions.Police["TruckBed"].items, 2);
--------------------------------------------------
--		FIRE VEHICLE			--
--------------------------------------------------
table.insert(VehicleDistributions.Fire["TruckBed"].items, "Base.DingDong");
table.insert(VehicleDistributions.Fire["TruckBed"].items, 2);
table.insert(VehicleDistributions.Fire["TruckBed"].items, "Base.Jacket_Fireman");
table.insert(VehicleDistributions.Fire["TruckBed"].items, 2);
table.insert(VehicleDistributions.Fire["TruckBed"].items, "Base.Trousers_Fireman");
table.insert(VehicleDistributions.Fire["TruckBed"].items, 2);
table.insert(VehicleDistributions.Fire["TruckBed"].items, "Base.Hat_Fireman");
table.insert(VehicleDistributions.Fire["TruckBed"].items, 2);
table.insert(VehicleDistributions.Fire["TruckBed"].items, "Base.Glasses_SafetyGoggles");
table.insert(VehicleDistributions.Fire["TruckBed"].items, 1);
--------------------------------------------------
--		FOSSOIL VEHICLE			--
--------------------------------------------------
table.insert(VehicleDistributions.Fossoil["TruckBed"].items, "Base.Suppressor_Oil");
table.insert(VehicleDistributions.Fossoil["TruckBed"].items, 10);
table.insert(VehicleDistributions.Fossoil["TruckBed"].items, "Base.Suppressor_Oil");
table.insert(VehicleDistributions.Fossoil["TruckBed"].items, 4);
--------------------------------------------------
--		MILITARY VEHICLE		--
--------------------------------------------------
if getActivatedMods():contains("FRUsedCarsBETA") then
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Large3");	--556
	table.insert(VehicleDistributions.Military["TruckBed"].items, 3);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Large5");	--308
	table.insert(VehicleDistributions.Military["TruckBed"].items, 2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Small3");	-- 9mm
	table.insert(VehicleDistributions.Military["TruckBed"].items, 1);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Small5");	-- 45SS
	table.insert(VehicleDistributions.Military["TruckBed"].items, 1);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Heavy1");	-- 40mm
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Heavy2");	-- 556LMG
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Heavy3");	-- 308LMG
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Case_Heavy4");	-- 50BMG
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Launcher");			-- KEEP THESE SUPER RARE
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Suppressor_Pistol");	-- KEEP THESE SUPER RARE
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Suppressor_Rifle");		-- KEEP THESE SUPER RARE
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.MilitaryBaton");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.RamboKnife");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Sight_4xACOG");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Scope_1-4x");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Sight_EOTech");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.Sight_3xEOTech");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.1);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.556Clip");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.5);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.556Belt");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.AmmoCan50_556");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.5);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.AmmoCan50_556");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.AmmoCan50_HE");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.4);
	table.insert(VehicleDistributions.Military["TruckBed"].items, "Base.AmmoCan50_INC");
	table.insert(VehicleDistributions.Military["TruckBed"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Large3");	--556
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 3);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Large5");	--308
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Small3");	-- 9mm
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 1);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Small5");	-- 45SS
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 1);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Heavy1");	-- 40mm
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Heavy2");	-- 556LMG
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Heavy3");	-- 308LMG
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Case_Heavy4");	-- 50BMG
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Launcher");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Suppressor_Pistol");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Suppressor_Rifle");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.01);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.MilitaryBaton");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.RamboKnife");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Sight_4xACOG");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Scope_1-4x");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Sight_EOTech");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.Sight_3xEOTech");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.1);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.556Clip");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.5);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.556Belt");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.AmmoCan50_556");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.5);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.AmmoCan50_556");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.3);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.AmmoCan50_HE");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.4);
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, "Base.AmmoCan50_INC");
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items, 0.2);
end

--------------------------------------------------
--		RANGER VEHICLE			--
--------------------------------------------------
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Case_Large2");	-- 223
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 2);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Case_Small4");	-- 357
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 2);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Light_Large");
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 1);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.RamboKnife");
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 1);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Sling_2");
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 1);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Scope_1-4x");
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 1);
table.insert(VehicleDistributions.Ranger["TruckBed"].items, "Base.Scope_20x");
table.insert(VehicleDistributions.Ranger["TruckBed"].items, 0.5);

--------------------------------------------------
--		HUNTER VEHICLE			--
--------------------------------------------------
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Sako85");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 2);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Savage12");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 2);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.DT11");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 2);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.M29_44");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 1);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.RamboKnife");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 2);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Light_Large");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 1.0);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Choke_Full");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Carrier_12g");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Pad");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Scope_1-4x");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Hunter["TruckBed"].items, "Base.Scope_20x");
table.insert(VehicleDistributions.Hunter["TruckBed"].items, 0.5);

--------------------------------------------------
--		SURVIVALIST VEHICLE		--
--------------------------------------------------
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.RamboKnife");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 2);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small1");	-- 22
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.2);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small2");	-- 380
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.2);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small3");	-- 9mm
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small4");	-- 357
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.4);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small5");	-- 45SS
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.3);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small6");	-- 45DS
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.4);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Small7");	-- 44
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.2);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Medium3");	-- 45DS
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Medium5");	-- 762x39
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Large1");	-- MIX
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Large3");	-- 556
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Large4");	-- 762x39
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Case_Heavy4");	-- 50BMG
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.1);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Light_Large");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Light_Small");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.3);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Suppressor_Pistol");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.1);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.Suppressor_Rifle");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.1);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.AmmoCan30_9");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.3);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.AmmoCan30_357");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.3);
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, "Base.AmmoCan50_223");
table.insert(VehicleDistributions.Survivalist["TruckBed"].items, 0.3);

--------------------------------------------------
--		ALL GLOVEBOX			--
--------------------------------------------------
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small1");	--22
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small2");	--380
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small3");	-- 9
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small4");	--357
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small5");	-- 45SS
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small6");	-- 45DS
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Case_Small7");	-- 44
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.RamboKnife");
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Butterfly");
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.PushDagger");
table.insert(VehicleDistributions.GloveBox.items, 0.1);
table.insert(VehicleDistributions.GloveBox.items, "Base.Karambit");
table.insert(VehicleDistributions.GloveBox.items, 0.1);

--------------------------------------------------
--		ALL TRUNK STANDARD		--
--------------------------------------------------
table.insert(VehicleDistributions.TrunkStandard.items, "Base.Case_Small2");	--380
table.insert(VehicleDistributions.TrunkStandard.items, 0.1);
table.insert(VehicleDistributions.TrunkStandard.items, "Base.Case_Small3");	--9
table.insert(VehicleDistributions.TrunkStandard.items, 0.1);
table.insert(VehicleDistributions.TrunkStandard.items, "Base.Case_Small4");	--357
table.insert(VehicleDistributions.TrunkStandard.items, 0.1);
table.insert(VehicleDistributions.TrunkStandard.items, "Base.Case_Small6");	--45DS
table.insert(VehicleDistributions.TrunkStandard.items, 0.1);

--------------------------------------------------
--		ALL TRUNK HEAVY			--
--------------------------------------------------
table.insert(VehicleDistributions.TrunkHeavy.items, "Base.Case_Large1");
table.insert(VehicleDistributions.TrunkHeavy.items, 0.1);
table.insert(VehicleDistributions.TrunkHeavy.items, "Base.Suppressor_Oil");
table.insert(VehicleDistributions.TrunkHeavy.items, 0.1);

--------------------------------------------------
--		ALL TRUNK SPORTS		--
--------------------------------------------------
table.insert(VehicleDistributions.TrunkSports.items, "Base.Case_Medium1");
table.insert(VehicleDistributions.TrunkSports.items, 0.1);

------------------------------------------------------------------
--		PROCEDURAL LIST	(VANILLA FirearmWeapons LIST)	--
------------------------------------------------------------------
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Marlin_M70");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Ruger_1022");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Buckmark_Carbine");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Buckmark_Long");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Buckmark");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.GP100_2");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.GP100_4");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.GP100_6");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M29_44");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M29_44Carbine");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.PPK");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Bersa85F");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.G18");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.G21");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.DEagle");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Automag");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M9");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.CZ75");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AMT1911");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AMT1911_Long");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M5906");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M4506");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M5238");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Marlin_1894");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Win_1894");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Win_1895");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.NEF_Handi_38");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.MAC10_Fold");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M1Carbine");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M2Carbine");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AUG");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AUG9");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AK103");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.AKMS_Fold");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.MD65_Fold");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M85_Fold");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Vz58");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Vz58_Fold");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.SKS");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.SKS_PARA");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M14");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.MINI14");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.MINI14_T");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M16A1");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M723");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.XM117");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.FAL");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.FAL_PARA_Stock");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.G3");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.G33");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K1_Stock");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K2");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K2C1");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K5");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K7_Stock");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.K14");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.SVD");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Mosin");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M1903");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M1");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Coachgun");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Coachgun_Sawed");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Coachgun_Pistol");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M870");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.M1897");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.R11_87");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Shorty");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Sako85");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Savage12");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3);

local function isMod(mod_Name)
	local mods = getActivatedMods();
	for i=0, mods:size()-1, 1 do
		if mods:get(i) == mod_Name then
			return true;
		end
	end
	return false;
end
	