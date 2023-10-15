-- Change to fatigue decrease by Vitamins due to new Overdose mechanic
local vitamins = ScriptManager.instance:getItem("Base.PillsVitamins");
if vitamins then
	vitamins:DoParam("FatigueChange = -7");
end
-- Adds OnEat to Alcoholic drinks
if not getActivatedMods():contains("LeGourmetRevolution") then
	local wine = ScriptManager.instance:getItem("Base.Wine");
	if wine then
		wine:DoParam("OnEat = OnEat_Alcohol");
	end
	local wine2 = ScriptManager.instance:getItem("Base.Wine2");
	if wine2 then
		wine2:DoParam("OnEat = OnEat_Alcohol");
	end
end
local whiskey = ScriptManager.instance:getItem("Base.WhiskeyFull");
if whiskey then
	whiskey:DoParam("OnEat = OnEat_Alcohol");
end
local beerBottle = ScriptManager.instance:getItem("Base.BeerBottle");
if beerBottle then
	beerBottle:DoParam("OnEat = OnEat_Alcohol");
end
local beerCan = ScriptManager.instance:getItem("Base.BeerCan");
if beerCan then
	beerCan:DoParam("OnEat = OnEat_Alcohol");
end

-- Add OnEat to preparations that can contain Mushrooms
-- MUSHROOMS (NO RECIPES)
local mushroom1 = ScriptManager.instance:getItem("Base.MushroomGeneric1");
if mushroom1 then
	mushroom1:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom2 = ScriptManager.instance:getItem("Base.MushroomGeneric2");
if mushroom2 then
	mushroom2:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom3 = ScriptManager.instance:getItem("Base.MushroomGeneric3");
if mushroom3 then
	mushroom3:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom4 = ScriptManager.instance:getItem("Base.MushroomGeneric4");
if mushroom4 then
	mushroom4:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom5 = ScriptManager.instance:getItem("Base.MushroomGeneric5");
if mushroom5 then
	mushroom5:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom6 = ScriptManager.instance:getItem("Base.MushroomGeneric6");
if mushroom6 then
	mushroom6:DoParam("OnEat = OnEat_Mushroom");
end
local mushroom7 = ScriptManager.instance:getItem("Base.MushroomGeneric7");
if mushroom7 then
	mushroom7:DoParam("OnEat = OnEat_Mushroom");
end

-- SALADS
local salad = ScriptManager.instance:getItem("farming.Salad");
if salad then
	salad:DoParam("OnEat = OnEat_Salad");
end

-- STEWS
local potOfStew = ScriptManager.instance:getItem("Base.PotOfStew");
if potOfStew then
	potOfStew:DoParam("OnEat = OnEat_PotOfStew");
end

-- SOUPS
local potOfSoup = ScriptManager.instance:getItem("Base.PotOfSoupRecipe");
if potOfSoup then
	potOfSoup:DoParam("OnEat = OnEat_PotOfSoup");
end

-- STIR FRIES 
local stirFry = ScriptManager.instance:getItem("Base.PanFriedVegetables");
if stirFry then
	stirFry:DoParam("OnEat = OnEat_StirFry");
end
local stirFry2 = ScriptManager.instance:getItem("Base.GriddlePanFriedVegetables");
if stirFry2 then
	stirFry2:DoParam("OnEat = OnEat_StirFry2");
end

-- PASTA
local pastaPot = ScriptManager.instance:getItem("Base.PastaPot");
if pastaPot then
	pastaPot:DoParam("OnEat = OnEat_PastaPot");
end
local pastaPan = ScriptManager.instance:getItem("Base.PastaPan");
if pastaPan then
	pastaPan:DoParam("OnEat = OnEat_PastaPan");
end

-- RICE
local ricePot = ScriptManager.instance:getItem("Base.RicePot");
if ricePot then
	ricePot:DoParam("OnEat = OnEat_RicePot");
