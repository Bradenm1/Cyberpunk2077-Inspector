{
	name: gamedataAIActionAnimData_Record,
	functions: {
		Direction() => (whandle:gamedataAIActionAnimDirection_Record),
		AnimSlot() => (whandle:gamedataAIActionAnimSlot_Record),
		AnimVariationSubAction() => (whandle:gamedataAISubAction_Record),
		AnimFeature() => (CName),
		AnimVariation() => (Int32),
		WeaponOverride() => (Int32),
		RagdollOnDeath() => (Bool),
		UpdateMovePolicy() => (Bool),
		GetID() => (TweakDBID),
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