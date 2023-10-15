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

require "ISUI/ISPanelJoypad"

LSMenuOverlay = ISPanelJoypad:derive("LSMenuOverlay");

local LSMainMenuOverlay
local LSMenuremoved = false
local LSMenuplay = 0
local LSMenuplay2 = 0
local LSScreenScaleX = getCore():getScreenWidth() / 1920
local LSScreenScaleY = getCore():getScreenHeight() / 1080
local LSMenuScreenshotImage
local LSMenuScreenshot2Image
local LSMenuScreenshotFrameImage
local ScreenshotFrameTexture = getTexture("media/ui/frame.png")
local ScreenshotTexture1 = getTexture("media/ui/screenshots/music0.png")
local ScreenshotTexture2 = getTexture("media/ui/screenshots/disco0.png")
local MainMenuImageEventListenerNumberCount = 0
local MainMenuImageEventListenerNumberTotal = 200
local MainMenuImageEventListenerNonRepeatNumber = 0
local LSMenuOverlayImageImage
local LSMenuOverlayImage2Image
local LSMainMenuDigit = 0
local LSMainMenuLastDigitMusic = 0
local LSMainMenuLastDigitMusic1 = 0
local LSMainMenuLastDigitMusic2 = 0
local LSMainMenuLastDigitDisco = 0
local LSMainMenuLastDigitDisco1 = 0
local LSMainMenuLastDigitDisco2 = 0
local MainMenuOriginalVolume

function LSMenuOverlay.onResetLua(reason)
	local self = LSMainMenuOverlay.initialise

	if LSMenuremoved == true then
	return
	end

	if reason == "optionsChangedApplied" then
	LSMenuScreenshotFrameImage = self.LSMenuScreenshotFrame
	LSMenuScreenshot2Image = self.LSMenuScreenshot2
	LSMenuScreenshotImage = self.LSMenuScreenshot
	LSMenuOverlayImageImage = self.LSMenuOverlayImage
	LSMenuOverlayImage2Image = self.LSMenuOverlayImage2
	else
	LSMainMenuOverlay:reset()
	end
end

function MainMenuMusicEventListener()

	if LSMenuplay ~= 0 and LSMenuremoved == false then 
	LSMenuOverlayImageImage.mouseover = true
	MainMenuImageEventListenerNumberCount = MainMenuImageEventListenerNumberCount + 1
		if MainMenuImageEventListenerNumberCount >= MainMenuImageEventListenerNumberTotal then
		
		local limit = 35--starts at 0 and ends at (last number - 1) - so if you have pictures from 0 up to 30 then limit should be set as 31
		
			MainMenuImageEventListenerNumberCount = 0
		
			LSMainMenuDigit = ZombRand(limit)--starts at 0 and ends at (last number - 1)
				
				if LSMainMenuDigit == LSMainMenuLastDigitMusic then
					if LSMainMenuDigit == (limit - 1) then--in case it's the last picture we pick the one before it
					LSMainMenuDigit = LSMainMenuDigit - 1
					else--else we pick the one after it
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				if LSMainMenuDigit == LSMainMenuLastDigitMusic1 then
					if LSMainMenuDigit == (limit - 1) then
					LSMainMenuDigit = LSMainMenuDigit - 1
					else
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				if LSMainMenuDigit == LSMainMenuLastDigitMusic2 then
					if LSMainMenuDigit == (limit - 1) then
					LSMainMenuDigit = LSMainMenuDigit - 1
					else
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				
				if (MainMenuImageEventListenerNonRepeatNumber == 0) or (MainMenuImageEventListenerNonRepeatNumber > 2) then
					LSMainMenuLastDigitMusic = LSMainMenuDigit
					MainMenuImageEventListenerNonRepeatNumber = 0
				elseif MainMenuImageEventListenerNonRepeatNumber == 1 then
					LSMainMenuLastDigitMusic1 = LSMainMenuDigit
				elseif MainMenuImageEventListenerNonRepeatNumber == 2 then
					LSMainMenuLastDigitMusic2 = LSMainMenuDigit
				end
				MainMenuImageEventListenerNonRepeatNumber = MainMenuImageEventListenerNonRepeatNumber + 1
				
				LSMenuScreenshotImage.texture = getTexture("media/ui/screenshots/music".. LSMainMenuDigit ..".png")

		end

	else
	--MainMenuImageEventListenerNumberFrame = 0
	LSMenuOverlayImageImage.mouseover = false
	MainMenuImageEventListenerNumberCount = 0
	LSMenuScreenshotImage.texture = getTexture("media/ui/screenshots/music0.png")
	Events.OnFETick.Remove(MainMenuMusicEventListener)
	end
