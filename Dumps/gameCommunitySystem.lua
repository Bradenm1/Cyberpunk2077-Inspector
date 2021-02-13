{
	name: gameCommunitySystem,
	functions: {
		EnableDynamicCrowdNullArea(areaLocalBBox: Box, areaLocalToWorld: WorldTransform, savable: Bool, duration: Float) => (Uint64),
		DisableCrowdNullArea(areaId: Uint64),
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