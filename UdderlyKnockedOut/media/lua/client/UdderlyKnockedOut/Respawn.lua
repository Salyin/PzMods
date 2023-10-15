print("UKO: Initializing")
Respawn = {};

Respawn.Id = "respawn";
Respawn.Name = "I was only knocked out, I'm waking up now..";
Respawn.Message = ""

Respawn.Recoverables = {};

function Respawn.AddRecoverable(recoverable)
    table.insert(Respawn.Recoverables, recoverable);
end

Respawn.AddRecoverable(RecoverableLevels);
Respawn.AddRecoverable(RecoverableBoosts);
Respawn.AddRecoverable(RecoverableTraits);
Respawn.AddRecoverable(RecoverableBooks);
Respawn.AddRecoverable(RecoverableOccupation);
Respawn.AddRecoverable(RecoverableWeight);
Respawn.AddRecoverable(RecoverableKills);