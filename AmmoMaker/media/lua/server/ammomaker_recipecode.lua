--Ammo Maker by STIMP_TM

require 'recipecode'

--Recipe on test activated mods

function Recipe.OnTest.isActivated_A26GF(recipe, playerObj, item)

    return getActivatedMods():contains("Arsenal(26)GunFighter") or getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]");

end

function Recipe.OnTest.isActivated_A26GF2(recipe, playerObj, item)

    return getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]");

end

function Recipe.OnTest.isNotActivated_A26GF(recipe, playerObj, item)

    return not (getActivatedMods():contains("Arsenal(26)GunFighter") or getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]"));

end

function Recipe.OnTest.isNotActivated_A26GF_FA(recipe, playerObj, item)

    return not (getActivatedMods():contains("Arsenal(26)GunFighter") or getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]") or getActivatedMods():contains("firearmmod"));

end

function Recipe.OnTest.isActivated_FA(recipe, playerObj, item)

    return getActivatedMods():contains("firearmmod");

end

function Recipe.OnTest.isActivated_PSA(recipe, playerObj, item)

    return getActivatedMods():contains("PRitemtest");

end

function Recipe.OnTest.isActivated_VFE(recipe, playerObj, item)

    return getActivatedMods():contains("VFExpansion1");

end

function Recipe.OnTest.isActivated_SG(recipe, playerObj, item)

    return getActivatedMods():contains("ScrapGuns(new version)");

end

function Recipe.OnTest.isActivated_CJ(recipe, playerObj, item)

    return getActivatedMods():contains("CaptainJuezo1");

end

--Recipe on create ammo

function Recipe.OnCreate.Make_A26GF_177BB(items, result, player)

	player:getInventory():AddItems("Base.BB177", 5);

end

function Recipe.OnCreate.Make_A26GF_545x39(items, result, player)

	player:getInventory():AddItems("Base.545x39Bullets", 1);

end

function Recipe.OnCreate.Make_PSA_545x39(items, result, player)

	player:getInventory():AddItems("Base.Bullets545", 1);

end

function Recipe.OnCreate.Make_CJ_545x39(items, result, player)

	player:getInventory():AddItems("Base.CJ545", 3);

end

function Recipe.OnCreate.Make_Base_223Rem(items, result, player)

	player:getInventory():AddItems("Base.223Bullets", 1);

end

function Recipe.OnCreate.Make_Base_556x45NATO(items, result, player)

	player:getInventory():AddItems("Base.556Bullets", 1);

end

function Recipe.OnCreate.Make_A26GF_57x28(items, result, player)

	player:getInventory():AddItems("Base.Bullets57", 2);

end

function Recipe.OnCreate.Make_A26GF_22LR(items, result, player)

	player:getInventory():AddItems("Base.Bullets22", 8);

end

function Recipe.OnCreate.Make_FA_22LR(items, result, player)

	player:getInventory():AddItems("firearmmod.Bullets22", 8);

end

function Recipe.OnCreate.Make_VFE_22LR(items, result, player)

	player:getInventory():AddItems("VFExpansion1.22Bullets", 4);

end

function Recipe.OnCreate.Make_PSA_22LR(items, result, player)

	player:getInventory():AddItems("Base.Bullets22LR", 4);

end

function Recipe.OnCreate.Make_CJ_22LR(items, result, player)

	player:getInventory():AddItems("Base.CJ22LR", 40);

end

function Recipe.OnCreate.Make_PSA_762x25Tok(items, result, player)

	player:getInventory():AddItems("Base.Bullets762Tokarev", 2);

end

function Recipe.OnCreate.Make_PSA_762x38RNag(items, result, player)

	player:getInventory():AddItems("Base.Bullets762Nagant", 10);

end

function Recipe.OnCreate.Make_A26GF_762x51NATO(items, result, player)

	player:getInventory():AddItems("Base.762x51Bullets", 1);

end

function Recipe.OnCreate.Make_FA_762x51NATO(items, result, player)

	player:getInventory():AddItems("firearmmod.762x51Bullets", 1);

end

function Recipe.OnCreate.Make_CJ_762x51NATO(items, result, player)

	player:getInventory():AddItems("Base.762NATO", 2);

end

function Recipe.OnCreate.Make_A26GF_3006Spring(items, result, player)

	player:getInventory():AddItems("Base.3006Bullets", 1);

end

function Recipe.OnCreate.Make_FA_3006Spring(items, result, player)

	player:getInventory():AddItems("firearmmod.Bullets3006", 1);

end

function Recipe.OnCreate.Make_Base_308Win(items, result, player)

	player:getInventory():AddItems("Base.308Bullets", 1);

end

function Recipe.OnCreate.Make_A26GF_762x39(items, result, player)

	player:getInventory():AddItems("Base.762x39Bullets", 1);

end

function Recipe.OnCreate.Make_FA_762x39(items, result, player)

	player:getInventory():AddItems("firearmmod.762x39Bullets", 1);

end

function Recipe.OnCreate.Make_VFE_762x39(items, result, player)

	player:getInventory():AddItems("VVFExpansion1.762Bullets", 1);

end

