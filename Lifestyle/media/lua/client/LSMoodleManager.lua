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

LSMoodleManager = LSMoodleManager or {};
LSMoodleManager.LSMoodles = {}
local MoodleManagerEnabled = false
local MoodleManagerPlayerSpawn = false
--local MoodleManagerPlayerDeath = false


LSMoodleManager.init = function(player)

	player:getModData().LSMoodles = player:getModData().LSMoodles or {}; 

	--COUCH POTATO HOMESICK AND AT HOME MOODLES
	--we use this to add couch potato homesick state params
    if player:getModData().LSMoodles["AtHouse"] == nil then
        player:getModData().LSMoodles["AtHouse"] = {};
        player:getModData().LSMoodles["AtHouse"].Level = 0;
        player:getModData().LSMoodles["AtHouse"].Value = 0.0;
		player:getModData().LSMoodles["AtHouse"].Tiers = 0;
		player:getModData().LSMoodles["AtHouse"].Alignment = "Good";
    end
	--we use this to add couch potato homesick state params
    if player:getModData().LSMoodles["HomeSick"] == nil then
        player:getModData().LSMoodles["HomeSick"] = {};
        player:getModData().LSMoodles["HomeSick"].Level = 0;
        player:getModData().LSMoodles["HomeSick"].Value = 0.0;
		player:getModData().LSMoodles["HomeSick"].Tiers = 3;
		player:getModData().LSMoodles["HomeSick"].Alignment = "Bad";
    end
	--we use this to guarantee new values are added to current saves
	if player:getModData().LSMoodles["AtHouse"].Tiers == nil or player:getModData().LSMoodles["HomeSick"].Tiers == nil then
	player:getModData().LSMoodles["AtHouse"].Tiers = 0;
	player:getModData().LSMoodles["HomeSick"].Tiers = 3;
	end
	if player:getModData().LSMoodles["AtHouse"].Alignment == nil or player:getModData().LSMoodles["HomeSick"].Alignment == nil then
	player:getModData().LSMoodles["AtHouse"].Alignment = "Good";
	player:getModData().LSMoodles["HomeSick"].Alignment = "Bad";
	end
	if player:getModData().LSMoodles["AtHouse"].Value == nil or player:getModData().LSMoodles["HomeSick"].Value == nil then
	player:getModData().LSMoodles["AtHouse"].Value = 0;
	player:getModData().LSMoodles["HomeSick"].Value = 0;
	end
	if player:getModData().LSMoodles["AtHouse"].Level == nil or player:getModData().LSMoodles["HomeSick"].Level == nil then
	player:getModData().LSMoodles["AtHouse"].Level = 0;
	player:getModData().LSMoodles["HomeSick"].Level = 0;
	end

	--MEDITATION MOODLES
	--we use this to add meditation mindfulness state params
    if player:getModData().LSMoodles["MindfulState"] == nil then
        player:getModData().LSMoodles["MindfulState"] = {};
        player:getModData().LSMoodles["MindfulState"].Level = 0;
        player:getModData().LSMoodles["MindfulState"].Value = 0.0;
		player:getModData().LSMoodles["MindfulState"].Tiers = 2;
		player:getModData().LSMoodles["MindfulState"].Alignment = "Good";
    end
	--we use this to guarantee new values are added to current saves
	if player:getModData().LSMoodles["MindfulState"].Tiers == nil then
	player:getModData().LSMoodles["MindfulState"].Tiers = 2;
	end
	if player:getModData().LSMoodles["MindfulState"].Alignment == nil then
	player:getModData().LSMoodles["MindfulState"].Alignment = "Good";
	end
	if player:getModData().LSMoodles["MindfulState"].Value == nil then
	player:getModData().LSMoodles["MindfulState"].Value = 0;
	end
	if player:getModData().LSMoodles["MindfulState"].Level == nil then
	player:getModData().LSMoodles["MindfulState"].Level = 0;
	end
	
	--MUSIC MOODLES - Good, Bad, Neutral, Hate
	--we use this to add music good and neutral state params
    if player:getModData().LSMoodles["MusicGood"] == nil then
        player:getModData().LSMoodles["MusicGood"] = {};
        player:getModData().LSMoodles["MusicGood"].Level = 0;
        player:getModData().LSMoodles["MusicGood"].Value = 0.0;
		player:getModData().LSMoodles["MusicGood"].Tiers = 1;
		player:getModData().LSMoodles["MusicGood"].Alignment = "Good";
    end
	--we use this to add music bad and hate state params
    if player:getModData().LSMoodles["MusicBad"] == nil then
        player:getModData().LSMoodles["MusicBad"] = {};
        player:getModData().LSMoodles["MusicBad"].Level = 0;
        player:getModData().LSMoodles["MusicBad"].Value = 0.0;
		player:getModData().LSMoodles["MusicBad"].Tiers = 1;
		player:getModData().LSMoodles["MusicBad"].Alignment = "Bad";
    end
	--we use this to guarantee new values are added to current saves
	if player:getModData().LSMoodles["MusicGood"].Tiers == nil or player:getModData().LSMoodles["MusicBad"].Tiers == nil then
	player:getModData().LSMoodles["MusicGood"].Tiers = 1;
	player:getModData().LSMoodles["MusicBad"].Tiers = 1;
	end
	if player:getModData().LSMoodles["MusicGood"].Alignment == nil or player:getModData().LSMoodles["MusicBad"].Alignment == nil then
	player:getModData().LSMoodles["MusicGood"].Alignment = "Good";
	player:getModData().LSMoodles["MusicBad"].Alignment = "Bad";
	end
	if player:getModData().LSMoodles["MusicBad"].Value == nil or player:getModData().LSMoodles["MusicGood"].Value == nil then
	player:getModData().LSMoodles["MusicBad"].Value = 0;
	player:getModData().LSMoodles["MusicGood"].Value = 0;
	end
	if player:getModData().LSMoodles["MusicBad"].Level == nil or player:getModData().LSMoodles["MusicGood"].Level == nil then
	player:getModData().LSMoodles["MusicBad"].Level = 0;
	player:getModData().LSMoodles["MusicGood"].Level = 0;
	end

	--DJ MOODLES - DJ audience
	--we use this to add DJ Audience state params
    if player:getModData().LSMoodles["DJAudience"] == nil then
        player:getModData().LSMoodles["DJAudience"] = {};
        player:getModData().LSMoodles["DJAudience"].Level = 0;
        player:getModData().LSMoodles["DJAudience"].Value = 0.0;
		player:getModData().LSMoodles["DJAudience"].Tiers = 2;
		player:getModData().LSMoodles["DJAudience"].Alignment = "Good";
    end
	--we use this to guarantee new values are added to current saves
	if player:getModData().LSMoodles["DJAudience"].Tiers == nil then
	player:getModData().LSMoodles["DJAudience"].Tiers = 2;
	end
	if player:getModData().LSMoodles["DJAudience"].Alignment == nil then
	player:getModData().LSMoodles["DJAudience"].Alignment = "Good";
	end
	if player:getModData().LSMoodles["DJAudience"].Value == nil then
	player:getModData().LSMoodles["DJAudience"].Value = 0;
	end
	if player:getModData().LSMoodles["DJAudience"].Level == nil then
	player:getModData().LSMoodles["DJAudience"].Level = 0;
	end

	--PARTY MOODLES - good and bad (Used by Party Animal and Killjoy traits while listening to the jukebox/djbooth or dacing or djing, with people and with disco balls)
	--we use this to add DJ Audience state params
    if player:getModData().LSMoodles["PartyGood"] == nil then
        player:getModData().LSMoodles["PartyGood"] = {};
        player:getModData().LSMoodles["PartyGood"].Level = 0;
        player:getModData().LSMoodles["PartyGood"].Value = 0.0;
		player:getModData().LSMoodles["PartyGood"].Tiers = 2;
		player:getModData().LSMoodles["PartyGood"].Alignment = "Good";
    end
	--we use this to add music bad and hate state params
    if player:getModData().LSMoodles["PartyBad"] == nil then
        player:getModData().LSMoodles["PartyBad"] = {};
        player:getModData().LSMoodles["PartyBad"].Level = 0;
        player:getModData().LSMoodles["PartyBad"].Value = 0.0;
		player:getModData().LSMoodles["PartyBad"].Tiers = 2;
		player:getModData().LSMoodles["PartyBad"].Alignment = "Bad";
    end
	--we use this to guarantee new values are added to current saves
	if player:getModData().LSMoodles["PartyGood"].Tiers == nil or player:getModData().LSMoodles["PartyBad"].Tiers == nil then
	player:getModData().LSMoodles["PartyGood"].Tiers = 2;
	player:getModData().LSMoodles["PartyBad"].Tiers = 2;
	end
	if player:getModData().LSMoodles["PartyGood"].Alignment == nil or player:getModData().LSMoodles["PartyBad"].Alignment == nil then
	player:getModData().LSMoodles["PartyGood"].Alignment = "Good";
	player:getModData().LSMoodles["PartyBad"].Alignment = "Bad";
	end
	if player:getModData().LSMoodles["PartyGood"].Value == nil or player:getModData().LSMoodles["PartyBad"].Value == nil then
	player:getModData().LSMoodles["PartyGood"].Value = 0;
	player:getModData().LSMoodles["PartyBad"].Value = 0;
	end
	if player:getModData().LSMoodles["PartyGood"].Level == nil or player:getModData().LSMoodles["PartyBad"].Level == nil then
	player:getModData().LSMoodles["PartyGood"].Level = 0;
	player:getModData().LSMoodles["PartyBad"].Level = 0;
	end

	--EMBARRASSED MOODLE
    if player:getModData().LSMoodles["Embarrassed"] == nil then
        player:getModData().LSMoodles["Embarrassed"] = {};
        player:getModData().LSMoodles["Embarrassed"].Level = 0;
        player:getModData().LSMoodles["Embarrassed"].Value = 0.0;
		player:getModData().LSMoodles["Embarrassed"].Tiers = 0;
		player:getModData().LSMoodles["Embarrassed"].Alignment = "Bad";
    end
	--we use this to guarantee new values are added to current saves, if a change happens add "and .valuechanged ~= newvalue then"
	if player:getModData().LSMoodles["Embarrassed"].Tiers == nil then
	player:getModData().LSMoodles["Embarrassed"].Tiers = 0;
	end
	if player:getModData().LSMoodles["Embarrassed"].Alignment == nil then
	player:getModData().LSMoodles["Embarrassed"].Alignment = "Bad";
	end
	if player:getModData().LSMoodles["Embarrassed"].Value == nil then
	player:getModData().LSMoodles["Embarrassed"].Value = 0;
	end
	if player:getModData().LSMoodles["Embarrassed"].Level == nil then
	player:getModData().LSMoodles["Embarrassed"].Level = 0;
	end

