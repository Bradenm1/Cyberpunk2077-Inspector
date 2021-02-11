-- Begin of ScanApp Class

BradenMenu = {
	description = "Tool used for Inspecting Entities among other things.",
	rootPath = "BradenMenu."
}

function BradenMenu:new()

	setmetatable(BradenMenu, self)
	self.__index = self

	-- Register menu vars
	self.DrawUI = false
	self.AlwaysShow = false
	self.EntityEditorActive = false
	self.AutoRemoveNilEntries = true
	self.SavedEntityCacheTextName = "exampleName" -- Name to save entity under
	self.DumpClassName = "NPCPuppet" -- Class to dump
	self.FilterText = "" -- The test to filter by on the inspector window
	self.SavedEntites = {} -- The entities the user has saved for the session
	self.SavedConpoments = {}
	self.OpenedInspectorWindows = {}

	-- Register the callbacks
	BradenMenu:RegisterCallbacks()

   return BradenMenu
end

-- Register the callbacks for this mod menu
function BradenMenu:RegisterCallbacks() 
	registerForEvent("onUpdate", function(deltaTime)
		-- asdasd
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
			local success, err = pcall(function () BradenMenu:DrawWindow() end)

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
	if ImGui.Begin("Debug Menu", true) then

		-- Draw the tabs within the window
		BradenMenu:DrawMainWindowTabs()

		if BradenMenu.EntityEditorActive == true then
			BradenMenu:DrawEntityWindow(nil, "Targeted")
		end

		-- Draw the other open Entity windows
		BradenMenu:DrawEntityWindows()

		-- Check if the player was removed, if so re-add it.
		if self.SavedEntites["Player"] == nil and BradenMenu:GetPlayer() then 
			self.SavedEntites["Player"] = BradenMenu:GetPlayer() 
		end
	end
	ImGui.End()
end

function BradenMenu:DrawMainWindowTabs()
	if ImGui.BeginTabBar("TabBar") then 
		if (ImGui.BeginTabItem("Main")) then
			ImGui.Spacing()
			if self.EntityEditorActive == false then
				if ImGui.Button("Open Entity Inspector") then
					self.EntityEditorActive = true
				end
			else
				if ImGui.Button("Close Entity Inspector") then
					self.EntityEditorActive = false
				end
			end

			if ImGui.Button("Close All Inspectors") then
				self.EntityEditorActive = 0
				self.OpenedInspectorWindows = {}
			end
			
			-- Draw the saved entites
			BradenMenu:DrawSavedEntites()
			
			-- Draw the saved conpoments
			BradenMenu:DrawSavedConpoments()
			
			ImGui.EndTabItem()
		end

		-- The game tab
		if (ImGui.BeginTabItem("Game")) then
			ImGui.Spacing()
			BradenMenu:DrawGlobalGameFunctionButtons()
			ImGui.EndTabItem()
		end

		-- The debug
		if (ImGui.BeginTabItem("Debug")) then
			ImGui.Spacing()
			BradenMenu:DrawDumpClass()
			ImGui.EndTabItem()
		end


		if (ImGui.BeginTabItem("Settings")) then
			ImGui.Spacing()
			value, pressed = ImGui.Checkbox("Always Show Windows", self.AlwaysShow)
			if pressed then
				self.AlwaysShow = value
			end
	
			value, pressed = ImGui.Checkbox("Auto Remove Nil Entries", self.AutoRemoveNilEntries)
			if pressed then 
				self.AutoRemoveNilEntries = value
			end
			ImGui.Spacing()
			ImGui.EndTabItem()
		end
	end
	ImGui.EndTabBar()
end

-- Draw all entity windows
function BradenMenu:DrawEntityWindows()
	for i, entity in pairs(self.OpenedInspectorWindows) do
		BradenMenu:DrawEntityWindow(entity, entity:GetDisplayName() .. " | " .. i)

		if BradenMenu:IsEntityNull(entity) == true and self.AutoRemoveNilEntries == true then 
			table.remove(self.OpenedInspectorWindows, i)
		end
	end
end

-- Display saved entites
function BradenMenu:DrawSavedEntites()
	ImGui.Text("Saved Entites -")
	ImGui.Indent()
	for key, value in pairs(self.SavedEntites) do
		if (value ~= nil) then 
			if ImGui.CollapsingHeader(key, ImGuiTreeNodeFlags.Selected) then 
				ImGui.Indent()
				if ImGui.Button("Open Inspector Window") then 
					table.insert(self.OpenedInspectorWindows, value) 
				end
				if ImGui.Button("Remove Entry") then 
					self.SavedEntites[key] = nil 
					table.remove(self.OpenedInspectorWindows, tonumber(key))
				end
				ImGui.Unindent()
			end

			if self.AutoRemoveNilEntries == true and BradenMenu:IsEntityNull(value) then 
				self.SavedEntites[key] = nil
			end
		end
	end
	ImGui.Unindent()
end

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

function BradenMenu:DrawEntityWindow(entity, windowName)
	ImGui.SetNextWindowSize(800, 700, ImGuiCond.Appearing)
	if ImGui.Begin("Entity Inspector - " .. windowName) then 
		if windowName == "Targeted" then
			-- Display a hint on how to use
			BradenMenu:TargetHint()
			ImGui.Spacing()
		end
		
		-- If the given entity is nil for this window use the entity the player is currently looking at
		if entity == nil then 
			entity = BradenMenu:GetTargetEntity()
		end

		-- Draw the tabs within the window
		BradenMenu:DrawEntityInsepectionTabs(entity)
	end
	ImGui.End()
end

-- Draw the tabs for the Entity Inspector
function BradenMenu:DrawEntityInsepectionTabs(entity)
	if ImGui.BeginTabBar("TabBar") then 

		-- The View tab
		if (ImGui.BeginTabItem("View")) then
			ImGui.Spacing()
			BradenMenu:DrawFilterInput()
			BradenMenu:DrawEntityInsepectionView(entity)
			ImGui.EndTabItem()
		end

		-- The Edit tab
		if (ImGui.BeginTabItem("Edit")) then
			ImGui.Spacing()
			BradenMenu:DrawEntityInsepectionEdit(entity)
			ImGui.EndTabItem()
		end

		-- The Settings tab
		if (ImGui.BeginTabItem("Settings")) then
			ImGui.Spacing()
			BradenMenu:DrawEntityInsepectionSetting(entity)
			ImGui.EndTabItem()
		end
	end
	ImGui.EndTabBar()
end

function BradenMenu:DrawEntityInsepectionView(entity)
	if (entity ~= nil) then
		BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)
	else
		BradenMenu:DrawWindowEntityInspecterNoEntity()
	end
