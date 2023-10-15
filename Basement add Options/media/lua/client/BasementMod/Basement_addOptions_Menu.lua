
local Basement = require("BasementMod/Basement");
local EnterBasementAction = require("BasementMod/TimedActions/EnterBasementAction");

function AddOption_Menu(playerId, playerObj, context, currentHatch, currentBasement, square)
    local currentHatchData = Basement_addOptions.returnHatchModData(currentHatch)
    if (currentBasement or currentHatchData) then -- and (addPadlockOnHatch or ) then
    --- Padlock
    	local id = 0
    	if currentBasement  then id = currentBasement.id 
    	elseif currentHatch then id = currentHatchData.basementId; 
    	end
		local id = id
		----------------------------------------------
		local basementData = Basement.Data.Basements[id];
		----------------------------------------------
	    if basementData then 

			local multiplier = basementData.buildingId
			if multiplier and multiplier <= 0 then 
				multiplier = 9999 
			end
			local keyId = id*multiplier
			-----------------------------------------------
			local inventory = playerObj:getInventory()
			local padLock 	= inventory:getItemFromType("Padlock")
			local crowbar 	= Basement_addOptions.GetCrowbarFromInv(playerObj)
			local haveThisKeyId = inventory:haveThisKeyId(keyId)
			-----------------------------------------------
			local unlockInsideWithoutKey = SandboxVars.BasementAddOptions.unlockInsideWithoutKey
			local lockInsideWithoutKey = SandboxVars.BasementAddOptions.lockInsideWithoutKey
			-----------------------------------------------
			local padlockvanillaBasement = SandboxVars.BasementAddOptions.padlockvanillaBasement 	and basementData and  (basementData.basementId < 10000  or currentBasement)
    		local padlockplayerBasement  = SandboxVars.BasementAddOptions.padlockplayerBasement 	and basementData and  basementData.type == "playerBasement"
    		local padlockSewer 			 = SandboxVars.BasementAddOptions.padlockSewer 				and basementData and  basementData.type == "sewer"
    		local padlockTravel 		 = SandboxVars.BasementAddOptions.padlockTravel 			and basementData and  basementData.type == "travel"
    		local padlockBasement 		 = SandboxVars.BasementAddOptions.padlockBasement 			and basementData and (basementData.type == "basement" or (currentHatchData and not currentHatchData.type))
    		local Admin 				 = isAdmin() and basementData

    		local padlockIsAllowed = padlockvanillaBasement or padlockplayerBasement or padlockSewer or padlockTravel or padlockBasement or Admin
			--------------------------------------------------------------------------------------------------------------- HATCH WITHOUT LOCK
			if basementData.buildingId < 0 and basementData.buildingId ~= -2 and not isAdmin() then 

				-- impossible to set padlock
			elseif padlockIsAllowed and (basementData.PadLock == nil or basementData.PadLock < 1) then
	      		local option = context:addOption(getText("IGUI_addOption_context_add_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,0);
	      		option.toolTip = ISToolTip:new()
	        		option.toolTip:initialise()
	        		option.toolTip:setVisible(false)
	      		if padLock then
	      			local color = " <RGB:0,0.8,0> "
	        		option.toolTip.description = color .. getText("IGUI_addOption_YouHavePadlock").. " <LINE> ".. " <LINE> "
	        		local color = " <RGB:0.8,0.8,0.8> "
	        		option.toolTip.description = option.toolTip.description.. color .. getText("IGUI_addOption_YouHavePadlock_info")
	      		else
	      			local color = " <RGB:0.9,0,0> "
	            	option.toolTip.description = color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Padlock"))-- .. " <LINE> "
	            	option.notAvailable = true
	      		end
			--------------------------------------------------------------------------------------------------------------- HATCH WITHOUT LOCK NOT LOCKED
	      	elseif padlockIsAllowed and basementData.PadLock and basementData.PadLock == 1 then
	      		--------------------------------------------------
	      		local option1 = context:addOptionOnTop(getText("IGUI_addOption_context_lock_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,1);
	      		--------------------------------------------------
	      		local option2 = context:addOption(getText("IGUI_addOption_context_remove_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,-1);
	      		option2.toolTip = ISToolTip:new()
	        	option2.toolTip:initialise()
	        	option2.toolTip:setVisible(false)
	      		--------------------------------------------------
	           	local option3 = context:addOption(getText("IGUI_addOption_context_removeWithoutKey_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,-3);
	            option3.toolTip = ISToolTip:new()
	        	option3.toolTip:initialise()
	        	option3.toolTip:setVisible(false)
	            local color = " <RGB:0.9,0.5,0> "
	        	option3.toolTip.description = color .. getText("IGUI_addOption_YouWillDestroyeThePadLock")
	        	--------------------------------------------------	
	      		if haveThisKeyId ~= nil or isAdmin() then
	      			local color = " <RGB:0,0.8,0> "
	         		option2.toolTip.description = color .. getText("IGUI_addOption_YouHaveTheKey")
	         	elseif currentBasement and lockInsideWithoutKey then -- sandboxoption 	
	            	local color = " <RGB:0.9,0,0> "
	            	option2.toolTip.description = color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Key1"))
	            	option2.notAvailable = true
	           else
	        		option1.toolTip = ISToolTip:new()
	        		option1.toolTip:initialise()
	        		option1.toolTip:setVisible(false)
	            	local color = " <RGB:0.9,0,0> "
	            	option1.toolTip.description = color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Key1"))
	            	option1.notAvailable = true
	            	option2.toolTip.description = color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Key1"))
	            	option2.notAvailable = true
	        	end
	
			--------------------------------------------------------------------------------------------------------------- HATCH WITH LOCK LOCKED
	      	elseif basementData.PadLock and basementData.PadLock > 1 then
	      		--------------------------------------------------
	      		local option = context:addOptionOnTop(getText("IGUI_addOption_context_unlock_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,2);
	      		--------------------------------------------------
	      		
	
	      		if haveThisKeyId ~= nil or isAdmin() then
	      			--local color = " <RGB:0,0.8,0> "
	        		--option.toolTip.description = color .. getText("IGUI_addOption_YouHaveTheKey")
	            elseif currentBasement and unlockInsideWithoutKey then -- sandboxoption 
	            	--local color = " <RGB:0,0.8,0> "
	            	--option.toolTip.description = color .. getText("IGUI_addOption_YouCanUnlockInside")
	            else
	            	option.toolTip = ISToolTip:new()
	        		option.toolTip:initialise()
	        		option.toolTip:setVisible(false)
	            	local color = " <RGB:0.9,0,0> "
	            	option.toolTip.description = color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Key1"))
	            	option.notAvailable = true
	        	end
	      		--------------------------------------------------
	        	--local crowbarCondition = crowbar:getCondition()
	        	-----------------------------------------------
				local CrowbarvanillaBasement = SandboxVars.BasementAddOptions.CrowbarvanillaBasement 	and basementData and  (basementData.basementId < 10000 or currentBasement) 
    			local CrowbarplayerBasement  = SandboxVars.BasementAddOptions.CrowbarplayerBasement 	and basementData and  basementData.type == "playerBasement"
    			local CrowbarSewer 			 = SandboxVars.BasementAddOptions.CrowbarSewer 				and basementData and  basementData.type == "sewer"
    			local CrowbarTravel 		 = SandboxVars.BasementAddOptions.CrowbarTravel 			and basementData and  basementData.type == "travel"
    			local CrowbarBasement 		 = SandboxVars.BasementAddOptions.CrowbarBasement 			and basementData and (basementData.type == "basement" or (currentHatchData and not currentHatchData.type))
    			local Admin 				 = isAdmin() and basementData

    			local CrowbarIsAllowed = CrowbarvanillaBasement or CrowbarplayerBasement or CrowbarSewer or CrowbarTravel or CrowbarBasement or Admin

	        	if crowbar and (CrowbarIsAllowed or isAdmin()) then 
	        		---------------------------------------------------------------------------------------------------------
	      			local option = context:addOption(getText("IGUI_addOption_context_force_padlock"), playerObj, Basement_addOptions.PadLock,currentHatch,currentBasement,id,keyId,-2);
	      			--------------------------------------------------
	      			option.toolTip = ISToolTip:new()
	        		option.toolTip:initialise()
	        		option.toolTip:setVisible(false)
	            	local color = " <RGB:0.8,0.8,0.8> "
	            	local chanceToSucceed = SandboxVars.BasementAddOptions.chanceToSucceedBreakPadlockAction +1
	            	option.toolTip.description = color .. getText("IGUI_addOption_ForcePadlockWithCrowbar") .. " <LINE> ".. " <LINE> "
	        		local color = " <RGB:0,0.8,0> "
	        		option.toolTip.description = option.toolTip.description .. color .. getText("IGUI_addOption_ForcePadlockWithCrowbar_youHaveOneChanceTo") .. chanceToSucceed .. getText("IGUI_addOption_ForcePadlockWithCrowbar_toSuccess")
	        	end
	      		---------------------------------------------------------------------------------------------------------
	      	end
	    end
--    else
--    	--- Build special hatch from playerBasement list
--        if Basement.CanCreateHatchOnSquare(square) then
--            if ISBuildMenu.cheat == true or (playerInv:getFirstTagRecurse("Hammer") and playerInv:getFirstTagRecurse("DigGrave")) then
--                local function doBuildHatch(size)
--                    local multiplier = size == "medium" and 2 or size == "large" and 3 or 1;
--                    local hatch = ISHatch:new("BasementHatch", size, Basement.HatchSprite[size]);
--                    hatch.modData["xp:Woodwork"] = 200;
--                    hatch.modData["need:Base.Plank"] = tostring(20 * multiplier);
--                    hatch.modData["need:Base.Nails"] = tostring(30 * multiplier);
--                    hatch.player = player;
--                    hatch.completionSound = "BuildWoodenStructureLarge";
--                    getCell():setDrag(hatch, player);
--                end
--
--                local buildOption = context:addOptionOnTop("Basement");
--                local buildContext = ISContextMenu:getNew(context);
--                context:addSubMenu(buildOption, buildContext);
--
--                for _, size in pairs(Basement.Sizes) do
--                    local hatchOption = buildContext:addOption(getText("ContextMenu_BasementBuildHatch_" .. size), size, doBuildHatch);
--                    
--                    local recipeName = "build " .. size .. " basement";
--                    local magazine = getScriptManager():getItem("BasementMod.BasementsMag_" .. size);
--                    if not ISBuildMenu.cheat and not playerObj:isRecipeKnown(recipeName) then
--                        local tooltip = ISWorldObjectContextMenu.addToolTip();
--                        tooltip:setName(getText("ContextMenu_Hatch_" .. size));
--                        tooltip.description = getText("Tooltip_craft_hatchLearnRecipeDesc", magazine:getDisplayName()) .. tooltip.description;
--                        hatchOption.toolTip = tooltip;
--                        hatchOption.notAvailable = true;
--                    else
--                        local multiplier = size == "medium" and 2 or size == "large" and 3 or 1;
--                        local tooltip = ISBuildMenu.canBuild(20 * multiplier, 30 * multiplier, 2, 1, 0, 3 * multiplier, hatchOption, player);
--                        tooltip:setTexture(Basement.HatchSprite[size].E);
--                        tooltip:setName(getText("ContextMenu_Hatch_" .. size));
--                        tooltip.description = getText("Tooltip_craft_hatchDesc_" .. size) .. tooltip.description;
--                        if not ISBuildMenu.cheat and not hatchOption.notAvailable then
--                            hatchOption.notAvailable = not Basement.CanCreateHatchOfSizeOnSquare(square, size);
--                        end
--                    end
--
--                end
--            end
--        end	
    end
    if currentHatchData and Basement_addOptions.IsObjectHatch(currentHatch) then
    	local sandbox = SandboxVars.BasementAddOptions.timeElapsedToAllowTraveling
    	local currentHatchData = currentHatch:getModData().BasementMod
    	local basementId = currentHatch:getModData().BasementMod.basementId; 
    	local basementData = Basement.Data.Basements[basementId];
        local function doEnterBasement()
            if luautils.walkAdj(playerObj, currentHatch:getSquare()) then
                ISTimedActionQueue.add(EnterBasementAction:new(playerObj, basementId, currentHatch));
            end
        end

        if currentHatchData.type and currentHatchData.type == "travel" then
        	local function travelConfirm(this,button)
				if button.internal == "YES" then
					doEnterBasement()
			    end
			end
            local function travel()
            	local square = playerObj:getSquare()
            	if currentHatchData.buildingId == -1 then
        			pos = basementData.exitHatchPosition; --IGUI_ContextMenu_addOptionsEnter
        		elseif currentHatchData.buildingId == -2 then
        			pos = basementData.hatchPosition
        		end
        		if not pos then return end
        		local dist = playerObj:DistTo(pos.x,pos.y)
        		local txt =	" m"
        		local distTxt = dist
	     		if dist > 1000 then txt = " klm" ; distTxt = distTxt/1000 end
        		local txt = getText("IGUI_addOption_dialogInfo_travelConfirmationAndDistance") .. math.floor(distTxt) .. txt
        		local txt = txt .. "\n \n"..getText("IGUI_addOption_dialogInfo_travelConsuption")
        		local txt = txt .. "\n \n"..getText("IGUI_addOption_dialogInfo_travelAllowedByTimeElapsed") .. sandbox .. "h"
				local dialog = ISModalDialog:new(0,0, 250, 150, txt, true, nil, travelConfirm, 0)--IGUI_addOption_confirm_Travel_Confirm
			    dialog:initialise()
			    dialog:addToUIManager()
			end
        	context:addOptionOnTop(getText("IGUI_addOption_ContextMenu_addOptions_EnterTravel"), nil, travel); --
        elseif currentHatchData.buildingId == -1 then
        	context:addOptionOnTop(getText("IGUI_addOption_ContextMenu_addOptionsEnter"), nil, doEnterBasement); --
        elseif currentHatchData.buildingId == -2 then
        	context:addOptionOnTop(getText("IGUI_addOption_ContextMenu_addOptionsExit"), nil, doEnterBasement);--
        end
    end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	if isDebugEnabled() or isAdmin() then
	   	local adminOption2 = context.addDebugOption and context:addDebugOption("Basement Tools (addOptions)") or context:addOption("[DEBUG] Basement Tools (addOptions)");
		local adminContext = ISContextMenu:getNew(context);
		context:addSubMenu(adminOption2, adminContext);

		local basements = Basement.Data.Basements

	   	if currentHatch then
	   		--- Hatch on floor menu
	   		local hatchOnFloorOption = adminContext:addOption("Hatch on the floor");
        	local hatchOnFloorContext = ISContextMenu:getNew(adminContext);
        	adminContext:addSubMenu(hatchOnFloorOption, hatchOnFloorContext);
			------------------------------------------------------------------------------------------
			local hatchSize_targeted = Basement_addOptions.getHatchSizeBySprite(currentHatch)
			------------------------------------------------------------------------------------------
		   	if not currentHatchData and not Basement_addOptions.IsObjectHatch(currentHatch) then
	      	---Reassign existing Basement to new hatch
		   		local reassignToOption  = hatchOnFloorContext:addOption("Reassign "..hatchSize_targeted.." hatch to");
				local reassignToContext = ISContextMenu:getNew(hatchOnFloorContext);
		   		hatchOnFloorContext:addSubMenu(reassignToOption, reassignToContext);
	      		for _, basementData in pairs(Basement.Data.Basements) do 	-- Check all basements assigned only
	      		   local basement = Basement.FindById(basementData.basementId);
	      		   if basement and basement.size == hatchSize_targeted then
	      		      	local option   = reassignToContext:addOption("Assigned Basement #" .. basement.id, currentHatch, Basement_addOptions.reassign, basement.id);
	      		   		option.toolTip = ISToolTip:new()
        				option.toolTip:initialise()
        				option.toolTip:setVisible(false)
        				option.toolTip.description = getText("IGUI_addOption_Reassign_Assigned")
	      		   	end
	      		end	
	      		------------------------------------------------------------------------------------------
	      		---New assign to hatch where you want
	      		local assignToOption  = hatchOnFloorContext:addOption("Assign "..hatchSize_targeted.." hatch to");
				local assignToContext = ISContextMenu:getNew(hatchOnFloorContext);
		   		hatchOnFloorContext:addSubMenu(assignToOption, assignToContext);
		   		local basements = BasementAPI.GetBasements();
	      		for _, basement in ipairs(basements) do 								-- Check all basements
	      			local basementData = Basement.Data.Basements[basement.id];
	      		  	if not basementData then 												-- Check if basement is assigned or not
	      		   		if basement.size == hatchSize_targeted then 					-- Check if the size of current hatch tile == the size of the basement compared
	      					local option   = assignToContext:addOption("Free Basement #" .. basement.id, currentHatch, Basement_addOptions.reassign, basement.id);
	      		   			option.toolTip = ISToolTip:new()
        					option.toolTip:initialise()
        					option.toolTip:setVisible(false)
        					option.toolTip.description = getText("IGUI_addOption_Assign_FreeBasement")
	      		   		end
	      		   	end
	      		end
	    	elseif currentHatchData then
	    		local keyId = 0
	   			local hatchID = currentHatchData.basementId 
				----------------------------------------------
				local basementData = basements[hatchID];
	   			local multiplier = basementData.buildingId
				if multiplier and multiplier <= 0 then 
					multiplier = 9999 
				end
				local keyId = hatchID*multiplier
	    		--- info hatch
		    	if hatchID >= 10000 then
	               	local infoOption = hatchOnFloorContext:addOption("Hatch Info");
	            	infoOption.toolTip = ISToolTip:new()
	        		infoOption.toolTip:initialise()
	        		infoOption.toolTip:setVisible(false)
	            	if basementData and currentHatchData then
	            		infoOption.toolTip:setName("Hatch #" .. hatchID);
	            		if currentHatchData.type then
	            	    	infoOption.toolTip.description = "Category: " .. currentHatchData.type
	            	    else
	            	    	infoOption.toolTip.description = "Category: Unknow"
	            	    end

	            		if currentHatchData.buildingId == -1 then
	            	    	infoOption.toolTip.description = infoOption.toolTip.description.."\n Type: Entrance"
	            	    elseif currentHatchData.buildingId == -2 then
	            	    	infoOption.toolTip.description = infoOption.toolTip.description.."\n Type: Arrival"
	            	    else
	            	    	infoOption.toolTip.description = infoOption.toolTip.description.."\n Type: Unknow"
	            	    end
	            		if basementData.size then infoOption.toolTip.description = infoOption.toolTip.description .. "\n Size: " .. tostring(basementData.size) else infoOption.toolTip.description = "\n 	Size: " .. "unknow" end
	            		if basementData.hatchPosition then infoOption.toolTip.description = infoOption.toolTip.description .. " \n Entrance position: X:" .. basementData.hatchPosition.x .. " Y:" .. basementData.hatchPosition.y .. " Z:" .. basementData.hatchPosition.z; end
	            		if basementData.exitHatchPosition then infoOption.toolTip.description = infoOption.toolTip.description .. " \n Arrival position: X:" .. basementData.exitHatchPosition.x .. " Y:" .. basementData.exitHatchPosition.y .. " Z:" .. basementData.exitHatchPosition.z; end
	            	end
	            end
	      		local function GetHatchKey(keyId)
	      			local inventory = playerObj:getInventory()
	      			local key = inventory:AddItem("Base.KeyPadlock")
					key:setKeyId(keyId)
	      		end
	      		local option = hatchOnFloorContext:addOption("Get hatch key",keyId,GetHatchKey);
	    	end
	   	end-- end current hatch
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
	   	--- Special hatchs menu
	   	local specialHatchOption  = adminContext:addOption("Special Hatch");
        local specialHatchContext = ISContextMenu:getNew(adminContext);
        adminContext:addSubMenu(specialHatchOption, specialHatchContext);
	    for _, optionAdminMenu in pairs(Basement_addOptions.optionAdminMenu) do 
		   	--- Admin option
	        local assignedOption  = specialHatchContext:addOption(optionAdminMenu);
	        local assignedContext = ISContextMenu:getNew(specialHatchContext);
	        specialHatchContext:addSubMenu(assignedOption, assignedContext);
	        assignedOption.notAvailable = true
	        ------------------------------------------------------------------------------------------
	        for type, data in pairs(Basement_addOptions.typeSprite) do
	      	---  Option Name
		      	if type ~= "exit" then
	 	        	local typeOption  = assignedContext:addOption(type);
		        	local typeContext = ISContextMenu:getNew(assignedContext);
		        	assignedContext:addSubMenu(typeOption, typeContext);
		        	typeOption.notAvailable = true
	
			       	for _, size in pairs(Basement.Sizes) do
					-- Option by size
			       	    local hatchSizeOption  = typeContext:addOption(size);
			       	    local hatchSizeContext = ISContextMenu:getNew(typeContext);
			       	    typeContext:addSubMenu(hatchSizeOption, hatchSizeContext);
						hatchSizeOption.notAvailable = true
			       	    for _, basement in pairs(basements) do
				   		--- Special hatch id
			        	 	local assigned 	 = optionAdminMenu == "assigned"   and basement.buildingId == -2
			        	 	local unassigned = optionAdminMenu == "unassigned" and basement.buildingId == -3
			        	 	local pending 	 = optionAdminMenu == "pending"    and basement.buildingId == -1
		
			        	    if basement.size == size and basement.type == type and (assigned or unassigned or pending) then
			        	    	typeOption.notAvailable = false
			        	    	hatchSizeOption.notAvailable = false
			        	    	assignedOption.notAvailable = false
			        	    	local HatchOption  = hatchSizeContext:addOption(type .." #" .. basement.basementId);
			        	 		local HatchContext = ISContextMenu:getNew(hatchSizeContext);
			        	 		hatchSizeContext:addSubMenu(HatchOption, HatchContext);
			
			        	        local option 				= HatchContext:addOption("Teleport to entrance"	, playerObj, Basement_addOptions.EnterBasementId, basement.basementId,-2);
			        	        local optionArrival 		= HatchContext:addOption("Teleport to arrival"	, playerObj, Basement_addOptions.EnterBasementId, basement.basementId,-1);

			        	        local option 				= HatchContext:addOption("Rebuild entrance"		, playerObj, Basement_addOptions.RebuildHatchId, basement.basementId,-1);
			        	        option.toolTip = ISToolTip:new()
			        			option.toolTip:initialise()
			        			option.toolTip:setVisible(false)
			        			option.toolTip.description = getText("IGUI_addOption_Info_RebuildAssignedHatch")

			        	        local optionRebuildArrival 	= HatchContext:addOption("Rebuild arrival"		, playerObj, Basement_addOptions.RebuildHatchId, basement.basementId,-2);
			        	        optionRebuildArrival.toolTip = ISToolTip:new()
			        			optionRebuildArrival.toolTip:initialise()
			        			optionRebuildArrival.toolTip:setVisible(false)
			        			optionRebuildArrival.toolTip.description = getText("IGUI_addOption_Info_RebuildAssignedHatch")

			        	        if basement.buildingId == -2 then optionArrival.notAvailable = false ; optionRebuildArrival.notAvailable = false else optionArrival.notAvailable = true ; optionRebuildArrival.notAvailable = true end
			        	        ------------------------------------------------------------------------------------------
								local function dialogConfirm(this,button,typeOptionAdminMenu)
									if button.internal == "YES" then
										local v = {}
										if (typeOptionAdminMenu == "reassign" and unassigned) then
											v.exitHatchPosition = {x=basement.exitHatchPosition.x,y=basement.exitHatchPosition.y,z=basement.exitHatchPosition.z}
										 	v.buildingId = -2
										elseif(typeOptionAdminMenu == "unassign" and assigned) then
											v.exitHatchPosition = {x=basement.exitHatchPosition.x,y=basement.exitHatchPosition.y,z=basement.exitHatchPosition.z}
										 	v.buildingId = -3
										elseif(typeOptionAdminMenu == "resume" and pending) then
											Basement_addOptions.RebuildHatchId(playerObj, basement.basementId,-2)
											return
										elseif(typeOptionAdminMenu == "remove" and (unassigned or pending)) then
											v.exitHatchPosition = {x=0,y=0,z=0}
											v.buildingId = -4
										else
											print("is bugged "..tostring(typeOptionAdminMenu))
											return
										end
		
										local basementId = basement.basementId
										local x  = basement.hatchPosition.x
										local y  = basement.hatchPosition.y
										local z  = basement.hatchPosition.z
			
								    	local x2 = v.exitHatchPosition.x
								    	local y2 = v.exitHatchPosition.y
								    	local z2 = v.exitHatchPosition.z
			
								    	local size = basement.size
								    	local type = basement.type
			
										Basement_addOptions.reassignSpecialHatch(basementId,v.buildingId,x,y,z,x2,y2,z2,type,size)
								    end
								end
			        	       	local function dialog(typeOptionAdminMenu)
									local dialog = ISModalDialog:new(0,0, 250, 150, getText("IGUI_addOption_context_Debug_Confirm"), true, nil, dialogConfirm, 0,typeOptionAdminMenu)
								    dialog:initialise()
								    dialog:addToUIManager()
								end
								for _, typeOptionAdminMenu in pairs(Basement_addOptions.typeOptionAdminMenu) do
									if (typeOptionAdminMenu == "reassign" and unassigned) or 
										(typeOptionAdminMenu == "unassign" and assigned) or 
										(typeOptionAdminMenu == "resume" and pending) or 
										(typeOptionAdminMenu == "remove" and (unassigned or pending)) then
		
			        	        		local option   = HatchContext:addDebugOption(typeOptionAdminMenu,typeOptionAdminMenu,dialog);
			        	        		option.toolTip = ISToolTip:new()
			        					option.toolTip:initialise()
			        					option.toolTip:setVisible(false)
			        					option.toolTip.description = getText("IGUI_addOption_Info_optionAdminMenu_"..typeOptionAdminMenu)
			        				end
			        			end
			        		end
			        	end
			        end
			    end
			end
		end
        ------------------------------------------------------------------------------------------
	   	local createHatchOption = specialHatchContext:addOption("Build special hatch");
        local createHatchContext = ISContextMenu:getNew(specialHatchContext);
        specialHatchContext:addSubMenu(createHatchOption, createHatchContext);
	      	
	      --- Create special hatch option
	   	if Basement_addOptions.GlobalVar and Basement_addOptions.GlobalVar.CreateSpecialHatchData ~= nil then
	   		local SpecialHatchData = Basement_addOptions.GlobalVar.CreateSpecialHatchData
	   		local option   = context:addOptionOnTop("Cancel build of special hatch",playerId, Basement_addOptions.doBuildHatch,nil, nil,nil);
	   		option.toolTip = ISToolTip:new()
        	option.toolTip:initialise()
        	option.toolTip:setVisible(false)
        	option.toolTip.description = getText("IGUI_addOption_Info_CancelBuildSpecialHatch")
	   		if SpecialHatchData.buildingId == -1 then
		   		local type 	   = SpecialHatchData.type
		   		local size 	   = SpecialHatchData.size
		   		local option   = createHatchContext:addOption("Build special arrival hatch",playerId, Basement_addOptions.doBuildHatch,type, size,-2);
		   		option.toolTip = ISToolTip:new()
	        	option.toolTip:initialise()
	        	option.toolTip:setVisible(false)
	        	option.toolTip.description = getText("IGUI_addOption_Info_BuildSpecialArrivalHatch")
	
		   		local option   = context:addOptionOnTop("Build special arrival hatch",playerId, Basement_addOptions.doBuildHatch,type, size,-2);
		   		option.toolTip = ISToolTip:new()
	        	option.toolTip:initialise()
	        	option.toolTip:setVisible(false)
	        	option.toolTip.description = getText("IGUI_addOption_Info_BuildSpecialArrivalHatch")
	        end
	   		local option   = createHatchContext:addOption("Cancel build of special hatch",playerId, Basement_addOptions.doBuildHatch,nil, nil,nil);
	   		option.toolTip = ISToolTip:new()
        	option.toolTip:initialise()
        	option.toolTip:setVisible(false)
        	option.toolTip.description = getText("IGUI_addOption_Info_CancelBuildSpecialHatch")
	   	else
	   		for type, data in pairs(Basement_addOptions.typeSprite) do
	   			if type ~= "exit"then
	   				local createTravelHatchOption = createHatchContext:addOption(type);
        			local createTravelHatchContext = ISContextMenu:getNew(createHatchContext);
        			createHatchContext:addSubMenu(createTravelHatchOption, createTravelHatchContext);
	   				for _, size in pairs(Basement.Sizes) do
	   					local option = createTravelHatchContext:addOption(size,playerId, Basement_addOptions.doBuildHatch,type,size,-1);
	   					option.toolTip = ISToolTip:new()
        				option.toolTip:initialise()
        				option.toolTip:setVisible(false)
        				local txt = "IGUI_addOption_Info_Build_".. type .."_SpecialHatch"
        				option.toolTip.description = getText(txt)
        				if type == "playerBasement" then option.notAvailable = true end
	   				end
	   			end
	   		end
	   	end
	end
end

local function onFillWorldObjectContextMenu(playerId, context, worldobjects, test)
	if getCore():getGameMode() == 'LastStand' then return; end
    if test then return; end
    local playerObj = getSpecificPlayer(playerId);
    local square = clickedSquare --clickedSquare --or playerObj:getSquare();
    if not square or playerObj:getVehicle() then return end
    if square:DistTo(playerObj) > 6 then return end
    local squareX, squareY, squareZ = square:getX(), square:getY(), square:getZ();
    local currentHatch = Basement_addOptions.GetHatchOnSquare(square);  
    local currentBasement = Basement.FindByPosition(squareX, squareY, squareZ);
    if not currentHatch then
        for xx = squareX - 1, squareX + 1 do
            for yy = squareY - 1, squareY + 1 do
                local sq = getSquare(xx, yy, squareZ)
                currentHatch = Basement_addOptions.GetHatchOnSquare(sq);
                if currentHatch then break end;
            end
            if currentHatch then break end;
       	end
    end
    AddOption_Menu(playerId, playerObj, context, currentHatch, currentBasement, square)
end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu);