end

function LSMoodleManager.getMoodle(moodleName)
    return LSMoodleManager.LSMoodles[moodleName];
end

LSMoodleManager.getValue = function(moodleName)
	if MoodleManagerEnabled == false then return 0 end
    local player = getPlayer()
   LSMoodleManager.init(player)
    return player:getModData().LSMoodles[moodleName].Value
end

LSMoodleManager.getLevel = function(moodleName)
    local player = getPlayer()
    LSMoodleManager.init(player)

    return player:getModData().LSMoodles[moodleName].Level
end

LSMoodleManager.setValue = function(moodleName, value)
	if MoodleManagerEnabled == false then return end
    local player = getPlayer()
    LSMoodleManager.init(player)

    player:getModData().LSMoodles[moodleName].Value = value
end

LSMoodleManager.newType = function(player, moodleName)

	--if MoodleManagerEnabled == false then return end
	if player ~= nil then
	--get screen and font
    local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small);
    local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium);
    local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large);
    local SCREEN_X = getCore():getScreenWidth();
    local SCREEN_Y = getCore():getScreenHeight();
    local WIDTH = 31;
    local HEIGHT = 50;
	--wiggle motion
    local enableWiggle, wiggle, wiggleX, wiggleY, wiggleBidirectional, wiggleDegradation = false, 0, 0, 0, false, 0;
	--init
    LSMoodleManager.init(player);

    local ISMoodles = ISUIElement:derive("ISMoodles");

    ISMoodles.initialise = function(LSMoodleManager)
        ISUIElement:initialise(LSMoodleManager);
    end
	--MoodleManagerEnabled = true
    ISMoodles.render = function(LSMoodleManager)
		--if MoodleManagerEnabled == false then return end
		if MoodleManagerEnabled == true and player:getModData().LSMoodles[moodleName] ~= nil then
        local moodleLevel = LSMoodleManager:level();
        local icon = getTexture("media/ui/moodles/"..moodleName..".png");

        if enableWiggle then
            if wiggleBidirectional then
                wiggle = wiggle - 13;
                wiggleX = wiggle * math.sin(0.5);
                if wiggle <= -30 then
                    wiggleBidirectional = false;
                    wiggleDegradation = wiggleDegradation + 1;
                end
            else 
                wiggle = wiggle + 13;
                wiggleX = wiggle * math.sin(0.5);
                if wiggle >= 30 then
                    wiggleBidirectional = true;
                    wiggleDegradation = wiggleDegradation + 1;
                end
            end
        end

        if wiggleDegradation > 2 then
            enableWiggle = false;
                
            if wiggle <= 2 and wiggle >= -2 then
                wiggleX = 0;
                wiggleDegradation = 0;
            elseif wiggle < 0 then
                wiggle = wiggle + 5;
                wiggleX = wiggle * math.sin(0.5);
            elseif wiggle > 0 then
                wiggle = wiggle - 5;
                wiggleX = wiggle * math.sin(0.5);
            end
        end

        if moodleLevel == 0 then
            if player:getModData().LSMoodles[moodleName].Level ~= 0 then
                player:getModData().LSMoodles[moodleName].Level = 0;
            end
        end

		local alignment = player:getModData().LSMoodles[moodleName].Alignment

        if moodleLevel == 1 then
            LSMoodleManager:drawTexture(getTexture("media/ui/Moodle_Bkg_"..alignment.."_1.png"), wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:mouseOverMoodle(getText("Moodles_"..moodleName.."_L1"), getText("Moodles_"..moodleName.."_L1_desc"))
                
            if player:getModData().LSMoodles[moodleName].Level ~= 1 then
                player:getModData().LSMoodles[moodleName].Level = 1;
                enableWiggle = true;
                if ZombRand(2) == 0 then
                    wiggleBidirectional = true;
                else
                    wiggleBidirectional = false;
                end
                --print("Level now is 1");
            end
        end

        if moodleLevel == 2 then
            LSMoodleManager:drawTexture(getTexture("media/ui/Moodle_Bkg_"..alignment.."_2.png"), wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:mouseOverMoodle(getText("Moodles_"..moodleName.."_L2"), getText("Moodles_"..moodleName.."_L2_desc"))

            if player:getModData().LSMoodles[moodleName].Level ~= 2 then
                player:getModData().LSMoodles[moodleName].Level = 2;
                enableWiggle = true;
                if ZombRand(2) == 0 then
                    wiggleBidirectional = true;
                else
                    wiggleBidirectional = false;
                end
                --print("Level now is 2");
            end
        end

        if moodleLevel == 3 then
            LSMoodleManager:drawTexture(getTexture("media/ui/Moodle_Bkg_"..alignment.."_3.png"), wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:mouseOverMoodle(getText("Moodles_"..moodleName.."_L3"), getText("Moodles_"..moodleName.."_L3_desc"))

            if player:getModData().LSMoodles[moodleName].Level ~= 3 then
                player:getModData().LSMoodles[moodleName].Level = 3;
                enableWiggle = true;
                if ZombRand(2) == 0 then
                    wiggleBidirectional = true;
                else
                    wiggleBidirectional = false;
                end
                --print("Level now is 3");
            end
        end

        if moodleLevel == 4 then
            LSMoodleManager:drawTexture(getTexture("media/ui/Moodle_Bkg_"..alignment.."_4.png"), wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:mouseOverMoodle(getText("Moodles_"..moodleName.."_L4"), getText("Moodles_"..moodleName.."_L4_desc"))

            if player:getModData().LSMoodles[moodleName].Level ~= 4 then
                player:getModData().LSMoodles[moodleName].Level = 4;
                enableWiggle = true;
                if ZombRand(2) == 0 then
                    wiggleBidirectional = true;
                else
                    wiggleBidirectional = false;
                end
                --print("Level now is 4");
            end
        end


		if moodleLevel == 4 and player:getModData().LSMoodles[moodleName].Tiers ~= 0 then
			if player:getModData().LSMoodles[moodleName].Tiers == 3 then
				icon = getTexture("media/ui/moodles/"..moodleName.."3.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			elseif player:getModData().LSMoodles[moodleName].Tiers == 2 then
				icon = getTexture("media/ui/moodles/"..moodleName.."2.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			elseif player:getModData().LSMoodles[moodleName].Tiers == 1 then
				icon = getTexture("media/ui/moodles/"..moodleName.."1.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			end
		elseif moodleLevel == 3 and player:getModData().LSMoodles[moodleName].Tiers ~= 0 then
		--print("mood level is 3 and tiers is "..tonumber(player:getModData().LSMoodles[moodleName].Tiers))
			if player:getModData().LSMoodles[moodleName].Tiers == 3 then
				icon = getTexture("media/ui/moodles/"..moodleName.."2.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			elseif player:getModData().LSMoodles[moodleName].Tiers == 2 then
				icon = getTexture("media/ui/moodles/"..moodleName.."2.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			elseif player:getModData().LSMoodles[moodleName].Tiers == 1 then
				icon = getTexture("media/ui/moodles/"..moodleName.."1.png")
				LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
				LSMoodleManager:bringToTop();
			end
		elseif moodleLevel == 2 and player:getModData().LSMoodles[moodleName].Tiers ~= 0 then
		--print("mood level 2 using icon 2")
			icon = getTexture("media/ui/moodles/"..moodleName.."1.png")
            LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:bringToTop();
        elseif moodleLevel ~= 0 then
            LSMoodleManager:drawTexture(icon, wiggleX, 0, 1, 1, 1, 1);
            LSMoodleManager:bringToTop();
        end

        local x, y = ISMoodles:updateLSMoodles();
        if y ~= LSMoodleManager:getY() then LSMoodleManager:setY(y) end--]]
		end
    end

    ISMoodles.mouseOverMoodle = function(LSMoodleManager, title, description)
	--if MoodleManagerEnabled == false then return end
		if MoodleManagerEnabled == true and player:getModData().LSMoodles[moodleName] ~= nil then
        local rectWidth = 5;
        local rectHeight = 31;

        if LSMoodleManager:isMouseOver() then
            local titleLength = getTextManager():MeasureStringX(UIFont.Small, title) + 7;
            local descriptionLength = getTextManager():MeasureStringX(UIFont.Small, description) + 7;

            if titleLength >= descriptionLength then
                LSMoodleManager:drawRect(-4 - (rectWidth + titleLength), 0, rectWidth + titleLength, rectHeight, 0.6, 0, 0, 0);
            elseif titleLength <= descriptionLength then
                LSMoodleManager:drawRect(-4 - (rectWidth + descriptionLength), 0, rectWidth + descriptionLength, rectHeight, 0.6, 0, 0, 0);
            end

            LSMoodleManager:drawTextRight(title, -10, 2, 1, 1, 1, 1);
            LSMoodleManager:drawTextRight(description, -10, 15, 1, 1, 1, 0.7);
        end
		end
    end

    ISMoodles.level = function(LSMoodleManager)
	--if MoodleManagerEnabled == false then return end
		if MoodleManagerEnabled == true and player:getModData().LSMoodles[moodleName] ~= nil then
        local value = player:getModData().LSMoodles[moodleName].Value;

        if value >= 0.7 then
            return 4
        elseif value >= 0.5 then
            return 3
        elseif value >= 0.3 then
            return 2
        elseif value >= 0.15 then
            return 1
        end

        return 0
		end
    end

    ISMoodles.updateLSMoodles = function(LSMoodleManager)
	--if MoodleManagerEnabled == false then return end
		--if MoodleManagerEnabled == true and player:getModData().LSMoodles[moodleName] ~= nil then
        local x = (SCREEN_X - WIDTH) - 19;
        local y = 101;
		if MoodleManagerEnabled == false then return x,y end
        for i = 0, 23 do
            if player:getMoodles():getMoodleLevel(MoodleType.FromIndex(i)) ~= 0 then
                y = y + 36;
            end
        end

        for k, v in pairs(player:getModData().LSMoodles) do--our moodles
            if k == moodleName then
                break
            else
                if v.Level ~= 0 and player:getModData().LSMoodles[moodleName].Level ~= 0 then
                    y = y + 36;
                end
            end
        end

	local sandboxmoodlepriority = SandboxVars.Debug.MoodlePriority or false
	if sandboxmoodlepriority then
        local ModdedMoodles = player:getModData().Moodles--modded
        if ModdedMoodles then
            for k, v in pairs(player:getModData().Moodles) do
                if v.Level ~= 0 then
                    y = y + 36;
               end
			end
       end
	end


        return x, y
		--end
    end

    ISMoodles.new = function(LSMoodleManager, width, height)
	--if MoodleManagerEnabled == false then return end
		if MoodleManagerEnabled == true and player:getModData().LSMoodles[moodleName] ~= nil then
        local x, y = ISMoodles:updateLSMoodles();
        
        local o = {};
        o = ISUIElement:new(x, y, width, height);
        setmetatable(o, LSMoodleManager);
        LSMoodleManager.__index = LSMoodleManager;
        o.borderColor = {r=0, g=0, b=0, a=0};
        o.backgroundColor = {r=0, g=0, b=0, a=0};

        return o;
		end
    end

    return ISMoodles:new(WIDTH, HEIGHT)
	end
end


--Util to add LSMoodleManager to UI manager on game start and removes on death, then adds it back on player creation 
LSMoodleManager.createType = function(player, moodleName)
	if not MoodleManagerPlayerSpawn then
	MoodleManagerPlayerSpawn = true
	player:getModData().LSMoodles = {}; 
	end
	MoodleManagerEnabled = true
    local moodleTypeUI = LSMoodleManager.newType(player, moodleName)

    moodleTypeUI:addToUIManager()
    --print("CreateType")

    --local onCreatePlayer = function(index, player, moodleName)
		--LSMoodleManager.init(player)
	--	MoodleManagerEnabled = true
		
	--	local player = getPlayer()
     --   local moodleTypeUI = LSMoodleManager.newType(player, moodleName)
        --print("onCreatePlayer")

     --   moodleTypeUI:addToUIManager()
   -- end

    local onPlayerDeath = function(player, moodleName)
        moodleTypeUI:removeFromUIManager()
		MoodleManagerEnabled = false
		--LSMoodleManager = {}
		--LSMoodleManager.LSMoodles = {}
		--MoodleManagerPlayerDeath = true
		--Events.OnPlayerDeath.Remove(onPlayerDeath)
    end
    
    --Events.OnCreatePlayer.Add(onCreatePlayer)
    Events.OnPlayerDeath.Add(onPlayerDeath)
end

function onPlayerDeathLSMoodle()
MoodleManagerPlayerSpawn = false
end

Events.OnPlayerDeath.Add(onPlayerDeathLSMoodle)

local onGameStartLSGeneralMoodles = function()
	LSMoodleManager.createType(getPlayer(), "MindfulState");
	LSMoodleManager.createType(getPlayer(), "HomeSick");
	LSMoodleManager.createType(getPlayer(), "AtHouse");
	LSMoodleManager.createType(getPlayer(), "MusicGood");
	LSMoodleManager.createType(getPlayer(), "MusicBad");
	LSMoodleManager.createType(getPlayer(), "DJAudience");
	LSMoodleManager.createType(getPlayer(), "PartyGood");
	LSMoodleManager.createType(getPlayer(), "PartyBad");
	LSMoodleManager.createType(getPlayer(), "Embarrassed");
end
Events.OnCreatePlayer.Add(onGameStartLSGeneralMoodles);
--Events.OnGameStart.Add(onGameStartLSGeneralMoodles);

if getActivatedMods():contains('MoodleFramework') then
require "MF_ISMoodle"

function MF.ISMoodle:getXYPosition()

    local x = (getCore():getScreenWidth() - self:getWidth() * MF.scale) - 18;
    local y = 101;
    
	if self.disable then if MF.verbose then print("MF.ISMoodle:getXYPosition while disabled. "..self.name) end; return x,y; end
	
    if self:getLevel() ~= 0 then
        for i = 0, 23 do--vanilla moodles
            if self.char:getMoodles():getMoodleLevel(MoodleType.FromIndex(i)) ~= 0 then
                y = y + 36 * MF.scale;
            end
        end
        
        local aiteronMM = self.char:getModData().MoodleManager;--aiteron moodles
        if aiteronMM and aiteronMM.moodles then
            local nbMoodlesAiteron = 0
            for _, moodleObj in pairs(aiteronMM.moodles) do

                if moodleObj.getLevel then
                    local lvl = moodleObj:getLevel()
                    if lvl > 0 then
                        nbMoodlesAiteron = nbMoodlesAiteron + 1
                        y = y + 36 * MF.scale;
                    end
                end
            end
            
        else
            
        end
	local sandboxmoodlepriority = SandboxVars.Debug.MoodlePriority or false
	if not sandboxmoodlepriority then
        for k, v in pairs(self.char:getModData().LSMoodles) do--our moodles
           if v.Level ~= 0 then
              y = y + 36;
           end
        end
	end
        for k, v in pairs(self.char:getModData().Moodles) do--modded moodles then
            if k == self.name then
                break
            else
                if v.Level ~= 0 then
                    y = y + 36 * MF.scale;
                end
            end
        end
    end

    return x, y
end
end