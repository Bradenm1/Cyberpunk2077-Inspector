{
	name: worldAnimationSystemScriptInterface,
	functions: {
		SetForcedVisible(entityId: entEntityID, value: Bool),
		SetForcedVisibleOnlyInFrustum(entityId: entEntityID, value: Bool),
		EnterCombatMode(entityId: entEntityID),
		ExitCombatMode(entityId: entEntityID),
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