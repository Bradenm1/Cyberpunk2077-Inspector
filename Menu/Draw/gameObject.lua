function Inspector.DrawGameObject(self, entity)
	ImGui.Indent()

	-- Functions
	self:ObjectToText("DisplayName" , entity:GetDisplayName())
	self:ObjectToText("GetTracedActionName" , entity:GetTracedActionName())

	self:DrawNodeTree("GetOwner", "entEntity", entity:GetOwner(), 
		function(entityOwner)  self:DrawWindowEntityInspecterViewHasEntity(entityOwner) end
	)

	if entity:IsNPC() then 
		self:DrawNodeTree("GetKiller", "entEntity", entity:GetKiller(), 
			function(entityKiller) self:DrawWindowEntityInspecterViewHasEntity(entityKiller) end
		)
	end

	self:DrawNodeTree("GetTargetTrackerComponent", "AITargetTrackerComponent", entity:GetTargetTrackerComponent(), 
		function(trackerComponent) self:DrawAITargetTrackerComponent(trackerComponent) end
	)

	local bool, items = GetSingleton('gameTransactionSystem'):GetItemList(entity)
	self:DisplayObjectArray("GetItemList", "gameUniqueItemData", items,
		function(key, value) 
			if self:TextToTreeNode("GetItemList - gameUniqueItemData - " .. key .. " - " .. tostring(Game.NameToString(value:GetName()))) then 
				self:DrawgameUniqueItemData(value)
				ImGui.Unindent()
			end 
		end
	)

	self:ObjectToText("IsAccessPoint", entity:IsAccessPoint())
	self:ObjectToText("IsActive", entity:IsActive())
	self:ObjectToText("IsActiveBackdoor", entity:IsActiveBackdoor())
	self:ObjectToText("IsAnyClueEnabled" , entity:IsAnyClueEnabled())
	self:ObjectToText("IsAnyPlaystyleValid" , entity:IsAnyPlaystyleValid())
	self:ObjectToText("IsBackdoor" , entity:IsBackdoor())
	self:ObjectToText("IsBodyDisposalPossible" , entity:IsBodyDisposalPossible())
	self:ObjectToText("IsBraindanceBlocked" , entity:IsBraindanceBlocked())
	self:ObjectToText("IsBreached" , entity:IsBreached())
	self:ObjectToText("IsClueInspected" , entity:IsClueInspected())
	self:ObjectToText("IsConnectedToBackdoorDevice" , entity:IsConnectedToBackdoorDevice())
	self:ObjectToText("IsConnectedToSecuritySystem" , entity:IsConnectedToSecuritySystem())
	self:ObjectToText("IsContainer" , entity:IsContainer())
	self:ObjectToText("IsControllingDevices" , entity:IsControllingDevices())
	self:ObjectToText("IsCurrentlyScanned" , entity:IsCurrentlyScanned())
	self:ObjectToText("IsCurrentTarget" , entity:IsCurrentTarget())
	self:ObjectToText("IsDead" , entity:IsDead())
	self:ObjectToText("IsDeadNoStatPool" , entity:IsDeadNoStatPool())
	self:ObjectToText("IsDemolitionSkillCheckActive" , entity:IsDemolitionSkillCheckActive())
	self:ObjectToText("IsDevice" , entity:IsDevice())
	self:ObjectToText("IsDrone" , entity:IsDrone())
	self:ObjectToText("IsDropPoint" , entity:IsDropPoint())
	self:ObjectToText("IsEngineeringSkillCheckActive" , entity:IsEngineeringSkillCheckActive())
	self:ObjectToText("IsExplosive" , entity:IsExplosive())
	self:ObjectToText("IsFastTravelPoint" , entity:IsFastTravelPoint())
	self:ObjectToText("IsGameplayRelevant" , entity:IsGameplayRelevant())
	self:ObjectToText("IsGrouppedClue" , entity:IsGrouppedClue())
	self:ObjectToText("IsHackingPlayer" , entity:IsHackingPlayer())
	self:ObjectToText("IsHackingSkillCheckActive" , entity:IsHackingSkillCheckActive())
	self:ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	self:ObjectToText("CanRevealRemoteActionsWheel" , entity:CanRevealRemoteActionsWheel())
	self:ObjectToText("GetScannerAttitudeTweak" , entity:GetScannerAttitudeTweak())
	self:ObjectToText("GetSensesComponent" , entity:GetSensesComponent())
	self:ObjectToText("CalculateRealTimePassed" , entity:CalculateRealTimePassed())
	self:ObjectToText("CalculateAmountOfTicks" , entity:CalculateAmountOfTicks())
	self:ObjectToText("ShouldEnableOutlineRed" , entity:ShouldEnableOutlineRed())
	self:ObjectToText("ShouldEnableOutlineGreen" , entity:ShouldEnableOutlineGreen())
	self:ObjectToText("CanBeTagged" , entity:CanBeTagged())
	self:ObjectToText("GetCurrentOutline" , entity:GetCurrentOutline())
	self:ObjectToText("GetDefaultHighlightType" , entity:GetDefaultHighlightType())
	self:ObjectToText("GetObjectToForwardHighlight" , entity:GetObjectToForwardHighlight())
	self:ObjectToText("GetBraindanceLayer" , entity:GetBraindanceLayer())
	self:ObjectToText("CanScanThroughWalls" , entity:CanScanThroughWalls())
	self:ObjectToText("IsHighlightedInFocusMode" , entity:IsHighlightedInFocusMode())
	self:ObjectToText("IsHostile: " , entity:IsHostile())
	self:ObjectToText("IsInIconForcedVisibilityRange: " , entity:IsInIconForcedVisibilityRange())
	self:ObjectToText("IsInitialized" , entity:IsInitialized())
	self:ObjectToText("IsInvestigating" , entity:IsInvestigating())
	self:ObjectToText("IsItem" , entity:IsItem())
	self:ObjectToText("IsJohnnyReplacer" , entity:IsJohnnyReplacer())
	self:ObjectToText("IsLogicReady" , entity:IsLogicReady())
	self:ObjectToText("IsNetrunner" , entity:IsNetrunner())
	self:ObjectToText("IsNetworkKnownToPlayer" , entity:IsNetworkKnownToPlayer())
	self:ObjectToText("IsNetworkLinkDynamic" , entity:IsNetworkLinkDynamic())
	self:ObjectToText("IsNPC" , entity:IsNPC())
	self:ObjectToText("IsObjectRevealed" , entity:IsObjectRevealed())
	self:ObjectToText("IsPhotoModeBlocked" , entity:IsPhotoModeBlocked())
	self:ObjectToText("IsPlayer" , entity:IsPlayer())
	self:ObjectToText("IsPlayerControlled" , entity:IsPlayerControlled())
	self:ObjectToText("IsPrevention" , entity:IsPrevention())
	self:ObjectToText("IsPuppet" , entity:IsPuppet())
	self:ObjectToText("IsQuest" , entity:IsQuest())
	self:ObjectToText("IsQuickHackAble" , entity:IsQuickHackAble())
	self:ObjectToText("IsQuickHacksExposed" , entity:IsQuickHacksExposed())
	self:ObjectToText("IsReplacer" , entity:IsReplacer())
	self:ObjectToText("IsScaningCluesBlocked" , entity:IsScaningCluesBlocked())
	self:ObjectToText("IsScanned" , entity:IsScanned())
	self:ObjectToText("IsScannerDataDirty" , entity:IsScannerDataDirty())
	self:ObjectToText("IsSelectedForDebugging" , entity:IsSelectedForDebugging())
	self:ObjectToText("IsSensor" , entity:IsSensor())
	self:ObjectToText("IsShardContainer" , entity:IsShardContainer())
	self:ObjectToText("IsSolo" , entity:IsSolo())
	self:ObjectToText("IsTaggedinFocusMode" , entity:IsTaggedinFocusMode())
	self:ObjectToText("IsTechie" , entity:IsTechie())
	self:ObjectToText("IsTurret" , entity:IsTurret())
	self:ObjectToText("IsVehicle" , entity:IsVehicle())
	self:ObjectToText("IsVehicle" , entity:IsVehicle())
	self:ObjectToText("IsVRReplacer" , entity:IsVRReplacer())
	self:ObjectToText("CanOverrideNetworkContext" , entity:CanOverrideNetworkContext())
	self:DrawWindowCName("GetNetworkLinkSlotName", entity:GetNetworkLinkSlotName()) -- Does not work with vehicles
	self:DrawWindowCName("GetRoleMappinSlotName", entity:GetRoleMappinSlotName())
	self:DrawWindowCName("GetQuickHackIndicatorSlotName", entity:GetQuickHackIndicatorSlotName())
	self:DrawWindowCName("GetPhoneCallIndicatorSlotName", entity:GetPhoneCallIndicatorSlotName())
	self:DisplayVector4("GetNetworkBeamEndpoint", entity:GetNetworkBeamEndpoint()) 
	self:ObjectToText("ShouldSendGameAttachedEventToPS", entity:ShouldSendGameAttachedEventToPS())
	self:ObjectToText("GetContentScale", entity:GetContentScale())
	self:ObjectToText("DeterminGameplayRole", entity:DeterminGameplayRole())

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