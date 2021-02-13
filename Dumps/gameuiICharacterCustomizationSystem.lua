{
	name: gameuiICharacterCustomizationSystem,
	functions: {
		IsTransgenderAllowed() => (Bool),
		IsNudityAllowed() => (Bool),
		InitializeState() => (Bool),
		FinalizeState() => (Bool),
		ClearState() => (Bool),
		GetState() => (handle:gameuiICharacterCustomizationState),
		GetHeadOptions(presetName: CName) => (array:handle:gameuiCharacterCustomizationOption),
		GetBodyOptions(presetName: CName) => (array:handle:gameuiCharacterCustomizationOption),
		GetArmsOptions(presetName: CName) => (array:handle:gameuiCharacterCustomizationOption),
		GetUnitedOptions(head: Bool, body: Bool, arms: Bool, headPreset: CName, bodyPreset: CName, armsPreset: CName) => (array:handle:gameuiCharacterCustomizationOption),
		RandomizeOptions(),
		ApplyUIPreset(presetName: CName),
		ApplyChangeToOption(option: handle:gameuiCharacterCustomizationOption, newValue: Uint32),
		TriggerVoiceToneSample(),
		HasCharacterCustomizationComponent(entity: handle:entEntity) => (Bool),
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