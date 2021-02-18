{
	name: gameIWatchdogSystem,
	functions: {
		HasActiveFallback(entityId: entEntityID, fallbackCategory: CName) => (Bool),
		IsFallbackHandled(fallbackCategory: CName) => (Bool),
		IsFallbackForced(fallbackCategory: CName) => (Bool),
		SetForcedFallback(fallbackCategory: CName, isForced: Bool),
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