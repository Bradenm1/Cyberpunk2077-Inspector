{
	name: gamedataGender_Record,
	functions: {
		Comment() => (String),
		EnumName() => (CName),
		Type() => (gamedataGender),
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