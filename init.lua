-- Begin of BradenMenu Class

--[[
	Overview mod information:
		I use extension methods to spread the information out, not have it all within one file. 
		Makes it easier to understand what's what when looking at the directory hierarchy

		- 'Draw'
			Contains the files needed to draw information to the screen for the inspector
		- 'Misc'
			Contains misc files used in the project
		- 'Dumps'
			Contains files I've dumped to view their information when adding new things to the menu.
			You can add your own if you use the debug tab.

	BradenMenu Information:
		An inspector tool created for inspecting entities within Cyberpunk 2077.

	Created by Bradenm1
]]--

-- Load some global functions
require("Menu/Misc/String")
require("Menu/Misc/Game")

BradenMenu = {}

-- Constructor
function BradenMenu:new()
	setmetatable(BradenMenu, self)
	self.__index = self

	-- Register vars
	self.RootPath = "Cyberpunk2077-Inspector"
	self.Description = "Tool used for Inspecting Entities among other things."
	self.FilterText = "" -- The text to filter in the inspector windows

	-- Cache
	-- pcall is bugged, can't get it to work with modules and is pointless
	self:ErrorHandler(function() self:LoadModules() end)

	self.UniqueIDObject = require("Menu/Misc/UniqueID"):new() -- UniqueID ID used with PushID to stop conflicts
	self.DebugMenu = require("Menu/DebugMenu"):new()
	
	-- Register the callbacks
	self:ErrorHandler(function() self:RegisterCallbacks() end)

   return BradenMenu
end

function BradenMenu:LoadModules()
	-- Extension of ImGui
	self.IGE = require("Menu/Misc/ImGuiExtension")

	-- Class modules
	self.InspectorModule = require("Menu/Inspector.lua")
	self.PositionChangerModule = require("Menu/Objects/PositionChanger")
	self.VehicleLightColourChangerModule = require("Menu/Objects/VehicleLightColourChanger")

	-- Data 
	self.GodModeData = require("Menu/Data/GodModeData")
	self.VehicleELightType = require("Menu/Data/vehicleELightType")
	self.AttitudeGroups = require("Menu/Data/AttitudeGroups")
	self.ReactionPresets = require("Menu/Data/ReactionPresets")
	self.Components = require("Menu/Data/Components")

	-- Load Components
	for i, name in pairs(self.Components) do
		BradenMenu[name] = require("Menu/Draw/" .. name)
	end
end

-- Register the callbacks for this mod menu
function BradenMenu:RegisterCallbacks() 

	registerForEvent("onUpdate", function(deltaTime)
		self:ErrorHandler(function(deltaTime) self.DebugMenu:onUpdate(deltaTime) end)
	end)

	registerForEvent("onOverlayOpen", function()
		self:ErrorHandler(function() self.DebugMenu:onOverlayOpen() end)
    end)
    
	registerForEvent("onOverlayClose", function()
		self:ErrorHandler(function() self.DebugMenu:onOverlayClose() end)
    end)

	registerForEvent("onDraw", function()
		self:ErrorHandler(function() self.DebugMenu:OnDraw() end)
	end)
end

function BradenMenu:ErrorHandler(func)
	-- Run the function, also check if an error occured
	local success, err = pcall(function () func() end)

	-- Log error to the Cyber Engine Tweaks console if error occured
	if success == false then
		print(err)
	end
end

-- End of BradenMenu Class

return BradenMenu:new()
