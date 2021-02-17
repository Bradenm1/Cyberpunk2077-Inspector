{
	name: vehicleCameraManager,
	functions: {
		IsTPPActive() => (Bool),
		GetActivePerspective() => (vehicleCameraPerspective),
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