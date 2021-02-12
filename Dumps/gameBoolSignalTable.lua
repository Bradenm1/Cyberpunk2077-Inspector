{
	name: gameBoolSignalTable,
	functions: {
		GetOrCreateSignal(signalName: CName) => (Uint16),
		GetOrCreateTagSignal(signalName: CName) => (Uint16),
		Set(signalId: Uint16, value: Bool) => (Bool),
		SetWithData(signalId: Uint16, data: handle:gameSignalUserData) => (Bool),
		SetByName(signalName: CName, value: Bool) => (Bool),
		SetTimed(signalId: Uint16, duration: Float) => (Bool),
		GetCurrentValue(signalId: Uint16) => (Bool),
		GetCurrentData(signalId: Uint16) => (handle:gameSignalUserData),
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