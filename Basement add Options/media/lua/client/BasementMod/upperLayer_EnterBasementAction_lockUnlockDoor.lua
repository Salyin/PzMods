Events.OnGameBoot.Add(function()
    --require ("BasementMod/TimedActions/EnterBasementAction")
    local EnterBasementAction = require("BasementMod/TimedActions/EnterBasementAction");
    local Utils = require("BasementMod/Utils");
    local Basement = require("BasementMod/Basement");
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
    local upperLayer = {}
    upperLayer.EnterBasementAction = {}
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
    upperLayer.EnterBasementAction.isValid = EnterBasementAction.isValid
    function EnterBasementAction:isValid()
        local basementData = Basement.Data.Basements[self.basementId];
        if basementData.PadLock == nil or basementData.PadLock <= 1 or isAdmin() then
            self.worldAge =  math.ceil(getGameTime():getWorldAgeHours())
            self.sandbox = SandboxVars.BasementAddOptions.timeElapsedToAllowTraveling
            self.modData = self.character:getModData();
            self.modData.BasementMod = self.modData.BasementMod or {};
            self.currentHatchData = self.currentHatch:getModData().BasementMod
            if not isAdmin() and self.modData.BasementMod.LastTraveledFromTravelHatch then
                if self.character:getInventory():containsTagRecurse("AvatarMOD") then
                    if not self.txt then self.character:Say(getText("IGUI_addOption_TraveledFromTravelHatch_isNotAllowedWithAvatar")); self.txt = true end
                    return false
                end
                if self.currentHatchData.type == "travel" then
                    local timeElapsed = self.worldAge - self.modData.BasementMod.LastTraveledFromTravelHatch
                    if timeElapsed < self.sandbox then 
                        local waiting = self.sandbox - timeElapsed
                        if not self.txt then self.character:Say(getText("IGUI_addOption_Say_needWaitingForTraveling") .. waiting .."h");self.txt = true end
                        return false
                    end
                end
            end
            return true
        else
            if self.test == nil then
                self.test = true
                self.character:playSound("basement_doorISlocked");
            end
            return false
        end
    end
    upperLayer.EnterBasementAction.start = EnterBasementAction.start
    function EnterBasementAction:start()
        self.closingSound = nil
        if self.basementId >= 10000  then
            self:setActionAnim("Loot");
            if self.currentHatchData.buildingId == -2 and self.currentHatchData.type ~= "travel" then 
                self.character:SetVariable("LootPosition", "High");
            else 
                self.character:SetVariable("LootPosition", "Low");
            end
            if self.currentHatchData.type == "travel" then
                self.sound = self.character:playSound("basement_egout_open");
                self.closingSound = "basement_egout_close"       
            elseif self.currentHatchData.type == "sewer" then
                if self.currentHatchData.buildingId == -2 then
                    self.sound = self.character:playSound("basement_egout_open_eco");
                    self.closingSound = "basement_egout_close"
                else 
                    self.sound = self.character:playSound("basement_egout_open");
                    self.closingSound = "basement_egout_close_eco"
                end
            else
                self.sound = self.character:playSound("BasementHatchOpening");
                self.closingSound = "BasementHatchClosing"
            end   
        else
            upperLayer.EnterBasementAction.start(self)
        end
    end
    upperLayer.EnterBasementAction.perform = EnterBasementAction.perform
    function EnterBasementAction:perform()
        if self.basementId >= 10000 then
            Utils.delayedFunction(function()
                if self.currentHatchData.type == "travel" then
                    self.modData.BasementMod.LastTraveledFromTravelHatch = (self.worldAge - (self.sandbox-(self.sandbox/self.sandbox)))
                end
                Basement_addOptions.EnterBasementId(self.character, self.basementId, self.currentHatchData.buildingId);
                self.sound = self.character:playSound(self.closingSound);                
            end, 1);
            ISBaseTimedAction.perform(self);
        else
            upperLayer.EnterBasementAction.perform(self)
        end
    end
end)

--local Utils = require("BasementMod/Utils");
--local Basement = require("BasementMod/Basement");
--
-----@class EnterBasementAction : ISBaseTimedAction
--local EnterBasementAction = ISBaseTimedAction:derive("EnterBasementAction");
--
--function EnterBasementAction:isValid()
--    return true;
--end
--
--function EnterBasementAction:waitToStart()
--    if self.currentHatch then
--        self.character:faceThisObject(self.currentHatch)
--        return self.character:shouldBeTurning()
--    end
--end
--
--function EnterBasementAction:start()
--    self:setActionAnim("Loot");
--	self.character:SetVariable("LootPosition", "Low");
--    self.sound = self.character:playSound("BasementHatchOpening");
--end
--
--function EnterBasementAction:update()
--    if self.currentHatch then
--        self.character:faceThisObject(self.currentHatch)
--    end
--end
--
--function EnterBasementAction:stop()
--    self.character:stopOrTriggerSound(self.sound);
--    ISBaseTimedAction.stop(self);
--end
--

--
--function EnterBasementAction:new(playerObj, basementId, currentHatch)
--    local o = {};
--    setmetatable(o, self);
--    self.__index = self;
--    o.character = playerObj;
--    o.stopOnWalk = true;
--    o.stopOnRun = true;
--    o.maxTime = 50;
--    -- custom fields
--    o.basementId = basementId;
--    o.currentHatch = currentHatch
--    return o;
--end
--
--return EnterBasementAction;
