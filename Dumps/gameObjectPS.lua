{
	name: gameObjectPS,
	functions: {
		GetID() => (gamePersistentID),
		GetPersistencySystem() => (handle:gamePersistencySystem),
		GetGameInstance() => (ScriptGameInstance),
		ForcePersistentStateChanged(),
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