{
	name: AIAnimationTask,
	functions: {
		GetPhaseDuration() => (Float),
		SendAnimData(context: AIbehaviorScriptExecutionContext, animData: handle:gamedataAIActionAnimData_Record),
		StartPhase(context: AIbehaviorScriptExecutionContext, newPhase: EAIActionPhase),
		Activate(context: AIbehaviorScriptExecutionContext),
		Deactivate(context: AIbehaviorScriptExecutionContext),
		Update(context: AIbehaviorScriptExecutionContext) => (AIbehaviorUpdateOutcome),
		GetDescription(context: AIbehaviorScriptExecutionContext) => (String),
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
		record: TweakDBID,
		animVariation: handle:AIArgumentMapping,
		actionRecord: whandle:gamedataAIAction_Record,
		actionDebugName: String,
		animVariationValue: Int32,
		phaseRecord: whandle:gamedataAIActionPhase_Record,
		actionPhase: EAIActionPhase,
		phaseActivationTime: Float,
		phaseDuration: Float,
	}
}