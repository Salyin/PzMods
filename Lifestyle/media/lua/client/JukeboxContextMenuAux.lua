--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------
require "JukeboxContextMenu"
JukeboxMenu = JukeboxMenu or {}

JukeboxMenu.doBuildMenu = function(player, context, worldobjects)

    if getCore():getGameMode()=="LastStand" then
        return;
    end
 
    local thisPlayer = getSpecificPlayer(player)

    if thisPlayer:getVehicle() then return; end
    
	local Jukebox = nil
	local spriteName = nil
	local switch = {"JukeboxSwitch01","JukeboxSwitch02","JukeboxSwitch03"};
	local idx = ZombRand(#switch) + 1

	local objects = {}
	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						--local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
							spriteName = thisSpriteName;
						end
					end
				end
			end
		end
	end

	if not Jukebox then return end

	--ModData.request("LSDATA")
	--local JukeboxID = tostring(Jukebox:getX()) .. "," .. tostring(Jukebox:getY()) .. "," .. tostring(Jukebox:getZ()) 
	--local LSDATA = ModData.getOrCreate("LSDATA")
	--local JukeboxData = LSDATA[JukeboxID]

	--if JukeboxData == nil then
  -- The JukeboxID is not in the LSDATA table, so we need to add it.
		--JukeboxData = {}
		--JukeboxData.onOff = "off"
		--LSDATA[JukeboxID] = JukeboxData
		--if isClient() then ModData.transmit("LSDATA") end
	--end

	--if JukeboxData ~= nil then
	--if JukeboxData.onOff == nil then
    --JukeboxData.onOff = "off"
	--if isClient() then ModData.transmit("LSDATA") end
	--end
	--end

	--if JukeboxData ~= nil and JukeboxData.onOff == "on" then
	
	if not ((SandboxVars.ElecShutModifier > -1 and
	GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
	Jukebox:getSquare():haveElectricity()) then
	return
	end

    local JukeboxData = Jukebox:getModData()
    if not JukeboxData.JukeboxID then
	JukeboxData.JukeboxID = {(tostring(Jukebox:getX()) .. "," .. tostring(Jukebox:getY()) .. "," .. tostring(Jukebox:getZ()))};
	Jukebox:transmitModData();
	end
    if not JukeboxData.OnOff then 
	JukeboxData.OnOff = {"off"};
	Jukebox:transmitModData();
	end

	if JukeboxData.OnOff == "on" then

-----------------------Want to Dance Option

	if (getSpecificPlayer(player):getModData().WantsToDance ~= nil) and
	(getSpecificPlayer(player):getModData().WantsToDance == false) then
--		local PlayerWantsToDanceOption = context:addOption(getText("ContextMenu_DancingPartner_Enable_Option"), worldobjects, JukeboxMenu.onEnableDancing, getSpecificPlayer(player));
--		PlayerWantsToDanceOption.iconTexture = getTexture('media/ui/okay_icon.png')
	elseif (getSpecificPlayer(player):getModData().WantsToDance ~= nil) and
	(getSpecificPlayer(player):getModData().WantsToDance == true) then
--		local PlayerWantsToDanceOptionNo = context:addOption(getText("ContextMenu_DancingPartner_Disable_Option"), worldobjects, JukeboxMenu.onDisableDancing, getSpecificPlayer(player));
--		PlayerWantsToDanceOptionNo.iconTexture = getTexture('media/ui/okayNo_icon.png')
	else
		getSpecificPlayer(player):getModData().WantsToDance = true
	end

---------------------

-----------------------Volume Option

	contextMenu = "ContextMenu_Jukebox_Volume"
		
	local buildVolumeOption = context:addOption(getText(contextMenu));
	buildVolumeOption.iconTexture = getTexture('media/ui/moodles/MusicGood.png')
	local volumeMenu = ISContextMenu:getNew(context);
	context:addSubMenu(buildVolumeOption, volumeMenu)

	if getSpecificPlayer(player):getModData().JukeboxVolumeAll ~= nil and tonumber(getSpecificPlayer(player):getModData().JukeboxVolumeAll) ~= nil then

	else
		getSpecificPlayer(player):getModData().JukeboxVolumeAll = 1
	end

	local VolumeALLOption4 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_Increase2Option"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), 0.8);
	VolumeALLOption4.iconTexture = getTexture('media/ui/volumevhigh_icon.png')
	local VolumeALLOption3 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_IncreaseOption"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), 0.4);
	VolumeALLOption3.iconTexture = getTexture('media/ui/volumehigh_icon.png')
	local VolumeALLOption2 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_DecreaseOption"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), -0.4);
	VolumeALLOption2.iconTexture = getTexture('media/ui/volumelow_icon.png')
	local VolumeALLOption1 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_Decrease2Option"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), -0.8);
	VolumeALLOption1.iconTexture = getTexture('media/ui/volumevlow_icon.png')

	if getSpecificPlayer(player):getModData().JukeboxVolumeAll <= 0.4 then
		VolumeALLOption1.notAvailable = true;
		VolumeALLOption2.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll <= 0.8 then
		VolumeALLOption1.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll >= 3.2 then
		VolumeALLOption3.notAvailable = true;
		VolumeALLOption4.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll >= 2.8 then
		VolumeALLOption4.notAvailable = true;
	end

---------------------

	local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
	
	
		contextMenu = "ContextMenu_Play_Group_Styles"
		
		local buildOption = context:addOption(getText(contextMenu));
		buildOption.iconTexture = getTexture('media/ui/djbooth_icon.png')
		local parentMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, parentMenu)
	
---------------DISCO
	
	--local AvailableDiscoTracks = {}
	local AvailableDiscoTracks = require("JukeboxTracks/Disco")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomDiscoNumber = ZombRand(#AvailableDiscoTracks) + 1
	local randomDiscoTrack = AvailableDiscoTracks[randomDiscoNumber]
	
	local soundFile = nil;
	local soundEnd = nil;
	
	soundFile = switch[idx]

	local PlayDiscoOption = parentMenu:addOption(getText("ContextMenu_Play_Style_Disco"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomDiscoTrack.sound,
		randomDiscoTrack.length,
		randomDiscoTrack.genre);	
		PlayDiscoOption.iconTexture = getTexture('media/ui/Traits/trait_disco.png')
		
-----------RB

	local AvailableRBTracks = require("JukeboxTracks/RB")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomRBNumber = ZombRand(#AvailableRBTracks) + 1
	local randomRBTrack = AvailableRBTracks[randomRBNumber]

	local RBMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, RBMenu)

	local PlayRBOption = parentMenu:addOption(getText("ContextMenu_Play_Style_RB"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomRBTrack.sound,
		randomRBTrack.length,
		randomRBTrack.genre);	
		PlayRBOption.iconTexture = getTexture('media/ui/Traits/trait_rbsoul.png')

-----------metal

	local AvailablemetalTracks = require("JukeboxTracks/Metal")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randommetalNumber = ZombRand(#AvailablemetalTracks) + 1
	local randommetalTrack = AvailablemetalTracks[randommetalNumber]

	local metalMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, metalMenu)

	local PlayMetalOption = parentMenu:addOption(getText("ContextMenu_Play_Style_metal"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randommetalTrack.sound,
		randommetalTrack.length,
		randommetalTrack.genre);	
		PlayMetalOption.iconTexture = getTexture('media/ui/Traits/trait_metal.png')

-----------salsa

	local AvailablesalsaTracks = require("JukeboxTracks/Salsa")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomsalsaNumber = ZombRand(#AvailablesalsaTracks) + 1
	local randomsalsaTrack = AvailablesalsaTracks[randomsalsaNumber]

	local salsaMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, salsaMenu)

	local PlaySalsaOption = parentMenu:addOption(getText("ContextMenu_Play_Style_salsa"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomsalsaTrack.sound,
		randomsalsaTrack.length,
		randomsalsaTrack.genre);	
		PlaySalsaOption.iconTexture = getTexture('media/ui/Traits/trait_salsa.png')


-----------pop

	local AvailablepopTracks = require("JukeboxTracks/Pop")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randompopNumber = ZombRand(#AvailablepopTracks) + 1
	local randompopTrack = AvailablepopTracks[randompopNumber]

	local popMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, popMenu)

	local PlayPopOption = parentMenu:addOption(getText("ContextMenu_Play_Style_pop"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randompopTrack.sound,
		randompopTrack.length,
		randompopTrack.genre);	
		PlayPopOption.iconTexture = getTexture('media/ui/Traits/trait_pop.png')


-----------beach

	local AvailablebeachTracks = require("JukeboxTracks/Beach")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randombeachNumber = ZombRand(#AvailablebeachTracks) + 1
	local randombeachTrack = AvailablebeachTracks[randombeachNumber]

	local beachMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, beachMenu)

	local PlayBeachOption = parentMenu:addOption(getText("ContextMenu_Play_Style_beach"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randombeachTrack.sound,
		randombeachTrack.length,
		randombeachTrack.genre);	
		PlayBeachOption.iconTexture = getTexture('media/ui/Traits/trait_beach.png')


-----------classical

	local AvailableclassicalTracks = require("JukeboxTracks/Classical")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomclassicalNumber = ZombRand(#AvailableclassicalTracks) + 1
	local randomclassicalTrack = AvailableclassicalTracks[randomclassicalNumber]

	local classicalMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, classicalMenu)

	local PlayClassicalOption = parentMenu:addOption(getText("ContextMenu_Play_Style_classical"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomclassicalTrack.sound,
		randomclassicalTrack.length,
		randomclassicalTrack.genre);	
		PlayClassicalOption.iconTexture = getTexture('media/ui/Traits/trait_classical.png')


-----------country

	local AvailablecountryTracks = require("JukeboxTracks/Country")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomcountryNumber = ZombRand(#AvailablecountryTracks) + 1
	local randomcountryTrack = AvailablecountryTracks[randomcountryNumber]

	local countryMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, countryMenu)

	local PlayCountryOption = parentMenu:addOption(getText("ContextMenu_Play_Style_country"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomcountryTrack.sound,
		randomcountryTrack.length,
		randomcountryTrack.genre);	
		PlayCountryOption.iconTexture = getTexture('media/ui/Traits/trait_country.png')


-----------holiday

	local AvailableholidayTracks = require("JukeboxTracks/Holiday")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomholidayNumber = ZombRand(#AvailableholidayTracks) + 1
	local randomholidayTrack = AvailableholidayTracks[randomholidayNumber]

	local holidayMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, holidayMenu)

	local PlayHolidayOption = parentMenu:addOption(getText("ContextMenu_Play_Style_holiday"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomholidayTrack.sound,
		randomholidayTrack.length,
		randomholidayTrack.genre);	
		PlayHolidayOption.iconTexture = getTexture('media/ui/Traits/trait_holiday.png')


-----------jazz

	local AvailablejazzTracks = require("JukeboxTracks/Jazz")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomjazzNumber = ZombRand(#AvailablejazzTracks) + 1
	local randomjazzTrack = AvailablejazzTracks[randomjazzNumber]

	local jazzMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, jazzMenu)

	local PlayJazzOption = parentMenu:addOption(getText("ContextMenu_Play_Style_jazz"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomjazzTrack.sound,
		randomjazzTrack.length,
		randomjazzTrack.genre);	
		PlayJazzOption.iconTexture = getTexture('media/ui/Traits/trait_jazz.png')


-----------muzak

	local AvailablemuzakTracks = require("JukeboxTracks/Muzak")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randommuzakNumber = ZombRand(#AvailablemuzakTracks) + 1
	local randommuzakTrack = AvailablemuzakTracks[randommuzakNumber]

	local muzakMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, muzakMenu)

	local PlayMuzakOption = parentMenu:addOption(getText("ContextMenu_Play_Style_muzak"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randommuzakTrack.sound,
		randommuzakTrack.length,
		randommuzakTrack.genre);	
		PlayMuzakOption.iconTexture = getTexture('media/ui/Traits/trait_muzak.png')


-----------rap

	local AvailablerapTracks = require("JukeboxTracks/Rap")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomrapNumber = ZombRand(#AvailablerapTracks) + 1
	local randomrapTrack = AvailablerapTracks[randomrapNumber]

	local rapMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, rapMenu)

	local PlayRapOption = parentMenu:addOption(getText("ContextMenu_Play_Style_rap"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomrapTrack.sound,
		randomrapTrack.length,
		randomrapTrack.genre);	
		PlayRapOption.iconTexture = getTexture('media/ui/Traits/trait_rap.png')


-----------reggae

	local AvailablereggaeTracks = require("JukeboxTracks/Reggae")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomreggaeNumber = ZombRand(#AvailablereggaeTracks) + 1
	local randomreggaeTrack = AvailablereggaeTracks[randomreggaeNumber]

	local reggaeMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, reggaeMenu)

	local PlayReggaeOption = parentMenu:addOption(getText("ContextMenu_Play_Style_reggae"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomreggaeTrack.sound,
		randomreggaeTrack.length,
		randomreggaeTrack.genre);	
		PlayReggaeOption.iconTexture = getTexture('media/ui/Traits/trait_reggae.png')


-----------rock

	local AvailablerockTracks = require("JukeboxTracks/Rock")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomrockNumber = ZombRand(#AvailablerockTracks) + 1
	local randomrockTrack = AvailablerockTracks[randomrockNumber]

	local rockMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, rockMenu)

	local PlayRockOption = parentMenu:addOption(getText("ContextMenu_Play_Style_rock"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomrockTrack.sound,
		randomrockTrack.length,
		randomrockTrack.genre);	
		PlayRockOption.iconTexture = getTexture('media/ui/Traits/trait_rock.png')


-----------world

	local AvailableworldTracks = require("JukeboxTracks/World")
				
				-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
	local randomworldNumber = ZombRand(#AvailableworldTracks) + 1
	local randomworldTrack = AvailableworldTracks[randomworldNumber]

	local worldMenu = parentMenu:getNew(parentMenu);
	context:addSubMenu(parentMenu, worldMenu)

	local PlayWorldOption = parentMenu:addOption(getText("ContextMenu_Play_Style_world"),
		worldobjects,
		JukeboxMenu.onPlay,
		getSpecificPlayer(player),
		Jukebox,
		soundFile,  
		randomworldTrack.sound,
		randomworldTrack.length,
		randomworldTrack.genre);	
		PlayWorldOption.iconTexture = getTexture('media/ui/Traits/trait_world.png')
	
	end
end


Events.OnFillWorldObjectContextMenu.Add(JukeboxMenu.doBuildMenu);
