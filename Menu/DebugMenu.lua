-- Begin of DebugMenu Class

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

	DebugMenu Information:
		An inspector tool created for inspecting entities within Cyberpunk 2077.

	Created by Bradenm1
]]--

-- Load some global functions
local DebugMenu = {}

-- Constructor
function DebugMenu:new()
	setmetatable(DebugMenu, self)
	self.__index = self

	-- Do local requires
	self.Inspector = BradenMenu.InspectorModule:new(self, nil, "Targeted") -- Load and init this module class

	-- Inspector related vars
	self.DrawUI = false
	self.SavedEntites = {} -- The entities the user has saved for the session
	self.OpenedInspectorWindows = {}

	-- Dump vars
	self.DumpClassName = "NPCPuppet" -- Class to dump

	-- Setting Vars
	self.PrintErrors = true
	self.AlwaysShow = false
	self.ShowInspectors = false
	self.AutoRemoveNilEntries = true

   return DebugMenu
end
 
function DebugMenu:onUpdate()
    self:AlwaysRun()
end

function DebugMenu:onOverlayOpen()
    if Game.GetPlayer() then 
        self.SavedEntites["Player"] = BradenMenu.InspectorModule:new(self, Game.GetPlayer(), "Player")

        -- Show the UI when Cyber Engine Tweaks closes
		self.DrawUI = true
    end
end

function DebugMenu:onOverlayClose()
    -- Hide the UI when Cyber Engine Tweaks closes
    self.DrawUI = false 
end

function DebugMenu:OnDraw()
	if (self.AlwaysShow or self.DrawUI) then
		self:DrawWindow()
	end
end

function DebugMenu:AlwaysRun()
	if self.Inspector ~= nil and self.Inspector.PositionChanger ~= nil then
		self.Inspector:RunAlways()
	end

	for i, v in pairs(self.OpenedInspectorWindows) do
		v:RunAlways()
	end
end

-- The draw function for drawning the window
function DebugMenu:DrawWindow() 
	ImGui.SetNextWindowPos(100, 500, ImGuiCond.FirstUseEver) -- set window position x, y
	ImGui.SetNextWindowSize(600, 300, ImGuiCond.Appearing) -- set window size w, h
	
	-- Main Window
	if ImGui.Begin("Debug Menu - Entity Inspector") then

		-- Draw the tabs within the window
		self:DrawMainWindowTabs()

		if self.ShowInspectors then 
			-- Draw the other open Entity windows
			--self.Inspector:DrawEntityWindows()
			ImGui.SetNextWindowSize(630, 700, ImGuiCond.Appearing)
			if ImGui.Begin("Entity Inspector") then 
				if ImGui.BeginTabBar("Inspector", ImGuiTabBarFlags.Reorderable) then 
					-- Draw the main window
					self.Inspector:DrawTab(nil, "Targeted") -- Draw main tab

					for i, v in pairs(self.OpenedInspectorWindows) do
						v:DrawTab()
					end
				end
				ImGui.EndTabBar()
			end
		end

	end
	ImGui.End()
end

function DebugMenu:DrawMainWindowTabs()
	if ImGui.BeginTabBar("TabBar") then 
		if (ImGui.BeginTabItem("Main")) then
			ImGui.Spacing()
			
			self:DrawToggleInspectorWindow()

			if ImGui.Button("Close All Entity Inspector Windows") then
				self.OpenedInspectorWindows = {}
			end
			
			-- Draw the saved entites
			self:DrawSavedEntites()
			
			ImGui.EndTabItem()
		end

		if (ImGui.BeginTabItem("All Objects In View")) then
			ImGui.Spacing()
			self:DrawAllObjectsTab()
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
			self:DrawDebugTab()
			ImGui.EndTabItem()
		end


		if (ImGui.BeginTabItem("Settings")) then
			ImGui.Spacing()
			self:DrawSettingsTab()
			ImGui.EndTabItem()
		end
	end
	ImGui.EndTabBar()
