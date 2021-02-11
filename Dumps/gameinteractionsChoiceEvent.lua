{
	name: gameinteractionsChoiceEvent,
	functions: {
		IsInputLayerEvent() => (Bool),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		choice: gameinteractionsChoice,
		actionType: gameinputActionType,
		hotspot: whandle:gameObject,
		activator: whandle:gameObject,
		eventType: gameinteractionsEInteractionEventType,
		layerData: gameinteractionsLayerData,
	}
}