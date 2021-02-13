{
	name: gameLocationManager,
	functions: {
		GetLocationTags(entityID: entEntityID) => (tags: array:CName),
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