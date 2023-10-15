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

require('NPCs/MainCreationMethods');

--
local musicStyles = {"disco","beach","classical","country","holiday","jazz","metal","muzak","pop","rap","rbsoul","reggae","rock","salsa","world"};
local musicStylesDislike = {"discono","beachno","classicalno","countryno","holidayno","jazzno","metalno","muzakno","popno","rapno","rbsoulno","reggaeno","rockno","salsano","worldno"};
local idxmusicStyles
local randomMusicStyle
-- we use this to initiate the tracker and get the last value
local function initPlayerTracker(_player)
	local player = _player

	--PlayTracker
	player:getModData().PlayTracker = {}
	--HaloCooldownCounter
	player:getModData().HaloCooldownCounter = {}
	--PlayerVoice
	player:getModData().PlayerVoice = {}
	--PlayerMusicTaste
	player:getModData().PlayerMusicLike = {}
	player:getModData().PlayerMusicDislike = {}
end

-- we use this to enable any trackers that might not exist
local function checkPlayerTracker()
	local player = getPlayer();
	
	--MusicMoodle and DiscoBall
	if player:hasModData()
		and player:getModData().ListenedToMusic ~= nil
		and player:getModData().ActiveDiscoBallNearby ~= nil
		and player:getModData().IsListeningToJukebox ~= nil
		and player:getModData().VanillaMusicResume ~= nil
	then
		player:getModData().ListenedToMusic = -1
		player:getModData().ActiveDiscoBallNearby = false
		player:getModData().IsListeningToJukebox = false
		player:getModData().VanillaMusicResume = 0
	else
		player:getModData().ListenedToMusic = -1
		player:getModData().ActiveDiscoBallNearby = false
		player:getModData().IsListeningToJukebox = false
		player:getModData().VanillaMusicResume = 0
	end
	--Dancing
	if player:hasModData()
		and player:getModData().IsDancingInit ~= nil
	then
		player:getModData().IsDancingInit = false
	else
		player:getModData().IsDancingInit = false
	end
	if player:hasModData()
		and player:getModData().IsDancingFull ~= nil
		and player:getModData().IsDancingFullPartner ~= nil
		and player:getModData().WantsToDance ~= nil
		and player:getModData().OtherPlayersAroundDancing ~= nil
	then
		player:getModData().IsDancingFull = false
		player:getModData().IsDancingFullPartner = false
		player:getModData().WantsToDance = false
		player:getModData().OtherPlayersAroundDancing = 0
	else
		player:getModData().IsDancingFull = false
		player:getModData().IsDancingFullPartner = false
		player:getModData().WantsToDance = false
		player:getModData().OtherPlayersAroundDancing = 0
	end
	--PlayTracker
	if player:hasModData()
		and player:getModData().PlayTracker ~= nil
	then
	else
		player:getModData().PlayTracker = {}
	end
	--HaloCooldownCounter
	if player:hasModData()
		and player:getModData().HaloCooldownCounter ~= nil
		and tonumber(player:getModData().HaloCooldownCounter) ~= nil
	then
	else
		player:getModData().HaloCooldownCounter = 0
	end
	--TDcomplained
	if player:hasModData()
		and player:getModData().TDcomplained ~= nil
	then
	else
		player:getModData().TDcomplained = false
	end
	--GaveApplause
	if player:hasModData()
		and player:getModData().GaveApplause ~= nil
	then
	else
		player:getModData().GaveApplause = false
	end
	--PlayerVoice
	if player:hasModData()
		and player:getModData().PlayerVoice ~= nil
		and tonumber(player:getModData().PlayerVoice) ~= nil
	then
	else
		player:getModData().PlayerVoice = ZombRand(5);
	end
	--PlayerMusicTaste
	if player:hasModData()
		and player:getModData().PlayerMusicLike ~= nil
		and tostring(player:getModData().PlayerMusicLike) ~= nil
	then
		if not player:HasTrait("disco") and not player:HasTrait("beach") and not player:HasTrait("classical") and not player:HasTrait("country") and not player:HasTrait("holiday") and not player:HasTrait("jazz") and not
		player:HasTrait("metal") and not player:HasTrait("muzak") and not player:HasTrait("pop") and not player:HasTrait("rap") and not player:HasTrait("rbsoul") and not player:HasTrait("rock") and not
		player:HasTrait("reggae") and not player:HasTrait("salsa") and not player:HasTrait("world") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStyles) + 1
			randomMusicStyle = musicStyles[idxmusicStyles]
			player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStyles) + 1
		randomMusicStyle = musicStyles[idxmusicStyles]
		player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
		if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
			player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
			HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
		end
	end
	if player:hasModData()
		and player:getModData().PlayerMusicDislike ~= nil
		and tostring(player:getModData().PlayerMusicDislike) ~= nil
	then
		if not player:HasTrait("discono") and not player:HasTrait("beachno") and not player:HasTrait("classicalno") and not player:HasTrait("countryno") and not player:HasTrait("holidayno") and not player:HasTrait("jazzno") and not
		player:HasTrait("metalno") and not player:HasTrait("muzakno") and not player:HasTrait("popno") and not player:HasTrait("rapno") and not player:HasTrait("rbsoulno") and not player:HasTrait("rockno") and not
		player:HasTrait("reggaeno") and not player:HasTrait("salsano") and not player:HasTrait("worldno") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStylesDislike) + 1
			randomMusicStyle = musicStylesDislike[idxmusicStyles]
			local MusicStyleCheck = musicStyles[idxmusicStyles]
			if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
				player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
				if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
					player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
				end
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStylesDislike) + 1
		randomMusicStyle = musicStylesDislike[idxmusicStyles]
		local MusicStyleCheck = musicStyles[idxmusicStyles]
		if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
		player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
			end
		end
	end
	--PlayingInstrument
	if player:hasModData()
		and player:getModData().PlayingInstrument ~= nil
	then
		player:getModData().PlayingInstrument = false
	else
		player:getModData().PlayingInstrument = false
	end
	--IsMeditating
	if player:hasModData()
		and player:getModData().IsMeditating ~= nil
		and player:getModData().IsMeditationDisturbed ~= nil
	then
		player:getModData().IsMeditating = false
		player:getModData().IsMeditationDisturbed = false
	else
		player:getModData().IsMeditating = false
		player:getModData().IsMeditationDisturbed = false
	end
	
	--DJBooth

	if player:hasModData()
		and player:getModData().DJBoothCustomLoopPlaying ~= nil
		and player:getModData().DJBoothCustomLoop ~= nil
		and player:getModData().DJBoothCustomLoopKeyPressed ~= nil
		and player:getModData().DJBoothCustomLoopActive ~= nil
		and player:getModData().IsListeningToDJ ~= nil
	then
		player:getModData().DJBoothCustomLoopPlaying = false
		player:getModData().DJBoothCustomLoop = false
		player:getModData().DJBoothCustomLoopKeyPressed = 0
		player:getModData().DJBoothCustomLoopActive = 0
		player:getModData().IsListeningToDJ = false
	else
		player:getModData().DJBoothCustomLoopPlaying = false
		player:getModData().DJBoothCustomLoop = false
		player:getModData().DJBoothCustomLoopKeyPressed = 0
		player:getModData().DJBoothCustomLoopActive = 0
		player:getModData().IsListeningToDJ = false
	end

	-- REGULAR BUTTONS
	if player:hasModData()
		and player:getModData().DJKEYLEFTRIGHT ~= nil
		and player:getModData().DJKEYUP ~= nil
		and player:getModData().DJKEYDOWN ~= nil
		and player:getModData().DJKEY ~= nil
	then
		player:getModData().DJKEYLEFTRIGHT = false
		player:getModData().DJKEYUP = false
		player:getModData().DJKEYDOWN = false
		player:getModData().DJKEY = 0
	else
		player:getModData().DJKEYLEFTRIGHT = false
		player:getModData().DJKEYUP = false
		player:getModData().DJKEYDOWN = false
		player:getModData().DJKEY = 0
	end
	
	--SWITCHES
	if player:hasModData()
		and player:getModData().DJBoothSwitchAPressed ~= nil
	then
		player:getModData().DJBoothSwitchAPressed = false
	else
		player:getModData().DJBoothSwitchAPressed = false
	end
	if player:hasModData()
		and player:getModData().DJBoothSwitchBPressed ~= nil
	then
		player:getModData().DJBoothSwitchBPressed = false
	else
		player:getModData().DJBoothSwitchBPressed = false
	end
	if player:hasModData()
		and player:getModData().DJBoothSwitchCPressed ~= nil
	then
		player:getModData().DJBoothSwitchCPressed = false
	else
		player:getModData().DJBoothSwitchCPressed = false
	end
	if player:hasModData()
		and player:getModData().DJBoothSwitchDPressed ~= nil
	then
		player:getModData().DJBoothSwitchDPressed = false
	else
		player:getModData().DJBoothSwitchDPressed = false
	end
	if player:hasModData()
		and player:getModData().DJBoothSwitchBAPressed ~= nil
	then
		player:getModData().DJBoothSwitchBAPressed = false
	else
		player:getModData().DJBoothSwitchBAPressed = false
	end
	--VYNIL
	if player:hasModData()
		and player:getModData().VynilAScratched ~= nil
		and player:getModData().VynilAScratchedTimes ~= nil
		and player:getModData().VynilBScratched ~= nil
		and player:getModData().VynilBScratchedTimes ~= nil
	then
		player:getModData().VynilAScratched = false
		player:getModData().VynilAScratchedTimes = 0
		player:getModData().VynilBScratched = false
		player:getModData().VynilBScratchedTimes = 0
	else
		player:getModData().VynilAScratched = false
		player:getModData().VynilAScratchedTimes = 0
		player:getModData().VynilBScratched = false
		player:getModData().VynilBScratchedTimes = 0
	end
	--RGB
	if player:hasModData()
		and player:getModData().DJBoothBigButtonRGB ~= nil
	then
		player:getModData().DJBoothBigButtonRGB = 0
	else
		player:getModData().DJBoothBigButtonRGB = 0
	end
	--Small Buttons
	if player:hasModData()
		and player:getModData().DJBoothSmallButtonAPressed ~= nil
		and player:getModData().DJBoothSmallButtonBPressed ~= nil
		and player:getModData().DJBoothSmallButtonCPressed ~= nil
		and player:getModData().DJBoothSmallButtonDPressed ~= nil
		and player:getModData().DJBoothSmallButtonEPressed ~= nil
		and player:getModData().DJBoothSmallButtonFPressed ~= nil
		and player:getModData().DJBoothSmallButtonGPressed ~= nil
		and player:getModData().DJBoothSmallButtonHPressed ~= nil
		and player:getModData().DJBoothSmallButtonIPressed ~= nil
		and player:getModData().DJBoothSmallButtonJPressed ~= nil
		and player:getModData().DJBoothSmallButtonKPressed ~= nil
		and player:getModData().DJBoothSmallButtonLPressed ~= nil
		and player:getModData().DJBoothSmallButtonMPressed ~= nil
		and player:getModData().DJBoothSmallButtonNPressed ~= nil
		and player:getModData().DJBoothSmallButtonOPressed ~= nil
		and player:getModData().DJBoothSmallButtonPPressed ~= nil
	then
		player:getModData().DJBoothSmallButtonAPressed = false
		player:getModData().DJBoothSmallButtonBPressed = false
		player:getModData().DJBoothSmallButtonCPressed = false
		player:getModData().DJBoothSmallButtonDPressed = false
		player:getModData().DJBoothSmallButtonEPressed = false
		player:getModData().DJBoothSmallButtonFPressed = false
		player:getModData().DJBoothSmallButtonGPressed = false
		player:getModData().DJBoothSmallButtonHPressed = false
		player:getModData().DJBoothSmallButtonIPressed = false
		player:getModData().DJBoothSmallButtonJPressed = false
		player:getModData().DJBoothSmallButtonKPressed = false
		player:getModData().DJBoothSmallButtonLPressed = false
		player:getModData().DJBoothSmallButtonMPressed = false
		player:getModData().DJBoothSmallButtonNPressed = false
		player:getModData().DJBoothSmallButtonOPressed = false
		player:getModData().DJBoothSmallButtonPPressed = false
	else
		player:getModData().DJBoothSmallButtonAPressed = false
		player:getModData().DJBoothSmallButtonBPressed = false
		player:getModData().DJBoothSmallButtonCPressed = false
		player:getModData().DJBoothSmallButtonDPressed = false
		player:getModData().DJBoothSmallButtonEPressed = false
		player:getModData().DJBoothSmallButtonFPressed = false
		player:getModData().DJBoothSmallButtonGPressed = false
		player:getModData().DJBoothSmallButtonHPressed = false
		player:getModData().DJBoothSmallButtonIPressed = false
		player:getModData().DJBoothSmallButtonJPressed = false
		player:getModData().DJBoothSmallButtonKPressed = false
		player:getModData().DJBoothSmallButtonLPressed = false
		player:getModData().DJBoothSmallButtonMPressed = false
		player:getModData().DJBoothSmallButtonNPressed = false
		player:getModData().DJBoothSmallButtonOPressed = false
		player:getModData().DJBoothSmallButtonPPressed = false
	end
	
	
	--Big Buttons
	if player:hasModData()
		and player:getModData().DJBoothBigButtonAPressed ~= nil
		and player:getModData().DJBoothBigButtonAPressedCount ~= nil
		and player:getModData().DJBoothBigButtonBPressed ~= nil
		and player:getModData().DJBoothBigButtonCPressed ~= nil
		and player:getModData().DJBoothBigButtonDPressed ~= nil
		and player:getModData().DJBoothBigButtonEPressed ~= nil
		and player:getModData().DJBoothBigButtonFPressed ~= nil
		and player:getModData().DJBoothBigButtonGPressed ~= nil
		and player:getModData().DJBoothBigButtonHPressed ~= nil
		and player:getModData().DJBoothBigButton1Pressed ~= nil
		and player:getModData().DJBoothBigButton2Pressed ~= nil
		and player:getModData().DJBoothBigButton3Pressed ~= nil
		and player:getModData().DJBoothBigButton4Pressed ~= nil
		and player:getModData().DJBoothBigButton5Pressed ~= nil
		and player:getModData().DJBoothBigButton6Pressed ~= nil
		and player:getModData().DJBoothBigButton7Pressed ~= nil
		and player:getModData().DJBoothBigButton8Pressed ~= nil
	then
		player:getModData().DJBoothBigButtonAPressed = false
		player:getModData().DJBoothBigButtonAPressedCount = 0
		player:getModData().DJBoothBigButtonBPressed = false
		player:getModData().DJBoothBigButtonBPressedCount = 0
		player:getModData().DJBoothBigButtonCPressed = false
		player:getModData().DJBoothBigButtonCPressedCount = 0
		player:getModData().DJBoothBigButtonDPressed = false
		player:getModData().DJBoothBigButtonDPressedCount = 0
		player:getModData().DJBoothBigButtonEPressed = false
		player:getModData().DJBoothBigButtonEPressedCount = 0
		player:getModData().DJBoothBigButtonFPressed = false
		player:getModData().DJBoothBigButtonFPressedCount = 0
		player:getModData().DJBoothBigButtonGPressed = false
		player:getModData().DJBoothBigButtonGPressedCount = 0
		player:getModData().DJBoothBigButtonHPressed = false
		player:getModData().DJBoothBigButtonHPressedCount = 0
		player:getModData().DJBoothBigButton1Pressed = false
		player:getModData().DJBoothBigButton1PressedCount = 0
		player:getModData().DJBoothBigButton2Pressed = false
		player:getModData().DJBoothBigButton2PressedCount = 0
		player:getModData().DJBoothBigButton3Pressed = false
		player:getModData().DJBoothBigButton3PressedCount = 0
		player:getModData().DJBoothBigButton4Pressed = false
		player:getModData().DJBoothBigButton4PressedCount = 0
		player:getModData().DJBoothBigButton5Pressed = false
		player:getModData().DJBoothBigButton5PressedCount = 0
		player:getModData().DJBoothBigButton6Pressed = false
		player:getModData().DJBoothBigButton6PressedCount = 0
		player:getModData().DJBoothBigButton7Pressed = false
		player:getModData().DJBoothBigButton7PressedCount = 0
		player:getModData().DJBoothBigButton8Pressed = false
		player:getModData().DJBoothBigButton8PressedCount = 0
	else
		player:getModData().DJBoothBigButtonAPressed = false
		player:getModData().DJBoothBigButtonAPressedCount = 0
		player:getModData().DJBoothBigButtonBPressed = false
		player:getModData().DJBoothBigButtonBPressedCount = 0
		player:getModData().DJBoothBigButtonCPressed = false
		player:getModData().DJBoothBigButtonCPressedCount = 0
		player:getModData().DJBoothBigButtonDPressed = false
		player:getModData().DJBoothBigButtonDPressedCount = 0
		player:getModData().DJBoothBigButtonEPressed = false
		player:getModData().DJBoothBigButtonEPressedCount = 0
		player:getModData().DJBoothBigButtonFPressed = false
		player:getModData().DJBoothBigButtonFPressedCount = 0
		player:getModData().DJBoothBigButtonGPressed = false
		player:getModData().DJBoothBigButtonGPressedCount = 0
		player:getModData().DJBoothBigButtonHPressed = false
		player:getModData().DJBoothBigButtonHPressedCount = 0
		player:getModData().DJBoothBigButton1Pressed = false
		player:getModData().DJBoothBigButton1PressedCount = 0
		player:getModData().DJBoothBigButton2Pressed = false
		player:getModData().DJBoothBigButton2PressedCount = 0
		player:getModData().DJBoothBigButton3Pressed = false
		player:getModData().DJBoothBigButton3PressedCount = 0
		player:getModData().DJBoothBigButton4Pressed = false
		player:getModData().DJBoothBigButton4PressedCount = 0
		player:getModData().DJBoothBigButton5Pressed = false
		player:getModData().DJBoothBigButton5PressedCount = 0
		player:getModData().DJBoothBigButton6Pressed = false
		player:getModData().DJBoothBigButton6PressedCount = 0
		player:getModData().DJBoothBigButton7Pressed = false
		player:getModData().DJBoothBigButton7PressedCount = 0
		player:getModData().DJBoothBigButton8Pressed = false
		player:getModData().DJBoothBigButton8PressedCount = 0
	end