end

function MainMenuMusicEventListener2()

	if LSMenuplay2 ~= 0 and LSMenuremoved == false then 
	LSMenuOverlayImage2Image.mouseover = true
	MainMenuImageEventListenerNumberCount = MainMenuImageEventListenerNumberCount + 1

		if MainMenuImageEventListenerNumberCount >= MainMenuImageEventListenerNumberTotal then
		
		local limit = 9--starts at 0 and ends at (last number - 1) - so if you have pictures from 0 up to 30 then limit should be set as 31
		
			MainMenuImageEventListenerNumberCount = 0
		
			LSMainMenuDigit = ZombRand(limit)--starts at 0 and ends at (last number - 1)
				
				if LSMainMenuDigit == LSMainMenuLastDigitDisco then
					if LSMainMenuDigit == (limit - 1) then--in case it's the last picture we pick the one before it
					LSMainMenuDigit = LSMainMenuDigit - 1
					else--else we pick the one after it
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				if LSMainMenuDigit == LSMainMenuLastDigitDisco1 then
					if LSMainMenuDigit == (limit - 1) then
					LSMainMenuDigit = LSMainMenuDigit - 1
					else
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				if LSMainMenuDigit == LSMainMenuLastDigitDisco2 then
					if LSMainMenuDigit == (limit - 1) then
					LSMainMenuDigit = LSMainMenuDigit - 1
					else
					LSMainMenuDigit = LSMainMenuDigit + 1
					end
				end
				
				if (MainMenuImageEventListenerNonRepeatNumber == 0) or (MainMenuImageEventListenerNonRepeatNumber > 2) then
					LSMainMenuLastDigitDisco = LSMainMenuDigit
					MainMenuImageEventListenerNonRepeatNumber = 0
				elseif MainMenuImageEventListenerNonRepeatNumber == 1 then
					LSMainMenuLastDigitDisco1 = LSMainMenuDigit
				elseif MainMenuImageEventListenerNonRepeatNumber == 2 then
					LSMainMenuLastDigitDisco2 = LSMainMenuDigit
				end
				MainMenuImageEventListenerNonRepeatNumber = MainMenuImageEventListenerNonRepeatNumber + 1
				
				LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco".. LSMainMenuDigit ..".png")

		end
		
			--LSMainMenuDigit = ZombRand(4)
		
			--if MainMenuImageEventListenerNumberFrame == 0 then
				--LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco".. LSMainMenuDigit ..".png")
			--elseif MainMenuImageEventListenerNumberFrame == 1 then
				--LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco2.png")
			--elseif MainMenuImageEventListenerNumberFrame == 2 then
				--LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco3.png")
			--elseif MainMenuImageEventListenerNumberFrame == 3 then
				--LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco4.png")
			
			
			--elseif MainMenuImageEventListenerNumberFrame == 5 then
				--LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco1.png")
			
			
			--end
			
		--	if MainMenuImageEventListenerNumberFrame == 5 then
		--	MainMenuImageEventListenerNumberFrame = 0
		--	else
		--	MainMenuImageEventListenerNumberFrame = MainMenuImageEventListenerNumberFrame + 1
		--	end
		--end

	else
	--MainMenuImageEventListenerNumberFrame = 0
	LSMenuOverlayImage2Image.mouseover = false
	MainMenuImageEventListenerNumberCount = 0
	LSMenuScreenshot2Image.texture = getTexture("media/ui/screenshots/disco0.png")
	Events.OnFETick.Remove(MainMenuMusicEventListener2)
	end
end

function LSMenuOverlay.onMouseMoveImage(x, y)
	if LSMenuplay == 0 then
	LSMenuplay = getSoundManager():playUISound("GuitarAcoustic06MyOldKentuckyHomeLOOP")
	--LSMenuScreenshotImage.fade:setFadeIn(true)
	--LSMenuScreenshotImage.fade:reset()
	LSMenuScreenshotFrameImage:setVisible(true)
	LSMenuScreenshotImage:setVisible(true)
	MainMenuOriginalVolume = tonumber(getSoundManager():getMusicVolume())
	getSoundManager():setMusicVolume(0)
	Events.OnFETick.Add(MainMenuMusicEventListener)	
	end
