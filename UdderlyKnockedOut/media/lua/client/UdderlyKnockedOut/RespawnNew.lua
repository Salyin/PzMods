function Respawn.OnCreatePlayer(id, player)
    if not Respawn.CanRecover(player) then
        return;
    end
    print("UKO: Character Data Loading..")
    for i, recoverable in ipairs(Respawn.Recoverables) do
        recoverable:Recover(player);
    end
    player:setHaloNote(Respawn.Message, 200, 200, 200, 2000)
end

function Respawn.CanRecover(player)
    return player:HasTrait(Respawn.Id) and Respawn.Recoverables ~= nil;
end

Events.OnCreatePlayer.Add(Respawn.OnCreatePlayer);