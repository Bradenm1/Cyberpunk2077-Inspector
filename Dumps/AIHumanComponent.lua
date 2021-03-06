{
	name: AIHumanComponent,
	functions: {
		SetMovementParams(params: moveMovementParameters),
		GetMovementParams(type: moveMovementType) => (moveMovementParameters),
		SetTDBMovementParams(paramsID: TweakDBID) => (Bool),
		GetNPCRarity() => (gamedataNPCRarity),
		IsOfficer() => (Bool),
		GetAssignedVehicleId() => (entEntityID),
		GetAssignedVehicleSlot() => (gamemountingMountingSlotId),
		HasVehicleAssigned() => (Bool),
		GetFriendlyFireCheckID() => (Uint32),
		GetGame() => (ScriptGameInstance),
		OnAttach(),
		ResetBehaviorCoverArguments(),
		OnDetach(),
		OnDeath(evt: handle:gameeventsDeathEvent) => (Bool),
		OnDefeated(evt: handle:gameeventsDefeatedEvent) => (Bool),
		OnPlayerCombatChanged(value: Int32) => (Bool),
		OnDelayPassiveConditionEvaluationEvent(evt: handle:DelayPassiveConditionEvaluationEvent) => (Bool),
		GetCoverBlackboard() => (handle:gameIBlackboard),
		GetShootingBlackboard() => (handle:gameIBlackboard),
		GetCombatGadgetBlackboard() => (handle:gameIBlackboard),
		GetActionBlackboard() => (handle:gameIBlackboard),
		GetAIPatrolBlackboard() => (handle:gameIBlackboard),
		GetAIAlertedPatrolBlackboard() => (handle:gameIBlackboard),
		GetCurrentRole() => (handle:AIRole),
		OnVehicleAssign(evt: handle:gameMountAIEvent) => (Bool),
		GetAssignedVehicleData() => (Bool, vehicleID: entEntityID, vehicleSlot: gamemountingMountingSlotId),
		GetAssignedVehicle(gi: ScriptGameInstance) => (Bool, vehicle: whandle:gameObject),
		OnAIRoleChanged(newRole: handle:AIRole, oldRole: handle:AIRole),
		IsPlayerCompanion() => (Bool),
		GetFriendlyTargetAsPlayer() => (Bool, player: whandle:PlayerPuppet),
		GetFriendlyTarget() => (Bool, friendlyTarget: whandle:gameObject),
		GetActionAnimationScriptProxy() => (handle:ActionAnimationScriptProxy),
		OnSignalCombatQueriesRequest(signalId: Uint16, newValue: Bool),
		IsFriendlyFiring() => (Bool),
		FriendlyFireCheck() => (Bool),
		FriendlyFireCheckInit() => (Bool),
		FriendlyFireTargetUpdateInit(),
		LoSFinderCheckInit() => (Bool),
		CombatQueriesSystemInit() => (Bool),
		OnStartGrenadeThrowQueryEvent(evt: handle:StartGrenadeThrowQueryEvent) => (Bool),
		StartGrenadeThrowQuery(target: whandle:gameObject),
		CanThrowGrenadeAtTarget(target: whandle:gameObject) => (Bool, throwPositions: Vector4, throwAngle: Float, throwStartType: gameGrenadeThrowStartType),
		CacheThrowGrenadeAtTargetQuery(target: whandle:gameObject) => (Bool),
		NULLCachedThrowGrenadeAtTargetQuery(),
		OnSetScriptExecutionContext(evt: handle:SetScriptExecutionContextEvent) => (Bool),
		GetScriptContext() => (Bool, context: AIbehaviorScriptExecutionContext),
		CheckTweakCondition(ActionConditionName: String) => (Bool),
		TryBulletDodgeOpportunity() => (Bool),
		OnHitAiEventReceived(hitAIEvent: handle:AIAIEvent) => (Bool),
		UpdateMyAttackBlockedCount(resetBB: Bool),
		UpdateMyAttackParriedCount(resetBB: Bool),
		UpdateMyAttackDodgedCount(resetBB: Bool),
		OnCommandStateChanged(command: handle:AICommand, oldState: AICommandState, newState: AICommandState),
		OnSignalCommandSignal(signalId: Uint16, newValue: Bool),
		TrackActionCommandID(commandClassNames: script_ref:array:CName),
		ClearActionCommandID(commandClassNames: script_ref:array:CName),
		IsCommandReceivedOrOverriden(commandClassName: CName) => (Bool),
		IsCommandReceivedOrOverriden(commandID: Uint32) => (Bool),
		IsCommandActive(commandClassName: CName) => (Bool),
		GetActiveCommandsCount() => (Int32),
		IsCommandActive(commandID: Uint32) => (Bool),
		GetActiveCommandID(commandClassName: CName) => (Int32),
		OnStatusEffectApplied(evt: handle:gameeventsApplyStatusEffectEvent) => (Bool),
		OnStatusEffectRemoved(evt: handle:gameeventsApplyStatusEffectEvent) => (Bool),
		OnNewThreat(evt: handle:AINewThreat) => (Bool),
		OnHostileThreatDetected(evt: handle:AIHostileThreatDetected) => (Bool),
		OnEnemyThreatDetected(evt: handle:AIEnemyThreatDetected) => (Bool),
		OnThreatRemoved(evt: handle:AIThreatRemoved) => (Bool),
		OnAnimParamsEvent(evt: handle:entAnimParamsEvent) => (Bool),
		SetBehaviorArgument(n: CName, nv: Variant),
		GetBehaviorArgument(n: CName) => (Variant),
		GetFriendlyFireSystem() => (handle:gameIFriendlyFireSystem),
		GetLoSFinderSystem() => (handle:gameLoSIFinderSystem),
		GetSignals() => (handle:gameBoolSignalTable),
		SendCommand(cmd: handle:AICommand) => (Bool),
		CancelCommand(cmd: handle:AICommand) => (Bool),
		CancelCommandById(cmdId: Uint32) => (Bool),
		StartExecutingCommand(cmd: handle:AICommand) => (Bool),
		StopExecutingCommand(cmd: handle:AICommand, success: Bool) => (Bool),
		IsCommandExecuting(commandName: CName, useInheritance: Bool) => (Bool),
		IsCommandWaiting(commandName: CName, useInheritance: Bool) => (Bool),
		GetCommandState(cmd: handle:AICommand) => (AICommandState),
		DebugLog(category: CName, message: String),
		GetHighLevelState() => (gamedataNPCHighLevelState),
		GetAIRole() => (handle:AIRole),
		SetAIRole(role: handle:AIRole),
		InvokeBehaviorCallback(cbName: CName),
		GetLOD() => (Int32),
		GetStoryTier() => (gameStoryTier),
		SetCombatSpaceSize(combatSpaceSize: AICombatSpaceSize),
		GetCombatSpaceSize() => (AICombatSpaceSize),
		SetCombatSpaceSizeMultiplier(multiplier: Float),
		GetCombatSpaceSizeMultiplier() => (Float),
		GetUpdateTickCount() => (Uint32),
		ForceTickNextFrame(),
		EnableCollider(),
		DisableCollider(),
		GetOrCreateBlackboard(definition: handle:gamebbScriptDefinition, cache: script_ref:handle:gameIBlackboard) => (handle:gameIBlackboard),
		GetCurrentReactionPreset() => (whandle:gamedataReactionPreset_Record),
		GetPS() => (handle:gameComponentPS),
		GetBasePS() => (handle:gameComponentPS),
		GetPersistentID() => (gamePersistentID),
		GetEntity() => (whandle:entEntity),
		FindComponentByName(componentName: CName) => (whandle:entIComponent),
		GetName() => (CName),
		IsEnabled() => (Bool),
		Toggle(on: Bool),
		QueueEntityEvent(ev: handle:redEvent),
		RegisterRenderDebug(filterName: String, functionName: CName),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		movementParamsRecord: TweakDBID,
		shootingBlackboard: handle:gameIBlackboard,
		gadgetBlackboard: handle:gameIBlackboard,
		coverBlackboard: handle:gameIBlackboard,
		actionBlackboard: handle:gameIBlackboard,
		patrolBlackboard: handle:gameIBlackboard,
		alertedPatrolBlackboard: handle:gameIBlackboard,
		friendlyFireCheckID: Uint32,
		ffs: handle:gameIFriendlyFireSystem,
		LoSFinderCheckID: Uint32,
		loSFinderSystem: handle:gameLoSIFinderSystem,
		LoSFinderVisibleObject: whandle:senseVisibleObject,
		actionAnimationScriptProxy: handle:ActionAnimationScriptProxy,
		lastOwnerBlockedAttackEventID: gameDelayID,
		lastOwnerParriedAttackEventID: gameDelayID,
		lastOwnerDodgedAttackEventID: gameDelayID,
		grenadeThrowQueryTarget: whandle:gameObject,
		grenadeThrowQueryId: Int32,
		scriptContext: AIbehaviorScriptExecutionContext,
		scriptContextInitialized: Bool,
		highLevelCb: Uint32,
		activeCommands: AIbehaviorUniqueActiveCommandList,
		persistentState: handle:gamePersistentState,
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}