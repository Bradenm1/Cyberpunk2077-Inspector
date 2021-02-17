{
	name: ActionAnimationScriptProxy,
	functions: {
		Setup(animFeatureName: CName, animFeature: handle:animAnimFeature_AIAction, useRootMotion: Bool, usePoseMatching: Bool, resetRagdollOnStart: Bool, motionDynamicObjectsCheck: Bool, updadeMovePolicy: Bool, slideParams: gameActionAnimationSlideParams, targetObject: whandle:gameObject, tagetPositionProvider: handle:entIPositionProvider) => (Bool),
		ForceLaunch(animFeatureName: CName, animFeature: handle:animAnimFeature_AIAction, useRootMotion: Bool, usePoseMatching: Bool, resetRagdollOnStart: Bool, motionDynamicObjectsCheck: Bool, slideParams: gameActionAnimationSlideParams, targetObject: whandle:gameObject, tagetPositionProvider: handle:entIPositionProvider),
		Terminate(),
		GetPhaseDuration(animFeatureName: CName, animFeature: handle:animAnimFeature_AIAction) => (Float),
		Bind(go: handle:gameObject),
		Launch(),
		Stop(),
		GetStatus() => (gameEActionStatus),
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