end

-- Draw the toggle button for the inspector window
function DebugMenu:DrawToggleInspectorWindow() 
	value, pressed = ImGui.Checkbox("Toggle Inspector Window", self.ShowInspectors)
	if pressed then 
		self.ShowInspectors = value
	end
end

-- Draw the Settings tab
function DebugMenu:DrawSettingsTab()
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

	value, pressed = ImGui.Checkbox("Print Errors", self.PrintErrors)
	if pressed then 
		self.PrintErrors = value
	end

	ImGui.Spacing()
end

-- Display saved entites
function DebugMenu:DrawSavedEntites()
	ImGui.Text("Saved Entites - ")
	ImGui.Indent()
	for key, value in pairs(self.SavedEntites) do
		if (value ~= nil) then 
			if ImGui.CollapsingHeader(key) then 
				ImGui.Indent()
				ImGui.Text("Does Entity still exist: - " .. tostring(not Game:BMIsEntityNull(value.Entity)))
				-- Check if it's already opened
				if self.OpenedInspectorWindows[key] == nil then
						if ImGui.Button("Open " .. key) then 
							self.OpenedInspectorWindows[key] = value
						end
					else
						if ImGui.Button("Close " .. key) then 
							self.OpenedInspectorWindows[key] = nil
						end
					end

					-- The remove button for deleting a entry and removing the inspector window
					if key ~= "Player" and ImGui.Button("Remove " .. key) then 
						self.OpenedInspectorWindows[key] = nil
						self.SavedEntites[key] = nil 
					end
				ImGui.Unindent()
			end

			if self.AutoRemoveNilEntries == true and Game:BMIsEntityNull(value.Entity) then 
				self.OpenedInspectorWindows[key] = nil
				self.SavedEntites[key] = nil
			end
		end
	end
	ImGui.Unindent()
end

-- Draw the the All Objects tab
function DebugMenu:DrawAllObjectsTab()
	if ImGui.Button("Destroy All") then
		self:DoActionAllObjects(
			function(i, entity) 
				entity:GetEntity():Destroy(entity:GetEntity()) 
			end
		)
	end

	if ImGui.Button("Kill All") then
		self:DoActionAllObjects(
			function(i, entity) 
				if (entity:IsNPC()) then 
					entity:Kill(entity, false, false) 
				end
			end
		)
	end

	BradenMenu.IGE.DrawNodeTree("TSQ_ALL", "entEntity", {}, 
		function() 
			self:DoActionAllObjects(
				function(i, entity) 
					local name = Game.NameToString(entity:GetDisplayName())
					if name == "" then name = Game.NameToString(entity:GetCurrentAppearanceName()) end
					if BradenMenu.IGE.TextToTreeNode(i .. " - entEntity - " .. name) then 
						BradenMenu.IGE.DrawCacheEntityInput(entity)
						ImGui.Unindent()
					end 
				end
			)
		end
	)
end

-- Do an action on all the obectives in the players view
function DebugMenu:DoActionAllObjects(func) 
	local searchQuery = Game["TSQ_ALL;"]()
	searchQuery.maxDistance = 10000
	local success, parts = Game.GetTargetingSystem():GetTargetParts(Game.GetPlayer(), searchQuery, {})
	if success then 
		for i, v in ipairs(parts) do
			local entity = v:GetComponent(v):GetEntity()
			if entity then
				func(i, entity) 
			end
		end
	end
end

-- Draw the the Debug tab
function DebugMenu:DrawDebugTab()
	ImGui.Text("Dumps information for a given class to the 'Dumps' directory within the mod.")
	ImGui.Spacing()
	text, selected = ImGui.InputTextMultiline("Class Name", self.DumpClassName, 100, 200, 20)
	if selected then self.DumpClassName = text end

	if ImGui.Button("Dump class") then 
		self:DumpClass(self.DumpClassName)
	end