end

function BradenMenu:DrawEntityInsepectionEdit(entity)
	if (entity ~= nil) then
		BradenMenu:DrawWindowEntityInspecterEditHasEntity(entity)
	else
		BradenMenu:DrawWindowEntityInspecterNoEntity()
	end
end

-- This draws the input box and the button used for saving a given entity
function BradenMenu:DrawEntityInsepectionSetting(entity)
	if (entity ~= nil) then
		text, selected = ImGui.InputTextMultiline("Cache Name", self.SavedEntityCacheTextName, 100, 200, 20)
		if selected then self.SavedEntityCacheTextName = text end
		if ImGui.Button("Save Targeted Entity") then 
			self.SavedEntites[self.SavedEntityCacheTextName] = entity
		end
	else
		BradenMenu:DrawWindowEntityInspecterNoEntity()
	end
end

function BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)

	-- Display information related to the Entity
	if ImGui.CollapsingHeader("Entity") then
		BradenMenu:DrawWindowEntityEntity(entity)
	end

	-- Display information related to the GameObject
	if ImGui.CollapsingHeader("GameObject") then 
		BradenMenu:DrawWindowEntityGameObject(entity)
	end

	-- Display information related to the vehicleCarBaseObject
	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject") then 

		end
	end

	-- Display information related to the gamePuppet
	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet") then 
			BradenMenu:DrawWindowEntityGamePuppet(entity)
		end
	end

	-- Display information related to the ScriptedPuppet
	if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet") then 
			BradenMenu:DrawWindowEntityScriptedPuppet(entity)
		end
	end
end

function BradenMenu:DrawWindowEntityInspecterEditHasEntity(entity)
	if ImGui.CollapsingHeader("Entity", ImGuiTreeNodeFlags.Selected) then 
		ImGui.Indent()
		if ImGui.Button("Kill") then entity:Kill(entity, false, false) end
		if ImGui.Button("Destroy") then entity:GetEntity():Destroy(entity:GetEntity()) end
		if ImGui.Button("UnbindTransform") then entity:GetEntity():UnbindTransform(entity:GetEntity()) end
		if ImGui.Button("CycleRandomAppearance") then entity:ScheduleAppearanceChange("") end
		if ImGui.Button("Follow Player") then 
			local follow = GetSingleton('AIFollowerRole')
			follow:SetFollowTarget(Game.GetPlayer())
			entity:GetAIControllerComponent():SetAIRole(follow)
		end
		if ImGui.Button("Teleport Player To Entity") then 
			entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(Game.GetPlayer(), entity:GetWorldPosition(), EulerAngles.new(0,0,0)) 
		end
		if ImGui.Button("Teleport To Player") then 
			entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(entity, Game.GetPlayer():GetWorldPosition(), EulerAngles.new(0,0,0))
		end

		ImGui.Unindent()
	end
	
	if ImGui.CollapsingHeader("GameObject", ImGuiTreeNodeFlags.Selected) then 
		ImGui.Indent()
		if ImGui.Button("EvaluateMappinsVisualState") then entity:EvaluateMappinsVisualState() end
		if ImGui.Button("FadeOutOutlines") then entity:FadeOutOutlines() end
		if ImGui.Button("FireSingleE3Tick") then entity:FireSingleE3Tick() end
		if ImGui.Button("ForceDefeatReward") then entity:ForceDefeatReward(true) end
		if ImGui.Button("TryOpenQuickhackMenu") then entity:TryOpenQuickhackMenu(true) end
		if ImGui.Button("ToggleQuestImportance") then entity:ToggleQuestImportance(false) end
		if ImGui.Button("EvaluateLastFrameRequest") then entity:EvaluateLastFrameRequest() end
		ImGui.Unindent()
	end

	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject", ImGuiTreeNodeFlags.Selected) then 
			ImGui.Indent()
			if ImGui.Button("ToggleOn") then entity:TurnOn(not entity:IsTurnedOn()) end
			if ImGui.Button("ToggleEngineOn") then entity:TurnEngineOn(not entity:IsEngineTurnedOn()) end
			if ImGui.Button("DetachAllParts") then entity:DetachAllParts() end
			if ImGui.Button("DestructionResetGrid") then entity:DestructionResetGrid() end
			if ImGui.Button("DestructionResetGlass") then entity:DestructionResetGlass() end
			if ImGui.Button("ResetTimesSentReactionEvent") then entity:ResetTimesSentReactionEvent() end
			if ImGui.Button("ResetReactionSequenceOfAllPassengers") then entity:ResetReactionSequenceOfAllPassengers() end
			if ImGui.Button("RestoreRevealState") then entity:RestoreRevealState() end
			ImGui.Unindent()
		end
	end

	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet", ImGuiTreeNodeFlags.Selected) then 	
			ImGui.Indent()
			if ImGui.Button("CacheLootForDroping") then entity:CacheLootForDroping() end
			if ImGui.Button("DropAmmo") then entity:DropAmmo() end
			if ImGui.Button("DropLootBag") then entity:DropLootBag() end
			if ImGui.Button("DropWeapons") then entity:DropWeapons() end
			if ImGui.Button("GenerateLoot") then entity:GenerateLoot() end
			if ImGui.Button("SendAIDeathSignal") then entity:SendAIDeathSignal() end
			if ImGui.Button("SetIsDead") then entity:GetPuppetPS():SetIsDead(true) end
			if ImGui.Button("SetAttitudeGroup hostile") then entity:GetAttitude():SetAttitudeGroup("hostile") end
			if ImGui.Button("SetAttitudeGroup civilian") then entity:GetAttitude():SetAttitudeGroup("civilian") end
			if ImGui.Button("SetAttitudeGroup neutral") then entity:GetAttitude():SetAttitudeGroup("neutral") end
			if ImGui.Button("Toggle Move Policies") then entity.movePolicies:Toggle(not entity.movePolicies:IsEnabled()) end
			ImGui.Unindent()
		end
	end

	if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet", ImGuiTreeNodeFlags.Selected) then 
			ImGui.Indent()
			if ImGui.Button("RevokeAllTickets") then entity:RevokeAllTickets() end
			if ImGui.Button("ResolveQualityRangeInteractionLayer") then entity:ResolveQualityRangeInteractionLayer() end
			if ImGui.Button("RemoveListeners") then entity:RemoveListeners() end
			if ImGui.Button("RegisterSubCharacter") then entity:RegisterSubCharacter() end
			if ImGui.Button("RefreshCachedReactionPresetData") then entity:RefreshCachedReactionPresetData() end
			if ImGui.Button("ProcessEnemyNetrunnerTutorialFact") then entity:ProcessEnemyNetrunnerTutorialFact() end
			if ImGui.Button("RemoveLink") then entity:RemoveLink() end
			if ImGui.Button("StartOxygenDecay") then entity:StartOxygenDecay() end
			if ImGui.Button("PlayerAttachedCallback") then Game.GetPlayer():PlayerAttachedCallback(entity) end
			if ImGui.Button("CanRevealRemoteActionsWheel") then entity:CanRevealRemoteActionsWheel() end
			if ImGui.Button("AwardsExperience") then entity:AwardsExperience() end
			ImGui.Unindent()
		end
	end

