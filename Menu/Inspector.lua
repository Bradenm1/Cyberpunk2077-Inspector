Inspector = {}

--[[
	Inspector Information:

	The Inspector window:
		This class also contains the code to run each inspector instance but without creating new objects for each one. 

	Why not use Modules and Classes for each instance?
		ImGui seems to get extremely angry when you try create new object within lua for ImGui elements and it either glitches out or crashes the game.
		An example:
			If I make each inspector window a 'Inspector' instance and simply loop though an array drawing each one, since the text, buttons and labels are the same names
			it will cause a overlapping result where both instances are overwritting each others ImGui elements. Even though the ImGui.Begin has a different name for each one.
		It seems to me every element which contains text in ImGui seems to need unique text and unique code for the function else it breaks if something else uses it at the same time.
		if you don't you'll get random as issues that make no sense, maybe i'm missing something seems broken though.
]]

-- Fetch required files
require("Menu/Draw/gameObject")
require("Menu/Draw/gameDataCharacter_Record")
require("Menu/Draw/gamePuppet")
require("Menu/Draw/entEntity")
require("Menu/Draw/gameAttitudeAgent")
require("Menu/Draw/gameAttitudeAgentPS")
require("Menu/Draw/CName")
require("Menu/Draw/AITrackedLocation")
require("Menu/Draw/AITargetTrackerComponent")
require("Menu/Draw/gamedataNPCType_Record")
require("Menu/Draw/movePoliciesComponent")
require("Menu/Draw/WorldTransform")	
require("Menu/Draw/WorldTransformPosition")
require("Menu/Draw/AILocationInformation")
require("Menu/Draw/fixedPoint")
require("Menu/Draw/gamePersistentID")
require("Menu/Draw/gameItemObject")
require("Menu/Draw/entEntityID")
require("Menu/Draw/ScriptedPuppet")
require("Menu/Draw/vehicleCarBaseObject")
require("Menu/Draw/gameUniqueItemData")
require("Menu/Draw/PositionChanger")
require("Menu/Draw/gameStatDetailedData")
require("Menu/Draw/gameStatsBundleHandler")

-- Constructor
function Inspector:new(parent)

	setmetatable(Inspector, self)
	self.__index = self

	-- All inspectors share these vars
    self.Parent = parent or {} -- The parent window
    self.SavedEntityCacheTextName = "exampleName"
    self.FilterText = "" -- The test to filter by on the inspector window

   return Inspector
end

-- Draw all entity windows
function Inspector:DrawEntityWindows()
	if self.Parent.SeparateWindows then 
		self:DrawInspectorSeparateWindows()
	else
		self:DrawInspectorTabs()
	end
end

-- Draw the all inspectors as tabs
function Inspector:DrawInspectorTabs() 
	ImGui.SetNextWindowSize(800, 700, ImGuiCond.Appearing)
	if ImGui.Begin("Entity Inspector") then 
		if ImGui.BeginTabBar("Inspector", ImGuiTabBarFlags.Reorderable) then 
			-- Draw the main window
			self:DrawTabs(nil, "Targeted")

			self:DrawOtherWindows(function(entity, key) self:DrawTabs(entity, key) end )
		end
		ImGui.EndTabBar()
	end
end

-- Draws all inspectors as separate windows
function Inspector:DrawInspectorSeparateWindows() 
	-- Draw the main window
	self:DrawWindow(nil, "Targeted")

	self:DrawOtherWindows(function(entity, key) self:DrawWindow(entity, key) end )
end

-- Draw the other windows... Garbage code
function Inspector:DrawOtherWindows(func) 
	for key, entity in pairs(self.Parent.OpenedInspectorWindows) do
		func(entity, key)

		if (Game:IsEntityNull(entity) == true) and self.Parent.AutoRemoveNilEntries == true then 
			table.remove(self.Parent.OpenedInspectorWindows, i)
		end
	end
end

-- Draw the tab
function Inspector:DrawTabs(entity, windowName)
	if ImGui.BeginTabItem("Entity Inspector - " .. windowName) then 
		self:DrawEntityWindowsPlain(entity, windowName)
		ImGui.EndTabItem()
	end
end

-- Draw the window
function Inspector:DrawWindow(entity, windowName)
	ImGui.SetNextWindowSize(800, 700, ImGuiCond.Appearing)
	if ImGui.Begin("Entity Inspector - " .. windowName) then 
		self:DrawEntityWindowsPlain(entity, windowName)
		ImGui.End()
	end
end

-- Draw the window as is
function Inspector:DrawEntityWindowsPlain(entity, windowName)
	-- Rather a hash compare here
	if windowName == "Targeted" then
		-- Display a hint on how to use if it's the main inspector window
		self:TargetHint()
		ImGui.Spacing()
	end
	
	-- If the given entity is nil for this window use the entity the player is currently looking at
	if entity == nil then 
		entity = Game:GetTargetEntity()
	end

	-- Draw the tabs within the window
	self:DrawEntityInsepectionTabs(entity)
end


-- Draw the tabs for the Entity Inspector
function Inspector:DrawEntityInsepectionTabs(entity)
	if ImGui.BeginTabBar("TabBar") then 

		-- The View tab
		if (ImGui.BeginTabItem("View")) then
			ImGui.Spacing()
			self:DrawFilterInput()
			self:DrawViewTab(entity)
			ImGui.EndTabItem()
		end

		-- The Edit tab
		if (ImGui.BeginTabItem("Edit")) then
			ImGui.Spacing()
			self:DrawEditTab(entity)
			ImGui.EndTabItem()
		end

		-- The Settings tab
		if (ImGui.BeginTabItem("Settings")) then
			ImGui.Spacing()
			self:DrawSettingTab(entity)
			ImGui.EndTabItem()
		end
	end
	ImGui.EndTabBar()
