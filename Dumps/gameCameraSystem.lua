{
	name: gameCameraSystem,
	functions: {
		PrepareBlendCamera(),
		AbandonBlendCamera(),
		GetActiveCameraWorldTransform(transform: Transform) => (Bool),
		GetActiveCameraData() => (entCameraData),
		GetActiveCameraFOV() => (Float),
		GetAspectRatio() => (Float),
		GetActiveCameraRight() => (Vector4),
		GetActiveCameraForward() => (Vector4),
		GetActiveCameraUp() => (Vector4),
		ProjectPoint(worldSpacePoint: Vector4) => (Vector4),
		UnprojectPoint(screenSpacePoint: Vector2) => (Vector4),
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