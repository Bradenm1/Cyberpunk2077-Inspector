{
	name: NPCManager,
	functions: {
		Init(owner: handle:gameObject),
		UnInit(owner: handle:gameObject),
		ApplySpawnGLPs(record: whandle:gamedataCharacter_Record),
		SetNPCAbilities(record: whandle:gamedataCharacter_Record),
		SetNPCVisualTagsStats(record: whandle:gamedataCharacter_Record),
		SetNPCArchetypeData(record: whandle:gamedataCharacter_Record),
		ScaleToPlayer(),
		SetNPCImmortalityMode(record: whandle:gamedataCharacter_Record),
		ClearNPCImmortalityMode(),
		GetScannableObjects() => (arr: array:gameScanningTooltipElementDef),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		owner: whandle:NPCPuppet,
	}
}