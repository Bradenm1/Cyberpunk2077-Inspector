-- Begin of BradenMenu Class

--[[
	Overview mod information:
		I use extension methods to spread the information out, not have it all within one file. 
		Makes it easier to understand what's what when looking at the directory hierarchy

		- 'Draw'
			Contains the files needed to draw information to the screen for the inspector
		- 'Misc'
			Contains misc files used in the project s
		- 'Dumps'
			Contains files I've dumped to view their infomration when adding to the menu.

		Note:
			Don't take this as the correct way to do things I would rather an OOP approach.
			This is just how i'm apporeaching it given ImGui's issues with OOP i've encounted within lua.

	BradenMenu Information:
		An inspector tool created for inspecting entities within Cyberpunk 2077.

	Created by Bradenm1
]]--

-- Load some global functions
require("Menu/Misc/String")
require("Menu/Misc/Game")

BradenMenu = {
	rootPath = "BradenMenu.",
	description = "Tool used for Inspecting Entities among other things."
}

-- Load within the BradenMenu class
require("Menu/Draw/GlobalGameFunctions")

-- Constructor
function BradenMenu:new()

	setmetatable(BradenMenu, self)
	self.__index = self

	-- Register menu vars
	self.DrawUI = false
	self.AlwaysShow = false
	self.AutoRemoveNilEntries = true
	self.SeparateWindows = true
	self.DumpClassName = "NPCPuppet" -- Class to dump
	self.SavedEntites = {} -- The entities the user has saved for the session
	self.SavedConpoments = {}
	self.OpenedInspectorWindows = {}
	self.Inspector = require("Menu/Inspector.lua"):new(self) -- Load and init this module class

	-- Register the callbacks
	BradenMenu:RegisterCallbacks()

   return BradenMenu
end
 
-- Register the callbacks for this mod menu
function BradenMenu:RegisterCallbacks() 

	registerForEvent("onInit", function(deltaTime)
		-- Check if the player exists within the saved entities, if not add the player.
		if self.SavedEntites["Player"] == nil and Game:Player() then 
			self.SavedEntites["Player"] = Game:Player() 
		end
	end)

	registerForEvent("onOverlayOpen", function()
		-- Show the UI when Cyber Engine Tweaks closes
		self.DrawUI = true
    end)
    
	registerForEvent("onOverlayClose", function()
		-- Hide the UI when Cyber Engine Tweaks closes
        self.DrawUI = false 
    end)

	registerForEvent("onDraw", function()
		if (self.AlwaysShow or self.DrawUI) then

			-- Run the Draw Window function, also check if an error occured
			local success, err = pcall(function () self:DrawWindow() end)

			-- Log error to the Cyber Engine Tweaks console if error occured
			if success == false then
				print(err)
			end
		end
	end)
end

-- The draw function for drawning the window
function BradenMenu:DrawWindow() 
	ImGui.SetNextWindowPos(100, 500, ImGuiCond.FirstUseEver) -- set window position x, y
	ImGui.SetNextWindowSize(800, 300, ImGuiCond.Appearing) -- set window size w, h
	
	-- Main Window
	if ImGui.Begin("Debug Menu") then

		-- Draw the tabs within the window
		self:DrawMainWindowTabs()
		
		-- Draw the other open Entity windows
		self.Inspector:DrawEntityWindows()

	end
	ImGui.End()
end

