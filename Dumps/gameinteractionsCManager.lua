{
	name: gameinteractionsCManager,
	functions: {
		IsInteractionLookAtTarget(activatorOwner: whandle:gameObject, hotSpotOwner: whandle:gameObject) => (Bool),
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