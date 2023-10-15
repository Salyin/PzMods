require "Advanced_trajectory_core"

local tasergun = {}

tasergun[4] = {0.75,0.75,0.45}
tasergun[6] = 0
tasergun[7] = 2
tasergun[9] = "Taser"
tasergun[11] = false
tasergun[12] = 0.5
tasergun[13] = false
tasergun[14] = "Base.aty_revolversfx"

Advanced_trajectory.Advanced_trajectory["Base.Taser"] = tasergun

--compatibility adjustment for Advanced Trajectory
local mods = getActivatedMods()
if mods:contains("Advanced_trajectory") then
    local old_at_getShootZombies = Advanced_trajectory.getShootzombie
    Advanced_trajectory.getShootzombie = function(postable, damage, isshotplayer)
        if getPlayer():getPrimaryHandItem():getFullType() == "Base.Taser" then
            local sq = getCell():getGridSquare(postable[1], postable[2], postable[3])
            if sq:getMovingObjects():size() > 0 then
                local zombie = sq:getMovingObjects():get(0)
                if instanceof(zombie, "IsoZombie") then
					zombie:setUseless(true)
					OnTaseZ(zombie)
                end
				--if  instanceof(zombie, "IsoPlayer") then
					--getPlayer():Say("I got hit.")
					--OnTaseGunAT(zombie)
               -- end
            else
                local found = false
                for i = -1, 1 do
                    for z = -1, 1 do
                        local sq2 = getCell():getGridSquare(postable[1] + z, postable[2] + i, postable[3])
                        if sq2:getMovingObjects():size() > 0 then
                            found = true
                            local zombie = sq2:getMovingObjects():get(0)
                            if instanceof(zombie, "IsoZombie") then
								zombie:setUseless(true)
								OnTaseZ(zombie)
                            end
							--if instanceof(zombie, "IsoPlayer") then

                           -- end
                        end
                        if found then
                            break
                        end
                    end
                    if found then
                        break
                    end
                end
            end
        end
		return old_at_getShootZombies(postable, damage, isshotplayer)
    end
end