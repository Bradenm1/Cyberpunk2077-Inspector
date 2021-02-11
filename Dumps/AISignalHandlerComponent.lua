{
	name: AISignalHandlerComponent,
	functions: {
		AddSignal(signal: script_ref:AIGateSignal, keepActive: Bool) => (Uint32),
		RemoveSignal(id: Uint32) => (Bool),
		ConsumeSignal(tag: CName),
		IsHighestPriority(tag: CName) => (Bool, signalId: Uint32),
		GetSignal(signalId: Uint32) => (Bool, signal: AIGateSignal),
		HasSignalWithTag(tag: CName) => (Bool),
		GetHighestPrioritySignal() => (Bool, signal: AIGateSignal, signalId: Uint32),
		GetEntity() => (whandle:entEntity),
		FindComponentByName(componentName: CName) => (whandle:entIComponent),
		GetName() => (CName),
		IsEnabled() => (Bool),
		Toggle(on: Bool),
		QueueEntityEvent(ev: handle:redEvent),
		RegisterRenderDebug(filterName: String, functionName: CName),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		Get(entity: handle:entEntity) => (handle:AISignalHandlerComponent),
		DetectScriptableCycles(),
	},
	properties: {
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}