require 'Foraging/forageSystem'

Events.preAddSkillDefs.Add(function()

	local homeless = {
		name                    = "homeless",
		type                    = "occupation",
		visionBonus             = 2,
		weatherEffect           = 20,
		darknessEffect          = 10,
		specialisations         = {
			["Animals"]             = 5,
			["Berries"]             = 5,
			["Medical"]             = 5,
			["Mushrooms"]           = 5,
			["ForestRarities"]      = 5,
			["Trash"]               = 25,
			["Junk"]                = 25,
			["JunkFood"]            = 75,
			["JunkWeapons"]         = 25,
		},
	}

	forageSystem.addSkillDef(homeless, false)

end)