{
	name: gameSceneAnimationMotionActionParams,
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
		motionType: gameSceneAnimationMotionActionParamsMotionType,
		placementTransform: WorldTransform,
		motionBlendInTime: Float,
		poseBlendInTime: Float,
		blendInCurve: gameSceneAnimationMotionActionParamsEasingType,
		animationName: CName,
		placementMode: gameSceneAnimationMotionActionParamsPlacementMode,
		startTime: Float,
		endTime: Float,
		initialDt: Float,
		globalTimeToAnimTime: Float,
		mountDescriptor: gameMountDescriptor,
		playerParams: gameScenePlayerAnimationParams,
		HACK_eventPlayDirection: gameSceneAnimationMotionActionParamsActionPlayDirection,
		trajectoryLOD: array:scnAnimationMotionSample,
		dynamicAnimSetupHash: Uint64,
	}
}