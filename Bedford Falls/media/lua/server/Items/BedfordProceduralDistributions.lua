local function preDistributionMerge()
	table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "BedfordMap");
	table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 10);
	table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "BedfordMap");
	table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 10);
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);