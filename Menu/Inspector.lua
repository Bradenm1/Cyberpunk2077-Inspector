local Inspector = {}

--[[
	Inspector Information:

	The Inspector window:
		This class also contains the code to run each inspector instance but without creating new objects for each one. 
]]

-- Constructor
function Inspector:new(parent, entity, windowName)
	local o = {} 

	-- All inspectors share these vars
	o.Parent = parent or {} -- The parent window
	o.Entity = entity
	o.WindowName = windowName or "Targeted"
	o.SavedEntityCacheTextName = "exampleName"

	-- Cached data used in the menu instance
	o.SelectedAttitudeGroup = 1
	o.SelectedReactionPreset = 1

	-- Objects
	o.PositionChanger = BradenMenu.PositionChangerModule:new(entity)
	o.VehicleLightColourChanger = BradenMenu.VehicleLightColourChangerModule:new(entity)

	-- The unique id for this instance
	o.UniqueID = BradenMenu.UniqueIDObject:GetNextID()

	self.__index = self
   	return setmetatable(o, self)
end

function Inspector:RunAlways()
	self.PositionChanger:RunAlways()
end

-- Draw the tab
function Inspector:DrawTab()
	ImGui.PushID(self.UniqueID)
	if ImGui.BeginTabItem("Entity Inspector - " .. self.WindowName) then 
		self:DrawEntityWindowsPlain(self.Entity, self.WindowName)
		ImGui.EndTabItem()
	end
	ImGui.PopID()
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
		entity = BradenMenu.GE:BMGetTargetEntity()
		self.PositionChanger.Entity = entity
		self.VehicleLightColourChanger.Entity = entity
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
		BradenMenu.EntityInspect:Draw(entity, self)
	else
		self:DrawNoEntity()
	end
end

-- Draw the Edit tab
function Inspector:DrawEditTab(entity)
	if (entity ~= nil) then
		BradenMenu.EntityInspect:DrawEdit(entity, self)
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
		self.Parent.SavedEntites[self.SavedEntityCacheTextName] = BradenMenu.InspectorModule:new(self.Parent, entity, self.SavedEntityCacheTextName)
	end
end

-- Draws the filter input
function Inspector:DrawFilterInput()
	text, selected = ImGui.InputTextMultiline("Top Level Filter", BradenMenu.FilterText, 100, 200, 20)
	if selected then BradenMenu.FilterText = text end
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