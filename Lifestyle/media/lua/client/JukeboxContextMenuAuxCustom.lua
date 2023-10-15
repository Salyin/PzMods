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
require "JukeboxContextMenuAux"
JukeboxMenu = JukeboxMenu or {}

JukeboxMenu.doBuildMenuCustom = function(player, context, worldobjects)

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

---------------Custom/Addons
	local PlayJukeboxCustomTracks = require("TimedActions/PlayJukeboxCustomTracks")
				
	if #PlayJukeboxCustomTracks > 0 then

		local soundFile = nil;
		local soundEnd = nil;
			
		local buildOptionCustom = context:addOption(getText("ContextMenu_Play_Group_StylesCustom"));
		buildOptionCustom.iconTexture = getTexture('media/ui/addon_icon.png')
		local parentMenuCustom = ISContextMenu:getNew(context);
		context:addSubMenu(buildOptionCustom, parentMenuCustom)

---------------discoCustom
	
		local AvailableDiscoCustomTracks = require("JukeboxTracksCustom/Disco")
			
		if #AvailableDiscoCustomTracks > 0 then

			local randomDiscoCustomNumber = ZombRand(#AvailableDiscoCustomTracks) + 1
			local randomDiscoCustomTrack = AvailableDiscoCustomTracks[randomDiscoCustomNumber]
	
			soundFile = switch[idx]

			local PlayDiscoCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_Disco"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomDiscoCustomTrack.sound,
				randomDiscoCustomTrack.length,
				randomDiscoCustomTrack.genre);	
				PlayDiscoCustomOption.iconTexture = getTexture('media/ui/Traits/trait_disco.png')
		end

---------------rbsoulCustom
	
		local AvailableRBCustomTracks = require("JukeboxTracksCustom/RB")
	
		if #AvailableRBCustomTracks > 0 then

			local randomRBCustomNumber = ZombRand(#AvailableRBCustomTracks) + 1
			local randomRBCustomTrack = AvailableRBCustomTracks[randomRBCustomNumber]
	
			soundFile = switch[idx]

			local PlayRBCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_RB"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomRBCustomTrack.sound,
				randomRBCustomTrack.length,
				randomRBCustomTrack.genre);	
				PlayRBCustomOption.iconTexture = getTexture('media/ui/Traits/trait_rbsoul.png')
		end
	
---------------metalCustom
	
		local AvailablemetalCustomTracks = require("JukeboxTracksCustom/Metal")

		if #AvailablemetalCustomTracks > 0 then

			local randommetalCustomNumber = ZombRand(#AvailablemetalCustomTracks) + 1
			local randommetalCustomTrack = AvailablemetalCustomTracks[randommetalCustomNumber]
	
			soundFile = switch[idx]

			local PlaymetalCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_metal"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randommetalCustomTrack.sound,
				randommetalCustomTrack.length,
				randommetalCustomTrack.genre);	
				PlaymetalCustomOption.iconTexture = getTexture('media/ui/Traits/trait_metal.png')
		end
		
---------------salsaCustom
	
		local AvailablesalsaCustomTracks = require("JukeboxTracksCustom/Salsa")

		if #AvailablesalsaCustomTracks > 0 then

			local randomsalsaCustomNumber = ZombRand(#AvailablesalsaCustomTracks) + 1
			local randomsalsaCustomTrack = AvailablesalsaCustomTracks[randomsalsaCustomNumber]
	
			soundFile = switch[idx]

			local PlaysalsaCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_salsa"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomsalsaCustomTrack.sound,
				randomsalsaCustomTrack.length,
				randomsalsaCustomTrack.genre);	
				PlaysalsaCustomOption.iconTexture = getTexture('media/ui/Traits/trait_salsa.png')
		end
		
---------------popCustom
	
		local AvailablepopCustomTracks = require("JukeboxTracksCustom/Pop")

		if #AvailablepopCustomTracks > 0 then

			local randompopCustomNumber = ZombRand(#AvailablepopCustomTracks) + 1
			local randompopCustomTrack = AvailablepopCustomTracks[randompopCustomNumber]
	
			soundFile = switch[idx]

			local PlaypopCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_pop"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randompopCustomTrack.sound,
				randompopCustomTrack.length,
				randompopCustomTrack.genre);	
				PlaypopCustomOption.iconTexture = getTexture('media/ui/Traits/trait_pop.png')
		end
		
---------------beachCustom
	
		local AvailablebeachCustomTracks = require("JukeboxTracksCustom/Beach")

		if #AvailablebeachCustomTracks > 0 then

			local randombeachCustomNumber = ZombRand(#AvailablebeachCustomTracks) + 1
			local randombeachCustomTrack = AvailablebeachCustomTracks[randombeachCustomNumber]
	
			soundFile = switch[idx]

			local PlaybeachCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_beach"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randombeachCustomTrack.sound,
				randombeachCustomTrack.length,
				randombeachCustomTrack.genre);	
				PlaybeachCustomOption.iconTexture = getTexture('media/ui/Traits/trait_beach.png')
		end
		
---------------classicalCustom
	
		local AvailableclassicalCustomTracks = require("JukeboxTracksCustom/Classical")

		if #AvailableclassicalCustomTracks > 0 then

			local randomclassicalCustomNumber = ZombRand(#AvailableclassicalCustomTracks) + 1
			local randomclassicalCustomTrack = AvailableclassicalCustomTracks[randomclassicalCustomNumber]
	
			soundFile = switch[idx]

			local PlayclassicalCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_classical"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomclassicalCustomTrack.sound,
				randomclassicalCustomTrack.length,
				randomclassicalCustomTrack.genre);	
				PlayclassicalCustomOption.iconTexture = getTexture('media/ui/Traits/trait_classical.png')
		end
		