function Recipe.OnCreate.Make_PSA_762x39(items, result, player)

	player:getInventory():AddItems("Base.Bullets762AK", 1);

end

function Recipe.OnCreate.Make_CJ_762x39(items, result, player)

	player:getInventory():AddItems("Base.CJ762", 3);

end

function Recipe.OnCreate.Make_A26GF_762x54R(items, result, player)

	player:getInventory():AddItems("Base.762x54rBullets", 1);

end

function Recipe.OnCreate.Make_PSA_762x54R(items, result, player)

	player:getInventory():AddItems("Base.Bullets762PKM", 1);

end

function Recipe.OnCreate.Make_CJ_762x54R(items, result, player)

	player:getInventory():AddItems("Base.762_54R", 2);

end

function Recipe.OnCreate.Make_A26GF_380ACP(items, result, player)

	player:getInventory():AddItems("Base.Bullets380", 5);

end

function Recipe.OnCreate.Make_Base_9mmLuger(items, result, player)

	player:getInventory():AddItems("Base.Bullets9mm", 3);

end

function Recipe.OnCreate.Make_Base_38SP(items, result, player)

	player:getInventory():AddItems("Base.Bullets38", 3);

end

function Recipe.OnCreate.Make_A26GF_357Mag(items, result, player)

	player:getInventory():AddItems("Base.Bullets357", 2);

end

function Recipe.OnCreate.Make_FA_357Mag(items, result, player)

	player:getInventory():AddItems("firearmmod.Bullets357", 2);

end

function Recipe.OnCreate.Make_CJ_357Mag(items, result, player)

	player:getInventory():AddItems("Base.357Magnum", 9);

end

function Recipe.OnCreate.Make_PSA_9x39(items, result, player)

	player:getInventory():AddItems("Base.Bullets939", 2);

end

function Recipe.OnCreate.Make_PSA_9x18Mak(items, result, player)

	player:getInventory():AddItems("Base.Bullets9x18mm", 6);

end

function Recipe.OnCreate.Make_A26GF_410Gauge(items, result, player)

	player:getInventory():AddItems("Base.410gShotgunShells", 1);

end

function Recipe.OnCreate.Make_FA_4440WCF(items, result, player)

	player:getInventory():AddItems("firearmmod.Bullets4440", 2);

end

function Recipe.OnCreate.Make_Base_44Mag(items, result, player)

	player:getInventory():AddItems("Base.Bullets44", 2);

end

function Recipe.OnCreate.Make_A26GF_44Mag(items, result, player)

	player:getInventory():AddItems("Base.Bullets44", 1);

end

function Recipe.OnCreate.Make_FA_44Mag(items, result, player)

	player:getInventory():AddItems("firearmmod.Bullets44", 1);

end

function Recipe.OnCreate.Make_Base_45ACP(items, result, player)

	player:getInventory():AddItems("Base.Bullets45", 2);

end

function Recipe.OnCreate.Make_A26GF_45LC(items, result, player)

	player:getInventory():AddItems("Base.Bullets45LC", 2);

end

function Recipe.OnCreate.Make_A26GF_4570Gov(items, result, player)

	player:getInventory():AddItems("Base.Bullets4570", 1);

end

function Recipe.OnCreate.Make_A26GF_50AE(items, result, player)

	player:getInventory():AddItems("Base.Bullets50MAG", 1);

end

function Recipe.OnCreate.Make_A26GF_50BMG(items, result, player)

	player:getInventory():AddItems("Base.50BMGBullets", 1);

end

function Recipe.OnCreate.Make_A26GF_20Gauge(items, result, player)

	player:getInventory():AddItems("Base.20gShotgunShells", 1);

end

function Recipe.OnCreate.Make_A26GF_68PB(items, result, player)

	player:getInventory():AddItems("Base.PB68", 3);

end

function Recipe.OnCreate.Make_Base_12Gauge(items, result, player)

	player:getInventory():AddItems("Base.ShotgunShells", 1);

end

function Recipe.OnCreate.Make_A26GF_12Gauge(items, result, player)

	player:getInventory():AddItems("Base.ShotgunShells", 1);

end

function Recipe.OnCreate.Make_FA_12Gauge(items, result, player)

	player:getInventory():AddItems("firearmmod.ShotgunShells", 1);

end

function Recipe.OnCreate.Make_A26GF_Flare(items, result, player)

	player:getInventory():AddItems("Base.Flare", 2);

end

function Recipe.OnCreate.Make_A26GF_10Gauge(items, result, player)

	player:getInventory():AddItems("Base.10gShotgunShells", 1);

end

function Recipe.OnCreate.Make_A26GF_4Gauge(items, result, player)

	player:getInventory():AddItems("Base.4gShotgunShells", 1);

end

function Recipe.OnCreate.Make_PSA_4Gauge(items, result, player)

	player:getInventory():AddItems("Base.23x75ShotgunShells", 1);

end

function Recipe.OnCreate.Make_A26GF_40mmHE(items, result, player)

	player:getInventory():AddItems("Base.40HERound", 1);

end

function Recipe.OnCreate.Make_A26GF_40mmINC(items, result, player)

	player:getInventory():AddItems("Base.40INCRound", 1);

