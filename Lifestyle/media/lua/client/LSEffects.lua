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

--local isPlayingJukeSong = nil;
--local isJukeRunning = getSoundManager():PlayWorldSound("JukeboxRunning", Jukebox:getSquare(), 3, 30, 0.5, false);


-- MAYBE DEFINE GENRES (MUSIC PLAYED) HERE THEN JUST CALL IT TO PLAYERS, EACH PLAYER WILL HEAR A DIFFERENT SONG WITHIN THAT GENRE BUT SHOULD STOP CORRECTLY
-- ONLY THING THAT MATTERS TO SYNC IS TO KNOW IF THE JUKE IS ON OR OFF AND WHAT STYLE ITS PLAYING
--PLAYSOUNDIMPL
--local iswaiting

local tickcount = 100
local tickStart = 0
--local Length
--local Time

function OnJukeboxSendSong(x, y, z, ThisJuke)

	local ThisJuke = ThisJuke or false
	local x = x
	local y = y
	local z = z
	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	if sqr == nil then return end

			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
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
						end
					end
				end
			end
			
	if ThisJuke ~= nil and ThisJuke ~= false then
		if not Jukebox then
			if ThisJuke:hasModData() then
			ThisJuke:getModData().JukeNoObject = true
			return
			end
		end
		Jukebox = ThisJuke
	end

	if not Jukebox then
	--print("failed")
	return end
	
	if Jukebox:hasModData() and
	Jukebox:getModData().JukeinRange ~= nil and
	Jukebox:getModData().JukeinRange == "out of range" then
	return
	end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "off" then
	return
	end

	local emitter = getWorld():getFreeEmitter()
	local audio
	local Jx = Jukebox:getX()
	local Jy = Jukebox:getY()
	local Jz = Jukebox:getZ()

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil then

		local JukeboxVolume = 1
		local playerData = getPlayer():getModData()
		if playerData.JukeboxVolumeAll ~= nil and tonumber(playerData.JukeboxVolumeAll) ~= nil then
			JukeboxVolume = tonumber(playerData.JukeboxVolumeAll)
		else
			playerData.JukeboxVolumeAll = 1
		end

		if emitter then
			--print("is emitter")
			emitter:setPos(Jx, Jy, Jz);--EMITTER SQUARE
			audio = emitter:playSoundImpl(Jukebox:getModData().genre, false, Jukebox);--SOUND THAT WILL BE PLAYED (SOUND NAME, IF IS WORLDSOUND, ISOOJECT)
			addSound(Jukebox, Jx, Jy, Jz, 30, 10)
			emitter:setVolume(audio, JukeboxVolume)

			Jukebox:getModData().OnPlay = "playing"
			Jukebox:getModData().OnPlayTime = getTimestamp()
		--if Jukebox:getModData().OnOff == "on" then
	
	-------------------------
	
			local anotherkindofhell
			anotherkindofhell = function()

            if Jukebox:getModData().OnOff == "off" then
				emitter:setPos(Jx, Jy, Jz)
				emitter:stopSoundByName(tostring(Jukebox:getModData().genre))
				Events.OnTick.Remove(anotherkindofhell)
				Jukebox:getModData().OnPlay = "nothing"
				local playercommand = "stop"
				local JukeReusableID = Jukebox:getModData().JukeboxID
				--isJukeSendSong(JukeReusableID, genre, Jx, Jy, Jz, playercommand)
             end

            if Jukebox:getModData().SilenceMusic == "yes" then
				emitter:setPos(Jx, Jy, Jz)
				emitter:stopSoundByName(tostring(Jukebox:getModData().genre))
				Events.OnTick.Remove(anotherkindofhell)
				Jukebox:getModData().OnPlay = "nothing"
				Jukebox:getModData().SilenceMusic = "no"
             end

			if playerData.JukeboxVolumeAll ~= JukeboxVolume then
				JukeboxVolume = tonumber(playerData.JukeboxVolumeAll)
				emitter:setVolume(audio, JukeboxVolume)
			end
			

			if Jukebox:getModData().OnPlay ~= nil and
			Jukebox:getModData().OnPlay ~= "nothing" then


				tickStart = tickStart + 1

				if tickStart % tickcount == 0 then
					tickStart = 0
					
				emitter:setPos(Jx, Jy, Jz)
				local Time = Jukebox:getModData().OnPlayTime
				local Length = Jukebox:getModData().Length
				
					if ((Length + Time) <= getTimestamp()) then
					
						local genre = Jukebox:getModData().genre
						
						if genre ~= "JukeboxAfterTurnOn" then--JUKEBOX PAUSES TO SWITCH
							
							local previoussong = tostring(genre)
							Jukebox:getModData().previousSong = previoussong
							Jukebox:getModData().genre = "JukeboxAfterTurnOn"
							local genre = "JukeboxAfterTurnOn"
							Jukebox:getModData().Length = 3
							local length = Jukebox:getModData().Length
							local style = Jukebox:getModData().Style
							--Jukebox:transmitModData()--Remove transmit if each player hear their own songs REMOVE OTHERS THAT TRANSMIT GENTE AND LENGTH AS WELL
							Events.OnTick.Remove(anotherkindofhell)
							--print("this is the last song played" .. previoussong)
							Jukebox:getModData().OnPlay = "nothing"
							OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)
						
						else--PAUSE ENDED

							local previoussong = "nothing"
							if Jukebox:getModData().previousSong ~= nil then
							previoussong = tostring(Jukebox:getModData().previousSong)
							end

							if Jukebox:getModData().Style == "disco" or Jukebox:getModData().Style == "cdisco" then--DISCO

								--print("this is the last song played before new DISCO" .. previoussong)
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "disco"
								if Jukebox:getModData().Style == "cdisco" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cdisco"
								end
								
								local AvailableDiscoTracks = require("JukeboxTracksCustom/Disco")
								if TrackGenre == "disco" then
								AvailableDiscoTracks = require("JukeboxTracks/Disco")
								end
				
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomDiscoNumber = ZombRand(#AvailableDiscoTracks) + 1
								local randomDiscoTrack = AvailableDiscoTracks[randomDiscoNumber]

								Jukebox:getModData().genre = tostring(randomDiscoTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomDiscoTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "rbsoul" or Jukebox:getModData().Style == "crbsoul" then--RBSOUL
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "rbsoul"
								if Jukebox:getModData().Style == "crbsoul" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "crbsoul"
								end
								local AvailableRBTracks = require("JukeboxTracksCustom/RB")
								if TrackGenre == "rbsoul" then
								AvailableRBTracks = require("JukeboxTracks/RB")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomRBNumber = ZombRand(#AvailableRBTracks) + 1
								local randomRBTrack = AvailableRBTracks[randomRBNumber]

								Jukebox:getModData().genre = tostring(randomRBTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomRBTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "metal" or Jukebox:getModData().Style == "cmetal" then--METAL
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "metal"
								if Jukebox:getModData().Style == "cmetal" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cmetal"
								end
								local AvailablemetalTracks = require("JukeboxTracksCustom/Metal")
								if TrackGenre == "metal" then
								AvailablemetalTracks = require("JukeboxTracks/Metal")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
							local randommetalNumber = ZombRand(#AvailablemetalTracks) + 1
							local randommetalTrack = AvailablemetalTracks[randommetalNumber]

								Jukebox:getModData().genre = tostring(randommetalTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randommetalTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

						elseif Jukebox:getModData().Style == "salsa" or Jukebox:getModData().Style == "csalsa" then--SALSA
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "salsa"
								if Jukebox:getModData().Style == "csalsa" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "csalsa"
								end
								local AvailablesalsaTracks = require("JukeboxTracksCustom/Salsa")
								if TrackGenre == "salsa" then
								AvailablesalsaTracks = require("JukeboxTracks/Salsa")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
							local randomsalsaNumber = ZombRand(#AvailablesalsaTracks) + 1
							local randomsalsaTrack = AvailablesalsaTracks[randomsalsaNumber]

								Jukebox:getModData().genre = tostring(randomsalsaTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomsalsaTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

							elseif Jukebox:getModData().Style == "pop" or Jukebox:getModData().Style == "cpop" then--pop
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "pop"
								if Jukebox:getModData().Style == "cpop" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cpop"
								end
								local AvailablepopTracks = require("JukeboxTracksCustom/Pop")
								if TrackGenre == "pop" then
								AvailablepopTracks = require("JukeboxTracks/Pop")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randompopNumber = ZombRand(#AvailablepopTracks) + 1
								local randompopTrack = AvailablepopTracks[randompopNumber]

								Jukebox:getModData().genre = tostring(randompopTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randompopTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)
								
							elseif Jukebox:getModData().Style == "beach" or Jukebox:getModData().Style == "cbeach" then--beach
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "beach"
								if Jukebox:getModData().Style == "cbeach" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cbeach"
								end
								local AvailablebeachTracks = require("JukeboxTracksCustom/Beach")
								if TrackGenre == "beach" then
								AvailablebeachTracks = require("JukeboxTracks/Beach")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randombeachNumber = ZombRand(#AvailablebeachTracks) + 1
								local randombeachTrack = AvailablebeachTracks[randombeachNumber]

								Jukebox:getModData().genre = tostring(randombeachTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randombeachTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

							elseif Jukebox:getModData().Style == "classical" or Jukebox:getModData().Style == "cclassical" then--classical
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "classical"
								if Jukebox:getModData().Style == "cclassical" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cclassical"
								end
								local AvailableclassicalTracks = require("JukeboxTracksCustom/Classical")
								if TrackGenre == "classical" then
								AvailableclassicalTracks = require("JukeboxTracks/Classical")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomclassicalNumber = ZombRand(#AvailableclassicalTracks) + 1
								local randomclassicalTrack = AvailableclassicalTracks[randomclassicalNumber]

								Jukebox:getModData().genre = tostring(randomclassicalTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomclassicalTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)
								
							elseif Jukebox:getModData().Style == "country" or Jukebox:getModData().Style == "ccountry" then--country
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "country"
								if Jukebox:getModData().Style == "ccountry" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "ccountry"
								end
								local AvailablecountryTracks = require("JukeboxTracksCustom/Country")
								if TrackGenre == "country" then
								AvailablecountryTracks = require("JukeboxTracks/Country")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomcountryNumber = ZombRand(#AvailablecountryTracks) + 1
								local randomcountryTrack = AvailablecountryTracks[randomcountryNumber]

								Jukebox:getModData().genre = tostring(randomcountryTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomcountryTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

							elseif Jukebox:getModData().Style == "holiday" or Jukebox:getModData().Style == "choliday" then--holiday
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "holiday"
								if Jukebox:getModData().Style == "choliday" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "choliday"
								end
								local AvailableholidayTracks = require("JukeboxTracksCustom/Holiday")
								if TrackGenre == "holiday" then
								AvailableholidayTracks = require("JukeboxTracks/Holiday")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomholidayNumber = ZombRand(#AvailableholidayTracks) + 1
								local randomholidayTrack = AvailableholidayTracks[randomholidayNumber]

								Jukebox:getModData().genre = tostring(randomholidayTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomholidayTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

							elseif Jukebox:getModData().Style == "jazz" or Jukebox:getModData().Style == "cjazz" then--jazz
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "jazz"
								if Jukebox:getModData().Style == "cjazz" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cjazz"
								end
								local AvailablejazzTracks = require("JukeboxTracksCustom/Jazz")
								if TrackGenre == "jazz" then
								AvailablejazzTracks = require("JukeboxTracks/Jazz")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomjazzNumber = ZombRand(#AvailablejazzTracks) + 1
								local randomjazzTrack = AvailablejazzTracks[randomjazzNumber]

								Jukebox:getModData().genre = tostring(randomjazzTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomjazzTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "muzak" or Jukebox:getModData().Style == "cmuzak" then--muzak
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "muzak"
								if Jukebox:getModData().Style == "cmuzak" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cmuzak"
								end
								local AvailablemuzakTracks = require("JukeboxTracksCustom/Muzak")
								if TrackGenre == "muzak" then
								AvailablemuzakTracks = require("JukeboxTracks/Muzak")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randommuzakNumber = ZombRand(#AvailablemuzakTracks) + 1
								local randommuzakTrack = AvailablemuzakTracks[randommuzakNumber]

								Jukebox:getModData().genre = tostring(randommuzakTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randommuzakTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)

							elseif Jukebox:getModData().Style == "rap" or Jukebox:getModData().Style == "crap" then--rap
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "rap"
								if Jukebox:getModData().Style == "crap" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "crap"
								end
								local AvailablerapTracks = require("JukeboxTracksCustom/Rap")
								if TrackGenre == "rap" then
								AvailablerapTracks = require("JukeboxTracks/Rap")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomrapNumber = ZombRand(#AvailablerapTracks) + 1
								local randomrapTrack = AvailablerapTracks[randomrapNumber]

								Jukebox:getModData().genre = tostring(randomrapTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomrapTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "reggae" or Jukebox:getModData().Style == "creggae" then--reggae
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "reggae"
								if Jukebox:getModData().Style == "creggae" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "creggae"
								end
								local AvailablereggaeTracks = require("JukeboxTracksCustom/Reggae")
								if TrackGenre == "reggae" then
								AvailablereggaeTracks = require("JukeboxTracks/Reggae")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomreggaeNumber = ZombRand(#AvailablereggaeTracks) + 1
								local randomreggaeTrack = AvailablereggaeTracks[randomreggaeNumber]

								Jukebox:getModData().genre = tostring(randomreggaeTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomreggaeTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "rock" or Jukebox:getModData().Style == "crock" then--rock
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "rock"
								if Jukebox:getModData().Style == "crock" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "crock"
								end
								local AvailablerockTracks = require("JukeboxTracksCustom/Rock")
								if TrackGenre == "rock" then
								AvailablerockTracks = require("JukeboxTracks/Rock")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomrockNumber = ZombRand(#AvailablerockTracks) + 1
								local randomrockTrack = AvailablerockTracks[randomrockNumber]

								Jukebox:getModData().genre = tostring(randomrockTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomrockTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


							elseif Jukebox:getModData().Style == "world" or Jukebox:getModData().Style == "cworld" then--world
			
								local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
								local TrackGenre = "world"
								if Jukebox:getModData().Style == "cworld" then
									PlayJukeboxTracks = require("TimedActions/PlayJukeboxCustomTracks")
									TrackGenre = "cworld"
								end
								local AvailableworldTracks = require("JukeboxTracksCustom/World")
								if TrackGenre == "world" then
								AvailableworldTracks = require("JukeboxTracks/World")
								end
						-- RANDOMIZING WHICH AVAILABLE TRACK WILL BE PICKED IN A GIVEN ACTION AND SETTING THE LENGTH
								local randomworldNumber = ZombRand(#AvailableworldTracks) + 1
								local randomworldTrack = AvailableworldTracks[randomworldNumber]

								Jukebox:getModData().genre = tostring(randomworldTrack.sound)
								local genre = Jukebox:getModData().genre
								Jukebox:getModData().Length = tonumber(randomworldTrack.length)
								local length = Jukebox:getModData().Length
								local style = Jukebox:getModData().Style
								--Jukebox:transmitModData()
								Events.OnTick.Remove(anotherkindofhell)
								Jukebox:getModData().OnPlay = "nothing"
								OnJukeboxStyleChange(Jx, Jy, Jz, style, length, genre)


						end--STYLES
					end--PAUSE
				end--TIMETOSWITCH
			end--TICK
		else--ONPLAYISNIL
		tickStart = 0
		Events.OnTick.Remove(anotherkindofhell)
		end
	end--FUNCTION
	
	Events.OnTick.Add(anotherkindofhell)	
	-------------------------------
	
		--else
	
		--end
		end
	else
		return
	end

end

