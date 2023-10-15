local MoodleAPI = require("MoodleAPI/MoodleAPIClient");

-- OVERDOSE MOODLE
local function getDTOverdoseMoodleValue2()
    local player = getPlayer();
    if player:getModData().DTOverdose > 50 and player:getModData().DTOverdose <= 70 then
        return 2;
    end
    return 0;
end
local function getDTOverdoseMoodleValue3()
    local player = getPlayer();
    if player:getModData().DTOverdose > 70 and player:getModData().DTOverdose <= 85 then
        return 3;
    end
    return 0;
end
local function getDTOverdoseMoodleValue4()
    local player = getPlayer();
    if player:getModData().DTOverdose > 85 and player:getModData().DTOverdose <= 100 then
        return 4;
    end
    return 0;
end

MoodleAPI.AddMoodle("DTOverdose2", "media/ui/moodles/dtoverdose.png", "BAD", getDTOverdoseMoodleValue2);
MoodleAPI.AddMoodle("DTOverdose3", "media/ui/moodles/dtoverdose.png", "BAD", getDTOverdoseMoodleValue3);
MoodleAPI.AddMoodle("DTOverdose4", "media/ui/moodles/dtoverdose.png", "BAD", getDTOverdoseMoodleValue4);

-- ALLERGY MOODLE / SHARED WITH SNAKE'S MODPACK
local function getDTFoodAllergyMoodleValue1()
    local player = getPlayer();
    if player:getModData().DTFoodAllergy > 20 and player:getModData().DTFoodAllergy <= 40 then
        return 1;
    end
    return 0;
end
local function getDTFoodAllergyMoodleValue2()
    local player = getPlayer();
    if player:getModData().DTFoodAllergy > 40 and player:getModData().DTFoodAllergy <= 60 then
        return 2;
    end
    return 0;
end
local function getDTFoodAllergyMoodleValue3()
    local player = getPlayer();
    if player:getModData().DTFoodAllergy > 60 and player:getModData().DTFoodAllergy <= 80 then
        return 3;
    end
    return 0;
end
local function getDTFoodAllergyMoodleValue4()
    local player = getPlayer();
    if player:getModData().DTFoodAllergy > 80 and player:getModData().DTFoodAllergy <= 100 then
        return 4;
    end
    return 0;
end

MoodleAPI.AddMoodle("DTFoodAllergy1", "media/ui/moodles/dtfoodallergy.png", "BAD", getDTFoodAllergyMoodleValue1);
MoodleAPI.AddMoodle("DTFoodAllergy2", "media/ui/moodles/dtfoodallergy.png", "BAD", getDTFoodAllergyMoodleValue2);
MoodleAPI.AddMoodle("DTFoodAllergy3", "media/ui/moodles/dtfoodallergy.png", "BAD", getDTFoodAllergyMoodleValue3);
MoodleAPI.AddMoodle("DTFoodAllergy4", "media/ui/moodles/dtfoodallergy.png", "BAD", getDTFoodAllergyMoodleValue4);

local function getDTDrugsAllergyMoodleValue1()
    local player = getPlayer();
    if player:getModData().DTDrugsAllergy > 20 and player:getModData().DTDrugsAllergy <= 40 then
        return 1;
    end
    return 0;
end
local function getDTDrugsAllergyMoodleValue2()
    local player = getPlayer();
    if player:getModData().DTDrugsAllergy > 40 and player:getModData().DTDrugsAllergy <= 60 then
        return 2;
    end
    return 0;
end
local function getDTDrugsAllergyMoodleValue3()
    local player = getPlayer();
    if player:getModData().DTDrugsAllergy > 60 and player:getModData().DTDrugsAllergy <= 80 then
        return 3;
    end
    return 0;
end
local function getDTDrugsAllergyMoodleValue4()
    local player = getPlayer();
    if player:getModData().DTDrugsAllergy > 80 and player:getModData().DTDrugsAllergy <= 100 then
        return 4;
    end
    return 0;
end

