{
	name: AIRole,
	functions: {
		GetRoleTweakRecord() => (handle:gamedataAIRole_Record),
		GetRoleEnum() => (EAIRole),
		GetTweakRecordId() => (TweakDBID),
		OnRoleSet(owner: whandle:gameObject),
		OnRoleCleared(owner: whandle:gameObject),
		OnHighLevelStateEnter(owner: whandle:gameObject, newState: gamedataNPCHighLevelState, previousState: gamedataNPCHighLevelState),
		OnHighLevelStateExit(owner: whandle:gameObject, leftState: gamedataNPCHighLevelState, nextState: gamedataNPCHighLevelState),
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