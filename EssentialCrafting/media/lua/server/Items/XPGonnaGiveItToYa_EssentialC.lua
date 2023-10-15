function Recipe.OnGiveXP.DoctorLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 5);
end

function Recipe.OnGiveXP.DoctorHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Doctor, 10);
end

DoctorXPLow = Recipe.OnGiveXP.DoctorLow
DoctorXPHigh = Recipe.OnGiveXP.DoctorHigh

function Recipe.OnGiveXP.MechanicsLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 5);
end

function Recipe.OnGiveXP.MechanicsHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end

MechanicsXPLow = Recipe.OnGiveXP.MechanicsLow
MechanicsXPHigh = Recipe.OnGiveXP.MechanicsHigh

function Recipe.OnGiveXP.TailoringLow(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5);
end

function Recipe.OnGiveXP.TailoringMed(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 15);
end

function Recipe.OnGiveXP.TailoringHigh(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 25);
end

TailoringXPLow = Recipe.OnGiveXP.TailoringLow
TailoringXPMed = Recipe.OnGiveXP.TailoringMed
TailoringXPHigh = Recipe.OnGiveXP.TailoringHigh