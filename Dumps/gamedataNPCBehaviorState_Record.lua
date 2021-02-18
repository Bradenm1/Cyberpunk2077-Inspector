{
	name: gamedataNPCBehaviorState_Record,
	functions: {
		Comment() => (String),
		EnumName() => (CName),
		Type() => (gamedataNPCBehaviorState),
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