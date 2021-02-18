{
	name: gameCAttitudeManager,
	functions: {
		GetAttitudeGroup(entityID: entEntityID) => (CName),
		SetAttitudeGroupRelationPersistent(firstGroup: CName, secondGroup: CName, attitude: EAIAttitude),
		SetAttitudeGroupRelationfromTweakPersistent(firstGroup: TweakDBID, secondGroup: TweakDBID, attitude: EAIAttitude),
		SetAttitudeRelation(firstGroup: CName, secondGroup: CName, attitude: EAIAttitude),
		SetAttitudeRelationFromTweak(firstGroup: TweakDBID, secondGroup: TweakDBID, attitude: EAIAttitude),
		GetAttitudeRelation(firstGroup: CName, secondGroup: CName) => (EAIAttitude),
		GetAttitudeRelationFromTweak(firstGroup: TweakDBID, secondGroup: TweakDBID) => (EAIAttitude),
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