end

-- we use this to enable any trackers when a player is created
local function checkNewPlayerTracker()
	local player = getPlayer();

	--Dancing
	if player:hasModData()
		and player:getModData().IsDancingInit ~= nil
	then
		player:getModData().IsDancingInit = false
	else
		player:getModData().IsDancingInit = false
	end
	if player:hasModData()
		and player:getModData().IsDancingFull ~= nil
	then
		player:getModData().IsDancingFull = false
	else
		player:getModData().IsDancingFull = false
	end
	--PlayTracker
	if player:hasModData()
		and player:getModData().PlayTracker ~= nil
	then
	else
		player:getModData().PlayTracker = {}
	end
	--HaloCooldownCounter
	if player:hasModData()
		and player:getModData().HaloCooldownCounter ~= nil
		and tonumber(player:getModData().HaloCooldownCounter) ~= nil
	then
	else
		player:getModData().HaloCooldownCounter = 0
	end
	--TDcomplained
	if player:hasModData()
		and player:getModData().TDcomplained ~= nil
	then
	else
		player:getModData().TDcomplained = false
	end
	--GaveApplause
	if player:hasModData()
		and player:getModData().GaveApplause ~= nil
	then
	else
		player:getModData().GaveApplause = false
	end
	--PlayerVoice
	if player:hasModData()
		and player:getModData().PlayerVoice ~= nil
		and tonumber(player:getModData().PlayerVoice) ~= nil
	then
	else
		player:getModData().PlayerVoice = ZombRand(5);
	end
	--PlayerMusicTaste
	if player:hasModData()
		and player:getModData().PlayerMusicLike ~= nil
		and tostring(player:getModData().PlayerMusicLike) ~= nil
	then
		if not player:HasTrait("disco") and not player:HasTrait("beach") and not player:HasTrait("classical") and not player:HasTrait("country") and not player:HasTrait("holiday") and not player:HasTrait("jazz") and not
		player:HasTrait("metal") and not player:HasTrait("muzak") and not player:HasTrait("pop") and not player:HasTrait("rap") and not player:HasTrait("rbsoul") and not player:HasTrait("rock") and not
		player:HasTrait("reggae") and not player:HasTrait("salsa") and not player:HasTrait("world") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStyles) + 1
			randomMusicStyle = musicStyles[idxmusicStyles]
			player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStyles) + 1
		randomMusicStyle = musicStyles[idxmusicStyles]
		player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
		if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
			player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
			HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
		end
	end
	if player:hasModData()
		and player:getModData().PlayerMusicDislike ~= nil
		and tostring(player:getModData().PlayerMusicDislike) ~= nil
	then
		if not player:HasTrait("discono") and not player:HasTrait("beachno") and not player:HasTrait("classicalno") and not player:HasTrait("countryno") and not player:HasTrait("holidayno") and not player:HasTrait("jazzno") and not
		player:HasTrait("metalno") and not player:HasTrait("muzakno") and not player:HasTrait("popno") and not player:HasTrait("rapno") and not player:HasTrait("rbsoulno") and not player:HasTrait("rockno") and not
		player:HasTrait("reggaeno") and not player:HasTrait("salsano") and not player:HasTrait("worldno") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStylesDislike) + 1
			randomMusicStyle = musicStylesDislike[idxmusicStyles]
			local MusicStyleCheck = musicStyles[idxmusicStyles]
			if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
				player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
				if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
					player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
				end
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStylesDislike) + 1
		randomMusicStyle = musicStylesDislike[idxmusicStyles]
		local MusicStyleCheck = musicStyles[idxmusicStyles]
		if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
		player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
			end
		end
	end
	--PlayingInstrument
	if player:hasModData()
		and player:getModData().PlayingInstrument ~= nil
	then
	else
		player:getModData().PlayingInstrument = false
	end
	--IsMeditating
	if player:hasModData()
		and player:getModData().IsMeditating ~= nil
	then
	else
		player:getModData().IsMeditating = false
	end
