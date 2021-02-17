{
	name: RequestTakeControl,
	functions: {
		Cancel(),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		requestSource: entEntityID,
		originalEvent: handle:ToggleTakeOverControl,
	}
}