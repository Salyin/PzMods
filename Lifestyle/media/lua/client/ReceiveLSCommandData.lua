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

-- Synchronization and MP related stuff

local Commands = {}

Commands["IsListeningToMusic"] = function(arg)

    local listener_id = arg[1]
    local listener = getPlayerByOnlineID(arg[1])
    local SourceMusiclvl = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsListeningToMusic(listener, SourceMusiclvl)
end

Commands["IsListeningToDJ"] = function(arg)

    local DJlistener_id = arg[1]
    local DJlistener = getPlayerByOnlineID(arg[1])
    local SourceMusiclvl = arg[2]
	local SourceDJ = arg[3]
	local SourceIsDJ = arg[4]
	--print("client received command from server and is trying to invoke function")
    PlayerIsListeningToDJ(DJlistener, SourceMusiclvl, SourceDJ, SourceIsDJ)
end

Commands["WasAskedIfIsDancing"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceProposer = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsAskedIfIsDancing(DanceTarget, DanceProposer)
end

Commands["OtherPlayerIsDancingResponse"] = function(arg)

    local DanceProposer_id = arg[1]
    local DanceProposer = getPlayerByOnlineID(arg[1])
    local IsDancing = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerOtherPlayerIsDancingResponse(DanceProposer, IsDancing)
end

Commands["WasAskedToDance"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceProposer = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsAskedToDance(DanceTarget, DanceProposer)
end

Commands["DanceWasAccepted"] = function(arg)

    local DanceProposer_id = arg[1]
    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DancePartner = arg[2]
	local PartnerX = arg[3]
	local PartnerY = arg[4]
	--print("client received command from server and is trying to invoke function")
    PlayerDanceWasAccepted(DanceProposer, DancePartner, PartnerX, PartnerY)
end

Commands["PartnerStoppedDancing"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
	--print("client received command from server and is trying to invoke function")
    PartnerStopDance(DanceTarget)
end

Commands["FaceDancingProposer"] = function(arg)

    local DancePartner_id = arg[1]
    local DancePartner = getPlayerByOnlineID(arg[1])
    local ProposerX = arg[2]
	local ProposerY = arg[3]
	--print("client received command from server and is trying to invoke function")
    PartnerFaceProposer(DancePartner, ProposerX, ProposerY)
end

Commands["IsStartingDuet"] = function(arg)

    local currentPerformer_id = arg[1]
    local currentPerformer = getPlayerByOnlineID(arg[1])
    local SourceWaitingDuet = arg[2]
	--print("client received command from server and is trying to invoke function")
    OtherPlayerIsStartingDuet(currentPerformer, SourceWaitingDuet)
end

Commands["ChangeDiscoStyle"] = function(arg)

    local style = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnDiscoBallStyleChange(style, x, y, z)
end

Commands["TurnDiscoBallOff"] = function(arg)

    local playerDiscoCommand = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnDiscoBallTurnOff(playerDiscoCommand, x, y, z)
end

Commands["JukeboxStart"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxStart(x, y, z)

end

Commands["TurnJukeboxOff"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxTurnOff(x, y, z)

end

Commands["JukeboxStyleChange"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxStyleChange(x, y, z, style, length, genre)

end

Commands["StopJukeSong"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeSongStop(x, y, z)

end

Commands["isPlayingJuke"] = function(arg)

    local genre = arg[1]
	local x = arg[2]
	local y = arg[3]
	local z = arg[4]
	local JukeReusableID = arg[5]
	local playercommand = arg[6]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    isJukeSendSong(JukeReusableID, genre, x, y, z, playercommand)
end

-- Base stuff
local function OnLSServerCommand(module, command, args)
    if module == 'LS' then
        if Commands[command] then
            args = args or {}
            Commands[command](args)

        end
    end
end

Events.OnServerCommand.Add(OnLSServerCommand)

function LS_OnReceiveGlobalModData(key, modData)
    if modData then
        ModData.remove(key)
        ModData.add(key, modData)
    end
end


Events.OnReceiveGlobalModData.Add(LS_OnReceiveGlobalModData)

function LS_OnConnected()
    ModData.request("LSDATA")
end


Events.OnConnected.Add(LS_OnConnected)