end

function BradenMenu:DrawWindowEntityEntity(entity)
	ImGui.Indent()

	-- Functions
	BradenMenu:DrawNodeTree("GetEntityID", "entEntityID", entity:GetEntityID(), 
		function(entEntityID)  BradenMenu:DrawWindowentEntityID(entEntityID) end
	)
	
	--ImGui.Text("CurrentAppearanceName: " .. tostring(entity:GetCurrentAppearanceName()):match("%[ (%g+) -"))
	BradenMenu:DrawWindowCName("GetCurrentAppearanceName", entity:GetCurrentAppearanceName())
	BradenMenu:DrawWindowCName("GetCurrentContext", entity:GetCurrentContext())
	BradenMenu:ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	BradenMenu:ObjectToText("GetWorldOrientation", entity:GetWorldOrientation())
	BradenMenu:DisplayVector4("GetWorldForward", entity:GetWorldForward())
	BradenMenu:DisplayVector4("GetWorldPosition", entity:GetWorldPosition())
	BradenMenu:DisplayVector4("GetWorldRight", entity:GetWorldPosition())
	BradenMenu:DisplayVector4("GetWorldUp", entity:GetWorldUp())
	BradenMenu:ObjectToText("GetWorldYaw", entity:GetWorldYaw())

	BradenMenu:DrawNodeTree("GetWorldTransform", "WorldTransform", entity:GetWorldTransform(), 
		function(worldTransform)  BradenMenu:DrawWindowWorldTransform(worldTransform) end
	)

	--BradenMenu:AddConpoment(entity:GetWorldTransform())
	BradenMenu:ObjectToText("IsAttached", entity:IsAttached()) -- Good way to tell if object has been deleted!
	BradenMenu:ObjectToText("IsControlledByAnotherClient", entity:IsControlledByAnotherClient())
	BradenMenu:ObjectToText("IsControlledByAnyPeer", entity:IsControlledByAnyPeer())
	BradenMenu:ObjectToText("IsControlledByLocalPeer", entity:IsControlledByLocalPeer())
	BradenMenu:ObjectToText("IsReplicated", entity:IsReplicated())

	if entity:IsPlayer() then
		BradenMenu:DisplayObjectArray("GetPlayerCurrentWorkspotTags", "CName", entity:GetPlayerCurrentWorkspotTags(),
			function(key, value) BradenMenu:DrawWindowCName("Tag", value)end
		)
	end

	-- Variables
	if entity.statesComponent ~= nil then 
		BradenMenu:ObjectToText("regularRecordID", entity.statesComponent.regularRecordID)
		BradenMenu:ObjectToText("highLevelAnimFeatureName", entity.statesComponent.highLevelAnimFeatureName)
		BradenMenu:ObjectToText("upperBodyAnimFeatureName", entity.statesComponent.upperBodyAnimFeatureName)
		BradenMenu:ObjectToText("stanceAnimFeatureName", entity.statesComponent.stanceAnimFeatureName)
		BradenMenu:ObjectToText("name", entity.statesComponent.name)
	end

	ImGui.Unindent()
end

