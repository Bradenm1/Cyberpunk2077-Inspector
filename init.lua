-- Begin of ScanApp Class

BradenMenu = {
	description = "Tool used for Inspecting Entities among other things",
	rootPath = "BradenMenu.",
	DrawUI = false,
	EntityEditorActive = 0,
	OpenedInspectorWindows = {},
	CheckboxValue = false,
	AutoRemoveNilEntries = true,
	InspectorOption = 0,
	SavedEntityCacheTextName = "exampleName",
	SavedEntites = {}
}

function BradenMenu:new()

	setmetatable(BradenMenu, self)
	self.__index = self

	BradenMenu:RegisterCallbacks()

   return BradenMenu
end

-- Register the callbacks for this mod menu
function BradenMenu:RegisterCallbacks() 
	registerForEvent("onUpdate", function(deltaTime)
		-- asdasd
	end)	

	registerForEvent("onOverlayOpen", function()
        BradenMenu.DrawUI = true
    end)
      
    registerForEvent("onOverlayClose", function()
        BradenMenu.DrawUI = false
    end)

	registerForEvent("onDraw", function()
		if (BradenMenu.DrawUI) then
			BradenMenu:DrawWindow()
		end
	end)
end

-- The draw function for drawning the window
function BradenMenu:DrawWindow() 
	ImGui.SetNextWindowPos(100, 500, ImGuiCond.FirstUseEver) -- set window position x, y
	ImGui.SetNextWindowSize(800, 300, ImGuiCond.Appearing) -- set window size w, h

		-- Main Window
	if ImGui.Begin("Debug Menu", true, ImGuiWindowFlags.MenuBar) then
		
		if ImGui.BeginMenuBar() then
			if ImGui.BeginMenu("Open") then
				if ImGui.MenuItem("Entity Inspector") then 
					BradenMenu.EntityEditorActive = 1
				end
				ImGui.EndMenu()
			end
			ImGui.EndMenuBar()
		end

		if ImGui.Button("Entity Inspector") then 
			BradenMenu.EntityEditorActive = 1
		end
		ImGui.Spacing()
		ImGui.Spacing()

		value, pressed = ImGui.Checkbox("Auto Remove/Close Nil Entries", BradenMenu.AutoRemoveNilEntries)
		if pressed then 
			BradenMenu.AutoRemoveNilEntries = value
		end
		ImGui.Spacing()

		ImGui.Text("Saved Entites -")
		ImGui.Indent()
		for key, value in pairs(BradenMenu.SavedEntites) do
			if (value ~= nil) then 
				if ImGui.CollapsingHeader(key, ImGuiTreeNodeFlags.Selected) then 
					ImGui.Indent()
					if ImGui.Button("Open Inspector Window") then 
						table.insert(BradenMenu.OpenedInspectorWindows, value) 
					end
					if ImGui.Button("Remove Entry") then 
						BradenMenu.SavedEntites[key] = nil 
						table.remove(BradenMenu.OpenedInspectorWindows, tonumber(key))
					end
					ImGui.Unindent()
				end

				if BradenMenu.AutoRemoveNilEntries == true and BradenMenu:IsEntityNull(value) then 
					BradenMenu.SavedEntites[key] = nil
				end
			end
		end
		ImGui.Unindent()

		if BradenMenu.EntityEditorActive == 1 then
			BradenMenu:DrawEntityWindow(nil, "Targeted")
		end

		for i, entity in ipairs(BradenMenu.OpenedInspectorWindows) do
			BradenMenu:DrawEntityWindow(entity, i)

			if BradenMenu:IsEntityNull(entity) == true and BradenMenu.AutoRemoveNilEntries == true then 
				table.remove(BradenMenu.OpenedInspectorWindows, i)
			end
		end

		if BradenMenu:GetPlayer() then BradenMenu.SavedEntites["Player"] = BradenMenu:GetPlayer() end
	end
	ImGui.End()
end

