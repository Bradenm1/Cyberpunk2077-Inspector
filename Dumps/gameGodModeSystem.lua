{
	name: gameGodModeSystem,
	functions: {
		AddGodMode(entID: entEntityID, gmType: gameGodModeType, sourceInfo: CName) => (Bool),
		RemoveGodMode(entID: entEntityID, gmType: gameGodModeType, sourceInfo: CName) => (Bool),
		HasGodMode(entID: entEntityID, gmType: gameGodModeType) => (Bool),
		GetGodModeCount(entID: entEntityID, gmType: gameGodModeType) => (Uint32),
		GetGodModeSources(entID: entEntityID, gmType: gameGodModeType) => (array:CName),
		ClearGodMode(entID: entEntityID, sourceInfo: CName),
		EnableOverride(entID: entEntityID, gmType: gameGodModeType, sourceInfo: CName) => (Bool),
		DisableOverride(entID: entEntityID, sourceInfo: CName) => (Bool),
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