end

-- Draw the View tab
function Inspector:DrawViewTab(entity)
	if (entity ~= nil) then
		self:DrawWindowEntityInspecterViewHasEntity(entity)
	else
		self:DrawNoEntity()
	end
end

-- Draw the Edit tab
function Inspector:DrawEditTab(entity)
	if (entity ~= nil) then
		self:DrawEditEntity(entity)
	else
		self:DrawNoEntity()
	end
end

-- Draw the Setting tab
function Inspector:DrawSettingTab(entity)
	if (entity ~= nil) then
		self:DrawCacheEntityInput(entity)
	else
		self:DrawNoEntity()
	end
end

-- Draws the input box and the button used for saving a given entity
function Inspector:DrawCacheEntityInput(entity)
	ImGui.Text("Save this Entity into the Saved Entites table in in the Debug Menu.")
	text, selected = ImGui.InputTextMultiline("Name", self.SavedEntityCacheTextName, 100, 200, 20)
	if selected then self.SavedEntityCacheTextName = text end
	if ImGui.Button("Save") then 
		self.Parent.SavedEntites[self.SavedEntityCacheTextName] = entity
	end
end

-- Draw the collapsing headers for the entity
function Inspector:DrawWindowEntityInspecterViewHasEntity(entity)

	-- Display information related to the Entity
	if ImGui.CollapsingHeader("Entity") then
		self:DrawentEntity(entity)
	end

	-- Display information related to the GameObject
	if ImGui.CollapsingHeader("GameObject") then 
		self:DrawGameObject(entity)
	end

	-- Display information related to the vehicleCarBaseObject
	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject") then 

		end
	end

	-- Display information related to the gamePuppet
	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet") then 
			self:DrawGamePuppet(entity)
		end
	end

	-- Display information related to the ScriptedPuppet
	--[[if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet") then 
			self:DrawScriptedPuppet(entity)
		end
	end]]

	-- Display information related to a gameItemObject
	if entity:IsItem() then
		if ImGui.CollapsingHeader("gameItemObject") then 
			self:DrawgameItemObject(entity)
		end
	end
end

-- Draws all the edit functions
-- DODO: put this stuff in another file and separate it out
function Inspector:DrawEditEntity(entity)
	
	if ImGui.CollapsingHeader("Entity", ImGuiTreeNodeFlags.Selected) then 
		self:DrawEditentEntity(entity)
	end
	
	if ImGui.CollapsingHeader("GameObject", ImGuiTreeNodeFlags.Selected) then 
		self:DrawEditGameObject(entity)
	end

	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject", ImGuiTreeNodeFlags.Selected) then
			self:DrawEditvehicleCarBaseObject(entity)
		end
	end

	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet", ImGuiTreeNodeFlags.Selected) then 	
			self:DrawEditGamePuppet(entity)
		end
	end

	if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet", ImGuiTreeNodeFlags.Selected) then 
			self:DrawEditScriptedPuppet(entity)
		end
	end

end

-- Draw objects as an array and run a given func on the object
function Inspector:DisplayObjectArray(name, className, object, func) 
	if object ~= nil then 
		if self:TextToTreeNode(name .. ": - " .. className) then 
			ImGui.Indent()
			for key, value in ipairs(object) do
				func(key, value)
			end
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		self:ObjectToText(name, object)
	end
end

-- Draw objects as an array and run a given func on the object
function Inspector:DisplayObjectList(name, className, object, func) 
	if object ~= nil then 
		if self:TextToTreeNode(name .. ": - " .. className) then 
			ImGui.Indent()
			for key, value in pairs(object) do
				func(key, value)
			end
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		self:ObjectToText(name, object)
	end
end

-- Draws a Vector4 to the window given the vector4 name and the vector itself
function Inspector:DisplayVector4(vectorName, vector4) 
    self:DrawNodeTree(vectorName, "Vector4", vector4, 
        function() 
            self:ObjectToText("X", vector4.x)
			self:ObjectToText("Y", vector4.y)
			self:ObjectToText("Z", vector4.z)
            self:ObjectToText("W", vector4.w)
        end
    )
end

-- Draws a TreeNode given certain information
function Inspector:DrawNodeTree(name, className, object, func)
	if object ~= nil then 
		if self:TextToTreeNode(name .. " - " .. className) then 
			func(object)
			ImGui.Separator()
			ImGui.Unindent()
		end
	else
		Inspector:ObjectToText(name, object)
	end
end

-- Draws the filter input
function Inspector:DrawFilterInput()
	text, selected = ImGui.InputTextMultiline("Top Level Filter", self.FilterText, 100, 200, 20)
	if selected then self.FilterText = text end
end

-- Draws a ImGui tree node to the window
function Inspector:TextToTreeNode(text)
	return (self.FilterText == "" or text:StringContains(self.FilterText) ~= nil) and ImGui.TreeNode(text) 
end

-- Draws a ImGui text to the window
function Inspector:ObjectToText(ObjectName, object)
	--ImGui.PushStyleColor(ImGuiCol.Text, 0.5,0.5,0.5, 1)
	local text = ObjectName .. ": " .. tostring(object)
	if self.FilterText == "" or text:StringContains(self.FilterText) ~= nil then
		ImGui.Text(text)
	end
	--ImGui.PopStyleColor()
end

function Inspector:DrawNoEntity()
	ImGui.Text("No Entity at crosshair...")
end

function Inspector:TargetHint()
	ImGui.Text("The main Entity Inspector window requires the user to target an Entity.")
	ImGui.Text("For example simply look at an NPC at any distance.")
end

-- End of Inspector Class

return Inspector