function BradenMenu:DrawEntityWindow(entity, windowName)
	ImGui.SetNextWindowPos(100, 500, ImGuiCond.FirstUseEver)
	ImGui.SetNextWindowSize(800, 300, ImGuiCond.Appearing)
	if ImGui.Begin("Entity Inspector - " .. windowName) then 
		ImGui.Text("Entity Inspector requires the user to target an Entity. Simply look at an NPC for example from any distance.")
		
		if entity == nil then 
			entity = BradenMenu:GetTargetEntity()
		end

		if ImGui.BeginTabBar("String ID") then 
			if (ImGui.BeginTabItem("View")) then
				ImGui.Spacing()
				BradenMenu:DrawEntityInsepectionView(entity)
				ImGui.EndTabItem()
			end

			if (ImGui.BeginTabItem("Edit")) then
				ImGui.Spacing()
				BradenMenu:DrawEntityInsepectionEdit(entity)
				ImGui.EndTabItem()
			end

			if (ImGui.BeginTabItem("Game")) then
				ImGui.Spacing()
				if ImGui.Button("Game.ForcedNPCDeath()") then Game.ForcedNPCDeath() end
				if ImGui.Button("Game.EnterBD()") then Game.EnterBD() end
				if ImGui.Button("Game.cset()") then Game.cset() end
				if ImGui.Button("Game.ClearEquipment()") then Game.ClearEquipment() end
				if ImGui.Button("RandomizeOptions()") then Game.GetgameuiICharacterCustomizationSystem():RandomizeOptions() end
				ImGui.EndTabItem()
			end

			if (ImGui.BeginTabItem("Settings") and windowName == "Targeted") then
				ImGui.Spacing()
				
				text, selected = ImGui.InputTextMultiline("Cache Name", BradenMenu.SavedEntityCacheTextName, 100, 200, 20)
				if selected then BradenMenu.SavedEntityCacheTextName = text end
				if ImGui.Button("Save Targeted Entity") then 
					BradenMenu.SavedEntites[BradenMenu.SavedEntityCacheTextName] = entity
					--table.insert(BradenMenu.SavedEntites, entity)
				end

				ImGui.EndTabItem()
			end
		end
		ImGui.EndTabBar()
	end
	ImGui.End()
end

function BradenMenu:DrawEntityInsepectionEdit(entity)
	if (entity ~= nil) then
		BradenMenu:DrawWindowEntityInspecterEditHasEntity(entity)
	else
		BradenMenu:DrawWindowEntityInspecterNoEntity()
	end
end

function BradenMenu:DrawEntityInsepectionView(entity)
	if (entity ~= nil) then
		BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)
	else
		BradenMenu:DrawWindowEntityInspecterNoEntity()
	end
end

function BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)
	if ImGui.CollapsingHeader("Entity", ImGuiTreeNodeFlags.Selected) then 
		BradenMenu:DrawWindowEntityEntity(entity)
	end

	if ImGui.CollapsingHeader("GameObject", ImGuiTreeNodeFlags.Selected) then 
		BradenMenu:DrawWindowEntityGameObject(entity)
	end

	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet", ImGuiTreeNodeFlags.Selected) then 
			BradenMenu:DrawWindowEntityGamePuppet(entity)
		end
	end

	if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet", ImGuiTreeNodeFlags.Selected) then 
			BradenMenu:DrawWindowEntityScriptedPuppet(entity)
		end
	end
end

function BradenMenu:DrawWindowEntityInspecterEditHasEntity(entity)
	if ImGui.CollapsingHeader("GameObject", ImGuiTreeNodeFlags.Selected) then 
		ImGui.Text("ForceDefeatReward")
		BradenMenu:GetCheckBox()
		if ImGui.SmallButton("Run Function") then 
			entity:GetTargetTrackerComponent():Toggle(false)
			--Game.ReactionSystem():AddFearSource(entity)
			entity:ForceDefeatReward(BradenMenu.CheckboxValue)
		end
	end

end