function BradenMenu:DrawWindowEntityGamePuppet(entity)
	ImGui.Indent()

	-- Functions
	BradenMenu:ObjectToText("CanRagdoll" , entity:CanRagdoll())

	BradenMenu:DrawNodeTree("GetAttitude", "gameAttitudeAgent", entity:GetAttitude(), 
		function(gameAttitudeAgent)  BradenMenu:DrawWindowgameAttitudeAgent(gameAttitudeAgent) end
	)

	BradenMenu:DrawNodeTree("GetRecord", "gameDataCharacter_Record", entity:GetRecord(), 
		function(gameDataCharacter_Record)  BradenMenu:DrawWindowgameDataCharacter_Record(gameDataCharacter_Record) end
	)

	BradenMenu:DrawWindowCName("GetBodyType", entity:GetBodyType())
	BradenMenu:DisplayVector4("GetLastValidNavmeshPoint", entity:GetLastValidNavmeshPoint()) 
	BradenMenu:DrawWindowCName("GetResolvedGenderName", entity:GetResolvedGenderName())
	BradenMenu:DisplayVector4("GetVelocity", entity:GetVelocity()) 
	BradenMenu:ObjectToText("HasCPOMissionData" , entity:HasCPOMissionData())
	BradenMenu:ObjectToText("HasCrowdStaticLOD" , entity:HasCrowdStaticLOD())
	BradenMenu:ObjectToText("IsLooted" , entity:IsLooted())
	BradenMenu:ObjectToText("WasLootGenerated" , entity:WasLootGenerated())

	ImGui.Unindent()
end

function BradenMenu:DrawWindowEntityScriptedPuppet(entity)
	ImGui.Indent()

	ImGui.Unindent()
end


