function Recipe.OnGiveXP.HuntingLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 15);
end

function Recipe.OnGiveXP.HuntingHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 25);
end

HuntingXPLow = Recipe.OnGiveXP.HuntingLow
HuntingXPHigh = Recipe.OnGiveXP.HuntingHigh

function Recipe.OnGiveXP.ForagingLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.PlantScavenging, 15);
end

function Recipe.OnGiveXP.ForagingHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.PlantScavenging, 25);
end

ForagingXPLow = Recipe.OnGiveXP.ForagingLow
ForagingXPHigh = Recipe.OnGiveXP.ForagingHigh

function Recipe.OnGiveXP.SpearLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Spear, 15);
end

function Recipe.OnGiveXP.SpearHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Spear, 25);
end

SpearXPLow = Recipe.OnGiveXP.SpearLow
SpearXPHigh = Recipe.OnGiveXP.SpearHigh