function BradenMenu:DrawWindowEntityEntity(entity)
	--ImGui.SetNextItemOpen(true, ImGuiCond.Always)
	ImGui.Indent()

	if ImGui.Button("MatchVisualTag") then entity:MatchVisualTag("") end
	if ImGui.Button("CycleRandomAppearance") then entity:ScheduleAppearanceChange("") end
	if ImGui.Button("PrefetchAppearanceChange") then entity:ScheduleAppearanceChange("") end
	if ImGui.Button("Teleport Player To Entity") then entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(Game.GetPlayer(), entity:GetWorldPosition(), EulerAngles.new(0,0,0)) end
	if ImGui.Button("Teleport To Player") then entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(entity, Game.GetPlayer():GetWorldPosition(), EulerAngles.new(0,0,0)) end
	print(Dump(entity:GetWorldTransform(), true))

	local entEntityID = entity:GetEntityID()
	if entEntityID ~= nil then 
		if  ImGui.TreeNode("GetEntityID - ") then
			BradenMenu:DrawWindowentEntityID(entEntityID)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetEntityID - nil")
	end

	ImGui.Text("CurrentAppearanceName: " .. tostring(entity:GetCurrentAppearanceName()))
	ImGui.Text("GetControllingPeerID: " .. tostring(entity:GetControllingPeerID()))
	ImGui.Text("GetWorldOrientation: " .. tostring(entity:GetWorldOrientation()))
	ImGui.Text("GetWorldForward:")
	ImGui.Indent()
	BradenMenu:DisplayVector4(entity:GetWorldForward()) 
	ImGui.Unindent()
	ImGui.Text("GetWorldPosition:")
	ImGui.Indent()
	BradenMenu:DisplayVector4(entity:GetWorldPosition()) 
	ImGui.Unindent()

	ImGui.Text("GetWorldRight: " .. tostring(entity:GetWorldRight()))
	ImGui.Text("GetWorldTransform: " .. tostring(entity:GetWorldTransform()))
	ImGui.Text("GetWorldUp: " .. tostring(entity:GetWorldUp()))
	ImGui.Text("GetWorldYaw: " .. tostring(entity:GetWorldYaw()))
	ImGui.Text("IsAttached: " .. tostring(entity:IsAttached()))
	ImGui.Text("IsControlledByAnotherClient: " .. tostring(entity:IsControlledByAnotherClient()))
	ImGui.Text("IsControlledByAnyPeer: " .. tostring(entity:IsControlledByAnyPeer()))
	ImGui.Text("IsControlledByLocalPeer: " .. tostring(entity:IsControlledByLocalPeer()))
	ImGui.Text("IsReplicated: " .. tostring(entity:IsReplicated()))
	ImGui.Text("IsAttached: " .. tostring(entity:IsAttached()))
	ImGui.Text("IsAttached: " .. tostring(entity:IsAttached()))
	ImGui.Unindent()
end

function BradenMenu:DrawWindowEntityGamePuppet(entity)
	ImGui.Indent()

	if ImGui.Button("CacheLootForDroping") then entity:CacheLootForDroping() end
	if ImGui.Button("DropAmmo") then entity:DropAmmo() end
	if ImGui.Button("DropLootBag") then entity:DropLootBag() end
	if ImGui.Button("DropWeapons") then entity:DropWeapons() end
	if ImGui.Button("GenerateLoot") then entity:GenerateLoot() end
	if ImGui.Button("SendAIDeathSignal") then entity:SendAIDeathSignal() end

	-- Functions
	ImGui.Text("CanRagdoll: " .. tostring(entity:CanRagdoll()))

	gameAttitudeAgent = entity:GetAttitude()
	if gameAttitudeAgent ~= nil then 
		if  ImGui.TreeNode("GetAttitude - ") then
			BradenMenu:DrawWindowgameAttitudeAgent(gameAttitudeAgent)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetAttitude - nil")
	end

	ImGui.Text("GetBodyType: " .. tostring(entity:GetBodyType()))
	ImGui.Text("GetLastValidNavmeshPoint: " .. tostring(entity:GetLastValidNavmeshPoint()))
	ImGui.Text("GetResolvedGenderName: " .. tostring(entity:GetResolvedGenderName()))
	ImGui.Text("GetVelocity: " .. tostring(entity:GetVelocity()))
	ImGui.Text("HasCPOMissionData: " .. tostring(entity:HasCPOMissionData()))
	ImGui.Text("HasCrowdStaticLOD: " .. tostring(entity:HasCrowdStaticLOD()))
	ImGui.Text("IsLooted: " .. tostring(entity:IsLooted()))
	ImGui.Text("WasLootGenerated: " .. tostring(entity:WasLootGenerated()))
	ImGui.Unindent()
end

function BradenMenu:DrawWindowEntityScriptedPuppet(entity)
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


