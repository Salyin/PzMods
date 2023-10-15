--------------------------------  PATCH -------------------------------------
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"		

------------------------------ 책 ------------------------------------------
-- All (General)
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "Base.Lightswitches_NewBuilding");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.1);

-- Bookstore
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "Base.Lightswitches_NewBuilding");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);

table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "Base.Lightswitches_NewBuilding");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);