end

-- we use this to refresh each tracker at a specific time
--By hour
local function updatePlayerTrackerByHour()
	local player = getPlayer()
	local playerData = player:getModData()

	--TDcomplained
	--we reset each hour so it can play again if it was played before
	if player:hasModData()
		and player:getModData().TDcomplained ~= nil
	then

	if playerData.TDcomplained == true then
		playerData.TDcomplained = false
	end
	else
		player:getModData().TDcomplained = false
	end
	--PlayTracker
	-- we add this loop and update at each hour to reset the contents stored in PlayTracker if it's more than 12 hours old, adding 1 hour if not
	if player:hasModData()
		and player:getModData().PlayTracker ~= nil then
	local n = #playerData.PlayTracker

	for i = n,1,-1 do
		if playerData.PlayTracker[i].hoursSince > 12 then
			table.remove(playerData.PlayTracker,i)
		else
			playerData.PlayTracker[i].hoursSince = playerData.PlayTracker[i].hoursSince + 1
		end
	end
	else
			player:getModData().PlayTracker = {}
	end
end

--By ten minutes
local function updatePlayerTrackerByTenMinutes()
	local player = getPlayer()
	local playerData = player:getModData()

	--GaveApplause
	--we reset each ten minutes so it can play again if it was played before
	if player:hasModData()
		and player:getModData().GaveApplause ~= nil
	then

	if playerData.GaveApplause == true then
		playerData.GaveApplause = false
	end
	else
		player:getModData().GaveApplause = false
	end