end

-- Dump information given a class name
function DebugMenu:DumpClass(className)
	local comp = GetSingleton(self.DumpClassName)

	local dump = tostring(Dump(comp, false))
	local file = io.open("Dumps\\" .. self.DumpClassName .. ".lua", "w")

	file:write(tostring(dump))
	file:close()
end

-- The global game functions, simple buttons
function DebugMenu:DrawGlobalGameFunctionButtons()

	--[[if (ImGui.CollapsingHeader("Player")) then
		ImGui.Spacing()
		self.Inspector:drawPositionChanger(Game.GetPlayer())
		ImGui.EndTabItem()
	end
	if (ImGui.CollapsingHeader("Game Functions")) then
		ImGui.Spacing()
		ImGui.Indent()]]
		if ImGui.Button("Game.ForcedNPCDeath()") then Game.ForcedNPCDeath() end
		if ImGui.Button("Game.awacstest()") then Game.awacstest() end
		if ImGui.Button("Game.BreachNearestAP()") then Game.BreachNearestAP() end
		if ImGui.Button("Game.BreakEffectLoop()") then Game.BreakEffectLoop() end
		if ImGui.Button("Game.CGLP()") then Game.CGLP() end
		if ImGui.Button("Game.ChangeArea()") then Game.ChangeArea() end
		if ImGui.Button("Game.ChangeZoneIndicatorDanger()") then Game.ChangeZoneIndicatorDanger() end
		if ImGui.Button("Game.ChangeZoneIndicatorPublic()") then Game.ChangeZoneIndicatorPublic() end
		if ImGui.Button("Game.ChangeZoneIndicatorRestricted()") then Game.ChangeZoneIndicatorRestricted() end
		if ImGui.Button("Game.ChangeZoneIndicatorSafe()") then Game.ChangeZoneIndicatorSafe() end
		if ImGui.Button("Game.CheatExposeNPCQuickHacks()") then Game.CheatExposeNPCQuickHacks() end
		if ImGui.Button("Game.CLS_off()") then Game.CLS_off() end
		if ImGui.Button("Game.CLS_on()") then Game.CLS_on() end
		if ImGui.Button("Game.CLS_reset()") then Game.CLS_reset() end
		if ImGui.Button("Game.DbgBraindanceIsActive()") then Game.DbgBraindanceIsActive() end
		if ImGui.Button("Game.DbgBraindanceIsPaused()") then Game.DbgBraindanceIsPaused() end
		if ImGui.Button("Game.DbgBraindancePlayDirection()") then Game.DbgBraindancePlayDirection() end
		if ImGui.Button("Game.DbgBraindancePlaySpeed()") then Game.DbgBraindancePlaySpeed() end
		if ImGui.Button("Game.DbgBraindanceProgress()") then Game.DbgBraindanceProgress() end
		if ImGui.Button("Game.DbgBraindanceTimeInSec()") then Game.DbgBraindanceTimeInSec() end
		if ImGui.Button("Game.debug_AddLog()") then Game.debug_AddLog() end
		if ImGui.Button("Game.Debug_WeaponSpread_RandomCircular()") then Game.Debug_WeaponSpread_RandomCircular() end
		if ImGui.Button("Game.Debug_WeaponSpread_RandomGrid()") then Game.Debug_WeaponSpread_RandomGrid() end
		if ImGui.Button("Game.debug_AddLog()") then Game.debug_AddLog() end
		if ImGui.Button("Game.DecreaseGlobalTimeDilation()") then Game.DecreaseGlobalTimeDilation() end
		if ImGui.Button("Game.DecreasePlayerTimeDilation()") then Game.DecreasePlayerTimeDilation() end
		if ImGui.Button("Game.IncreaseGlobalTimeDilation()") then Game.IncreaseGlobalTimeDilation() end
		if ImGui.Button("Game.IncreasePlayerTimeDilation()") then Game.IncreasePlayerTimeDilation() end
		if ImGui.Button("Game.DemolitionUp()") then Game.DemolitionUp() end
		if ImGui.Button("Game.DespawnFlathead()") then Game.DespawnFlathead() end
		if ImGui.Button("Game.EnableAllPlayerVehicles()") then Game.EnableAllPlayerVehicles() end
		if ImGui.Button("Game.EnterBD()") then Game.EnterBD() end
		if ImGui.Button("Game.LeaveBD()") then Game.LeaveBD() end
		if ImGui.Button("Game.gebs()") then Game.gebs() end
		if ImGui.Button("Game.GetAllPerks()") then Game.GetAllPerks() end
		if ImGui.Button("Game.God1()") then Game.God1() end
		if ImGui.Button("Game.God2()") then Game.God2() end
		if ImGui.Button("Game.GodClearAll()") then Game.GodClearAll() end
		if ImGui.Button("Game.Hotkeys()") then Game.Hotkeys() end
		if ImGui.Button("Game.HotkeysNOW()") then Game.HotkeysNOW() end
		if ImGui.Button("Game.Kill()") then Game.Kill() end
		if ImGui.Button("Game.KillAll()") then Game.KillAll("1000") end
		if ImGui.Button("Game.KillEffect()") then Game.KillEffect() end
		if ImGui.Button("Game.LevelUp()") then Game.LevelUp() end
		if ImGui.Button("Game.mwtest()") then Game.mwtest() end
		if ImGui.Button("Game.NetrunnerTesting()") then Game.NetrunnerTesting() end
		if ImGui.Button("Game.Noslowmo()") then Game.Noslowmo() end
		if ImGui.Button("Game.PlayerSD()") then Game.PlayerSD() end
		if ImGui.Button("Game.PrevSys_active()") then Game.PrevSys_active() end
		if ImGui.Button("Game.PrevSys_off()") then Game.PrevSys_off() end
		if ImGui.Button("Game.PrevSys_on()") then Game.PrevSys_on() end
		if ImGui.Button("Game.PrevSys_safe()") then Game.PrevSys_safe() end
		if ImGui.Button("Game.Rev()") then Game.Rev() end
		if ImGui.Button("Game.SetActionContext()") then Game.SetActionContext() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.SetBreathingAll()") then Game.SetBreathingAll() end
		if ImGui.Button("Game.SetBreathingHeavy()") then Game.SetBreathingHeavy() end
		if ImGui.Button("Game.SetBreathingJohnny()") then Game.SetBreathingJohnny() end
		if ImGui.Button("Game.SetBreathingLow()") then Game.SetBreathingLow() end
		if ImGui.Button("Game.SetBreathingOff()") then Game.SetBreathingOff() end
		if ImGui.Button("Game.SetBreathingSick()") then Game.SetBreathingSick() end
		if ImGui.Button("Game.SetRpgContext()") then Game.SetRpgContext() end
		if ImGui.Button("Game.Slowmo()") then Game.Slowmo() end
		if ImGui.Button("Game.SM()") then Game.SM() end
		if ImGui.Button("Game.SpawnFlathead()") then Game.SpawnFlathead() end
		if ImGui.Button("Game.SpawnTestEffect()") then Game.SpawnTestEffect() end
		if ImGui.Button("Game.StreetCredUp()") then Game.StreetCredUp() end
		if ImGui.Button("Game.SwapItemPart()") then Game.SwapItemPart() end
		if ImGui.Button("Game.t1()") then Game.t1() end
		if ImGui.Button("Game.t2()") then Game.t2() end
		if ImGui.Button("Game.TestDrop()") then Game.TestDrop() end
		if ImGui.Button("Game.TestCustomQuestNotification()") then Game.TestCustomQuestNotification() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.ClearEquipment()") then Game.ClearEquipment() end
		--ImGui.Unindent()
	--end
end

-- End of DebugMenu Class

return DebugMenu