end
local ricePan = ScriptManager.instance:getItem("Base.RicePan");
if ricePan then
	ricePan:DoParam("OnEat = OnEat_RicePan");
end

-- ROASTED VEGETABLES
local roastedVegetables = ScriptManager.instance:getItem("Base.PanFriedVegetables2");
if roastedVegetables then
	roastedVegetables:DoParam("OnEat = OnEat_RoastedVegetables");
end

-- OMELETTE
local omelette = ScriptManager.instance:getItem("Base.OmeletteRecipe");
if omelette then
	omelette:DoParam("OnEat = OnEat_OmeletteRecipe");
end

-- SANDWICH
local sandwich = ScriptManager.instance:getItem("Base.Sandwich");
if sandwich then
	sandwich:DoParam("OnEat = OnEat_Sandwich");
end

-- BURGER
local burger = ScriptManager.instance:getItem("Base.BurgerRecipe");
if burger then
	burger:DoParam("OnEat = OnEat_BurgerRecipe");
end

-- PIE 
local pie = ScriptManager.instance:getItem("Base.PieWholeRaw");
if pie then
	pie:DoParam("OnEat = OnEat_PieWholeRaw");
end

-- Add OnEat to preparations that can contain Berries
-- BERRIES (NO RECIPES)
local berry1 = ScriptManager.instance:getItem("Base.BerryGeneric1");
if berry1 then
	berry1:DoParam("OnEat = OnEat_Berry");
end
local berry2 = ScriptManager.instance:getItem("Base.BerryGeneric2");
if berry2 then
	berry2:DoParam("OnEat = OnEat_Berry");
end
local berry3 = ScriptManager.instance:getItem("Base.BerryGeneric3");
if berry3 then
	berry3:DoParam("OnEat = OnEat_Berry");
end
local berry4 = ScriptManager.instance:getItem("Base.BerryGeneric4");
if berry4 then
	berry4:DoParam("OnEat = OnEat_Berry");
end
local berry5 = ScriptManager.instance:getItem("Base.BerryGeneric5");
if berry5 then
	berry5:DoParam("OnEat = OnEat_Berry");
end
local berryBlack = ScriptManager.instance:getItem("Base.BerryBlack");
if berryBlack then
	berryBlack:DoParam("OnEat = OnEat_Berry");
end
local berryBlue = ScriptManager.instance:getItem("Base.BerryBlue");
if berryBlue then
	berryBlue:DoParam("OnEat = OnEat_Berry");
end
local berryPoisonIvy = ScriptManager.instance:getItem("Base.BerryPoisonIvy");
if berryPoisonIvy then
	berryPoisonIvy:DoParam("OnEat = OnEat_Berry");
end
local berryBeauty = ScriptManager.instance:getItem("Base.BeautyBerry");
if berryBeauty then
	berryBeauty:DoParam("OnEat = OnEat_Berry");
end
local berryHoly = ScriptManager.instance:getItem("Base.HollyBerry");
if berryHoly then
	berryHoly:DoParam("OnEat = OnEat_Berry");
end
local berryWinter = ScriptManager.instance:getItem("Base.WinterBerry");
if berryWinter then
	berryWinter:DoParam("OnEat = OnEat_Berry");
end

-- SALAD
local fruitSalad = ScriptManager.instance:getItem("Base.FruitSalad");
if fruitSalad then
	fruitSalad:DoParam("OnEat = OnEat_FruitSalad");
end

-- CAKE
local cakeRaw = ScriptManager.instance:getItem("Base.CakeRaw");
if cakeRaw then
	cakeRaw:DoParam("OnEat = OnEat_CakeRaw");
end

-- PANCAKES
local pancakes = ScriptManager.instance:getItem("Base.PancakesRecipe");
if pancakes then
	pancakes:DoParam("OnEat = OnEat_Pancakes");
end

