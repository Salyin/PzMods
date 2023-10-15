function Recipe.OnGiveXP.MetalWeldingLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 5);
end

function Recipe.OnGiveXP.MetalWeldingHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 10);
end

MetalWeldingXPLow = Recipe.OnGiveXP.MetalWeldingLow
MetalWeldingXPHigh = Recipe.OnGiveXP.MetalWeldingHigh