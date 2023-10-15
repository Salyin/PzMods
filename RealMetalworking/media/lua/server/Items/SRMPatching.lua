function SRMRecipesPatch()
	local recipes = getScriptManager():getAllRecipes()
	
	for i=0,recipes:size()-1 do
		local recipe = recipes:get(i)

		if not getActivatedMods():contains("EssentialCrafting") then
			if recipe:getName() == "Forge Weapon Parts" then
				recipe:setIsHidden(true)
			end
		end
	end
end

SRMRecipesPatch()