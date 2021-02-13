{
	name: gameVisionModeSystem,
	functions: {
		EnterMode(activator: handle:gameObject, mode: gameVisionModeType),
		SetEntityVisionMode(id: entEntityID, val: Bool),
		SetChildEntityVisionMode(parentId: entEntityID, childNodeRef: NodeRef, enable: Bool),
		RegisterActivatorCallback(activator: handle:gameObject, listener: handle:gameObject) => (Bool),
		UnregisterActivatorCallback(activator: handle:gameObject, listener: handle:gameObject),
		ForceVisionAppearance(entity: handle:gameObject, appearance: gameVisionAppearance, transitionTime: Float),
		CancelForceVisionAppearance(entity: handle:gameObject, transitionTime: Float),
		GetScanningController() => (handle:gameScanningController),
		RequestPulse(entity: handle:gameObject, initialAppearance: gameVisionAppearance, peakAppearance: gameVisionAppearance, transitionInTime: Float, transitionOutTime: Float),
		RegisterDelayedReveal(revealEntityId: entEntityID, revealId: gameVisionModeSystemRevealIdentifier, delayTime: Float),
		UnregisterDelayedReveal(revealEntityId: entEntityID, revealId: gameVisionModeSystemRevealIdentifier),
		IsDelayedRevealInProgress(revealEntityId: entEntityID, revealId: gameVisionModeSystemRevealIdentifier) => (Bool),
		GetDelayedRevealEntries(revealEntityId: entEntityID) => (revealIds: array:gameVisionModeSystemRevealIdentifier),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
	}
}