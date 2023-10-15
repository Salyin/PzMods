MedicineXPOne = Recipe.OnGiveXP.MedicineMed
MedicineXPTwo = Recipe.OnGiveXP.MedicineHigh

function Recipe.OnGiveXP.MedicineMed(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 15);
end

function Recipe.OnGiveXP.MedicineHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 30);
end





