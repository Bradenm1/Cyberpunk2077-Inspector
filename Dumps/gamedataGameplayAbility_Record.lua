{
	name: gamedataGameplayAbility_Record,
	functions: {
		AbilityPackage() => (whandle:gamedataGameplayLogicPackage_Record),
		PrereqsForUse() => (outList: array:whandle:gamedataIPrereq_Record),
		GetPrereqsForUseCount() => (Int32),
		GetPrereqsForUseItem(index: Int32) => (whandle:gamedataIPrereq_Record),
		PrereqsForUseContains(item: whandle:gamedataIPrereq_Record) => (Bool),
		Loc_key_name() => (CName),
		Loc_key_desc() => (CName),
		ShowInCodex() => (Bool),
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