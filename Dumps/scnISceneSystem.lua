{
	name: scnISceneSystem,
	functions: {
		GetScriptInterface() => (handle:scnScriptInterface),
		GetPeerIdDialogChoiceFactName() => (String),
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