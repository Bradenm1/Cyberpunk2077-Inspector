{
	name: gamedataPhotoModeEffect_Record,
	functions: {
		LutPath() => (CName),
		HdrLutPath() => (CName),
		DisplayName() => (CName),
		Locked() => (Bool),
		GetID() => (TweakDBID),
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