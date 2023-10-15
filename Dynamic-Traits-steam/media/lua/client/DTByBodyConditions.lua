-- Traits gains based on body conditions are going to be handled in this function.
function traitsGainsByBodyConditions(player)
    --print("DT Logger: running traitsGainsByBodyConditions function");
    --------------- TRAITS APPLIED/REMOVED FOR "EMACIATED" ---------------
    if player:HasTrait("Emaciated") then
        ---
    --------------- TRAITS APPLIED/REMOVED FOR "VERY UNDERWEIGHT" ---------------
    elseif player:HasTrait("Very Underweight") then
        -- Removing Traits
        if player:HasTrait("Flimsy") then
            player:getTraits():remove("Flimsy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flimsy"), false, HaloTextHelper.getColorGreen());
            if player:getModData().DTCurrentStrXPLevel == 0 then
                saveCurrentStrXPLevel(player);
            end
            player:LevelPerk(Perks.Strength);
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
        end
        --- Gaining Traits ---
        if not player:HasTrait("Frail") then
            player:getTraits():add("Frail");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Frail"), true, HaloTextHelper.getColorRed());
            if player:getModData().DTCurrentStrXPLevel == 0 then
                saveCurrentStrXPLevel(player);
            end
            player:LoseLevel(Perks.Strength);
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
            player:LoseLevel(Perks.Strength);
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
            player:getXp():AddXP(Perks.Strength, player:getModData().DTCurrentStrXPLevel);
            player:getModData().DTCurrentStrXPLevel = 0;
        end
        if player:HasTrait("Athletic") then
            if player:HasTrait("Asthmatic") then
                player:getTraits():remove("Asthmatic");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), false, HaloTextHelper.getColorGreen());
            end
        else
            if not player:HasTrait("Asthmatic") then
                player:getTraits():add("Asthmatic");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), true, HaloTextHelper.getColorRed());
            end
        end
        --- If "Strong" or "Stout" are not present "LigthEater" is obtained, otherwise it is removed ---
        if player:HasTrait("Strong") or player:HasTrait("Stout") then
            if player:HasTrait("LightEater") then
                player:getTraits():remove("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
            player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
                player:getTraits():add("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), true, HaloTextHelper.getColorRed());
            end
        end
        --- If "Athletic" or "Fit" are not present "LowThirst" is obtained, otherwise it is removed ---
        if player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if player:HasTrait("LowThirst") then
                player:getTraits():remove("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("LowThirst") then
                player:getTraits():add("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), true, HaloTextHelper.getColorRed());
            end
        end
        if not player:HasTrait("Thinskinned") then
            player:getTraits():add("Thinskinned");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ThinSkinned"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("ProneToIllness") then
            player:getTraits():add("ProneToIllness");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("SlowHealer") then
            player:getTraits():add("SlowHealer");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), true, HaloTextHelper.getColorRed());
        end
    --------------- TRAITS APPLIED/REMOVED FOR "UNDERWEIGHT" ---------------
    elseif player:HasTrait("Underweight") then
        --- Removing Traits ---
        if player:HasTrait("Frail") then
            player:getTraits():remove("Frail");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Frail"), false, HaloTextHelper.getColorGreen());
            if player:getModData().DTCurrentStrXPLevel == 0 then
                saveCurrentStrXPLevel(player);
            end
            player:LevelPerk(Perks.Strength);
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
            --player:LevelPerk(Perks.Strength);
            --player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
        end
        if player:HasTrait("HeartyAppitite") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
        player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
            player:getTraits():remove("HeartyAppitite");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), false, HaloTextHelper.getColorGreen());
        end
        if player:HasTrait("HighThirst") then
            player:getTraits():remove("HighThirst");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), false, HaloTextHelper.getColorGreen());
        end
        if player:HasTrait("Asthmatic") then
            player:getTraits():remove("Asthmatic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), false, HaloTextHelper.getColorGreen());
        end
        if player:HasTrait("Thinskinned") then
            player:getTraits():remove("Thinskinned");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ThinSkinned"), false, HaloTextHelper.getColorGreen());
        end
        if player:HasTrait("ThickSkinned") then
            player:getTraits():remove("ThickSkinned");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), false, HaloTextHelper.getColorRed());
        end
        --- Gaining Traits ---
        if not player:HasTrait("Flimsy") then
            player:getTraits():add("Flimsy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flimsy"), true, HaloTextHelper.getColorRed());
            if player:getModData().DTCurrentStrXPLevel == 0 then
                saveCurrentStrXPLevel(player);
            end
            player:LoseLevel(Perks.Strength);
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
            player:getXp():AddXP(Perks.Strength, player:getModData().DTCurrentStrXPLevel);
            player:getModData().DTCurrentStrXPLevel = 0;
        end
        --- If "Strong" or "Stout" are not present "LigthEater" is obtained, otherwise it is removed ---
        if player:HasTrait("Strong") or player:HasTrait("Stout") then
            if player:HasTrait("LightEater") then
                player:getTraits():remove("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
            player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
                player:getTraits():add("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), true, HaloTextHelper.getColorGreen());
            end
        end
        --- If "Athletic" or "Fit" are not present "LowThirst" is obtained, otherwise it is removed ---
        if player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if player:HasTrait("LowThirst") then
                player:getTraits():remove("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("LowThirst") then
                player:getTraits():add("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), true, HaloTextHelper.getColorGreen());
            end
        end
        --- If "Athletic" or "Fit" are present, FastHealer is removed but SlowHealer is not obtained. ---
        if player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if player:HasTrait("SlowHealer") then
                player:getTraits():remove("SlowHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("FastHealer") then
                player:getTraits():remove("FastHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastHealer"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("SlowHealer") then
                player:getTraits():add("SlowHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), true, HaloTextHelper.getColorRed());
            end
        end
        --- If "Athletic" is present "Resilient" is removed but ProneToIllness is not obtained. ---
        if player:HasTrait("Athletic") then
            if player:HasTrait("ProneToIllness") then
                player:getTraits():remove("ProneToIllness");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("Resilient") then
                player:getTraits():remove("Resilient");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_resilient"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("ProneToIllness") then
                player:getTraits():add("ProneToIllness");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), true, HaloTextHelper.getColorRed());
            end
        end

    --------------- TRAITS APPLIED/REMOVED FOR A HEALTHY CHARACTER ---------------
    elseif not player:HasTrait("Emaciated") and not player:HasTrait("Very Underweight") 
    and not player:HasTrait("Underweight") and not player:HasTrait("Overweight") 
    and not player:HasTrait("Obese") then
        --- Removing traits ---
        if player:HasTrait("Flimsy") then
            player:getTraits():remove("Flimsy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flimsy"), false, HaloTextHelper.getColorGreen());
            --player:LevelPerk(Perks.Strength);
            --player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
        end
        if player:HasTrait("Flabby") then
            player:getTraits():remove("Flabby");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flabby"), false, HaloTextHelper.getColorGreen());
            --player:LevelPerk(Perks.Strength);
            --player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
        end
        if player:HasTrait("ProneToIllness") then
            player:getTraits():remove("ProneToIllness");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), false, HaloTextHelper.getColorGreen());
        end
        if player:HasTrait("SlowHealer") then
            player:getTraits():remove("SlowHealer");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), false, HaloTextHelper.getColorGreen());
        end
        --- Gaining Traits ---
        --- If "Weak" or "Feeble" are present, gain "LightEater", if "Strong" or "Stout" are present, gain "HeartyAppitite", otherwise, both are removed. ---
        if player:HasTrait("Weak") or player:HasTrait("Feeble") then
            if not player:HasTrait("LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
            player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
                if player:HasTrait("HeartyAppitite") then
                    player:getTraits():remove("HeartyAppitite");
                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), false, HaloTextHelper.getColorGreen());
                end
                player:getTraits():add("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), true, HaloTextHelper.getColorGreen());
            end
        elseif player:HasTrait("Strong") or player:HasTrait("Stout") then
            if not player:HasTrait("HeartyAppitite") then
                if player:HasTrait("LightEater") then
                    player:getTraits():remove("LightEater");
                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorGreen());
                end
                player:getTraits():add("HeartyAppitite");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), true, HaloTextHelper.getColorRed());
            end
        else
            if player:HasTrait("LightEater") then
                player:getTraits():remove("LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("HeartyAppitite") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
            player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
                player:getTraits():remove("HeartyAppitite");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), false, HaloTextHelper.getColorGreen());
            end
        end
        --- If "Unfit" or "Out of Shape" are present, gain "LowThirst", if "Athletic" or "Fit" are present, gain "HighThirst", otherwise, both are removed. ---
        if player:HasTrait("Unfit") or player:HasTrait("Out of Shape") then
            if not player:HasTrait("LowThirst") then
                if player:HasTrait("HighThirst") then
                    player:getTraits():remove("HighThirst");
                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), false, HaloTextHelper.getColorGreen());
                end
                player:getTraits():add("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), true, HaloTextHelper.getColorGreen());
            end
        elseif player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if not player:HasTrait("HighThirst") then
                if player:HasTrait("LowThirst") then
                    player:getTraits():remove("LowThirst");
                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), false, HaloTextHelper.getColorGreen());
                end
                player:getTraits():add("HighThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), true, HaloTextHelper.getColorRed());
            end
        else
            if player:HasTrait("LowThirst") then
                player:getTraits():remove("LowThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("HighThirst") then
                player:getTraits():remove("HighThirst");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), false, HaloTextHelper.getColorGreen());
            end
        end
        --- If "Strong" is present "ThickSkinned" is added, otherwise is removed. ---
        if player:HasTrait("Strong") then
            if not player:HasTrait("ThickSkinned") then
                player:getTraits():add("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), true, HaloTextHelper.getColorGreen());
            end
        else
            if player:HasTrait("ThickSkinned") then
                player:getTraits():remove("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), false, HaloTextHelper.getColorRed());
            end
        end
        --- If "Athletic" is present "Resilient" is added, otherwise is removed. ---
        if player:HasTrait("Athletic") then
            if not player:HasTrait("Resilient") then
                player:getTraits():add("Resilient");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_resilient"), true, HaloTextHelper.getColorGreen());
            end
        else
            if player:HasTrait("Resilient") then
                player:getTraits():remove("Resilient");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_resilient"), false, HaloTextHelper.getColorRed());
            end
        end
        --- If "Athletic" or "Fit" are present, FastHealer is added, otherwise is removed. ---
        if player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if not player:HasTrait("FastHealer") then
                player:getTraits():add("FastHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastHealer"), true, HaloTextHelper.getColorGreen());
            end
        else
            if player:HasTrait("FastHealer") then
                player:getTraits():remove("FastHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastHealer"), false, HaloTextHelper.getColorRed());
            end
        end
    --------------- TRAITS APPLIED/REMOVED FOR "OVERWEIGHT" ---------------
    elseif player:HasTrait("Overweight") then
        --- Removing Traits ---
        if player:HasTrait("BrittleKnees") then
            player:getTraits():remove("BrittleKnees");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BrittleKnees"), false, HaloTextHelper.getColorGreen());
            if player:getModData().DTCurrentFitXPLevel == 0 then
                saveCurrentFitXPLevel(player);
            end
            player:LevelPerk(Perks.Fitness);
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness));
            --player:LevelPerk(Perks.Strength);
            --player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength));
        end
        if player:HasTrait("LightEater") then
            player:getTraits():remove("LightEater");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorRed());
        end
        if player:HasTrait("LowThirst") then
            player:getTraits():remove("LowThirst");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LowThirst"), false, HaloTextHelper.getColorRed());
        end
        if player:HasTrait("Asthmatic") then
            player:getTraits():remove("Asthmatic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), false, HaloTextHelper.getColorGreen());
        end
        --- Gaining Traits ---
        if not player:HasTrait("Flabby") then
            player:getTraits():add("Flabby");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flabby"), true, HaloTextHelper.getColorRed());
            if player:getModData().DTCurrentFitXPLevel == 0 then
                saveCurrentFitXPLevel(player);
            end
            player:LoseLevel(Perks.Fitness);
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness));
            player:getXp():AddXP(Perks.Fitness, player:getModData().DTCurrentFitXPLevel);
            player:getModData().DTCurrentFitXPLevel = 0;
        end
        if not player:HasTrait("HeartyAppitite") then
            player:getTraits():add("HeartyAppitite");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("HighThirst") then
            player:getTraits():add("HighThirst");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), true, HaloTextHelper.getColorRed());
        end
        --- If "Athletic" or "Fit" are present, FastHealer is removed but SlowHealer is not obtained. ---
        if player:HasTrait("Athletic") or player:HasTrait("Fit") then
            if player:HasTrait("SlowHealer") then
                player:getTraits():remove("SlowHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("FastHealer") then
                player:getTraits():remove("FastHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastHealer"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("SlowHealer") then
                player:getTraits():add("SlowHealer");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), true, HaloTextHelper.getColorRed());
            end
        end
        --- If "Athletic" is present "Resilient" is removed but ProneToIllness is not obtained. ---
        if player:HasTrait("Athletic") then
            if player:HasTrait("ProneToIllness") then
                player:getTraits():remove("ProneToIllness");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), false, HaloTextHelper.getColorRed());
            end
            if player:HasTrait("Resilient") then
                player:getTraits():remove("Resilient");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_resilient"), false, HaloTextHelper.getColorRed());
            end
        else
            if not player:HasTrait("ProneToIllness") then
                player:getTraits():add("ProneToIllness");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), true, HaloTextHelper.getColorRed());
            end
        end
        --- If "Strong" is present "Thick Skinned" is obtained, otherwise is removed. ---
        if player:HasTrait("Strong") then
            if not player:HasTrait("ThickSkinned") then
                player:getTraits():add("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), true, HaloTextHelper.getColorGreen());
            end
        else
            if player:HasTrait("ThickSkinned") then
                player:getTraits():remove("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), false, HaloTextHelper.getColorRed());
            end
        end
    --------------- TRAITS APPLIED/REMOVED FOR "OBESE" ---------------
    elseif player:HasTrait("Obese") then
        if player:HasTrait("Flabby") then
            player:getTraits():remove("Flabby");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Flabby"), false, HaloTextHelper.getColorGreen());
            if player:getModData().DTCurrentFitXPLevel == 0 then
                saveCurrentFitXPLevel(player);
            end
            player:LevelPerk(Perks.Fitness);
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness));
        end
        --- Gaining Traits ---
        if not player:HasTrait("BrittleKnees") then
            player:getTraits():add("BrittleKnees");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BrittleKnees"), true, HaloTextHelper.getColorRed());
            if player:getModData().DTCurrentFitXPLevel == 0 then
                saveCurrentFitXPLevel(player);
            end
            player:LoseLevel(Perks.Fitness);
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness));
            player:LoseLevel(Perks.Fitness);
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness));
            player:getXp():AddXP(Perks.Fitness, player:getModData().DTCurrentFitXPLevel);
            player:getModData().DTCurrentFitXPLevel = 0;
        end
        if not player:HasTrait("HeartyAppitite") then
            player:getTraits():add("HeartyAppitite");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("HighThirst") then
            player:getTraits():add("HighThirst");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_HighThirst"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("ProneToIllness") then
            player:getTraits():add("ProneToIllness");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_pronetoillness"), true, HaloTextHelper.getColorRed());
        end
        if not player:HasTrait("SlowHealer") then
            player:getTraits():add("SlowHealer");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowHealer"), true, HaloTextHelper.getColorRed());
        end
        if player:HasTrait("Athletic") then
            if player:HasTrait("Asthmatic") then
                player:getTraits():remove("Asthmatic");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), false, HaloTextHelper.getColorGreen());
            end
        else
            if not player:HasTrait("Asthmatic") then
                player:getTraits():add("Asthmatic");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Asthmatic"), true, HaloTextHelper.getColorRed());
            end
        end
        if player:HasTrait("Strong") then
            if not player:HasTrait("ThickSkinned") then
                player:getTraits():add("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), true, HaloTextHelper.getColorGreen());
            end
        else
            if player:HasTrait("ThickSkinned") then
                player:getTraits():remove("ThickSkinned");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickskinned"), false, HaloTextHelper.getColorRed());
            end
        end
    end
end

DTXPPerLevel = {
    1500,
    3000,
    6000,
    9000,
    18000,
    30000,
    60000,
    90000,
    120000,
    150000
}

function saveCurrentStrXPLevel(player)
    local currentLevel = player:getPerkLevel(Perks.Strength);
    --print("Current level: " .. currentLevel);
    local currentTotalXP = player:getXp():getXP(Perks.Strength);
    --print("Current Total XP: " .. currentTotalXP)
    local currentLevelXP = currentTotalXP;
    for i = 1, currentLevel do
        currentLevelXP = currentLevelXP - DTXPPerLevel[i]
        --print("Current Level XP: " .. currentLevelXP)
    end
    player:getModData().DTCurrentStrXPLevel = currentLevelXP;
    --print("player:getModData().DTCurrentStrXPLevel: " .. player:getModData().DTCurrentStrXPLevel);
end

function saveCurrentFitXPLevel(player)
    local currentLevel = player:getPerkLevel(Perks.Fitness);
    --print("Current level: " .. currentLevel);
    local currentTotalXP = player:getXp():getXP(Perks.Fitness);
    --print("Current Total XP: " .. currentTotalXP)
    local currentLevelXP = currentTotalXP;
    for i = 1, currentLevel do
        currentLevelXP = currentLevelXP - DTXPPerLevel[i]
        --print("Current Level XP: " .. currentLevelXP)
    end
    player:getModData().DTCurrentFitXPLevel = currentLevelXP;
    --print("player:getModData().DTCurrentStrXPLevel: " .. player:getModData().DTCurrentFitXPLevel);
end
