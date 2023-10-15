require 'Items/ProceduralDistributions'

function registerAsLoot(item, chance, allocation)
  table.insert(ProceduralDistributions.list[allocation].items, item);
  table.insert(ProceduralDistributions.list[allocation].items, chance);
end

local iReg = "";

registerAsLoot("Base.SpoonMagazineHerbal", 0.8, "BookstoreBooks");
registerAsLoot("Base.SpoonMagazineHerbal", 0.2, "PostOfficeBooks");
registerAsLoot("Base.SpoonMagazineHerbal", 0.7, "LibraryBooks");
registerAsLoot("Base.SpoonMagazineHerbal", 1, "LivingRoomShelf");
registerAsLoot("Base.SpoonMagazineHerbal", 0.1, "ClassroomShelves");
registerAsLoot("Base.SpoonMagazineHerbal", 0.1, "ClassroomMisc");
registerAsLoot("Base.SpoonMagazineHerbal", 0.5, "MagazineRackMixed");