-- WAFFLES
local waffles = ScriptManager.instance:getItem("Base.WafflesRecipe");
if waffles then
	waffles:DoParam("OnEat = OnEat_Waffles");
end

-- VIOLETS
local violets = ScriptManager.instance:getItem("Base.Violets");
if violets then
	violets:DoParam("OnEat = OnEat_Violets");
end

-- SUNFLOWERSEEDS
local sunflowerseeds = ScriptManager.instance:getItem("Base.SunflowerSeeds");
if sunflowerseeds then
	sunflowerseeds:DoParam("OnEat = OnEat_SunFlowerSeeds");
end

-- GRAPELEAVES
local grapeLeaves = ScriptManager.instance:getItem("Base.GrapeLeaves");
if grapeLeaves then
	grapeLeaves:DoParam("OnEat = OnEat_GrapeLeaves");
end

-- ROSEHIPS
local rosehips = ScriptManager.instance:getItem("Base.Rosehips");
if rosehips then
	rosehips:DoParam("OnEat = OnEat_Rosehips");
end

-- ACORN
local acorns = ScriptManager.instance:getItem("Base.Acorn");
if acorns then
	acorns:DoParam("OnEat = OnEat_Acorns");
end

-- DANDELIONS
local dandelions = ScriptManager.instance:getItem("Base.Dandelions");
if dandelions then
	dandelions:DoParam("OnEat = OnEat_Dandelions");
end

-- NETTLES
local nettles = ScriptManager.instance:getItem("Base.Nettles");
if nettles then
	nettles:DoParam("OnEat = OnEat_Nettles");
end

-- THISTLE
local thistle = ScriptManager.instance:getItem("Base.Thistle");
if thistle then
	thistle:DoParam("OnEat = OnEat_Thistle");
end

-- GUM
local gum = ScriptManager.instance:getItem("Base.Gum");
if gum then
	gum:DoParam("OnEat = OnEat_Gum");
end

if getActivatedMods():contains("LeGourmetRevolution") then
	print("DT Logger: LeGourmetRevolution detected, adding OnEat params for Addicted to caffeine trait")

	-- COFFEE
	local coffee = ScriptManager.instance:getItem("Base.Coffee2");
	if coffee then
		coffee:DoParam("OnEat = OnEat_Coffee");
	end

	-- HOTDRINK
	local hotdrink = ScriptManager.instance:getItem("Base.HotDrink");
	if hotdrink then
		hotdrink:DoParam("OnEat = OnEat_HotDrinks");
	end

	-- HOTDRINKWHITE
	local hotdrinkwhite = ScriptManager.instance:getItem("Base.HotDrinkWhite");
	if hotdrinkwhite then
		hotdrinkwhite:DoParam("OnEat = OnEat_HotDrinks");
	end

	-- HOTDRINKRED
	local hotdrinkred = ScriptManager.instance:getItem("Base.HotDrinkRed");
	if hotdrinkred then
		hotdrinkred:DoParam("OnEat = OnEat_HotDrinks");
	end

	-- HOTDRINKSPIFFO
	local hotdrinkspiffo = ScriptManager.instance:getItem("Base.HotDrinkSpiffo");
	if hotdrinkspiffo then
		hotdrinkspiffo:DoParam("OnEat = OnEat_HotDrinks");
	end

	-- HOTDRINKTEA
	local hotdrinktea = ScriptManager.instance:getItem("Base.HotDrinkTea");
	if hotdrinktea then
		hotdrinktea:DoParam("OnEat = OnEat_HotDrinks");
	end

	-- CHOCOLATECOVEREDCOFFEEBEANS
	local chocolatecoveredcoffeebeans = ScriptManager.instance:getItem("Base.ChocolateCoveredCoffeeBeans");
	if chocolatecoveredcoffeebeans then
		chocolatecoveredcoffeebeans:DoParam("OnEat = OnEat_ChocolateCoveredCoffeeBeans");
	end
end

