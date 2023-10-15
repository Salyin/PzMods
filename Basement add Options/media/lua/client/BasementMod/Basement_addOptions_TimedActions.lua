--local Basement_addOptions = require("BasementMod/Basement_addOptions")--BasementMod/
local Basement = require("BasementMod/Basement");

---@class Basement_addOptions_TimedActions : ISBaseTimedAction
local Basement_addOptions_TimedActions = ISBaseTimedAction:derive("Basement_addOptions_TimedActions");

function Basement_addOptions_TimedActions:isValid()
    local currentHatchData = Basement_addOptions.returnSpecialHatchModData(currentHatch)
    local basementData = Basement.Data.Basements[self.id];
    if currentHatchData then
        if basementData and basementData.buildingId ~= -2 then
            return false
        end
    end
    if self.state == 0 then -- add pad lock to the hatch
        if self.padLock  or isAdmin() then
            return true
        end
    elseif self.state == 1 then -- lock the hatch
        if (self.currentBasement and SandboxVars.BasementAddOptions.lockInsideWithoutKey) or self.haveThisKeyId or isAdmin() then
            return true
        end
    elseif self.state == -1 then -- remove the padlock with key
        if self.haveThisKeyId  or isAdmin() then --and self.Basement_Key)
            return true
        end
    elseif self.state > 1 then -- unlock the padlock
        if (self.currentBasement and SandboxVars.BasementAddOptions.unlockInsideWithoutKey) or self.haveThisKeyId or isAdmin() then 
            return true
        end
    elseif self.state == -2 then -- force the padlock
        if self.crowbar and (self.character:getPrimaryHandItem() and self.character:getPrimaryHandItem():hasTag("Crowbar")) then
            return true
        end
    elseif self.state == -3 then -- remove the padlock without key
        return true
    end
    return false
end

function Basement_addOptions_TimedActions:waitToStart()
    --local hatch = Basement.GetHatchOnSquare(self.character:getSquare())
    if self.currentHatch then --;self.currentHatch
        self.character:faceThisObject(self.currentHatch) --
    elseif self.currentBasement then
        self.character:faceLocation(self.character:getX() - 2, self.character:getY())
    end
    return self.character:shouldBeTurning()
end

function Basement_addOptions_TimedActions:start()
    self.soundName = "basement_manipPadlock"
    if self.state == -2 then
        self:setActionAnim("RemoveBarricade");
        if self.currentBasement then 
            self.character:SetVariable("RemoveBarricade", "CrowbarHigh");
        else 
            self.character:SetVariable("RemoveBarricade", "CrowbarMid");
            self.attractZombies = SandboxVars.BasementAddOptions.attractZombies
            if not ISBuildMenu.cheat and not isAdmin() and self.attractZombies > 0 then -- sandboxoption
                if self.attractZombies < 5 then self.attractZombies = 5 end
                addSound(self.character, self.character:getX(),self.character:getY(),self.character:getZ(), self.attractZombies, 1); --SandboxVars.BasementAddOptions.attractZombies sandboxoption
            end
        end
        self.soundName = "basement_breakPadlockWithCrowbar"
        self.sound = self.character:playSound(self.soundName) 
    elseif self.state == -1 then 
        self:setActionAnim("Loot");
        if self.currentBasement then self.character:SetVariable("LootPosition", "High");
        else self.character:SetVariable("LootPosition", "Low");
        end   
        self.sound = self.character:playSound(self.soundName) 
    else
        self:setActionAnim("Loot");
        if self.currentBasement then self.character:SetVariable("LootPosition", "High");
        else self.character:SetVariable("LootPosition", "Low");
        end
        self.sound = self.character:playSound(self.soundName)
    end
end

function Basement_addOptions_TimedActions:update()
    if self.currentHatch then
        self.character:faceThisObject(self.currentHatch)
    elseif self.currentBasement then
        self.character:faceLocation(self.character:getX() - 2, self.character:getY())
    end
    if self.sound and self.sound ~= 0 and not self.character:getEmitter():isPlaying(self.sound) then self.sound = self.character:playSound(self.soundName) end
end

function Basement_addOptions_TimedActions:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function Basement_addOptions_TimedActions:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    --self.character:playSound("DoorIsLocked");
    Basement_addOptions.PadLockPerform(self.character,self.currentBasement,self.id,self.keyId,self.state)
    ISBaseTimedAction.perform(self);
end

function Basement_addOptions_TimedActions:new(playerObj,currentHatch,currentBasement,id,keyId,state,time)
    local o = {};
    setmetatable(o, self);
    self.__index    = self;
    o.character     = playerObj;
    o.stopOnWalk    = true;
    o.stopOnRun     = true;
    o.maxTime       = time;
    o.state         = state;
    o.keyId         = keyId;
    o.currentHatch = currentHatch;
    o.currentBasement = currentBasement;
    o.id            = id;
   -- o.basementData = Basement.Data.Basements[id];
    o.inventory     = playerObj:getInventory();
    o.padLock       = o.inventory:getItemFromType("Padlock");
    o.crowbar       = o.inventory:getItemFromType("Crowbar");
    o.haveThisKeyId = o.inventory:haveThisKeyId(keyId);
    --o.Basement_Key  = nil;
    -------------------------------------------------------------------------
    --for i=1,o.inventory:getItems():size() do
    --    local item = o.inventory:getItems():get(i-1)
    --    if item:getCategory()=="Key" and item:getType() == "KeyPadlock"  then
    --        if item:getKeyId() == keyId then
    --            o.Basement_Key = item
    --        end
    --    end
    --end
    -------------------------------------------------------------------------
    -- custom fields
    return o;
end

return Basement_addOptions_TimedActions;

