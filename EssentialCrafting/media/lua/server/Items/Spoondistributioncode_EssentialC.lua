require 'Items/ProceduralDistributions'

function registerAsLoot(item, chance, allocation)
  table.insert(ProceduralDistributions.list[allocation].items, item);
  table.insert(ProceduralDistributions.list[allocation].items, chance);
end

local iReg = "";

registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.8, "BookstoreBooks");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.2, "PostOfficeBooks");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.7, "LibraryBooks");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 1, "LivingRoomShelf");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.1, "ClassroomShelves");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.1, "ClassroomMisc");
registerAsLoot("SpoonEssentialCrafting.SpoonMagEssentialC", 0.5, "MagazineRackMixed");