--LSMenuScreenshotImage.fade:update()

end

function LSMenuOverlay.onMouseMoveOutsideImage(x, y)
	if LSMenuplay ~= 0 then
	getSoundManager():stopUISound(LSMenuplay)
	LSMenuplay = 0
	--LSMenuScreenshotImage.fade:setFadeIn(false)
	LSMenuScreenshotFrameImage:setVisible(false)
	LSMenuScreenshotImage:setVisible(false)
	getSoundManager():setMusicVolume(MainMenuOriginalVolume)
	end
end

function LSMenuOverlay.onMouseMoveImage2(x, y)
	if LSMenuplay2 == 0 then
	LSMenuplay2 = getSoundManager():playUISound("slow4LOOP")
	LSMenuScreenshotFrameImage:setVisible(true)
	LSMenuScreenshot2Image:setVisible(true)
	MainMenuOriginalVolume = tonumber(getSoundManager():getMusicVolume())
	getSoundManager():setMusicVolume(0)
	Events.OnFETick.Add(MainMenuMusicEventListener2)	
	end
end

function LSMenuOverlay.onMouseMoveOutsideImage2(x, y)
	if LSMenuplay2 ~= 0 then
	getSoundManager():stopUISound(LSMenuplay2)
	LSMenuplay2 = 0
	LSMenuScreenshotFrameImage:setVisible(false)
	LSMenuScreenshot2Image:setVisible(false)
	getSoundManager():setMusicVolume(MainMenuOriginalVolume)
	end
end


function LSMenuOverlay:initialise()
	ISPanel.initialise(self);
	
	self.LSMenuScreenshotFrame = ISImage:new((self:getWidth() / 2) - 400, (self:getHeight() / 2) - 700, 0, 0, ScreenshotFrameTexture)
	LSMenuScreenshotFrameImage = self.LSMenuScreenshotFrame
	self.LSMenuScreenshotFrame:initialise()
	self:addChild(self.LSMenuScreenshotFrame)
	self.LSMenuScreenshotFrame:setVisible(false)
	
	self.LSMenuScreenshot = ISImage:new((self:getWidth() / 2) - 395, (self:getHeight() / 2) - 675, 0, 0, ScreenshotTexture1)
	LSMenuScreenshotImage = self.LSMenuScreenshot
	self.LSMenuScreenshot:initialise()
	self:addChild(self.LSMenuScreenshot)
	self.LSMenuScreenshot:setVisible(false)

	self.LSMenuScreenshot2 = ISImage:new((self:getWidth() / 2) - 395, (self:getHeight() / 2) - 675, 0, 0, ScreenshotTexture2)
	LSMenuScreenshot2Image = self.LSMenuScreenshot2
	self.LSMenuScreenshot2:initialise()
	self:addChild(self.LSMenuScreenshot2)
	self.LSMenuScreenshot2:setVisible(false)
	
	local LSMenuOverlayTexture = getTexture("media/ui/lifestylemusicupdate_icon.png")
	self.LSMenuOverlayImage = ISImage:new((self:getWidth() / 2) + 30, (self:getHeight() / 2) - 30, 60, 60, LSMenuOverlayTexture)
	LSMenuOverlayImageImage = self.LSMenuOverlayImage
	self.LSMenuOverlayImage:setMouseOverText(getText("UI_mainscreen_MusicUpdate"))
	self.LSMenuOverlayImage.onMouseMove = LSMenuOverlay.onMouseMoveImage
	self.LSMenuOverlayImage.onMouseMoveOutside = LSMenuOverlay.onMouseMoveOutsideImage
	self.LSMenuOverlayImage:initialise()
	self:addChild(self.LSMenuOverlayImage)

	local LSMenuOverlayTexture2 = getTexture("media/ui/lifestyledancingupdate_icon.png")
	self.LSMenuOverlayImage2 = ISImage:new((self:getWidth() / 2) - 50, (self:getHeight() / 2) - 30, 60, 60, LSMenuOverlayTexture2)
	LSMenuOverlayImage2Image = self.LSMenuOverlayImage2
	self.LSMenuOverlayImage2:setMouseOverText(getText("UI_mainscreen_DiscoUpdate"))
	self.LSMenuOverlayImage2.onMouseMove = LSMenuOverlay.onMouseMoveImage2
	self.LSMenuOverlayImage2.onMouseMoveOutside = LSMenuOverlay.onMouseMoveOutsideImage2
	self.LSMenuOverlayImage2:initialise()
	self:addChild(self.LSMenuOverlayImage2)