function BradenMenu:DrawWindowEntityGameObject(entity)
	ImGui.Indent()

	if ImGui.Button("EvaluateLastFrameRequest") then entity:EvaluateLastFrameRequest() end
	if ImGui.Button("EvaluateMappinsVisualState") then entity:EvaluateMappinsVisualState() end
	if ImGui.Button("FadeOutOutlines") then entity:FadeOutOutlines() end
	if ImGui.Button("FireSingleE3Tick") then entity:FireSingleE3Tick() end
	if ImGui.Button("ForceDefeatReward") then entity:ForceDefeatReward(true) end
	if ImGui.Button("TryOpenQuickhackMenu") then entity:TryOpenQuickhackMenu(true) end
	if ImGui.Button("ToggleQuestImportance") then entity:ToggleQuestImportance(false) end
	if ImGui.Button("EvaluateLastFrameRequest") then entity:EvaluateLastFrameRequest() end
	if ImGui.Button("EvaluateLastFrameRequest") then entity:EvaluateLastFrameRequest() end

	-- Functions
	ImGui.Text("DisplayName: " .. tostring(entity:GetDisplayName()))
	ImGui.Text("GetTracedActionName: " .. tostring(entity:GetTracedActionName()))

	local entityOwner = entity:GetOwner()
	if entityOwner ~= nil then 
		if ImGui.TreeNode("GetOwner - ") then
			table.insert(BradenMenu.GetOwnersEntites, entityOwner)
		end
	else
		 ImGui.Text("GetOwner - nil")
	end

	if entity:IsNPC() then 
		entityOwner = entity:GetKiller()
		if entityOwner ~= nil then 
			--clicked = ImGui.Button("GetKiller - Open New Inspector")
			if ImGui.TreeNode("GetKiller -") then 
				--table.insert(BradenMenu.GetKillerEntites, entityOwner)
				BradenMenu:DrawWindowEntityInspecterViewHasEntity(entityOwner)
				ImGui.Unindent()
			end
		else
			 ImGui.Text("GetKiller - nil")
		end
	end

	local trackerComponent = entity:GetTargetTrackerComponent()
	if trackerComponent ~= nil then 
		if ImGui.TreeNode("GetTargetTrackerComponent: - ") then 
			ImGui.Text("GetThreats: " .. tostring(trackerComponent:GetThreats(false)))
			ImGui.Indent()
			for i, aiTrackedLocation in ipairs(trackerComponent:GetThreats(false)) do
				if ImGui.TreeNode("Index - " .. i) then 
					BradenMenu:DrawWindowAITrackedLocation(aiTrackedLocation)
					ImGui.Unindent()
				end
			end
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetTargetTrackerComponent - nil")
	end

	ImGui.Text("IsAccessPoint: " .. tostring(entity:IsAccessPoint()))
	ImGui.Text("IsActive: " .. tostring(entity:IsActive()))
	ImGui.Text("IsActiveBackdoor: " .. tostring(entity:IsActiveBackdoor()))
	ImGui.Text("IsAnyClueEnabled: " .. tostring(entity:IsAnyClueEnabled()))
	ImGui.Text("IsAnyPlaystyleValid: " .. tostring(entity:IsAnyPlaystyleValid()))
	ImGui.Text("IsBackdoor: " .. tostring(entity:IsBackdoor()))
	ImGui.Text("IsBodyDisposalPossible: " .. tostring(entity:IsBodyDisposalPossible()))
	ImGui.Text("IsBraindanceBlocked: " .. tostring(entity:IsBraindanceBlocked()))
	ImGui.Text("IsBreached: " .. tostring(entity:IsBreached()))
	ImGui.Text("IsClueInspected: " .. tostring(entity:IsClueInspected()))
	ImGui.Text("IsConnectedToBackdoorDevice: " .. tostring(entity:IsConnectedToBackdoorDevice()))
	ImGui.Text("IsConnectedToSecuritySystem: " .. tostring(entity:IsConnectedToSecuritySystem()))
	ImGui.Text("IsContainer: " .. tostring(entity:IsContainer()))
	ImGui.Text("IsControllingDevices: " .. tostring(entity:IsControllingDevices()))
	ImGui.Text("IsCurrentlyScanned: " .. tostring(entity:IsCurrentlyScanned()))
	ImGui.Text("IsCurrentTarget: " .. tostring(entity:IsCurrentTarget()))
	ImGui.Text("IsDead: " .. tostring(entity:IsDead()))
	ImGui.Text("IsDeadNoStatPool: " .. tostring(entity:IsDeadNoStatPool()))
	ImGui.Text("IsDemolitionSkillCheckActive: " .. tostring(entity:IsDemolitionSkillCheckActive()))
	ImGui.Text("IsDevice: " .. tostring(entity:IsDevice()))
	ImGui.Text("IsDrone: " .. tostring(entity:IsDrone()))
	ImGui.Text("IsDropPoint: " .. tostring(entity:IsDropPoint()))
	ImGui.Text("IsEngineeringSkillCheckActive: " .. tostring(entity:IsEngineeringSkillCheckActive()))
	ImGui.Text("IsExplosive: " .. tostring(entity:IsExplosive()))
	ImGui.Text("IsFastTravelPoint: " .. tostring(entity:IsFastTravelPoint()))
	--ImGui.Text("IsFriendlyTowardsPlayer: " .. tostring(entity:IsFriendlyTowardsPlayer()))
	ImGui.Text("IsGameplayRelevant: " .. tostring(entity:IsGameplayRelevant()))
	ImGui.Text("IsGrouppedClue: " .. tostring(entity:IsGrouppedClue()))
	ImGui.Text("IsHackingPlayer: " .. tostring(entity:IsHackingPlayer()))
	ImGui.Text("IsHackingSkillCheckActive: " .. tostring(entity:IsHackingSkillCheckActive()))
	ImGui.Text("IsHighlightedInFocusMode: " .. tostring(entity:IsHighlightedInFocusMode()))
	ImGui.Text("IsHostile: " .. tostring(entity:IsHostile()))
	ImGui.Text("IsInIconForcedVisibilityRange: " .. tostring(entity:IsInIconForcedVisibilityRange()))
	ImGui.Text("IsInitialized: " .. tostring(entity:IsInitialized()))
	ImGui.Text("IsInvestigating: " .. tostring(entity:IsInvestigating()))
	ImGui.Text("IsItem: " .. tostring(entity:IsItem()))
	ImGui.Text("IsJohnnyReplacer: " .. tostring(entity:IsJohnnyReplacer()))
	ImGui.Text("IsLogicReady: " .. tostring(entity:IsLogicReady()))
	ImGui.Text("IsNetrunner: " .. tostring(entity:IsNetrunner()))
	ImGui.Text("IsNetworkKnownToPlayer: " .. tostring(entity:IsNetworkKnownToPlayer()))
	ImGui.Text("IsNetworkLinkDynamic: " .. tostring(entity:IsNetworkLinkDynamic()))
	ImGui.Text("IsNPC: " .. tostring(entity:IsNPC()))
	ImGui.Text("IsObjectRevealed: " .. tostring(entity:IsObjectRevealed()))
	ImGui.Text("IsPhotoModeBlocked: " .. tostring(entity:IsPhotoModeBlocked()))
	ImGui.Text("IsPlayer: " .. tostring(entity:IsPlayer()))
	ImGui.Text("IsPlayerControlled: " .. tostring(entity:IsPlayerControlled()))
	ImGui.Text("IsPrevention: " .. tostring(entity:IsPrevention()))
	ImGui.Text("IsPuppet: " .. tostring(entity:IsPuppet()))
	ImGui.Text("IsQuest: " .. tostring(entity:IsQuest()))
	ImGui.Text("IsQuickHackAble: " .. tostring(entity:IsQuickHackAble()))
	ImGui.Text("IsQuickHacksExposed: " .. tostring(entity:IsQuickHacksExposed()))
	ImGui.Text("IsReplacer: " .. tostring(entity:IsReplacer()))
	ImGui.Text("IsScaningCluesBlocked: " .. tostring(entity:IsScaningCluesBlocked()))
	ImGui.Text("IsScanned: " .. tostring(entity:IsScanned()))
	ImGui.Text("IsScannerDataDirty: " .. tostring(entity:IsScannerDataDirty()))
	ImGui.Text("IsSelectedForDebugging: " .. tostring(entity:IsSelectedForDebugging()))
	ImGui.Text("IsSensor: " .. tostring(entity:IsSensor()))
	ImGui.Text("IsShardContainer: " .. tostring(entity:IsShardContainer()))
	ImGui.Text("IsSolo: " .. tostring(entity:IsSolo()))
	ImGui.Text("IsTaggedinFocusMode: " .. tostring(entity:IsTaggedinFocusMode()))
	--ImGui.Text("IsTargetTresspassingMyZone: " .. tostring(entity:IsTargetTresspassingMyZone()))
	ImGui.Text("IsTechie: " .. tostring(entity:IsTechie()))
	ImGui.Text("IsTurret: " .. tostring(entity:IsTurret()))
	ImGui.Text("IsVehicle: " .. tostring(entity:IsVehicle()))
	ImGui.Text("IsVehicle: " .. tostring(entity:IsVehicle()))
	ImGui.Text("IsVRReplacer: " .. tostring(entity:IsVRReplacer()))
	ImGui.Unindent()
