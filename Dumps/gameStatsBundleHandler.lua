{
	name: gameStatsBundleHandler,
	functions: {
		GetStatValue(statType: gamedataStatType) => (Float),
		GetStatBoolValue(statType: gamedataStatType) => (Bool),
		GetStatDetails() => (array:gameStatDetailedData),
		AddModifier(modifierData: handle:gameStatModifierData) => (Bool),
		RemoveModifier(modifierData: handle:gameStatModifierData),
		RemoveAllModifiers(statType: gamedataStatType),
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