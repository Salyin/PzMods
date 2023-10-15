require 'Items/ProceduralDistributions'

function registerAsLoot(item, chance, allocation)
  table.insert(ProceduralDistributions.list[allocation].items, item);
  table.insert(ProceduralDistributions.list[allocation].items, chance);
end

local iReg = "";

registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.8, "BookstoreBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.2, "PostOfficeBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.7, "LibraryBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 1, "LivingRoomShelf");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.1, "ClassroomShelves");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.1, "ClassroomMisc");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmith", 0.5, "MagazineRackMixed");

registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.8, "BookstoreBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.2, "PostOfficeBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.7, "LibraryBooks");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 1, "LivingRoomShelf");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.8, "GigamartFarming");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.1, "ClassroomShelves");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.1, "ClassroomMisc");
registerAsLoot("SpoonMetalworkStuff.SpoonMagazineBlacksmithTwo", 0.5, "MagazineRackMixed");

registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "ArmySurplusTools");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "ToolStoreTools");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GigamartFarming");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "ToolStoreFarming");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "CampingStoreGear");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "DinerBackRoomCounter");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GigamartHousewares");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "PawnShopKnives");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GarageCarpentry");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GarageMechanics");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GarageMetalwork");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "GarageTools");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "StoreShelfMechanics");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "ToolStoreMetalwork");
registerAsLoot("SpoonMetalworkStuff.SpoonMetalCutter", 2, "ToolStoreCarpentry");

registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "ArmySurplusTools");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "ToolStoreTools");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GigamartFarming");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "ToolStoreFarming");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "CampingStoreGear");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "DinerBackRoomCounter");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GigamartHousewares");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "PawnShopKnives");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GarageCarpentry");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GarageMechanics");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GarageMetalwork");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "GarageTools");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "StoreShelfMechanics");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "ToolStoreMetalwork");
registerAsLoot("SpoonMetalworkStuff.SpoonHandDrill", 2, "ToolStoreCarpentry");