end

function BradenMenu:DrawWindowAITrackedLocation(AITrackedLocation)
	ImGui.Indent()

	-- Functions
	local lastKown = AITrackedLocation.lastKown
	if lastKown ~= nil then 
		if ImGui.TreeNode("lastKown -") then 
			BradenMenu:DrawWindowAILocationInformation(lastKown)
			ImGui.Unindent()
		end
	else
		ImGui.Text("lastKown - nil")
	end

	local location = AITrackedLocation.location
	if location ~= nil then 
		if ImGui.TreeNode("location -") then 
			BradenMenu:DrawWindowAILocationInformation(location)
			ImGui.Unindent()
		end
	else
		ImGui.Text("location - nil")
	end

	local sharedLocation = AITrackedLocation.sharedLocation
	if sharedLocation ~= nil then 
		if ImGui.TreeNode("sharedLocation -") then 
			BradenMenu:DrawWindowAILocationInformation(sharedLocation)
			ImGui.Unindent()
		end
	else
		ImGui.Text("sharedLocation - nil")
	end

	local entity = AITrackedLocation.entity
	if entity ~= nil then 
		if ImGui.TreeNode("entity -") then 
			BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)
			ImGui.Unindent()
		end
	else
		ImGui.Text("entity - nil")
	end

	-- Properties
	ImGui.Text("accuracy: " .. tostring(AITrackedLocation.accuracy))
	ImGui.Text("accuracy: " .. tostring(AITrackedLocation.accuracy))
	ImGui.Text("sharedAccuracy: " .. tostring(AITrackedLocation.sharedAccuracy))
	ImGui.Text("sharedTimeDelay: " .. tostring(AITrackedLocation.sharedTimeDelay))
	ImGui.Text("threat: " .. tostring(AITrackedLocation.threat))
	ImGui.Text("speed:")
	ImGui.Indent()
	BradenMenu:DisplayVector4(AITrackedLocation.speed) 
	ImGui.Unindent()
	ImGui.Text("visible: " .. tostring(AITrackedLocation.visible))
	ImGui.Text("invaildExpection: " .. tostring(AITrackedLocation.invaildExpection))
	ImGui.Text("status: " .. tostring(AITrackedLocation.status))

	local sharedLastKnown = AITrackedLocation.sharedLastKnown
	if sharedLastKnown ~= nil then 
		if ImGui.TreeNode("sharedLastKnown -") then 
			BradenMenu:DrawWindowAILocationInformation(sharedLastKnown)
			ImGui.Unindent()
		end
	else
		ImGui.Text("sharedLocation - nil")
	end
	ImGui.Unindent()
