local vanillaFishingAction = ISFishingAction.perform
function ISFishingAction:perform()
    vanillaFishingAction(self);
    local player = self.character;
    if player:HasTrait("Fishing") then
        DTdecreaseStress(player, 0.07);
        DTdecreaseUnhappyness(player, 7);
        DTdecreaseStressFromCigarettes(player, 1);
        DTdecreaseAnger(player, 0.07);
    end
    if player:getDescriptor():getProfession() == "fisherman" then 
        DTdecreaseStress(player, 0.15);
        DTdecreaseUnhappyness(player, 15);
        DTdecreaseStressFromCigarettes(player, 1);
        DTdecreaseAnger(player, 0.15);
    end
end