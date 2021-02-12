{
	name: entEntityID,
	functions: {
	},
	staticFunctions: {
		IsDefined(id: entEntityID) => (Bool),
		IsDynamic(id: entEntityID) => (Bool),
		IsStatic(id: entEntityID) => (Bool),
		ToDebugString(id: entEntityID) => (String),
		ToDebugStringDecimal(id: entEntityID) => (String),
		GetHash(id: entEntityID) => (Uint32),
	},
	properties: {
		hash: Uint64,
	}
}