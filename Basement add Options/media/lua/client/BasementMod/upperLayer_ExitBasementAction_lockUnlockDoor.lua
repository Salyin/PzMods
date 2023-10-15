Events.OnGameBoot.Add(function()
    local ExitBasementAction = require("BasementMod/TimedActions/ExitBasementAction");
    --   require ("BasementMod/TimedActions/ExitBasementAction")
    --local Utils = require("BasementMod/Utils");
    local Basement = require("BasementMod/Basement")
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
    local upperLayer = upperLayer or {}
    upperLayer.ExitBasementAction = {}
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
    upperLayer.ExitBasementAction.isValid = ExitBasementAction.isValid
    function ExitBasementAction:isValid()
        local square = self.character:getCurrentSquare();
        if not square or self.character:getVehicle() then return end
        local squareX, squareY, squareZ = square:getX(), square:getY(), square:getZ();
        local currentBasement = Basement.FindByPosition(squareX, squareY, squareZ);
        if currentBasement then
    
            local id = currentBasement.id
            local basementData = Basement.Data.Basements[id];
    
            if basementData.PadLock == nil or basementData.PadLock <= 1 then
                return true
            else
                if self.test == nil then
                    self.test = true
                    self.character:playSound("basement_doorISlocked");
                end
                return false
            end
        end
        if self.test == nil then
            self.test = true
            self.character:playSound("basement_doorISlocked");
        end
        return false
    end
end)
--local Utils = require("BasementMod/Utils");
--local Basement = require("BasementMod/Basement");
--
-----@class ExitBasementAction : ISBaseTimedAction
--local ExitBasementAction = ISBaseTimedAction:derive("ExitBasementAction");
--
--function ExitBasementAction:isValid()
--    return true;
--end
--
--function ExitBasementAction:waitToStart()
--    self.character:faceLocation(self.character:getX() - 2, self.character:getY())
--    return self.character:shouldBeTurning()
--end
--
--function ExitBasementAction:start()
--    self:setActionAnim("Loot");
--	self.character:SetVariable("LootPosition", "High");
--    self.sound = self.character:playSound("BasementHatchOpening");
--end
--
--function ExitBasementAction:update()
--    self.character:faceLocation(self.character:getX() - 2, self.character:getY())
--end
--
--function ExitBasementAction:stop()
--    self.character:stopOrTriggerSound(self.sound);
--    ISBaseTimedAction.stop(self);
--end
--
--function ExitBasementAction:perform()
--    Utils.delayedFunction(function()
--        Basement.ExitBasement(self.character);
--        self.character:playSound("BasementHatchClosing");
--    end, 1);
--    ISBaseTimedAction.perform(self);
--end
--
--function ExitBasementAction:new(playerObj)
--    local o = {};
--    setmetatable(o, self);
--    self.__index = self;
--    o.character = playerObj;
--    o.stopOnWalk = true;
--    o.stopOnRun = true;
--    o.maxTime = 50;
--    -- custom fields
--    return o;
--end
--
--return ExitBasementAction;