function BradenMenu:DrawWindowEntityGameObject(entity)
	ImGui.Indent()

	-- Functions
	BradenMenu:ObjectToText("DisplayName: " , entity:GetDisplayName())
	BradenMenu:ObjectToText("GetTracedActionName: " , entity:GetTracedActionName())

	BradenMenu:DrawNodeTree("GetOwner", "entEntity", entity:GetOwner(), 
		function(entityOwner)  BradenMenu:DrawWindowEntityInspecterViewHasEntity(entityOwner) end
	)

	if entity:IsNPC() then 
		BradenMenu:DrawNodeTree("GetKiller", "entEntity", entity:GetKiller(), 
			function(entityKiller) BradenMenu:DrawWindowEntityInspecterViewHasEntity(entityKiller) end
		)
	end

	local trackerComponent = entity:GetTargetTrackerComponent()
	if trackerComponent ~= nil then 
		if BradenMenu:TextToTreeNode("GetTargetTrackerComponent: - AITargetTrackerComponent") then 
			ImGui.Text("GetThreats: " .. tostring(trackerComponent:GetThreats(false)))
			ImGui.Indent()
			for i, aiTrackedLocation in ipairs(trackerComponent:GetThreats(false)) do
				if BradenMenu:TextToTreeNode("Index - " .. i) then 
					BradenMenu:DrawWindowAITrackedLocation(aiTrackedLocation)
					ImGui.Unindent()
				end
			end
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		BradenMenu:ObjectToText("GetTargetTrackerComponent", trackerComponent)
	end

	BradenMenu:ObjectToText("IsAccessPoint", entity:IsAccessPoint())
	BradenMenu:ObjectToText("IsActive", entity:IsActive())
	BradenMenu:ObjectToText("IsActiveBackdoor", entity:IsActiveBackdoor())
	BradenMenu:ObjectToText("IsAnyClueEnabled" , entity:IsAnyClueEnabled())
	BradenMenu:ObjectToText("IsAnyPlaystyleValid" , entity:IsAnyPlaystyleValid())
	BradenMenu:ObjectToText("IsBackdoor" , entity:IsBackdoor())
	BradenMenu:ObjectToText("IsBodyDisposalPossible" , entity:IsBodyDisposalPossible())
	BradenMenu:ObjectToText("IsBraindanceBlocked" , entity:IsBraindanceBlocked())
	BradenMenu:ObjectToText("IsBreached" , entity:IsBreached())
	BradenMenu:ObjectToText("IsClueInspected" , entity:IsClueInspected())
	BradenMenu:ObjectToText("IsConnectedToBackdoorDevice" , entity:IsConnectedToBackdoorDevice())
	BradenMenu:ObjectToText("IsConnectedToSecuritySystem" , entity:IsConnectedToSecuritySystem())
	BradenMenu:ObjectToText("IsContainer" , entity:IsContainer())
	BradenMenu:ObjectToText("IsControllingDevices" , entity:IsControllingDevices())
	BradenMenu:ObjectToText("IsCurrentlyScanned" , entity:IsCurrentlyScanned())
	BradenMenu:ObjectToText("IsCurrentTarget" , entity:IsCurrentTarget())
	BradenMenu:ObjectToText("IsDead" , entity:IsDead())
	BradenMenu:ObjectToText("IsDeadNoStatPool" , entity:IsDeadNoStatPool())
	BradenMenu:ObjectToText("IsDemolitionSkillCheckActive" , entity:IsDemolitionSkillCheckActive())
	BradenMenu:ObjectToText("IsDevice" , entity:IsDevice())
	BradenMenu:ObjectToText("IsDrone" , entity:IsDrone())
	BradenMenu:ObjectToText("IsDropPoint" , entity:IsDropPoint())
	BradenMenu:ObjectToText("IsEngineeringSkillCheckActive" , entity:IsEngineeringSkillCheckActive())
	BradenMenu:ObjectToText("IsExplosive" , entity:IsExplosive())
	BradenMenu:ObjectToText("IsFastTravelPoint" , entity:IsFastTravelPoint())
	BradenMenu:ObjectToText("IsGameplayRelevant" , entity:IsGameplayRelevant())
	BradenMenu:ObjectToText("IsGrouppedClue" , entity:IsGrouppedClue())
	BradenMenu:ObjectToText("IsHackingPlayer" , entity:IsHackingPlayer())
	BradenMenu:ObjectToText("IsHackingSkillCheckActive" , entity:IsHackingSkillCheckActive())
	BradenMenu:ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	BradenMenu:ObjectToText("CanRevealRemoteActionsWheel" , entity:CanRevealRemoteActionsWheel())
	BradenMenu:ObjectToText("GetScannerAttitudeTweak" , entity:GetScannerAttitudeTweak())
	BradenMenu:ObjectToText("GetSensesComponent" , entity:GetSensesComponent())
	BradenMenu:ObjectToText("CalculateRealTimePassed" , entity:CalculateRealTimePassed())
	BradenMenu:ObjectToText("CalculateAmountOfTicks" , entity:CalculateAmountOfTicks())
	BradenMenu:ObjectToText("ShouldEnableOutlineRed" , entity:ShouldEnableOutlineRed())
	BradenMenu:ObjectToText("ShouldEnableOutlineGreen" , entity:ShouldEnableOutlineGreen())
	BradenMenu:ObjectToText("CanBeTagged" , entity:CanBeTagged())
	BradenMenu:ObjectToText("GetCurrentOutline" , entity:GetCurrentOutline())
	BradenMenu:ObjectToText("GetDefaultHighlightType" , entity:GetDefaultHighlightType())
	BradenMenu:ObjectToText("GetObjectToForwardHighlight" , entity:GetObjectToForwardHighlight())
	BradenMenu:ObjectToText("GetBraindanceLayer" , entity:GetBraindanceLayer())
	BradenMenu:ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	BradenMenu:ObjectToText("IsHighlightedInFocusMode" , entity:IsHighlightedInFocusMode())
	BradenMenu:ObjectToText("IsHostile: " , entity:IsHostile())
	BradenMenu:ObjectToText("IsInIconForcedVisibilityRange: " , entity:IsInIconForcedVisibilityRange())
	BradenMenu:ObjectToText("IsInitialized" , entity:IsInitialized())
	BradenMenu:ObjectToText("IsInvestigating" , entity:IsInvestigating())
	BradenMenu:ObjectToText("IsItem" , entity:IsItem())
	BradenMenu:ObjectToText("IsJohnnyReplacer" , entity:IsJohnnyReplacer())
	BradenMenu:ObjectToText("IsLogicReady" , entity:IsLogicReady())
	BradenMenu:ObjectToText("IsNetrunner" , entity:IsNetrunner())
	BradenMenu:ObjectToText("IsNetworkKnownToPlayer" , entity:IsNetworkKnownToPlayer())
	BradenMenu:ObjectToText("IsNetworkLinkDynamic" , entity:IsNetworkLinkDynamic())
	BradenMenu:ObjectToText("IsNPC" , entity:IsNPC())
	BradenMenu:ObjectToText("IsObjectRevealed" , entity:IsObjectRevealed())
	BradenMenu:ObjectToText("IsPhotoModeBlocked" , entity:IsPhotoModeBlocked())
	BradenMenu:ObjectToText("IsPlayer" , entity:IsPlayer())
	BradenMenu:ObjectToText("IsPlayerControlled" , entity:IsPlayerControlled())
	BradenMenu:ObjectToText("IsPrevention" , entity:IsPrevention())
	BradenMenu:ObjectToText("IsPuppet" , entity:IsPuppet())
	BradenMenu:ObjectToText("IsQuest" , entity:IsQuest())
	BradenMenu:ObjectToText("IsQuickHackAble" , entity:IsQuickHackAble())
	BradenMenu:ObjectToText("IsQuickHacksExposed" , entity:IsQuickHacksExposed())
	BradenMenu:ObjectToText("IsReplacer" , entity:IsReplacer())
	BradenMenu:ObjectToText("IsScaningCluesBlocked" , entity:IsScaningCluesBlocked())
	BradenMenu:ObjectToText("IsScanned" , entity:IsScanned())
	BradenMenu:ObjectToText("IsScannerDataDirty" , entity:IsScannerDataDirty())
	BradenMenu:ObjectToText("IsSelectedForDebugging" , entity:IsSelectedForDebugging())
	BradenMenu:ObjectToText("IsSensor" , entity:IsSensor())
	BradenMenu:ObjectToText("IsShardContainer" , entity:IsShardContainer())
	BradenMenu:ObjectToText("IsSolo" , entity:IsSolo())
	BradenMenu:ObjectToText("IsTaggedinFocusMode" , entity:IsTaggedinFocusMode())
	BradenMenu:ObjectToText("IsTechie" , entity:IsTechie())
	BradenMenu:ObjectToText("IsTurret" , entity:IsTurret())
	BradenMenu:ObjectToText("IsVehicle" , entity:IsVehicle())
	BradenMenu:ObjectToText("IsVehicle" , entity:IsVehicle())
	BradenMenu:ObjectToText("IsVRReplacer" , entity:IsVRReplacer())
	BradenMenu:ObjectToText("CanOverrideNetworkContext" , entity:CanOverrideNetworkContext())
	BradenMenu:DrawWindowCName("GetNetworkLinkSlotName", entity:GetNetworkLinkSlotName()) -- Does not work with vehicles
	BradenMenu:DrawWindowCName("GetRoleMappinSlotName", entity:GetRoleMappinSlotName())
	BradenMenu:DrawWindowCName("GetQuickHackIndicatorSlotName", entity:GetQuickHackIndicatorSlotName())
	BradenMenu:DrawWindowCName("GetPhoneCallIndicatorSlotName", entity:GetPhoneCallIndicatorSlotName())
	BradenMenu:DisplayVector4("GetNetworkBeamEndpoint", entity:GetNetworkBeamEndpoint()) 
	BradenMenu:ObjectToText("ShouldSendGameAttachedEventToPS", entity:ShouldSendGameAttachedEventToPS())
	BradenMenu:ObjectToText("GetContentScale", entity:GetContentScale())
	BradenMenu:ObjectToText("DeterminGameplayRole", entity:DeterminGameplayRole())

	ImGui.Unindent()
