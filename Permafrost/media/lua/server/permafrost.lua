local function setSandboxVars()
	MIN_TEMP = SandboxVars.Permafrost.MinimumTemperature;
	if MIN_TEMP == nil then
		MIN_TEMP = -20;
	end

	MAX_TEMP = SandboxVars.Permafrost.MaximumTemperature;
	if MAX_TEMP == nil then
		MAX_TEMP = 0;
	end

	SNOWSTORM = SandboxVars.Permafrost.PermanentSnowstorm;
	if SNOWSTORM == nil then
		SNOWSTORM = true;
	end
end

local function initialiseSeasons(season)
    setSandboxVars();
    season:init(
        50,
        MAX_TEMP, --max temp default 25
        MIN_TEMP, --min temp default 0
        15,
        season:getSeasonLag(),
        season:getHighNoon(),
        season:getSeedA(),
        season:getSeedB(),
        season:getSeedC()
	);
end

local function SetSnowStorm(forceCheck)
    if SNOWSTORM then
        if getGameTime():getWorldAgeHours() >= 1 then
            getCore():setForceSnow(true);
            
            if forceCheck then
                forceSnowCheck();
            end
        end
        if getGameTime():getWorldAgeHours() >= 1 then
            getClimateManager():triggerWinterIsComingStorm();
        end
    end
end

local function onGameStartSetSnowStorm()
    setSandboxVars();
    SetSnowStorm(true);
end

local function everyHoursSetSnowStorm()
    setSandboxVars();
    SetSnowStorm(false);
end

Events.OnInitSeasons.Add(initialiseSeasons);
Events.OnGameStart.Add(onGameStartSetSnowStorm);
Events.EveryHours.Add(everyHoursSetSnowStorm);