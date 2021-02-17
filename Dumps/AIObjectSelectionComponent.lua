{
	name: AIObjectSelectionComponent,
	functions: {
		SetRadius(radius: Float),
		SetCurrentCoverDebugPresetNumber(presetNumber: Int32),
		GetCurrentCoverDebugPresetNumber() => (Int32),
		IsCoverPositiveScored(coverId: Uint64, ring: gamedataAIRingType) => (Bool),
		PauseCoversProcessing(setPause: Bool),
		IsCoversProcessingPaused() => (Bool),
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
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}