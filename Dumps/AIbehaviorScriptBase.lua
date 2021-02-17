{
	name: AIbehaviorScriptBase,
	functions: {
		GetDescription(context: AIbehaviorScriptExecutionContext) => (String),
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