end

--By minute
local function updatePlayerTrackerByMinute()
	local player = getPlayer()
	local playerData = player:getModData()

	--HaloCooldownCounter
	-- we add this loop and update at each minute to reset the contents stored in HaloCooldownCounter if it's more than 5 minutes, adding 1 if not
	if player:hasModData()
		and player:getModData().HaloCooldownCounter ~= nil
		and tonumber(player:getModData().HaloCooldownCounter) ~= nil
	then
		if playerData.HaloCooldownCounter > 5 then
			playerData.HaloCooldownCounter = 0
		else
			playerData.HaloCooldownCounter = playerData.HaloCooldownCounter + 1
		end
	else
		player:getModData().HaloCooldownCounter = 0
	end
	--check if player has voice, needed in case something borks or player dies
	if player:hasModData()
		and player:getModData().PlayerVoice ~= nil
		and tonumber(player:getModData().PlayerVoice) ~= nil
	then
	else
		player:getModData().PlayerVoice = ZombRand(5);
	end
	--check if player has music tastes, needed in case something borks or player dies
	if player:hasModData()
		and player:getModData().PlayerMusicLike ~= nil
		and tostring(player:getModData().PlayerMusicLike) ~= nil
	then
		if not player:HasTrait("disco") and not player:HasTrait("beach") and not player:HasTrait("classical") and not player:HasTrait("country") and not player:HasTrait("holiday") and not player:HasTrait("jazz") and not
		player:HasTrait("metal") and not player:HasTrait("muzak") and not player:HasTrait("pop") and not player:HasTrait("rap") and not player:HasTrait("rbsoul") and not player:HasTrait("rock") and not
		player:HasTrait("reggae") and not player:HasTrait("salsa") and not player:HasTrait("world") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStyles) + 1
			randomMusicStyle = musicStyles[idxmusicStyles]
			player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStyles) + 1
		randomMusicStyle = musicStyles[idxmusicStyles]
		player:getModData().PlayerMusicLike = tostring(randomMusicStyle)
		if not player:HasTrait(tostring(player:getModData().PlayerMusicLike)) then
			player:getTraits():add(tostring(player:getModData().PlayerMusicLike));
			HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicLike)), true, HaloTextHelper.getColorGreen());
		end
	end
	if player:hasModData()
		and player:getModData().PlayerMusicDislike ~= nil
		and tostring(player:getModData().PlayerMusicDislike) ~= nil
	then
		if not player:HasTrait("discono") and not player:HasTrait("beachno") and not player:HasTrait("classicalno") and not player:HasTrait("countryno") and not player:HasTrait("holidayno") and not player:HasTrait("jazzno") and not
		player:HasTrait("metalno") and not player:HasTrait("muzakno") and not player:HasTrait("popno") and not player:HasTrait("rapno") and not player:HasTrait("rbsoulno") and not player:HasTrait("rockno") and not
		player:HasTrait("reggaeno") and not player:HasTrait("salsano") and not player:HasTrait("worldno") and not player:HasTrait("ToneDeaf") and not player:HasTrait("Deaf") then
			idxmusicStyles = ZombRand(#musicStylesDislike) + 1
			randomMusicStyle = musicStylesDislike[idxmusicStyles]
			local MusicStyleCheck = musicStyles[idxmusicStyles]
			if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
				player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
				if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
					player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
				end
			end
		end
	elseif player:HasTrait("Deaf") then
	
	elseif player:HasTrait("ToneDeaf") then
	
	else
		idxmusicStyles = ZombRand(#musicStylesDislike) + 1
		randomMusicStyle = musicStylesDislike[idxmusicStyles]
		local MusicStyleCheck = musicStyles[idxmusicStyles]
		if (tostring(player:getModData().PlayerMusicLike) ~= tostring(MusicStyleCheck)) then
		player:getModData().PlayerMusicDislike = tostring(randomMusicStyle)
			if not player:HasTrait(tostring(player:getModData().PlayerMusicDislike)) then
				player:getTraits():add(tostring(player:getModData().PlayerMusicDislike));
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_" .. tostring(player:getModData().PlayerMusicDislike)), true, HaloTextHelper.getColorRed());
			end
		end
	end
	
	--MeditationMindfulness
	-- we add this to check if the player is in the mindfulness state, then apply effects and countdown to end the state
	if player:hasModData()
		and player:getModData().IsMeditationMindfulness ~= nil
		and player:getModData().IsMeditationMindfulness == "enabled"
		and player:getModData().MeditationMindfulness ~= nil
		and tonumber(player:getModData().MeditationMindfulness) ~= nil
	then
		local MindfulDuration = 5
		local MindfulDurationMultiplier = 1
		local sandboxMeditationMindfulDuration = SandboxVars.Meditation.MindfulnessDuration or 2
		if sandboxMeditationMindfulDuration ~= nil then
			if sandboxMeditationMindfulDuration == 1 then
				MindfulDurationMultiplier = 0.5
			elseif sandboxMeditationMindfulDuration == 2 then
				MindfulDurationMultiplier = 1
			elseif sandboxMeditationMindfulDuration == 3 then
				MindfulDurationMultiplier = 2
			end
		end

		local EffectMultiplier = 1
		local sandboxMeditationEffectMultiplier = SandboxVars.Meditation.EffectMultiplier or 2
		if sandboxMeditationEffectMultiplier ~= nil then
			if sandboxMeditationEffectMultiplier == 1 then
				EffectMultiplier = 0.5
			elseif sandboxMeditationEffectMultiplier == 2 then
				EffectMultiplier = 1
			elseif sandboxMeditationEffectMultiplier == 3 then
				EffectMultiplier = 2
			end
		end

		--variables
		local HealPercentage = (SandboxVars.Meditation.HealFactor or 2)
		local MeditationStrengthFactor = 1
		local HungerRate = 0.002
		local PainRate = 5
		local PanicRate = 5
		
		--stats
		local initialStress = player:getStats():getStress()
		local initialPain = player:getStats():getPain()
		local initialHunger = player:getStats():getHunger()
		local initialPanic = player:getStats():getPanic()
		
		if player:getPerkLevel(Perks.Meditation) == 10 and player:HasTrait("Disciplined") then
			MindfulDuration = 260 * MindfulDurationMultiplier
			HealPercentage = (SandboxVars.Meditation.HealFactor or 2) * 6
			MeditationStrengthFactor = 3.5 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 10 then
			MindfulDuration = 180 * MindfulDurationMultiplier
			HealPercentage = (SandboxVars.Meditation.HealFactor or 2) * 4
			MeditationStrengthFactor = 3 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 9 and player:HasTrait("Disciplined") then
			MindfulDuration = 180 * MindfulDurationMultiplier
			MeditationStrengthFactor = 3.2 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 9 then
			MindfulDuration = 120 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2.8 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 8 and player:HasTrait("Disciplined") then
			MindfulDuration = 120 * MindfulDurationMultiplier
			MeditationStrengthFactor = 3 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 8 then
			MindfulDuration = 90 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2.4 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 7 and player:HasTrait("Disciplined") then
			MindfulDuration = 90 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2.6 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 7 then
			MindfulDuration = 60 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 6 and player:HasTrait("Disciplined") then
			MindfulDuration = 60 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2.2 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 6 then
			MindfulDuration = 30 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1.8 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 5 and player:HasTrait("Disciplined") then
			MindfulDuration = 40 * MindfulDurationMultiplier
			MeditationStrengthFactor = 2 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 5 then
			MindfulDuration = 20 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1.6 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 4 and player:HasTrait("Disciplined") then
			MindfulDuration = 28 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1.8 * EffectMultiplier
		elseif player:getPerkLevel(Perks.Meditation) == 4 then
			MindfulDuration = 14 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1.4 * EffectMultiplier
		elseif player:HasTrait("Disciplined") then
			MindfulDuration = 20 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1.2 * EffectMultiplier
		else
			MindfulDuration = 10 * MindfulDurationMultiplier
			MeditationStrengthFactor = 1 * EffectMultiplier
		end

		--effects for each state, inheriting the effects from the previous levels
		if playerData.LSMoodles["MindfulState"].Value == 0.6 then
			--HEAL
			player:getBodyDamage():AddGeneralHealth(HealPercentage)
			--ADDICTION
			if player:HasTrait("Smoker") then
				player:getStats():setStressFromCigarettes(0)
				--player:setTimeSinceLastSmoke(0)
			end
		end
		if (playerData.LSMoodles["MindfulState"].Value == 0.6 or playerData.LSMoodles["MindfulState"].Value == 0.4) then
			--PAIN
			if (initialPain > 0) then
				player:getStats():setPain(initialPain - (PainRate  * MeditationStrengthFactor))
					if (player:getStats():getPain() < 0) then
						player:getStats():setPain(0)
					end
			end
			--HUNGER
			if (initialHunger > 0) then
				player:getStats():setHunger(initialHunger - (HungerRate  * MeditationStrengthFactor))
					if (player:getStats():getHunger() < 0) then
						player:getStats():setHunger(0)
					end
			end
		end

		if (playerData.LSMoodles["MindfulState"].Value == 0.6 or playerData.LSMoodles["MindfulState"].Value == 0.4 or playerData.LSMoodles["MindfulState"].Value == 0.2) then
			--STRESS
			--we keep stress reduction effect separated so it doesn't apply during the normal meditation activity
			if (playerData.MeditationMindfulness > 0) and (initialStress > 0) then
				if player:HasTrait("Smoker") then
					player:getStats():setStressFromCigarettes(0)
				end
				player:getStats():setStress(initialStress - (0.05  * MeditationStrengthFactor))
					if (player:getStats():getStress() < 0) then
						player:getStats():setStress(0)
					end
			end
			--PANIC
			if (initialPanic > 0) then
				player:getStats():setPanic(initialPanic - (PanicRate  * MeditationStrengthFactor))
					if (player:getStats():getPanic() < 0) then
						player:getStats():setPanic(0)
					end
			end
		
		end

		if playerData.MeditationMindfulness > MindfulDuration then
		
			if playerData.LSMoodles["MindfulState"].Value == 0.6 then
			LSMoodleManager.setValue("MindfulState", 0.4)
			playerData.MeditationMindfulness = 1
			elseif playerData.LSMoodles["MindfulState"].Value == 0.4 then
			playerData.MeditationMindfulness = 1
			LSMoodleManager.setValue("MindfulState", 0.2)
			else
			playerData.MeditationMindfulness = 0
			LSMoodleManager.setValue("MindfulState", 0.0)
			player:getModData().IsMeditationMindfulness = "disabled"
			end
		elseif playerData.MeditationMindfulness > 0 then
			playerData.MeditationMindfulness = playerData.MeditationMindfulness + 1
		end
	end
	
end

Events.OnNewGame.Add(initPlayerTracker)
Events.OnCreatePlayer.Add(checkPlayerTracker)
Events.OnCreatePlayer.Add(checkNewPlayerTracker)
Events.EveryHours.Add(updatePlayerTrackerByHour)
Events.EveryTenMinutes.Add(updatePlayerTrackerByTenMinutes)
Events.EveryOneMinute.Add(updatePlayerTrackerByMinute)