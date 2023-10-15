require 'ISUI/ISWorldObjectContextMenu'

--Disable the ability to cancel the knocked out timed action
local old_isPlayerDoingActionThatCanBeCancelled = isPlayerDoingActionThatCanBeCancelled

---@param playerObj IsoPlayer
function isPlayerDoingActionThatCanBeCancelled(playerObj)
    if not playerObj then return false end
    local currentAction = ISTimedActionQueue.getTimedActionQueue(playerObj)
    if currentAction and currentAction.queue[1] then
        if currentAction.queue[1].Type == "Knockout_TimedAction" then
            return false
        end
    end
    return old_isPlayerDoingActionThatCanBeCancelled(playerObj)
end


--Disable the draw of world context menu if the player is knocked out
local old_ISWorldObjectContextMenu_createMenu = ISWorldObjectContextMenu.createMenu;

ISWorldObjectContextMenu.createMenu = function(player, worldobjects, x, y, test)
    local character = getSpecificPlayer(player)

    if character:isLocalPlayer() and character:getModData().Knockout_isKnockedout then return end

    return old_ISWorldObjectContextMenu_createMenu(player, worldobjects, x, y, test)
end