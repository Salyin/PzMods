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



function LoadJukeboxCustomTracks()


	local PlayJukeboxCustomTracks = require("TimedActions/PlayJukeboxCustomTracks")
	if #PlayJukeboxCustomTracks > 0 then
---------------discoCustom
		local AvailableDiscoCustomTracks = require("JukeboxTracksCustom/Disco")
			for k,v in pairs(PlayJukeboxCustomTracks) do
				if v.genre == "cdisco" then
					table.insert(AvailableDiscoCustomTracks, v)
				end
			end
---------------rbsoulCustom
		local AvailableRBCustomTracks = require("JukeboxTracksCustom/RB")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "crbsoul" then
						table.insert(AvailableRBCustomTracks, v)
					end
				end	
---------------metalCustom
		local AvailablemetalCustomTracks = require("JukeboxTracksCustom/Metal")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cmetal" then
						table.insert(AvailablemetalCustomTracks, v)
					end
				end
---------------salsaCustom
		local AvailablesalsaCustomTracks = require("JukeboxTracksCustom/Salsa")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "csalsa" then
						table.insert(AvailablesalsaCustomTracks, v)
					end
				end		
---------------popCustom
		local AvailablepopCustomTracks = require("JukeboxTracksCustom/Pop")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cpop" then
						table.insert(AvailablepopCustomTracks, v)
					end
				end
---------------beachCustom
		local AvailablebeachCustomTracks = require("JukeboxTracksCustom/Beach")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cbeach" then
						table.insert(AvailablebeachCustomTracks, v)
					end
				end
---------------classicalCustom	
		local AvailableclassicalCustomTracks = require("JukeboxTracksCustom/Classical")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cclassical" then
						table.insert(AvailableclassicalCustomTracks, v)
					end
				end
---------------countryCustom	
		local AvailablecountryCustomTracks = require("JukeboxTracksCustom/Country")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "ccountry" then
						table.insert(AvailablecountryCustomTracks, v)
					end
				end
---------------holidayCustom
		local AvailableholidayCustomTracks = require("JukeboxTracksCustom/Holiday")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "choliday" then
						table.insert(AvailableholidayCustomTracks, v)
					end
				end
---------------jazzCustom
		local AvailablejazzCustomTracks = require("JukeboxTracksCustom/Jazz")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cjazz" then
						table.insert(AvailablejazzCustomTracks, v)
					end
				end
---------------muzakCustom	
		local AvailablemuzakCustomTracks = require("JukeboxTracksCustom/Muzak")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cmuzak" then
						table.insert(AvailablemuzakCustomTracks, v)
					end
				end
---------------rapCustom
		local AvailablerapCustomTracks = require("JukeboxTracksCustom/Rap")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "crap" then
						table.insert(AvailablerapCustomTracks, v)
					end
				end
---------------reggaeCustom
		local AvailablereggaeCustomTracks = require("JukeboxTracksCustom/Reggae")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "creggae" then
						table.insert(AvailablereggaeCustomTracks, v)
					end
				end
---------------rockCustom
		local AvailablerockCustomTracks = require("JukeboxTracksCustom/Rock")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "crock" then
						table.insert(AvailablerockCustomTracks, v)
					end
				end
---------------worldCustom
		local AvailableworldCustomTracks = require("JukeboxTracksCustom/World")
				for k,v in pairs(PlayJukeboxCustomTracks) do
					if v.genre == "cworld" then
						table.insert(AvailableworldCustomTracks, v)
					end
				end


	end--custom

end

Events.OnGameStart.Add(LoadJukeboxCustomTracks)