MoodleAPI.AddMoodle("DTDrugsAllergy1", "media/ui/moodles/dtdrugsallergy.png", "BAD", getDTDrugsAllergyMoodleValue1);
MoodleAPI.AddMoodle("DTDrugsAllergy2", "media/ui/moodles/dtdrugsallergy.png", "BAD", getDTDrugsAllergyMoodleValue2);
MoodleAPI.AddMoodle("DTDrugsAllergy3", "media/ui/moodles/dtdrugsallergy.png", "BAD", getDTDrugsAllergyMoodleValue3);
MoodleAPI.AddMoodle("DTDrugsAllergy4", "media/ui/moodles/dtdrugsallergy.png", "BAD", getDTDrugsAllergyMoodleValue4);


local function getBloodlustMoodleValue1()
    local player = getPlayer();
    if player:getModData().DTstressIntelligence == true and player:getModData().DTunhappynessIntelligence == true and
            player:getModData().DTboredomIntelligence == true and player:getModData().DTangerIntelligence == true then
        if player:getModData().DTtimesinceLastKill >= 24 and player:getModData().DTtimesinceLastKill <= 48 then
            return 1;
        end
        return 0;
    else
        if player:getModData().DTtimesinceLastKill >= 12 and player:getModData().DTtimesinceLastKill <= 24 then
            return 1;
        end
        return 0;
    end
end

local function getBloodlustMoodleValue2()
    local player = getPlayer();
    if player:getModData().DTstressIntelligence == true and player:getModData().DTunhappynessIntelligence == true and
            player:getModData().DTboredomIntelligence == true and player:getModData().DTangerIntelligence == true then
        if player:getModData().DTtimesinceLastKill > 48 and player:getModData().DTtimesinceLastKill <= 72 then
            return 2;
        end
        return 0;
    else
        if player:getModData().DTtimesinceLastKill > 24 and player:getModData().DTtimesinceLastKill <= 48 then
            return 2;
        end
        return 0;
    end
end

local function getBloodlustMoodleValue3()
    local player = getPlayer();
    if player:getModData().DTstressIntelligence == true and player:getModData().DTunhappynessIntelligence == true and
            player:getModData().DTboredomIntelligence == true and player:getModData().DTangerIntelligence == true then
        if player:getModData().DTtimesinceLastKill > 72 and player:getModData().DTtimesinceLastKill <= 120 then
            return 3;
        end
        return 0;
    else
        if player:getModData().DTtimesinceLastKill > 48 and player:getModData().DTtimesinceLastKill <= 72 then
            return 3;
        end
        return 0;
    end
end

local function getBloodlustMoodleValue4()
    local player = getPlayer();
    if player:getModData().DTstressIntelligence == true and player:getModData().DTunhappynessIntelligence == true and
            player:getModData().DTboredomIntelligence == true and player:getModData().DTangerIntelligence == true then
        if player:getModData().DTtimesinceLastKill > 120  then
            return 4;
        end
        return 0;
    else
        if player:getModData().DTtimesinceLastKill > 72 then
            return 4;
        end
        return 0;
    end
end

MoodleAPI.AddMoodle("DTBloodlust1", "media/ui/moodles/dtbloodlust.png", "BAD", getBloodlustMoodleValue1);
MoodleAPI.AddMoodle("DTBloodlust2", "media/ui/moodles/dtbloodlust.png", "BAD", getBloodlustMoodleValue2);
MoodleAPI.AddMoodle("DTBloodlust3", "media/ui/moodles/dtbloodlust.png", "BAD", getBloodlustMoodleValue3);
MoodleAPI.AddMoodle("DTBloodlust4", "media/ui/moodles/dtbloodlust.png", "BAD", getBloodlustMoodleValue4);


local function getDTCaffeinePositiveMoodleValue1()
    local player = getPlayer();
    if player:getModData().DTcaffeineOnBody > 0 and player:HasTrait("AddictedToCaffeine") then
        return 1;
    end
    return 0;
end
local function getDTCaffeineNegativeMoodleValue1()
    local player = getPlayer();
    if player:getModData().DTtimeSinceLastCaffeine > 1440 and player:HasTrait("AddictedToCaffeine") then
        return 1;
    end
    return 0;
end

MoodleAPI.AddMoodle("DTCaffeinePositive1", "media/ui/moodles/dtcaffeine.png", "GOOD", getDTCaffeinePositiveMoodleValue1);
MoodleAPI.AddMoodle("DTCaffeineNegative1", "media/ui/moodles/dtcaffeine.png", "BAD", getDTCaffeineNegativeMoodleValue1);