end


function LSMenuOverlay:destroy()
	if self ~= nil and self.LSMenuOverlayImage ~= nil and self.LSMenuOverlayImage2 ~= nil then
	UIManager.setShowPausedMessage(true);
	self:setVisible(false);
	self:removeFromUIManager();
	if UIManager.getSpeedControls() then
		UIManager.getSpeedControls():SetCurrentGameSpeed(1);
	end
	LSMenuremoved = true
	
	Events.OnMainMenuEnter.Remove(LSMenuOnEnter)	

	Events.OnResetLua.Remove(LSMenuOverlay.onResetLua);

	Events.OnResolutionChange.Remove(LSMenuOnDestroy)

	Events.OnGameStart.Remove(LSMenuOnDestroy);

	Events.OnAcceptInvite.Remove(LSMenuOnDestroy);

	Events.OnSteamGameJoin.Remove(LSMenuOnDestroy);

	Events.OnJoypadBeforeDeactivate.Remove(LSMenuOnDestroy);

	Events.OnGameBoot.Remove(LSMenuOnGameBoot)
	
	end	
end

function LSMenuOverlay:reset()
	if self ~= nil and self.LSMenuOverlayImage ~= nil and self.LSMenuOverlayImage2 ~= nil then
	UIManager.setShowPausedMessage(true);
	self:setVisible(false);
	self:removeFromUIManager();
	if UIManager.getSpeedControls() then
		UIManager.getSpeedControls():SetCurrentGameSpeed(1);
	end
	LSMainMenuOverlay = nil
	LSMenuOnEnter()
	end	
end

function LSMenuOverlay:prerender()
	self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

end

function LSMenuOverlay:render()

end

function LSMenuOverlay:update()
    ISPanelJoypad.update(self)

end

function LSMenuOverlay:new()
    local ScaleX = getCore():getScreenWidth() / 1920
	local ScaleY = getCore():getScreenHeight() / 1080
	local x = ScaleX * 1450
	local y = ScaleY * 990
	local width = 200
	local height = 80
	local o = {}
	o = ISPanelJoypad:new(x, y, width, height);
	setmetatable(o, self)
    self.__index = self
	o.name = nil;
    o.backgroundColor = {r=0, g=0, b=0, a=0};
    o.borderColor = {r=0, g=0, b=0, a=0};
	o.y = y
	o.x = x
	o.width = width;
	o.height = height;
	o.anchorLeft = true;
	o.anchorRight = true;
	o.anchorTop = true;
	o.anchorBottom = true;
	o.target = target;
	o.DJSoundboardTexture = getTexture("DJBooth_Overlay0.png")
	o:noBackground()
    o.new = new;
    return o;
end


function LSMenuOnEnter()
	if LSMenuremoved == true then
	return
	end
	if LSMainMenuOverlay ~= nil then
		LSMainMenuOverlay:reset()
	end
	if not LSMainMenuOverlay then
		LSMainMenuOverlay = LSMenuOverlay:new();
		LSMainMenuOverlay:initialise();
		LSMainMenuOverlay:addToUIManager();
	end
end

function LSMenuOnDestroy()
	if LSMenuremoved == true then
	return
	end
LSMainMenuOverlay:destroy()

end

function LSMenuOnGameBoot()

	if LSMenuremoved == true then
	return
	end

Events.OnMainMenuEnter.Add(LSMenuOnEnter)	

Events.OnResetLua.Add(LSMenuOverlay.onResetLua);
--Events.OnMouseUp.Add(LSMenuOverlay.onResetLua);

Events.OnResolutionChange.Add(LSMenuOnDestroy)

--Events.OnMainMenuEnter.Add(LSMenuOverlay.destroy);

Events.OnGameStart.Add(LSMenuOnDestroy);

--Events.OnKeyPressed.Add(LSMenuOverlay.destroy);

--Events.OnKeyStartPressed.Add(LSMenuOverlay.destroy);

--Events.OnResetLua.Add(LSMenuOnDestroy);

Events.OnAcceptInvite.Add(LSMenuOnDestroy);

Events.OnSteamGameJoin.Add(LSMenuOnDestroy);

Events.OnJoypadBeforeDeactivate.Add(LSMenuOnDestroy);

end


Events.OnGameBoot.Add(LSMenuOnGameBoot)

