Knockout = Knockout or {}

function Knockout.disabler(player, bool)
    player:setIgnoreInputsForDirection(bool)
    player:setAuthorizeMeleeAction(not bool)
    player:setIgnoreAimingInput(bool)
    player:setCanShout(not bool)
    player:setBlockMovement(bool)
end

function Knockout.GetWorldAgeInDays()
    local worldAgeInHours = getGameTime():getWorldAgeHours()
    local worldAgeInDays = math.ceil(worldAgeInHours / 24)
    return worldAgeInDays
end

-- Function to check if one minute has passed between initialTime and currentTime
function Knockout.timePassed(initialTime)

	local currentTime = {day = Knockout.GetWorldAgeInDays(), hour = getGameTime():getHour(), minute = getGameTime():getMinutes()}

    local timeDifference = (currentTime.day - initialTime.day) * 24 * 60 + (currentTime.hour - initialTime.hour) * 60 + (currentTime.minute - initialTime.minute)

    return timeDifference
end

function Knockout.setUnconscious(character)
    if character:getModData().Knockout_isKnockedout then return end

    local playerIndex = character:getPlayerNum() --Get player num

    ISTimedActionQueue.clear(character)
    ISTimedActionQueue.add(Knockout_TimedAction:new(character, playerIndex))
end


Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects)

    if isAdmin() or isDebugEnabled() or getSpecificPlayer(player):isAccessLevel('admin') then
        local knockoutOption = context:addOption(getText("ContextMenu_Knockout_DebugOption"), playersList, Knockout.onCreateUI)
    end
end)

function Knockout.isOtherPlayerKnockedOutResponse(playerObj, clickedPlayerID)
    local playerObjID = playerObj:getOnlineID()
    local args = {playerObjID, clickedPlayerID}
    sendClientCommand('RealKnockouts', 'CheckKnockoutStatus', args)

    local response = playerObj:getModData().Knockout_CheckKnockoutStatusResponse
    playerObj:getModData().Knockout_CheckKnockoutStatusResponse = nil
    return response
end