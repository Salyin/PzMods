--***********************************************************
--**                       BitBraven                       **
--***********************************************************

--local Basement = require("BasementMod/Basement_addOptions")

ISSpecialHatch = ISBuildingObject:derive("ISSimpleFurniture");

function ISSpecialHatch:create(x, y, z, north, sprite)
	local facing = north and "N" or "E";
	Basement_addOptions.CreateSpecialHatch(x, y, z,self.type,self.size, facing,self.buildingId)
end

function ISSpecialHatch:new(name, type, size, sprite,buildingId)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite.E);
	o:setNorthSprite(sprite.N);
	o.name = name;
	o.type = type
	o.size = size;
	o.buildingId = buildingId
	o.dismantable = false;
	o.canBarricade = false;
	o.blockAllTheSquare = false;
	o.buildLow = true;
	return o;
end

function ISSpecialHatch:isValid(square)
	if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
	if square:getZ() > 0 then
		local below = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1)
		if below and below:HasStairs() then
			return false
		end
	end
	return ISBuildingObject.isValid(self, square) and Basement_addOptions.CanCreateHatchOnSquare(square);
end

function ISSpecialHatch:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
