Events.OnGameStart.Add(function()
    local Basement = require("BasementMod/Basement")
    local Basement_CanCreateHatchOnSquare = Basement.CanCreateHatchOnSquare
    function Basement.CanCreateHatchOnSquare(square)
        if RVInterior then
            local sandbox = SandboxVars.BasementAddOptions.buildHatchfromRVinteriorIsForbidden
            if sandbox == true and RVInterior.playerInsideInterior(square) then --ISBuildMenu.cheat == false and 
                return false;
            end
        end
        return Basement_CanCreateHatchOnSquare(square)
    end
end)