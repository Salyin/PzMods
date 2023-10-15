function SFPPRecipesPatch()
	local recipes = getScriptManager():getAllRecipes()
	
	for i=0,recipes:size()-1 do
		local recipe = recipes:get(i)

		if not getActivatedMods():contains("HuntingMod") then
			if recipe:getName() == "Butcher Small Animal" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher Small Animal"):findSource("Base.DeadMouse"):setCount(69)
				getScriptManager():getRecipe("Butcher Small Animal"):findSource("Base.DeadSquirrel"):setCount(69)
				getScriptManager():getRecipe("Butcher Small Animal"):findSource("Base.DeadRat"):setCount(69)
			end
			if recipe:getName() == "Butcher Rabbit" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher Rabbit"):findSource("Base.DeadRabbit"):setCount(69)
			end
			if recipe:getName() == "Butcher Bird" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher Bird"):findSource("Base.DeadBird"):setCount(69)
			end
			if recipe:getName() == "Butcher Deer" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Butcher Elk" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Butcher Wild Pig" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Butcher Bear" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Small Game with Throwing Spears" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Deer with Throwing Spears" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Wild Pigs with Throwing Spears" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Birds with Shotgun" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Bear with Shotgun" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Small Game with Varmint Rifle" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Birds with Varmint Rifle" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Deer with Rifle" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Wild Pigs with Rifle" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Hunt Bear with Rifle" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Track Game" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Track Large Game" then
				recipe:setIsHidden(true)
			end
			if recipe:getName() == "Throw Away This Shit" then
				recipe:setIsHidden(true)
			end
		end

		if getActivatedMods():contains("HuntingMod") then
			if recipe:getName() == "Butcher a Small Animal" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher a Small Animal"):findSource("Base.DeadMouse"):setCount(69)
				getScriptManager():getRecipe("Butcher a Small Animal"):findSource("Base.DeadSquirrel"):setCount(69)
				getScriptManager():getRecipe("Butcher a Small Animal"):findSource("Base.DeadRat"):setCount(69)
			end
			if recipe:getName() == "Butcher a Rabbit" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher a Rabbit"):findSource("Base.DeadRabbit"):setCount(69)
			end
			if recipe:getName() == "Butcher a Bird" then
				recipe:setIsHidden(true)
				getScriptManager():getRecipe("Butcher a Bird"):findSource("Base.DeadBird"):setCount(69)
			end
		end		
	end
end

SFPPRecipesPatch()