require "TimedActions/ISTakePillAction"

local DTtraitsByPills = {}
DTtraitsByPills.ISTakePillAction = {}

DTtraitsByPills.ISTakePillAction.perform = ISTakePillAction.perform
function ISTakePillAction:perform()
    DTtraitsByPills.ISTakePillAction.perform(self)
    --print("DT Logger: running ISTakePillAction:perform function");
    --print("DT Logger: Just took a " .. self.item:getType() .. " pill (getType)");
    local player = self.character;
    local pill = self.item;
    -- ANTIDEPRESSANTS
    if pill:getType() == "PillsAntiDep" and player:getModData().DTisMelancholic == true then
        player:getModData().DTPillsAntiDep = player:getModData().DTPillsAntiDep - 48;
        if player:getModData().DTPillsAntiDep < 0 then
            player:getModData().DTPillsAntiDep = 0;
        end
        if player:getModData().DTPillsAntiDep <= 48 and player:HasTrait("Melancholic") then
            player:getTraits():remove("Melancholic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), false, HaloTextHelper.getColorGreen());
        end
    -- BETABLOCKERS
    elseif pill:getType() == "PillsBeta" and player:getModData().DTisNervousWreck == true then
        player:getModData().DTPillsBeta = player:getModData().DTPillsBeta - 48;
        if player:getModData().DTPillsBeta < 0 then
            player:getModData().DTPillsBeta = 0;
        end
        if player:getModData().DTPillsBeta <= 48 and player:HasTrait("NervousWreck") then
            player:getTraits():remove("NervousWreck");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), false, HaloTextHelper.getColorGreen());
        end
    --elseif pill:getType() == "Pills" then
    end
    -- If too many pills are taken together an overdose can occur
    if pill:getType() == "PillsVitamins" then
        DTOverdose.overdoseIncrease(player, 8);
        if player:HasTrait("PillsAllergy") then
            DTDrugsAllergy.allergyIncrease(player, 15);
        end
    else
        DTOverdose.overdoseIncrease(player, 12);
        if player:HasTrait("PillsAllergy") then
            DTDrugsAllergy.allergyIncrease(player, 30);
        end
    end

    --print("DT Logger: DTOverdose value is " .. player:getModData().DTOverdose);
    --print("DT Logger: DTDrugsAllergy value is " .. player:getModData().DTDrugsAllergy);
end

function checkReduceInfectionPower(player)
    --print("DT Logger: running checkReduceInfectionPower function");
    if player:getReduceInfectionPower() > 0 and player:HasTrait("PillsAllergy") then
        if ZombRand(9) == 0 then
            DTDrugsAllergy.allergyIncrease(player, (player:getReduceInfectionPower() / 4));
        end
    end
end

function nervousWreckTrait(player)
    --print("DT Logger: running nervousWreckTrait function");
    player:getModData().DTPillsBeta = player:getModData().DTPillsBeta + 1;
    if player:getModData().DTPillsBeta > 240 then
        player:getModData().DTPillsBeta = 240;
    end
    if player:getModData().DTPillsBeta > 48 and not player:HasTrait("NervousWreck") then
        player:getTraits():add("NervousWreck");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), true, HaloTextHelper.getColorRed());
    end
    if player:HasTrait("NervousWreck") then
        DTincreaseStress(player, 0, 0.1);
    end
    --print("DT Logger: DTPillsBeta value is " .. player:getModData().DTPillsBeta);
end

function melancholicTrait(player)
    --print("DT Logger: running melancholicTrait function");
    player:getModData().DTPillsAntiDep = player:getModData().DTPillsAntiDep + 1;
    if player:getModData().DTPillsAntiDep > 240 then
        player:getModData().DTPillsAntiDep = 240;
    end
    if player:getModData().DTPillsAntiDep > 48 and not player:HasTrait("Melancholic") then
        player:getTraits():add("Melancholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), true, HaloTextHelper.getColorRed());
    end
    if player:HasTrait("Melancholic") then
        DTincreaseUnhappyness(player, 0, 3);
    end
    --print("DT Logger: DTPillsAntiDep value is " .. player:getModData().DTPillsAntiDep);
end

function pillsTraitsDevelopment(player)
    --print("DT Logger: running pillsTraitsDevelopment function");
    if player:getHoursSurvived() > 168 then
        if player:getModData().DTisMelancholic == false and player:getMoodles():getMoodleLevel(MoodleType.Unhappy) ~= 0 then
            local range = player:getHoursSurvived() / player:getMoodles():getMoodleLevel(MoodleType.Unhappy);
            --print("Hours survived: " .. player:getHoursSurvived());
            --print("Unhappy moodle level: " .. player:getMoodles():getMoodleLevel(MoodleType.Unhappy));
            --print("Range: " .. range);
            if ZombRand(range) == 0 then
                player:getModData().DTisMelancholic = true;
            end
        end
        if player:getModData().DTisNervousWreck == false and player:getMoodles():getMoodleLevel(MoodleType.Stress) ~= 0 then
            local range = player:getHoursSurvived() / player:getMoodles():getMoodleLevel(MoodleType.Stress);
            --print("Hours survived: " .. player:getHoursSurvived());
            --print("Stress moodle level: " .. player:getMoodles():getMoodleLevel(MoodleType.Stress));
            --print("Range: " .. range);
            if ZombRand(range) == 0 then
                player:getModData().DTisNervousWreck = true;
            end
        end
    end
end