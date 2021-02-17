{
	name: AIbehaviortaskScript,
	functions: {
		CutSelector(context: AIbehaviorScriptExecutionContext),
		Activate(context: AIbehaviorScriptExecutionContext),
		Deactivate(context: AIbehaviorScriptExecutionContext),
		Update(context: AIbehaviorScriptExecutionContext) => (AIbehaviorUpdateOutcome),
		ChildCompleted(context: AIbehaviorScriptExecutionContext, status: AIbehaviorCompletionStatus),
		GetDescription(context: AIbehaviorScriptExecutionContext) => (String),
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