end

function Recipe.OnCreate.Make_A26GF_HERocket(items, result, player)

	player:getInventory():AddItems("Base.HERocket", 1);

end

----Recipe on create gather gunpowder

function Recipe.OnCreate.GatherGunpowder(items, result, player)

	local item = items:get(0)
	
	if item:getType() == "CJ545" or item:getType() == "Bullets57" or item:getType() == "Bullets22" or item:getType() == "22Bullets" or item:getType() == "Bullets22LR" or item:getType() == "CJ22LR" or item:getType() == "762NATO" or item:getType() == "Bullets762Tokarev" or item:getType() == "Bullets762Nagant" or item:getType() == "CJ762" or item:getType() == "762_54R" or item:getType() == "Bullets380" or item:getType() == "Bullets9mm" or item:getType() == "Bullets38" or item:getType() == "Bullets357" or item:getType() == "357Magnum" or item:getType() == "Bullets939" or item:getType() == "Bullets9x18mm" or item:getType() == "410gShotgunShells" or item:getType() == "Bullets4440" or item:getType() == "Bullets44" or item:getType() == "Bullets45" or item:getType() == "Bullets45LC" or item:getType() == "20gShotgunShells" or item:getType() == "Flare" or item:getType() == "ScrapBullets" then

		local gunpowder1 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.1);

		player:getInventory():AddItem(gunpowder1);

	elseif item:getType() == "545x39Bullets" or item:getType() == "Bullets545" or item:getType() == "223Bullets" or item:getType() == "556Bullets" or item:getType() == "762x39Bullets" or item:getType() == "762Bullets" or item:getType() == "Bullets762AK" or item:getType() == "Bullets50MAG" or item:getType() == "ShotgunShells" then

		local gunpowder2 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.2);
	
		player:getInventory():AddItem(gunpowder2);

	elseif item:getType() == "762x51Bullets" or item:getType() == "3006Bullets" or item:getType() == "Bullets3006" or item:getType() == "308Bullets" or item:getType() == "762x54rBullets" or item:getType() == "Bullets762PKM" or item:getType() == "Bullets4570" or item:getType() == "10gShotgunShells" or item:getType() == "23x75ShotgunShells" or item:getType() == "SBullets" then

		local gunpowder3 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.3);
	
		player:getInventory():AddItem(gunpowder3);

	elseif item:getType() == "4gShotgunShells" or item:getType() == "40HERound" or item:getType() == "40INCRound" or item:getType() == "HD" then

		local gunpowder4 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.4);
	
		player:getInventory():AddItem(gunpowder4);

	elseif item:getType() == "50BMGBullets" then

		local gunpowder7 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.7);
	
		player:getInventory():AddItem(gunpowder7);

	elseif item:getType() == "NailBomb" then

		local gunpowder7 = InventoryItemFactory.CreateItem("Base.GunPowder", 0.7);

		player:getInventory():AddItem(gunpowder7);
		player:getInventory():AddItems("Base.Nails", 25);

	elseif item:getType() == "GlassBomb" then

		player:getInventory():AddItems("Base.GunPowder", 1);

	elseif item:getType() == "HPB" then

		player:getInventory():AddItems("Base.GunPowder", 2);
		player:getInventory():AddItems("Base.MetalPipe", 1);

	elseif item:getType() == "HERocket" then

		player:getInventory():AddItems("Base.GunPowder", 4);
		player:getInventory():AddItems("Base.ScrapMetal", 4);

	end

end

----Recipe on create items

function Recipe.OnCreate.ExtractSulfur(items, result, player)

	player:getInventory():AddItems("Base.Gravelbag", 1);

end

function Recipe.OnCreate.ExtractNitre(items, result, player)

	player:getInventory():AddItems("Base.Pot", 1);

end

function Recipe.OnCreate.RecyclePlastic(items, result, player)

	local item = items:get(0)
		
	if item:getType() == "BleachEmpty" or item:getType() == "Cube" or item:getType() == "Razor" then

		player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 1);

	elseif item:getType() == "Lunchbox" or item:getType() == "Lunchbox2" or item:getType() == "BucketEmpty" then

		player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 9);
		
	elseif item:getType() == "Cooler" then

		player:getInventory():AddItems("ammomaker.ammomaker_RecPlastic", 14);

	end

end

function Recipe.OnCreate.RecycleMetal(items, result, player)

	local item = items:get(0)
	
	if item:getType() == "UnusableMetal" then

		player:getInventory():AddItems("Base.ScrapMetal", 8);
	
	end

end

--Recipe on give xp

function Recipe.OnGiveXP.MetalWelding5(recipe, ingredients, result, player)

    player:getXp():AddXP(Perks.MetalWelding, 5);

end

function Recipe.OnGiveXP.Reloading5(recipe, ingredients, result, player)

    player:getXp():AddXP(Perks.Reloading, 5);

end

function Recipe.OnGiveXP.Chemistry3(recipe, ingredients, result, player)

	player:getXp():AddXP(Perks.MetalWelding, 3);
	player:getXp():AddXP(Perks.Cooking, 3);

end