end

function BradenMenu:DrawWindowgameAttitudeAgent(gameAttitudeAgent)
	ImGui.Indent()

	-- Functions
	ImGui.Text("GetAttitudeGroup: " .. tostring(gameAttitudeAgent:GetAttitudeGroup()))
	BradenMenu:DrawWindowCName(gameAttitudeAgent:GetAttitudeGroup())
	local ps = gameAttitudeAgent:GetPS()
	if ps ~= nil then 
		if ImGui.TreeNode("GetPS -") then 
			BradenMenu:DrawWindowgameAttitudeAgentPS(ps)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetPS - nil")
	end

	local basePS = gameAttitudeAgent:GetBasePS()
	if basePS ~= nil then 
		if ImGui.TreeNode("GetBasePS -") then 
			BradenMenu:DrawWindowgameAttitudeAgentPS(basePS)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetBasePS - nil")
	end

	local presistentID = gameAttitudeAgent:GetPersistentID()
	if presistentID ~= nil then 
		if ImGui.TreeNode("GetPersistentID -") then 
			BradenMenu:DrawWindowgamePersistentID(presistentID)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetPersistentID - nil")
	end

	local entity = gameAttitudeAgent:GetEntity()
	if entity ~= nil then 
		if ImGui.TreeNode("GetEntity -") then 
			BradenMenu:DrawWindowEntityInspecterViewHasEntity(entity)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetEntity - nil")
	end

	ImGui.Text("GetName: " .. tostring(gameAttitudeAgent:GetName()))
	ImGui.Text("ToString: " .. tostring(gameAttitudeAgent:ToString()))
	ImGui.Text("GetClassName: " .. tostring(gameAttitudeAgent:GetClassName()))

	-- Properties
	ImGui.Text("baseAttitudeGroup: " .. tostring(gameAttitudeAgent.baseAttitudeGroup))
	--ImGui.Text("presistentState: " .. tostring(gameAttitudeAgent.presistentState))
	ImGui.Text("name: " .. tostring(gameAttitudeAgent.name))
	ImGui.Text("isReplicable: " .. tostring(gameAttitudeAgent.isReplicable))
	ImGui.Text("id: " .. tostring(gameAttitudeAgent.id))


	ImGui.Unindent()
