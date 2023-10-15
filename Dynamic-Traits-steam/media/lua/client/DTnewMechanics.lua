-- Grant XP multiplier if the regularity is maxed
function exerciseMultiplierIfMaxRegularity(player)
	--print("DT Logger: running exerciseMultiplierIfMaxRegularity function");
	--print("function exerciseMultiplierIfMaxRegularity is called");

	-- Remove the Fitness XP multipliers (if any) when the regularity is lower than 99.7
	if player:getFitness():getRegularity("squats") < 99.7 and player:getFitness():getRegularity("situp") < 99.7 
	and player:getFitness():getRegularity("burpees") < 99.7 then
		-- Remove Fitness
		player:getXp():addXpMultiplier(Perks.Fitness, 1, player:getPerkLevel(Perks.Fitness), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Fitness); -- Remove the current XP multiplier
	end

	-- Remove the Strength XP multipliers (if any) when the regularity is lower than 99.7
	if player:getFitness():getRegularity("pushups") < 99.7 and player:getFitness():getRegularity("burpees") < 99.7
	and player:getFitness():getRegularity("barbellcurl") < 99.7 and player:getFitness():getRegularity("dumbbellpress") < 99.7
	and player:getFitness():getRegularity("bicepscurl") < 99.7 then
		player:getXp():addXpMultiplier(Perks.Strength, 1, player:getPerkLevel(Perks.Strength), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Strength); -- Remove the current XP multiplier
	end

	-- Grant an XP Multiplier when the regularity is maxed.
	if player:getFitness():getRegularity("squats") == 100 then
		player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
	end
	if player:getFitness():getRegularity("pushups") == 100 then
		player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
	end
	if player:getFitness():getRegularity("situp") == 100 then
		player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
	end
	if player:getFitness():getRegularity("burpees") == 100 then
		player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
		player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
	end
	if player:getFitness():getRegularity("barbellcurl") == 100 then
		player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
	end
	if player:getFitness():getRegularity("dumbbellpress") == 100 then
		player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
	end
	if player:getFitness():getRegularity("bicepscurl") == 100 then
		player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
	end

	-- If Fitness is at Lv10 remove the granted multiplier
	if player:getPerkLevel(Perks.Fitness) == 10 then
		player:getXp():addXpMultiplier(Perks.Fitness, 1, player:getPerkLevel(Perks.Fitness), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Fitness); -- Remove the current XP multiplier
	end
	-- If Strength is at Lv10 remove the granted multiplier
	if player:getPerkLevel(Perks.Strength) == 10 then
		player:getXp():addXpMultiplier(Perks.Strength, 1, player:getPerkLevel(Perks.Strength), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Strength); -- Remove the current XP multiplier
	end
end

-- OVERDOSE FUNCTIONS
DTOverdose = {}

-- Snake's modpack energy drink & tragos overdose
DTOverdose.energyDrinkOverdose = function(food, player)
	--print("DT Logger: running DTOverdose.energyDrinkOverdose");
	local hungerChangeOverdose = food:getHungerChange() * 100 * -1;
	local thirstChangeOverdose = food:getThirstChange() * 100 * -1;
	DTOverdose.overdoseIncrease(player, hungerChangeOverdose + thirstChangeOverdose);
end

DTOverdose.maximumEnergyDrinkOverdose = function(food, player)
	--print("DT Logger: running DTOverdose.energyDrinkOverdose");
	local hungerChangeOverdose = food:getHungerChange() * 100 * -1;
	local thirstChangeOverdose = food:getThirstChange() * 100 * -1;
	DTOverdose.overdoseIncrease(player, hungerChangeOverdose + thirstChangeOverdose);
end

DTOverdose.tragosOverdose = function(food, player)
	--print("DT Logger: running DTOverdose.tragosOverdose");
	local hungerChangeOverdose = food:getHungerChange() * 100 * -1;
	local thirstChangeOverdose = food:getThirstChange() * 100 * -1;
	DTOverdose.overdoseIncrease(player, hungerChangeOverdose + thirstChangeOverdose);
end

DTOverdose.overdoseIncrease = function(player, overdose)
	--print("DT Logger: running overdoseIncrease function");
	--print("overdose: " .. overdose)
	if player:HasTrait("IronGut") then
		player:getModData().DTOverdose = player:getModData().DTOverdose + (overdose * 0.7);
	elseif player:HasTrait("WeakStomach") then
		player:getModData().DTOverdose = player:getModData().DTOverdose + (overdose * 1.3);
	else
		player:getModData().DTOverdose = player:getModData().DTOverdose + overdose;
	end
	if player:getModData().DTOverdose > 100 then
		player:getModData().DTOverdose = 100;
	end
	--print("DT Logger: DTOverdose value is " .. player:getModData().DTOverdose)
