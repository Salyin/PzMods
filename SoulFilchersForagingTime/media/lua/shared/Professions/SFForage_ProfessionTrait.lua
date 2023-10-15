function SFForage_AddProfession()
    local scavenger = TraitFactory.addTrait("scavenger", getText("UI_trait_Scavenger"), 0, getText("UI_trait_ScavengerDesc"), true);
	
	TraitFactory.sortList();
	BaseGameCharacterDetails.SetTraitDescription(scavenger)

	local homeless = ProfessionFactory.addProfession("Homeless", getText("UI_prof_Homeless"), "profession_homeless", 2);
	homeless:addFreeTrait("scavenger");
	homeless:addXPBoost(Perks.PlantScavenging, 3);

	BaseGameCharacterDetails.SetProfessionDescription(homeless)
end

Events.OnGameBoot.Add(SFForage_AddProfession);