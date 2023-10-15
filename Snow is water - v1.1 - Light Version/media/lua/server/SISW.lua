if isClient() then return end

-- we update the update
function SMetalDrumGlobalObject:update()
    if RainManager.isRaining() or getClimateManager():isSnowing() then
        self.waterMax = self.waterMax or ISMetalDrum.waterMax
        if self.waterAmount < self.waterMax then
            local square = self:getSquare()
            if square then self.exterior = square:isOutside() end
            if self.exterior then
                if not self.haveLogs and not self.haveCharcoal then
                    self.waterAmount = math.min(self.waterMax, self.waterAmount + (1 * ISMetalDrum.waterScale)/2)
                    if not getClimateManager():isSnowing() then 
                       self.waterAmount = math.min(self.waterMax, self.waterAmount + 1 * ISMetalDrum.waterScale)
                    end
                    self.taintedWater = true
                    local isoObject = self:getIsoObject()
                    if isoObject then -- object might have been destroyed
                        self:noise('added rain to barrel at '..self.x..","..self.y..","..self.z..' waterAmount='..self.waterAmount)
                        isoObject:setTaintedWater(true)
                        isoObject:setWaterAmount(self.waterAmount)
                        isoObject:transmitModData()
                    end
                end
            end
        end
    end

    if self.haveLogs and self.isLit then
        if not self.charcoalTick then
            self.charcoalTick = 1
        else
            self.charcoalTick = self.charcoalTick + 1
        end
        self:noise('charcoal update ' .. self.charcoalTick)
        if self.charcoalTick == 12 then
            self.haveLogs = false
            self.isLit = false
            self.haveCharcoal = true
            self.charcoalTick = nil
            if self.LightSource then
                -- FIXME: won't be synced in multiplayer
                getCell():removeLamppost(self.LightSource)
            end
        end
        self:changeSprite()
        self:setModData()
    end
end