end

DTOverdose.overdoseDecrease = function(player)
	--print("DT Logger: running pillsOverdoseDecrease function");
	if player:HasTrait("IronGut") then
		player:getModData().DTOverdose = player:getModData().DTOverdose + (-4 * 1.3);
	elseif player:HasTrait("WeakStomach") then
		player:getModData().DTOverdose = player:getModData().DTOverdose + (-4 * 0.7);
	else
		player:getModData().DTOverdose = player:getModData().DTOverdose + -4;
	end
	if player:getModData().DTOverdose < 0 then
		player:getModData().DTOverdose = 0;
	end
	--print("DT Logger: DTOverdose value is " .. player:getModData().DTOverdose)
end

DTOverdose.overdoseMoodleLv2 = function(player)
	--print("DT Logger: running overdoseMoodleLv2 function");
	if player:getModData().DTOverdose > 50 then
		DTincreaseStress(player, ZombRand(7), 0.10);
		DTincreaseWetness(player, ZombRand(7), 10);
	end
end

DTOverdose.overdoseMoodleLv3 = function(player)
	--print("DT Logger: running overdoseMoodleLv3 function");
	if player:getModData().DTOverdose > 70 then
		DTincreaseFatigue(player, ZombRand(5), 0.07);
	end
end

DTOverdose.overdoseMoodleLv4 = function(player)
	--print("DT Logger: running overdoseMoodleLv4 function");
	if player:getModData().DTOverdose > 85 then
		DTincreasePoison(player, ZombRand(5), (ZombRand(player:getModData().DTOverdose) / 2));
	end
end

-- ALLERGY FUNCTIONS
DTFoodAllergy = {}

DTFoodAllergy.allergyIncrease = function(player, allergy)
	--print("DT Logger: running DTFoodAllergy.allergyIncrease function")
	--print("allergy: " .. allergy)
	if player:HasTrait("WeakStomach") then
		allergy = allergy * 1.1;
		--print("DT Logger: player has trait WeakStomach");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("IronGut") then
		allergy = allergy * 0.9;
		--print("DT Logger: player has trait IronGut");
		--print("DT Logger: allergy: " .. allergy);
	end
	if player:HasTrait("ProneToIllness") then
		allergy = allergy * 1.3;
		--print("DT Logger: player has trait ProneToIllness");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("Resilient") then
		allergy = allergy * 0.7;
		--print("DT Logger: player has trait Resilient");
		--print("DT Logger: allergy: " .. allergy);
	end
	--print("allergy: " .. allergy)
	player:getModData().DTFoodAllergy = player:getModData().DTFoodAllergy + allergy;
    if player:getModData().DTFoodAllergy > 100 then
        player:getModData().DTFoodAllergy = 100;
    end
end

DTFoodAllergy.allergyDecrease = function(player)
	--print("DT Logger: running DTFoodAllergy.allergyDecrease function")
	if ZombRand(5) == 0 then
		local decrease = ZombRand(5);
		--print("decrease: " .. decrease)
		if player:HasTrait("WeakStomach") then
			decrease = decrease * 0.9;
			--("DT Logger: player has trait WeakStomach");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("IronGut") then
			decrease = decrease * 1.1;
			--print("DT Logger: player has trait IronGut");
			--print("DT Logger: decrease: " .. decrease);
		end
		if player:HasTrait("SlowHealer") then
			decrease = decrease * 0.8;
			--print("DT Logger: player has trait SlowHealer");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("FastHealer") then
			decrease = decrease * 1.2;
			--print("DT Logger: player has trait FastHealer");
			--print("DT Logger: decrease: " .. decrease);
		end
		--print("decrease: " .. decrease)
		player:getModData().DTFoodAllergy = player:getModData().DTFoodAllergy - decrease;
		if player:getModData().DTFoodAllergy < 0 then
			player:getModData().DTFoodAllergy = 0;
		end
	end
	--print("player:getModData().DTFoodAllergy: " .. player:getModData().DTFoodAllergy);
end

DTFoodAllergy.allergyMoodleLv1 = function(player)
	--print("DT Logger: running DTFoodAllergy.allergyMoodleLv1 function");
	-- Sneezes with this frecueny will only occur in the Moodle Lv1.
	if player:getModData().DTFoodAllergy > 20 and player:getModData().DTFoodAllergy <= 40 then
		if ZombRand(30) == 0 then
			player:playEmote("dtsneeze");
			player:Say(getText("IGUI_PlayerText_Sneeze"));    
        	addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
		end
	end
