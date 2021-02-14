{
	name: AIFollowerTakedownCommandParams,
	functions: {
		GetCommandName() => (String),
		CreateCommand() => (handle:AICommand),
		CreateCommand() => (handle:AICommand),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		targetRef: gameEntityReference,
		approachBeforeTakedown: Bool,
		doNotTeleportIfTargetIsVisible: Bool,
	}
}