{
	name: gameActionScript,
	functions: {
		GetAITime(),
		EnableUpdate(),
		GetGameObject(),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		actionFlags: Uint32,
		gameObject: handle:gameObject,
	}
}