{
	name: worldTrafficScriptInterface,
	functions: {
		IsPathIntersectingWithTraffic(path: array:Vector4, distanceFromTraffic: Float) => (Bool, intersection: Vector4),
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