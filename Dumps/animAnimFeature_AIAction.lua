{
	name: animAnimFeature_AIAction,
	functions: {
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		state: Int32,
		animVariation: Int32,
		stateDuration: Float,
		direction: Float,
	}
}