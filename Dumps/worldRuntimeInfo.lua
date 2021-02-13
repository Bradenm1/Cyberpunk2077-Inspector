{
	name: worldRuntimeInfo,
	functions: {
		IsSingleplayer() => (Bool),
		IsMultiplayer() => (Bool),
		IsClient() => (Bool),
		IsServer() => (Bool),
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