end

function BradenMenu:DrawWindowWorldTransform(worldTransform)
	ImGui.Indent()

	local worldSingleton = GetSingleton("WorldTransform")

	-- Static Functions
	BradenMenu:DrawNodeTree("GetWorldPosition", "WorldPosition", worldSingleton:GetWorldPosition(worldTransform), 
		function(worldPosition)  BradenMenu:DrawWindowWorldTransformPosition(worldPosition) end
	)

	BradenMenu:DrawNodeTree("GetInverse", "WorldTransform", worldSingleton:GetInverse(worldTransform), 
		function(worldTransform)  BradenMenu:DrawWindowWorldTransform(worldTransform) end
	)

	BradenMenu:ObjectToText("GetOrientation: ", worldSingleton:GetOrientation(worldTransform))
	BradenMenu:ObjectToText("GetForward", worldSingleton:GetForward(worldTransform))
	BradenMenu:ObjectToText("GetRight", worldSingleton:GetRight(worldTransform))
	BradenMenu:ObjectToText("GetUp", worldSingleton:GetUp(worldTransform))
	BradenMenu:ObjectToText("ToMatrix", worldSingleton:ToMatrix(worldTransform))
	BradenMenu:ObjectToText("_ToXForm", worldSingleton:_ToXForm(worldTransform))
	ImGui.Unindent()
end

function BradenMenu:DrawWindowWorldTransformPosition(worldPosition)
	ImGui.Indent()

	-- Static Functions
	local worldPositionSingleton = GetSingleton("WorldPosition")

	BradenMenu:ObjectToText("GetX", worldPositionSingleton:GetX(worldPosition))
	BradenMenu:ObjectToText("GetY", worldPositionSingleton:GetY(worldPosition))
	BradenMenu:ObjectToText("GetZ", worldPositionSingleton:GetZ(worldPosition))

	BradenMenu:DisplayVector4("ToVector4", worldPositionSingleton:ToVector4(worldPosition)) 
	ImGui.Unindent()

	-- Properties
	BradenMenu:DrawNodeTree("X", "FixedPoint", worldPosition.x, 
		function(fixedPoint) BradenMenu:DrawWindowFixedPoint(fixedPoint) end
	)
	BradenMenu:DrawNodeTree("Y", "FixedPoint", worldPosition.y, 
		function(fixedPoint) BradenMenu:DrawWindowFixedPoint(fixedPoint) end
	)
	BradenMenu:DrawNodeTree("Z", "FixedPoint", worldPosition.z, 
		function(fixedPoint) BradenMenu:DrawWindowFixedPoint(fixedPoint) end
	)

	ImGui.Unindent()
end

function BradenMenu:DrawWindowgameDataCharacter_Record(gamedataCharacter_Record)
	ImGui.Indent()

	-- Functions	
	BradenMenu:ObjectToText("CpoCharacterBuild", gamedataCharacter_Record:CpoCharacterBuild())
	BradenMenu:ObjectToText("DevNotes", gamedataCharacter_Record:DevNotes())
	BradenMenu:ObjectToText("GetOnSpawnGLPsCount", gamedataCharacter_Record:GetOnSpawnGLPsCount())
	BradenMenu:ObjectToText("GetGendersCount", gamedataCharacter_Record:GetGendersCount())
	BradenMenu:ObjectToText("GetAbilitiesCount", gamedataCharacter_Record:GetAbilitiesCount())
	BradenMenu:ObjectToText("Items", gamedataCharacter_Record:Items())
	BradenMenu:ObjectToText("GetItemsCount", gamedataCharacter_Record:GetItemsCount())
	BradenMenu:ObjectToText("GetCrowdAppearanceNamesCount", gamedataCharacter_Record:GetCrowdAppearanceNamesCount())
	BradenMenu:ObjectToText("BaseAttitudeGroup", gamedataCharacter_Record:BaseAttitudeGroup())
	BradenMenu:ObjectToText("Savable", gamedataCharacter_Record:Savable())
	BradenMenu:ObjectToText("AlternativeFullDisplayName", gamedataCharacter_Record:AlternativeFullDisplayName())
	BradenMenu:ObjectToText("StateMachineName", gamedataCharacter_Record:StateMachineName())
	BradenMenu:ObjectToText("DisplayDescription", gamedataCharacter_Record:DisplayDescription())
	BradenMenu:ObjectToText("FullDisplayName", gamedataCharacter_Record:FullDisplayName())
	BradenMenu:ObjectToText("Level", gamedataCharacter_Record:Level())
	BradenMenu:ObjectToText("VoiceTag", gamedataCharacter_Record:VoiceTag())
	BradenMenu:ObjectToText("GetObjectActionsCount", gamedataCharacter_Record:GetObjectActionsCount())

	BradenMenu:DisplayObjectArray("ObjectActions", "gamedataObjectAction_Record", gamedataCharacter_Record:ObjectActions(),
		function(key, value) BradenMenu:DrawWindowCName("ActionName", value:ActionName())end
	)

	BradenMenu:DisplayObjectArray("Abilities", "gamedataGameplayAbility_Record", gamedataCharacter_Record:Abilities(),
		function(key, value) BradenMenu:DrawWindowCName("ActionName", value:Loc_key_name())end
	)

	BradenMenu:DisplayObjectArray("Tags", "CName", gamedataCharacter_Record:Tags(),
		function(key, value) BradenMenu:DrawWindowCName("Tag", value)end
	)

	BradenMenu:DisplayObjectArray("VisualTags", "CName", gamedataCharacter_Record:VisualTags(),
		function(key, value) BradenMenu:DrawWindowCName("Tag", value)end
	)

	BradenMenu:DisplayObjectArray("CrowdAppearanceNames", "CName", gamedataCharacter_Record:CrowdAppearanceNames(),
		function(key, value) BradenMenu:DrawWindowCName("Tag", value)end
	)

	ImGui.Unindent()
