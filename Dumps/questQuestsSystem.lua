{
	name: questQuestsSystem,
	functions: {
		GetFact(factName: CName) => (Int32),
		GetFactStr(factName: String) => (Int32),
		SetFact(factName: CName, value: Int32),
		SetFactStr(factName: String, value: Int32),
		RegisterListener(factName: CName, listener: handle:IScriptable, funcName: CName) => (Uint32),
		UnregisterListener(factName: CName, id: Uint32),
		RegisterEntity(factName: CName, entityId: entEntityID) => (Uint32),
		UnregisterEntity(factName: CName, callbackId: Uint32),
		GetGameplayTimerData() => (seconds: Float, percent: Float),
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