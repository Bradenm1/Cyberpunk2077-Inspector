{
	name: gamedataNPCType_Record,
	functions: {
		EnumComment() => (String),
		EnumName() => (CName),
		Type() => (gamedataNPCType),
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