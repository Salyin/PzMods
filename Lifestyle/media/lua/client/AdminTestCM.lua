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

require 'ISUI/ISWorldObjectContextMenu'

function onAdminTest(worldobjects, character)
    ISTimedActionQueue.add(ToneDeafSuffering:new(character))
end

function onAdminTestB(worldobjects, character)
    ISTimedActionQueue.add(PraiseMusician:new(character))
end

function onAdminTestC(worldobjects, character)

	--if character:isFacingLocation((character:getX()+1),(character:getY()-1),character:getZ()) then
	--print("PLAYER IS FACING ... 1")
	--character:Say("PLAYER IS FACING ... 1")
	--elseif character:isFacingLocation((character:getX()-1),(character:getY()+1),character:getZ()) then
	--print("PLAYER IS FACING ... 2")
	--character:Say("PLAYER IS FACING ... 2")
	--elseif character:isFacingLocation((character:getX()-1),character:getY(),character:getZ()) then
	--print("PLAYER IS FACING ... 3")
	--character:Say("PLAYER IS FACING ... 3")
	--elseif character:isFacingLocation((character:getX()+1),character:getY(),character:getZ()) then
	--print("PLAYER IS FACING ... 4")
	--character:Say("PLAYER IS FACING ... 4")
	--else
	--print("BUGGED FACING")
	--character:Say("BUGGED FACING")
	--end
    ISTimedActionQueue.add(BooingMusician:new(character))
end

Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects)

	local sandboxExpressions = SandboxVars.Debug.Expressions or false
	if sandboxExpressions then

    if isAdmin() or isDebugEnabled() then

    local character = getSpecificPlayer(player)
	
											if character:HasTrait("ToneDeaf") and
											(character:getPrimaryHandItem() == nil) and
											(character:getSecondaryHandItem() == nil) and
											(character:getCurrentState():equals(IdleState.instance()) or character:isSitOnGround()) and not
											character:isSneaking() and not
											character:isRunning() and not
											character:isSprinting() then
	
												local tdsuffertestoption = context:addOption(getText("ContextMenu_Debug_TDSuffer"), worldobjects, onAdminTest, character);

											end

			local praiseoption = context:addOption(getText("ContextMenu_Debug_Applause"), worldobjects, onAdminTestB, character);
			
			local boooption = context:addOption(getText("ContextMenu_Debug_Boo"), worldobjects, onAdminTestC, character);

	end
	end
end)