end

function BradenMenu:DrawWindowgameAttitudeAgentPS(gameAttitudeAgentPS)
	ImGui.Indent()

	-- Functons
	local id = gameAttitudeAgentPS:GetID()
	if id ~= nil then 
		if ImGui.TreeNode("GetID -") then 
			BradenMenu:DrawWindowgamePersistentID(id)
			ImGui.Unindent()
		end
	else
		ImGui.Text("GetID - nil")
	end

	ImGui.Text("GetPersistencySystem: " .. tostring(gameAttitudeAgentPS:GetPersistencySystem())) -- handle:gamePersistencySystem
	ImGui.Text("GetGameInstance: " .. tostring(gameAttitudeAgentPS:GetGameInstance())) -- ScriptGameInstance
	ImGui.Text("ToString: " .. tostring(gameAttitudeAgentPS:ToString()))
	ImGui.Text("GetClassName: " .. tostring(gameAttitudeAgentPS:GetClassName()))

	-- Properties
	ImGui.Text("currentAttitudeGroup: " .. tostring(gameAttitudeAgentPS.currentAttitudeGroup))

	ImGui.Unindent()
end

function BradenMenu:DrawWindowAILocationInformation(AILocationInformation)
	ImGui.Indent()

	-- Properties
	ImGui.Text("position:")
	ImGui.Indent()
	BradenMenu:DisplayVector4(AILocationInformation.position) 
	ImGui.Unindent()

	ImGui.Text("direction:")
	ImGui.Indent()
	BradenMenu:DisplayVector4(AILocationInformation.direction) 
	ImGui.Unindent()
	ImGui.Unindent()
end

function BradenMenu:DrawWindowCName(CName)
	ImGui.Indent()
	ImGui.Text("hash_lo: " .. CName["hash_lo"])
	ImGui.Text("hash_hi: " .. CName["hash_hi"])
	ImGui.Unindent()
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

function BradenMenu:GetCheckBox() 
	value, pressed = ImGui.Checkbox("Bool", BradenMenu.CheckboxValue)
	if pressed then 
		BradenMenu.CheckboxValue = value
	end
end

function BradenMenu:DisplayVector4(vector4) 
	-- Properties
	ImGui.Text("X - " .. tostring(vector4.x))
	ImGui.Text("Y - " .. tostring(vector4.y))
	ImGui.Text("Z - " .. tostring(vector4.z))
	ImGui.Text("W - " .. tostring(vector4.w))
end

function BradenMenu:DrawWindowEntityChild(child)
	if child == nil then 
		return nil
	end

	size_x, size_y = ImGui.GetWindowSize()
	ImGui.BeginChild("Entity Owner", size_x - 20, size_y - 60, true)
		BradenMenu:DrawEntityInsepection(child)
	ImGui.EndChild()
end

function BradenMenu:DrawWindowEntityInspecterNoEntity()
	ImGui.Text("No Entity at crosshear...")
end

function BradenMenu:DrawButtonReturnTruePressed(buttonName)
	return ImGui.Button(buttonName)
end

function BradenMenu:GetTargetEntity()
	if BradenMenu:GetPlayer() then
		return Game.GetTargetingSystem():GetLookAtObject(BradenMenu:GetPlayer(),false,false)
	end

	return nil
end

function BradenMenu:IsEntityNull(entity)
	return entity:IsAttached() == false
end

function BradenMenu:GetPlayer()
	return Game.GetPlayer()
end

-- End of BradenMenu Class

return BradenMenu:new()
