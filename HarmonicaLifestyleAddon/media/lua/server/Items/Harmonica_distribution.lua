--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

require "Items/ProceduralDistributions"
		
-- Item distribution

--WARDROBECHILD
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.8);

--WARDROBEMAN
table.insert(ProceduralDistributions["list"]["WardrobeMan"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeMan"].items, 0.08);

--WARDROBEMANClassy
table.insert(ProceduralDistributions["list"]["WardrobeManClassy"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeManClassy"].items, 0.08);

--WARDROBERedneck
table.insert(ProceduralDistributions["list"]["WardrobeRedneck"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeRedneck"].items, 0.9);

--WARDROBEWoman
table.insert(ProceduralDistributions["list"]["WardrobeWoman"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeWoman"].items, 0.08);

--WARDROBEWomanClassy
table.insert(ProceduralDistributions["list"]["WardrobeWomanClassy"].items, "LS.Harmonica");
table.insert(ProceduralDistributions["list"]["WardrobeWomanClassy"].items, 0.08);