end

function BradenMenu:DrawWindowAITrackedLocation(AITrackedLocation)
	ImGui.Indent()

	-- Properties
	BradenMenu:DrawNodeTree("lastKown", "AILocationInformation", AITrackedLocation.lastKown,
		function(lastKown) BradenMenu:DrawWindowAILocationInformation(lastKown) end
	)

	BradenMenu:DrawNodeTree("location", "AILocationInformation", AITrackedLocation.location,
		function(location) BradenMenu:DrawWindowAILocationInformation(location) end
	)

	BradenMenu:DrawNodeTree("sharedLocation", "AILocationInformation", AITrackedLocation.sharedLocation,
		function(sharedLocation) BradenMenu:DrawWindowAILocationInformation(sharedLocation) end
	)

	BradenMenu:DrawNodeTree("sharedLastKnown", "AILocationInformation", AITrackedLocation.sharedLastKnown,
		function(sharedLastKnown) BradenMenu:DrawWindowAILocationInformation(sharedLastKnown) end
	)

	BradenMenu:DrawNodeTree("entity", "entEntity", AITrackedLocation.entity,
		function(entity) BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	BradenMenu:ObjectToText("accuracy", AITrackedLocation.accuracy)
	BradenMenu:ObjectToText("sharedAccuracy", AITrackedLocation.sharedAccuracy)
	BradenMenu:ObjectToText("sharedTimeDelay", AITrackedLocation.sharedTimeDelay)
	BradenMenu:ObjectToText("threat", AITrackedLocation.threat)
	BradenMenu:DisplayVector4("speed", AITrackedLocation.speed)
	BradenMenu:ObjectToText("visible", AITrackedLocation.visible)
	BradenMenu:ObjectToText("invaildExpection", AITrackedLocation.invaildExpection)
	BradenMenu:ObjectToText("status", AITrackedLocation.status)

	ImGui.Unindent()
end

function BradenMenu:DrawWindowgameAttitudeAgent(gameAttitudeAgent)
	ImGui.Indent()

	-- Functions
	BradenMenu:DrawWindowCName("GetAttitudeGroup", gameAttitudeAgent:GetAttitudeGroup())
	
	BradenMenu:DrawNodeTree("GetPS", "gameComponentPS", gameAttitudeAgent:GetPS(), 
		function(ps) BradenMenu:DrawWindowgameAttitudeAgentPS(ps) end
	)
	
	BradenMenu:DrawNodeTree("GetBasePS", "gameComponentPS", gameAttitudeAgent:GetBasePS(), 
		function(basePS) BradenMenu:DrawWindowgameAttitudeAgentPS(basePS) end
	)

	BradenMenu:DrawNodeTree("GetPersistentID", "gamePersistentID", gameAttitudeAgent:GetPersistentID(), 
		function(presistentID) BradenMenu:DrawWindowgamePersistentID(presistentID) end
	)

	BradenMenu:DrawNodeTree("GetEntity", "entEntity", gameAttitudeAgent:GetEntity(), 
		function(entity) BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	BradenMenu:DrawWindowCName("GetName", gameAttitudeAgent:GetName())
	BradenMenu:DrawWindowCName("GetClassName", gameAttitudeAgent:GetClassName())

	-- Properties
	BradenMenu:DrawWindowCName("baseAttitudeGroup", gameAttitudeAgent.baseAttitudeGroup)
	BradenMenu:ObjectToText("presistentState: ", gameAttitudeAgent.presistentState)
	BradenMenu:DrawWindowCName("name", gameAttitudeAgent.name)
	BradenMenu:ObjectToText("isReplicable", gameAttitudeAgent.isReplicable)
	BradenMenu:ObjectToText("id", gameAttitudeAgent.id)
	BradenMenu:ObjectToText("ToString", gameAttitudeAgent.ToString)

	ImGui.Unindent()
end

function BradenMenu:DrawWindowgameAttitudeAgentPS(gameAttitudeAgentPS)
	ImGui.Indent()

	-- Functons
	BradenMenu:DrawNodeTree("GetID", "PersistentID", gameAttitudeAgentPS:GetID(), 
		function(id) BradenMenu:DrawWindowgamePersistentID(id) end
	)

	BradenMenu:ObjectToText("GetPersistencySystem", gameAttitudeAgentPS:GetPersistencySystem()) -- handle:gamePersistencySystem
	BradenMenu:ObjectToText("GetGameInstance", gameAttitudeAgentPS:GetGameInstance()) -- ScriptGameInstance
	BradenMenu:ObjectToText("ToString", gameAttitudeAgentPS:ToString())
	BradenMenu:DrawWindowCName("GetClassName", gameAttitudeAgentPS:GetClassName())

	-- Properties
	BradenMenu:DrawWindowCName("currentAttitudeGroup", gameAttitudeAgentPS.currentAttitudeGroup)

	ImGui.Unindent()
end

function BradenMenu:DrawWindowAILocationInformation(AILocationInformation)
	ImGui.Indent()

	-- Properties
	BradenMenu:DisplayVector4("position", AILocationInformation.position) 
	BradenMenu:DisplayVector4("direction", AILocationInformation.direction) 

	ImGui.Unindent()
end

function BradenMenu:DrawWindowCName(funcName, CName)
	if CName ~= nil then 
		local name = tostring(CName):match("%[ (%g+) -")
		if name == nil then name = "nil" end
		if BradenMenu:TextToTreeNode(funcName .. " - CName - " .. name) then 
			ImGui.Indent()
			ImGui.Text("name: " .. name)
			ImGui.Text("hash_lo: " .. CName["hash_lo"])
			ImGui.Text("hash_hi: " .. CName["hash_hi"])
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		ImGui.Text(funcName .. " - nil")
	end
end

function BradenMenu:DrawWindowgamePersistentID(gamePersistentID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("entityHash: " .. tostring(gamePersistentID.entityHash))
	ImGui.Text("componentName: " .. tostring(gamePersistentID.componentName))

	ImGui.Unindent()
end

function BradenMenu:DrawWindowentEntityID(entEntityID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("hash: " .. tostring(entEntityID.hash))

	ImGui.Unindent()
end

function BradenMenu:DrawWindowFixedPoint(fixedPoint)
	ImGui.Indent()

	-- Properties
	ImGui.Text("Bits: " .. tostring(fixedPoint.Bits))

	ImGui.Unindent()
end

-- The global game functions, simple buttons
function BradenMenu:DrawGlobalGameFunctionButtons()
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
end

function BradenMenu:DisplayObjectArray(name, className, object, func) 
	if object ~= nil then 
		if BradenMenu:TextToTreeNode(name .. ": - " .. className) then 
			ImGui.Indent()
			for key, value in ipairs(object) do
				func(key, value)
			end
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		BradenMenu:ObjectToText(name, object)
	end
end

-- Draws a Vector4 to the window given the vector4 name and the vector itself
function BradenMenu:DisplayVector4(vectorName, vector4) 

	if  BradenMenu:TextToTreeNode(vectorName .. " - Vector4") then
		ImGui.Indent()
		
		-- Properties
		BradenMenu:ObjectToText("X", vector4.x)
		BradenMenu:ObjectToText("Y", vector4.y)
		BradenMenu:ObjectToText("Z", vector4.z)
		BradenMenu:ObjectToText("W", vector4.w)
		ImGui.Unindent()
	
		ImGui.Unindent()
	end

end

-- Draws a TreeNode given certain information
function BradenMenu:DrawNodeTree(name, className, object, func)
	if object ~= nil then 
		if BradenMenu:TextToTreeNode(name .. " - " .. className) then 
			func(object)
			ImGui.Unindent()
		end
	else
		BradenMenu:ObjectToText(name, object)
	end
end

function BradenMenu:DrawWindowEntityInspecterNoEntity()
	ImGui.Text("No Entity at crosshear...")
end

-- Draws the filter input
function BradenMenu:DrawFilterInput()
	text, selected = ImGui.InputTextMultiline("Top Level Filter", self.FilterText, 100, 200, 20)
	if selected then self.FilterText = text end
end

-- Draws a ImGui tree node to the window
function BradenMenu:TextToTreeNode(text)
	return (self.FilterText == "" or BradenMenu:StringContains(text, self.FilterText) ~= nil) and ImGui.TreeNode(text) 
end

-- Draws a ImGui text to the window
function BradenMenu:ObjectToText(ObjectName, object)
	local text = ObjectName .. ": " .. tostring(object)
	if self.FilterText == "" or BradenMenu:StringContains(text, self.FilterText) ~= nil then
		ImGui.Text(text)
	end
end

-- Returns if anything in string1 contains anything from string2
function BradenMenu:StringContains(string1,string2)
	return string.lower(string1):match("^.*" .. string.lower(string2) .. ".*$")
end

function BradenMenu:DrawDumpClass()
	ImGui.Text("Dumps information for a given class to the 'Dumps' directory within the mod.")
	ImGui.Spacing()
	text, selected = ImGui.InputTextMultiline("Class Name", self.DumpClassName, 100, 200, 20)
	if selected then self.DumpClassName = text end

	if ImGui.Button("Dump class") then 
		BradenMenu:DumpClass(self.DumpClassName)
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

function BradenMenu:AddConpoment(comp) 
	if comp ~= nil then 
		if BradenMenu:TextToTreeNode("Save Component") then 
			local text, selected = ImGui.InputTextMultiline("Cache Name", self.SavedEntityCacheTextName, 100, 200, 20)
			if selected then self.SavedEntityCacheTextName = text end
			if ImGui.Button("Save Component") then 
				self.SavedConpoments[self.SavedEntityCacheTextName] = comp
			end
			ImGui.Unindent()
		end
	end
end

function BradenMenu:TargetHint() 
	ImGui.Text("The main Entity Inspector window requires the user to target an Entity. Simply look at an NPC for example from any distance.")
	ImGui.Text("For example simply look at an NPC at any distance.")
end

-- Get the current targeted entity
function BradenMenu:GetTargetEntity()
	if BradenMenu:IsEntityNull(BradenMenu:GetPlayer()) == false then
		return Game.GetTargetingSystem():GetLookAtObject(BradenMenu:GetPlayer(),false,false)
	end
	return nil
end

-- Check if an entity still exists
function BradenMenu:IsEntityNull(entity)
	return entity:IsAttached() == false
end

-- Returns the player
function BradenMenu:GetPlayer()
	return Game.GetPlayer()
end

-- End of BradenMenu Class

return BradenMenu:new()