---------------countryCustom
	
		local AvailablecountryCustomTracks = require("JukeboxTracksCustom/Country")

		if #AvailablecountryCustomTracks > 0 then

			local randomcountryCustomNumber = ZombRand(#AvailablecountryCustomTracks) + 1
			local randomcountryCustomTrack = AvailablecountryCustomTracks[randomcountryCustomNumber]

			soundFile = switch[idx]

			local PlaycountryCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_country"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomcountryCustomTrack.sound,
				randomcountryCustomTrack.length,
				randomcountryCustomTrack.genre);	
				PlaycountryCustomOption.iconTexture = getTexture('media/ui/Traits/trait_country.png')
		end
		
---------------holidayCustom
	
		local AvailableholidayCustomTracks = require("JukeboxTracksCustom/Holiday")

		if #AvailableholidayCustomTracks > 0 then

			local randomholidayCustomNumber = ZombRand(#AvailableholidayCustomTracks) + 1
			local randomholidayCustomTrack = AvailableholidayCustomTracks[randomholidayCustomNumber]
	
			soundFile = switch[idx]

			local PlayholidayCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_holiday"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomholidayCustomTrack.sound,
				randomholidayCustomTrack.length,
				randomholidayCustomTrack.genre);	
				PlayholidayCustomOption.iconTexture = getTexture('media/ui/Traits/trait_holiday.png')
		end
		
---------------jazzCustom
	
		local AvailablejazzCustomTracks = require("JukeboxTracksCustom/Jazz")

		if #AvailablejazzCustomTracks > 0 then

			local randomjazzCustomNumber = ZombRand(#AvailablejazzCustomTracks) + 1
			local randomjazzCustomTrack = AvailablejazzCustomTracks[randomjazzCustomNumber]
	
			soundFile = switch[idx]

			local PlayjazzCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_jazz"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomjazzCustomTrack.sound,
				randomjazzCustomTrack.length,
				randomjazzCustomTrack.genre);	
				PlayjazzCustomOption.iconTexture = getTexture('media/ui/Traits/trait_jazz.png')
		end


---------------muzakCustom
	
		local AvailablemuzakCustomTracks = require("JukeboxTracksCustom/Muzak")

		if #AvailablemuzakCustomTracks > 0 then

			local randommuzakCustomNumber = ZombRand(#AvailablemuzakCustomTracks) + 1
			local randommuzakCustomTrack = AvailablemuzakCustomTracks[randommuzakCustomNumber]

			soundFile = switch[idx]

			local PlaymuzakCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_muzak"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randommuzakCustomTrack.sound,
				randommuzakCustomTrack.length,
				randommuzakCustomTrack.genre);	
				PlaymuzakCustomOption.iconTexture = getTexture('media/ui/Traits/trait_muzak.png')
		end

---------------rapCustom
	
		local AvailablerapCustomTracks = require("JukeboxTracksCustom/Rap")

		if #AvailablerapCustomTracks > 0 then

			local randomrapCustomNumber = ZombRand(#AvailablerapCustomTracks) + 1
			local randomrapCustomTrack = AvailablerapCustomTracks[randomrapCustomNumber]

			soundFile = switch[idx]

			local PlayrapCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_rap"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomrapCustomTrack.sound,
				randomrapCustomTrack.length,
				randomrapCustomTrack.genre);	
				PlayrapCustomOption.iconTexture = getTexture('media/ui/Traits/trait_rap.png')
		end

---------------reggaeCustom
	
		local AvailablereggaeCustomTracks = require("JukeboxTracksCustom/Reggae")

		if #AvailablereggaeCustomTracks > 0 then

			local randomreggaeCustomNumber = ZombRand(#AvailablereggaeCustomTracks) + 1
			local randomreggaeCustomTrack = AvailablereggaeCustomTracks[randomreggaeCustomNumber]

			soundFile = switch[idx]

			local PlayreggaeCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_reggae"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomreggaeCustomTrack.sound,
				randomreggaeCustomTrack.length,
				randomreggaeCustomTrack.genre);	
				PlayreggaeCustomOption.iconTexture = getTexture('media/ui/Traits/trait_reggae.png')
		end

---------------rockCustom
	
		local AvailablerockCustomTracks = require("JukeboxTracksCustom/Rock")

		if #AvailablerockCustomTracks > 0 then

			local randomrockCustomNumber = ZombRand(#AvailablerockCustomTracks) + 1
			local randomrockCustomTrack = AvailablerockCustomTracks[randomrockCustomNumber]

			soundFile = switch[idx]

			local PlayrockCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_rock"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomrockCustomTrack.sound,
				randomrockCustomTrack.length,
				randomrockCustomTrack.genre);	
				PlayrockCustomOption.iconTexture = getTexture('media/ui/Traits/trait_rock.png')
		end

---------------worldCustom
	
		local AvailableworldCustomTracks = require("JukeboxTracksCustom/World")

		if #AvailableworldCustomTracks > 0 then

			local randomworldCustomNumber = ZombRand(#AvailableworldCustomTracks) + 1
			local randomworldCustomTrack = AvailableworldCustomTracks[randomworldCustomNumber]

			soundFile = switch[idx]

			local PlayworldCustomOption = parentMenuCustom:addOption(getText("ContextMenu_Play_Style_world"),
				worldobjects,
				JukeboxMenu.onPlay,
				getSpecificPlayer(player),
				Jukebox,
				soundFile,  
				randomworldCustomTrack.sound,
				randomworldCustomTrack.length,
				randomworldCustomTrack.genre);	
				PlayworldCustomOption.iconTexture = getTexture('media/ui/Traits/trait_world.png')
		end


	end--custom

	
	end
end

Events.OnFillWorldObjectContextMenu.Add(JukeboxMenu.doBuildMenuCustom);