end

DTFoodAllergy.allergyMoodleLv2 = function(player)
	--print("DT Logger: running DTFoodAllergy.allergyMoodleLv2 function");
	if player:getModData().DTFoodAllergy > 40 then
		-- Sneezes with this frecueny will only occur in the Moodle Lv2.
		if player:getModData().DTFoodAllergy <= 60 then
			if ZombRand(15) == 0 then
				player:playEmote("dtsneeze");
				player:Say(getText("IGUI_PlayerText_Sneeze"));    
				addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
			end
		end
		-- These next effects will be part of Moodle Lv2, Lv3 and Lv4
		if ZombRand(5) == 0 then
			local randNumb = ZombRand(4)
			if randNumb == 0 then
				--print("dtallergyleftarm")
				player:playEmote("dtallergyleftarm");
				DTapplyPain(player, 0, "ForeArm_L", ZombRand(15));
				DTapplyPain(player, 0, "UpperArm_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergylefthand")
				player:playEmote("dtallergylefthand");
				DTapplyPain(player, 0, "Hand_L", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightarm")
				player:playEmote("dtallergyrightarm");
				DTapplyPain(player, 0, "ForeArm_R", ZombRand(15));
				DTapplyPain(player, 0, "UpperArm_R", ZombRand(15));
			elseif randNumb == 3 then
				--print("dtallergyrighthand")
				player:playEmote("dtallergyrighthand");
				DTapplyPain(player, 0, "Hand_R", ZombRand(15));
			end
		end
	end
end

DTFoodAllergy.allergyMoodleLv3 = function(player)
	--print("DT Logger: running DTFoodAllergy.allergyMoodleLv3 function");
	if player:getModData().DTFoodAllergy > 60 then
		if ZombRand(5) == 0 then
			local randNumb = ZombRand(3)
			if randNumb == 0 then
				--print("dtallergyleftleg")
				player:playEmote("dtallergyleftleg");
				DTapplyPain(player, 0, "UpperLeg_L", ZombRand(15));
				DTapplyPain(player, 0, "LowerLeg_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergypullatcollar")
				player:playEmote("dtallergypullatcollar");
				DTapplyPain(player, 0, "Neck", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightleg")
				player:playEmote("dtallergyrightleg");
				DTapplyPain(player, 0, "UpperLeg_R", ZombRand(15));
				DTapplyPain(player, 0, "LowerLeg_R", ZombRand(15));
			end
		end
	end
end

DTFoodAllergy.allergyMoodleLv4 = function(player)
	--print("DT Logger: running DTFoodAllergy.allergyMoodleLv4 function");
	if player:getModData().DTFoodAllergy > 80 then
		DTincreaseFatigue(player, ZombRand(10), 0.07);
		DTdecreaseEndurance(player, ZombRand(10), 0.07);
		DTdecreaseBodyPartHealth(player, 0, 2);
		if ZombRand(3) == 0 then
			player:playEmote("dtfeelfeint");
			DTapplyPain(player, 0, "Head", ZombRand(15));
			DTincreasePoison(player, 3, 3);
		end
	end
end

DTDrugsAllergy = {}

DTDrugsAllergy.allergyIncrease = function(player, allergy)
	--print("DT Logger: running DTDrugsAllergy.allergyIncrease function")
	--print("allergy: " .. allergy)
	if player:HasTrait("WeakStomach") then
		allergy = allergy * 1.1;
		--print("DT Logger: player has trait WeakStomach");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("IronGut") then
		allergy = allergy * 0.9;
		--print("DT Logger: player has trait IronGut");
		--print("DT Logger: allergy: " .. allergy);
	end
	if player:HasTrait("ProneToIllness") then
		allergy = allergy * 1.3;
		--print("DT Logger: player has trait ProneToIllness");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("Resilient") then
		allergy = allergy * 0.7;
		--print("DT Logger: player has trait Resilient");
		--print("DT Logger: allergy: " .. allergy);
	end
	--print("allergy: " .. allergy)
	player:getModData().DTDrugsAllergy = player:getModData().DTDrugsAllergy + allergy;
	if player:getModData().DTDrugsAllergy > 100 then
		player:getModData().DTDrugsAllergy = 100;
	end
end

DTDrugsAllergy.allergyDecrease = function(player)
	--print("DT Logger: running DTDrugsAllergy.allergyDecrease function")
	if ZombRand(5) == 0 then
		local decrease = ZombRand(5);
		--print("decrease: " .. decrease)
		if player:HasTrait("WeakStomach") then
			decrease = decrease * 0.9;
			--("DT Logger: player has trait WeakStomach");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("IronGut") then
			decrease = decrease * 1.1;
			--print("DT Logger: player has trait IronGut");
			--print("DT Logger: decrease: " .. decrease);
		end
		if player:HasTrait("SlowHealer") then
			decrease = decrease * 0.8;
			--print("DT Logger: player has trait SlowHealer");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("FastHealer") then
			decrease = decrease * 1.2;
			--print("DT Logger: player has trait FastHealer");
			--print("DT Logger: decrease: " .. decrease);
		end
		--print("decrease: " .. decrease)
		player:getModData().DTDrugsAllergy = player:getModData().DTDrugsAllergy - decrease;
		if player:getModData().DTDrugsAllergy < 0 then
			player:getModData().DTDrugsAllergy = 0;
		end
	end
	--print("player:getModData().DTDrugsAllergy: " .. player:getModData().DTDrugsAllergy);
end

DTDrugsAllergy.allergyMoodleLv1 = function(player)
	--print("DT Logger: running DTDrugsAllergy.allergyMoodleLv1 function");
	-- Cough with this frecueny will only occur in the Moodle Lv1.
	if player:getModData().DTDrugsAllergy > 20 and player:getModData().DTDrugsAllergy <= 40 then
		if ZombRand(20) == 0 then
			player:playEmote("dtcough");
			player:Say(getText("IGUI_PlayerText_Cough"));
			addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
		end
	end
end

DTDrugsAllergy.allergyMoodleLv2 = function(player)
	--print("DT Logger: running DTDrugsAllergy.allergyMoodleLv2 function");
	if player:getModData().DTDrugsAllergy > 40 then
		-- Cough with this frecueny will only occur in the Moodle Lv2.
		if player:getModData().DTDrugsAllergy <= 60 then
			if ZombRand(10) == 0 then
				player:playEmote("dtcough");
				player:Say(getText("IGUI_PlayerText_Cough"));
				addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
			end
		end
		-- These next effects will be part of Moodle Lv2, Lv3 and Lv4
		if ZombRand(3) == 0 then
			local randNumb = ZombRand(4)
			if randNumb == 0 then
				--print("dtallergyleftarm")
				player:playEmote("dtallergyleftarm");
				DTapplyPain(player, 0, "ForeArm_L", ZombRand(15));
				DTapplyPain(player, 0, "UpperArm_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergylefthand")
				player:playEmote("dtallergylefthand");
				DTapplyPain(player, 0, "Hand_L", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightarm")
				player:playEmote("dtallergyrightarm");
				DTapplyPain(player, 0, "ForeArm_R", ZombRand(15));
				DTapplyPain(player, 0, "UpperArm_R", ZombRand(15));
			elseif randNumb == 3 then
				--print("dtallergyrighthand")
				player:playEmote("dtallergyrighthand");
				DTapplyPain(player, 0, "Hand_R", ZombRand(15));
			end
		end
	end
end

DTDrugsAllergy.allergyMoodleLv3 = function(player)
	--print("DT Logger: running DTDrugsAllergy.allergyMoodleLv3 function");
	if player:getModData().DTDrugsAllergy > 60 then
		if ZombRand(3) == 0 then
			local randNumb = ZombRand(3)
			if randNumb == 0 then
				--print("dtallergyleftleg")
				player:playEmote("dtallergyleftleg");
				DTapplyPain(player, 0, "UpperLeg_L", ZombRand(15));
				DTapplyPain(player, 0, "LowerLeg_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergypullatcollar")
				player:playEmote("dtallergypullatcollar");
				DTapplyPain(player, 0, "Neck", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightleg")
				player:playEmote("dtallergyrightleg");
				DTapplyPain(player, 0, "UpperLeg_R", ZombRand(15));
				DTapplyPain(player, 0, "LowerLeg_R", ZombRand(15));
			end
			DTdecreaseEndurance(player, ZombRand(15), 0.07);
			DTincreasePoison(player, 0, 3);
		end
	end
end

DTDrugsAllergy.allergyMoodleLv4 = function(player)
	--print("DT Logger: running DTDrugsAllergy.allergyMoodleLv4 function");
	if player:getModData().DTDrugsAllergy > 80 then
		DTincreaseFatigue(player, ZombRand(10), 0.07);
		DTdecreaseEndurance(player, ZombRand(10), 0.07);
		DTdecreaseBodyPartHealth(player, 0, 2);
		if ZombRand(3) == 0 then
			player:playEmote("dtfeelfeint");
			DTapplyPain(player, 0, "Head", ZombRand(15));
		end
	end
end
