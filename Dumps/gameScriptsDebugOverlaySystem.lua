{
	name: gameScriptsDebugOverlaySystem,
	functions: {
		CreateSink() => (gameScriptsDebugOverlaySink),
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