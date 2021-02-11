{
	name: gamedataReactionPreset_Record,
	functions: {
		ReactionGroup() => (String),
		EnumComment() => (String),
		StatModifiers() => (outList: array:whandle:gamedataStatModifier_Record),
		GetStatModifiersCount() => (Int32),
		GetStatModifiersItem(index: Int32) => (whandle:gamedataStatModifier_Record),
		StatModifiersContains(item: whandle:gamedataStatModifier_Record) => (Bool),
		Rules() => (outList: array:whandle:gamedataRule_Record),
		GetRulesCount() => (Int32),
		GetRulesItem(index: Int32) => (whandle:gamedataRule_Record),
		RulesContains(item: whandle:gamedataRule_Record) => (Bool),
		PresetMapper() => (outList: array:whandle:gamedataPresetMapper_Record),
		GetPresetMapperCount() => (Int32),
		GetPresetMapperItem(index: Int32) => (whandle:gamedataPresetMapper_Record),
		PresetMapperContains(item: whandle:gamedataPresetMapper_Record) => (Bool),
		EnumName() => (CName),
		FearThreshold() => (Float),
		AggressiveThreshold() => (Float),
		IsAggressive() => (Bool),
		Type() => (gamedataReactionPresetType),
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