function BradenMenu:DrawMainWindowTabs()
	if ImGui.BeginTabBar("TabBar") then 
		if (ImGui.BeginTabItem("Main")) then
			ImGui.Spacing()

			if ImGui.Button("Close All Inspectors") then
				self.OpenedInspectorWindows = {}
			end
			
			-- Draw the saved entites
			self:DrawSavedEntites()
			
			-- Draw the saved conpoments
			--self:DrawSavedConpoments()
			
			ImGui.EndTabItem()
		end

		-- The game tab
		if (ImGui.BeginTabItem("Game")) then
			ImGui.Spacing()
			self:DrawGlobalGameFunctionButtons()
			ImGui.EndTabItem()
		end

		-- The debug
		if (ImGui.BeginTabItem("Debug")) then
			ImGui.Spacing()
			self:DrawDumpClass()
			ImGui.EndTabItem()
		end


		if (ImGui.BeginTabItem("Settings")) then
			ImGui.Spacing()
			local value, pressed = ImGui.Checkbox("Always Show Windows", self.AlwaysShow)
			if pressed then
				self.AlwaysShow = value
			end
	
			ImGui.Spacing()
			ImGui.Text("Turning this off will keep entity entries around even when destroyed.")
			ImGui.Text("They can still be inspected but variables are cached don't exist anymore.")
			value, pressed = ImGui.Checkbox("Auto Remove Nil Entries", self.AutoRemoveNilEntries)
			if pressed then 
				self.AutoRemoveNilEntries = value
			end

			value, pressed = ImGui.Checkbox("Separate Inspector Windows", self.SeparateWindows)
			if pressed then 
				self.SeparateWindows = value
			end

			ImGui.Spacing()
			ImGui.EndTabItem()
		end
	end
	ImGui.EndTabBar()
end

-- Display saved entites
function BradenMenu:DrawSavedEntites()
	ImGui.Text("Saved Entites - ")
	ImGui.Indent()
	for key, value in pairs(self.SavedEntites) do
		--if (value ~= nil) then 
			if ImGui.CollapsingHeader(key) then 
				ImGui.Indent()
				ImGui.Text("Does Entity still exist: - " .. tostring(not Game:IsEntityNull(value)))
				if self.OpenedInspectorWindows[key] == nil then
						if ImGui.Button("Open " .. key) then 
							self.OpenedInspectorWindows[key] = value
						end
					else
						if ImGui.Button("Close " .. key) then 
							self.OpenedInspectorWindows[key] = nil
						end
					end
					if key ~= "Player" and ImGui.Button("Remove " .. key) then 
						self.OpenedInspectorWindows[key] = nil
						self.SavedEntites[key] = nil 
					end
				ImGui.Unindent()
			end

			if self.AutoRemoveNilEntries == true and Game:IsEntityNull(value) then 
				self.SavedEntites[key] = nil
			end
		--end
	end
	ImGui.Unindent()
end

function BradenMenu:DrawDumpClass()
	ImGui.Text("Dumps information for a given class to the 'Dumps' directory within the mod.")
	ImGui.Spacing()
	text, selected = ImGui.InputTextMultiline("Class Name", self.DumpClassName, 100, 200, 20)
	if selected then self.DumpClassName = text end

	if ImGui.Button("Dump class") then 
		self:DumpClass(self.DumpClassName)
	end
end

-- Dump information given a class name
function BradenMenu:DumpClass(className)
	local comp = GetSingleton(self.DumpClassName)

	local dump = tostring(Dump(comp, false))
	local file = io.open("Dumps\\" .. self.DumpClassName .. ".lua", "w")

	file:write(tostring(dump))
	file:close()
end

--[[
-- Display saved conponments
function BradenMenu:DrawSavedConpoments()
	ImGui.Text("Saved Conpoments -")
	ImGui.Indent()
	for key, value in pairs(self.SavedConpoments) do
		if (value ~= nil) then 
			if ImGui.CollapsingHeader(key, ImGuiTreeNodeFlags.Selected) then 
				ImGui.Indent()
				if ImGui.Button("Remove Entry") then 
					self.SavedConpoments[key] = nil 
				end
				ImGui.Unindent()
			end
		end
	end
	ImGui.Unindent()
end

function BradenMenu:AddConpoment(comp) 
	if comp ~= nil then 
		if self:TextToTreeNode("Save Component") then 
			local text, selected = ImGui.InputTextMultiline("Cache Name", self.SavedEntityCacheTextName, 100, 200, 20)
			if selected then self.SavedEntityCacheTextName = text end
			if ImGui.Button("Save Component") then 
				self.SavedConpoments[self.SavedEntityCacheTextName] = comp
			end
			ImGui.Unindent()
		end
	end
end]]

-- End of BradenMenu Class

return BradenMenu:new()
