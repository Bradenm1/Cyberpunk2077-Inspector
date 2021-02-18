function Inspector.DrawGameObject(self, entity)
	ImGui.Indent()

	-- Functions
	BradenMenu.IGE.ObjectToText("DisplayName" , entity:GetDisplayName())
	BradenMenu.IGE.ObjectToText("GetTracedActionName" , entity:GetTracedActionName())

	BradenMenu.IGE.DrawNodeTree("GetOwner", "entEntity", entity:GetOwner(), 
		function(entityOwner)  self:DrawWindowEntityInspecterViewHasEntity(entityOwner) end
	)

	if entity:IsNPC() then 
		BradenMenu.IGE.DrawNodeTree("GetKiller", "entEntity", entity:GetKiller(), 
			function(entityKiller) self:DrawWindowEntityInspecterViewHasEntity(entityKiller) end
		)
	end
	
	BradenMenu.IGE.DrawNodeTree("GetTargetTrackerComponent", "AITargetTrackerComponent", entity:GetTargetTrackerComponent(), 
		function(trackerComponent) self:DrawAITargetTrackerComponent(trackerComponent) end
	)

	local bool, items = GetSingleton('gameTransactionSystem'):GetItemList(entity)
	BradenMenu.IGE.DisplayObjectArray("GetItemList", "gameUniqueItemData", items,
		function(key, value) 
			if BradenMenu.IGE.TextToTreeNode("GetItemList - gameUniqueItemData - " .. key .. " - " .. tostring(Game.NameToString(value:GetName()))) then 
				self:DrawgameUniqueItemData(value)
				ImGui.Unindent()
			end 
		end
	)

	BradenMenu.IGE.ObjectToText("IsAccessPoint", entity:IsAccessPoint())
	BradenMenu.IGE.ObjectToText("IsActive", entity:IsActive())
	BradenMenu.IGE.ObjectToText("IsActiveBackdoor", entity:IsActiveBackdoor())
	BradenMenu.IGE.ObjectToText("IsAnyClueEnabled" , entity:IsAnyClueEnabled())
	BradenMenu.IGE.ObjectToText("IsAnyPlaystyleValid" , entity:IsAnyPlaystyleValid())
	BradenMenu.IGE.ObjectToText("IsBackdoor" , entity:IsBackdoor())
	BradenMenu.IGE.ObjectToText("IsBodyDisposalPossible" , entity:IsBodyDisposalPossible())
	BradenMenu.IGE.ObjectToText("IsBraindanceBlocked" , entity:IsBraindanceBlocked())
	BradenMenu.IGE.ObjectToText("IsBreached" , entity:IsBreached())
	BradenMenu.IGE.ObjectToText("IsClueInspected" , entity:IsClueInspected())
	BradenMenu.IGE.ObjectToText("IsConnectedToBackdoorDevice" , entity:IsConnectedToBackdoorDevice())
	BradenMenu.IGE.ObjectToText("IsConnectedToSecuritySystem" , entity:IsConnectedToSecuritySystem())
	BradenMenu.IGE.ObjectToText("IsContainer" , entity:IsContainer())
	BradenMenu.IGE.ObjectToText("IsControllingDevices" , entity:IsControllingDevices())
	BradenMenu.IGE.ObjectToText("IsCurrentlyScanned" , entity:IsCurrentlyScanned())
	BradenMenu.IGE.ObjectToText("IsCurrentTarget" , entity:IsCurrentTarget())
	BradenMenu.IGE.ObjectToText("IsDead" , entity:IsDead())
	BradenMenu.IGE.ObjectToText("IsDeadNoStatPool" , entity:IsDeadNoStatPool())
	BradenMenu.IGE.ObjectToText("IsDemolitionSkillCheckActive" , entity:IsDemolitionSkillCheckActive())
	BradenMenu.IGE.ObjectToText("IsDevice" , entity:IsDevice())
	BradenMenu.IGE.ObjectToText("IsDrone" , entity:IsDrone())
	BradenMenu.IGE.ObjectToText("IsDropPoint" , entity:IsDropPoint())
	BradenMenu.IGE.ObjectToText("IsEngineeringSkillCheckActive" , entity:IsEngineeringSkillCheckActive())
	BradenMenu.IGE.ObjectToText("IsExplosive" , entity:IsExplosive())
	BradenMenu.IGE.ObjectToText("IsFastTravelPoint" , entity:IsFastTravelPoint())
	BradenMenu.IGE.ObjectToText("IsGameplayRelevant" , entity:IsGameplayRelevant())
	BradenMenu.IGE.ObjectToText("IsGrouppedClue" , entity:IsGrouppedClue())
	BradenMenu.IGE.ObjectToText("IsHackingPlayer" , entity:IsHackingPlayer())
	BradenMenu.IGE.ObjectToText("IsHackingSkillCheckActive" , entity:IsHackingSkillCheckActive())
	BradenMenu.IGE.ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	BradenMenu.IGE.ObjectToText("CanRevealRemoteActionsWheel" , entity:CanRevealRemoteActionsWheel())
	BradenMenu.IGE.ObjectToText("GetScannerAttitudeTweak" , entity:GetScannerAttitudeTweak())
	BradenMenu.IGE.ObjectToText("GetSensesComponent" , entity:GetSensesComponent())
	BradenMenu.IGE.ObjectToText("CalculateRealTimePassed" , entity:CalculateRealTimePassed())
	BradenMenu.IGE.ObjectToText("CalculateAmountOfTicks" , entity:CalculateAmountOfTicks())
	BradenMenu.IGE.ObjectToText("ShouldEnableOutlineRed" , entity:ShouldEnableOutlineRed())
	BradenMenu.IGE.ObjectToText("ShouldEnableOutlineGreen" , entity:ShouldEnableOutlineGreen())
	BradenMenu.IGE.ObjectToText("CanBeTagged" , entity:CanBeTagged())
	BradenMenu.IGE.ObjectToText("GetCurrentOutline" , entity:GetCurrentOutline())
	BradenMenu.IGE.ObjectToText("GetDefaultHighlightType" , entity:GetDefaultHighlightType())
	BradenMenu.IGE.ObjectToText("GetObjectToForwardHighlight" , entity:GetObjectToForwardHighlight())
	BradenMenu.IGE.ObjectToText("GetBraindanceLayer" , entity:GetBraindanceLayer())
	BradenMenu.IGE.ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	BradenMenu.IGE.ObjectToText("IsHighlightedInFocusMode" , entity:IsHighlightedInFocusMode())
	BradenMenu.IGE.ObjectToText("IsHostile: " , entity:IsHostile())
	BradenMenu.IGE.ObjectToText("IsInIconForcedVisibilityRange: " , entity:IsInIconForcedVisibilityRange())
	BradenMenu.IGE.ObjectToText("IsInitialized" , entity:IsInitialized())
	BradenMenu.IGE.ObjectToText("IsInvestigating" , entity:IsInvestigating())
	BradenMenu.IGE.ObjectToText("IsItem" , entity:IsItem())
	BradenMenu.IGE.ObjectToText("IsJohnnyReplacer" , entity:IsJohnnyReplacer())
	BradenMenu.IGE.ObjectToText("IsLogicReady" , entity:IsLogicReady())
	BradenMenu.IGE.ObjectToText("IsNetrunner" , entity:IsNetrunner())
	BradenMenu.IGE.ObjectToText("IsNetworkKnownToPlayer" , entity:IsNetworkKnownToPlayer())
	BradenMenu.IGE.ObjectToText("IsNetworkLinkDynamic" , entity:IsNetworkLinkDynamic())
	BradenMenu.IGE.ObjectToText("IsNPC" , entity:IsNPC())
	BradenMenu.IGE.ObjectToText("IsObjectRevealed" , entity:IsObjectRevealed())
	BradenMenu.IGE.ObjectToText("IsPhotoModeBlocked" , entity:IsPhotoModeBlocked())
	BradenMenu.IGE.ObjectToText("IsPlayer" , entity:IsPlayer())
	BradenMenu.IGE.ObjectToText("IsPlayerControlled" , entity:IsPlayerControlled())
	BradenMenu.IGE.ObjectToText("IsPrevention" , entity:IsPrevention())
	BradenMenu.IGE.ObjectToText("IsPuppet" , entity:IsPuppet())
	BradenMenu.IGE.ObjectToText("IsQuest" , entity:IsQuest())
	BradenMenu.IGE.ObjectToText("IsQuickHackAble" , entity:IsQuickHackAble())
	BradenMenu.IGE.ObjectToText("IsQuickHacksExposed" , entity:IsQuickHacksExposed())
	BradenMenu.IGE.ObjectToText("IsReplacer" , entity:IsReplacer())
	BradenMenu.IGE.ObjectToText("IsScaningCluesBlocked" , entity:IsScaningCluesBlocked())
	BradenMenu.IGE.ObjectToText("IsScanned" , entity:IsScanned())
	BradenMenu.IGE.ObjectToText("IsScannerDataDirty" , entity:IsScannerDataDirty())
	BradenMenu.IGE.ObjectToText("IsSelectedForDebugging" , entity:IsSelectedForDebugging())
	BradenMenu.IGE.ObjectToText("IsSensor" , entity:IsSensor())
	BradenMenu.IGE.ObjectToText("IsShardContainer" , entity:IsShardContainer())
	BradenMenu.IGE.ObjectToText("IsSolo" , entity:IsSolo())
	BradenMenu.IGE.ObjectToText("IsTaggedinFocusMode" , entity:IsTaggedinFocusMode())
	BradenMenu.IGE.ObjectToText("IsTechie" , entity:IsTechie())
	BradenMenu.IGE.ObjectToText("IsTurret" , entity:IsTurret())
	BradenMenu.IGE.ObjectToText("IsVehicle" , entity:IsVehicle())
	BradenMenu.IGE.ObjectToText("IsVehicle" , entity:IsVehicle())
	BradenMenu.IGE.ObjectToText("IsVRReplacer" , entity:IsVRReplacer())
	BradenMenu.IGE.ObjectToText("CanOverrideNetworkContext" , entity:CanOverrideNetworkContext())
	self:DrawWindowCName("GetNetworkLinkSlotName", entity:GetNetworkLinkSlotName()) -- Does not work with vehicles
	self:DrawWindowCName("GetRoleMappinSlotName", entity:GetRoleMappinSlotName())
	self:DrawWindowCName("GetQuickHackIndicatorSlotName", entity:GetQuickHackIndicatorSlotName())
	self:DrawWindowCName("GetPhoneCallIndicatorSlotName", entity:GetPhoneCallIndicatorSlotName())
	BradenMenu.IGE.DisplayVector4("GetNetworkBeamEndpoint", entity:GetNetworkBeamEndpoint()) 
	BradenMenu.IGE.ObjectToText("ShouldSendGameAttachedEventToPS", entity:ShouldSendGameAttachedEventToPS())
	BradenMenu.IGE.ObjectToText("GetContentScale", entity:GetContentScale())
	BradenMenu.IGE.ObjectToText("DeterminGameplayRole", entity:DeterminGameplayRole())

	ImGui.Unindent()
end

function Inspector.DrawEditGameObject(self, entity)
	ImGui.Indent()
	if ImGui.Button("RemoveAllItems") then GetSingleton('gameTransactionSystem'):RemoveAllItems(entity) end
	if ImGui.Button("ClearAllSlots") then GetSingleton('gameTransactionSystem'):ClearAllSlots(entity) end
	if ImGui.Button("EvaluateMappinsVisualState") then entity:EvaluateMappinsVisualState() end
	if ImGui.Button("FadeOutOutlines") then entity:FadeOutOutlines() end
	if ImGui.Button("FireSingleE3Tick") then entity:FireSingleE3Tick() end
	if ImGui.Button("ForceDefeatReward") then entity:ForceDefeatReward(true) end
	if ImGui.Button("TryOpenQuickhackMenu") then entity:TryOpenQuickhackMenu(true) end
	if ImGui.Button("ToggleQuestImportance") then entity:ToggleQuestImportance(false) end
	if ImGui.Button("EvaluateLastFrameRequest") then entity:EvaluateLastFrameRequest() end
	
	ImGui.Unindent()
end