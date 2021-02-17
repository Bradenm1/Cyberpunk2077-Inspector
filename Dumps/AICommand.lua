{
	name: AICommand,
	functions: {
		Copy() => (handle:AICommand),
		GetCategory() => (CName),
		SetCategory(value: CName),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		id: Uint32,
		state: AICommandState,
		questBlockId: Uint64,
		category: CName,
	}
}