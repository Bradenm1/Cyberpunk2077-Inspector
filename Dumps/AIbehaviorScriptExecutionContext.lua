{
	name: AIbehaviorScriptExecutionContext,
	functions: {
	},
	staticFunctions: {
		GetOwner(context: AIbehaviorScriptExecutionContext) => (handle:gamePuppet),
		GetAITime(context: AIbehaviorScriptExecutionContext) => (EngineTime),
		GetArgumentBool(context: AIbehaviorScriptExecutionContext, entry: CName) => (Bool),
		SetArgumentBool(context: AIbehaviorScriptExecutionContext, entry: CName, value: Bool),
		GetArgumentInt(context: AIbehaviorScriptExecutionContext, entry: CName) => (Int32),
		SetArgumentInt(context: AIbehaviorScriptExecutionContext, entry: CName, value: Int32),
		GetArgumentUint64(context: AIbehaviorScriptExecutionContext, entry: CName) => (Uint64),
		SetArgumentUint64(context: AIbehaviorScriptExecutionContext, entry: CName, value: Uint64),
		GetArgumentFloat(context: AIbehaviorScriptExecutionContext, entry: CName) => (Float),
		SetArgumentFloat(context: AIbehaviorScriptExecutionContext, entry: CName, value: Float),
		GetArgumentName(context: AIbehaviorScriptExecutionContext, entry: CName) => (CName),
		SetArgumentName(context: AIbehaviorScriptExecutionContext, entry: CName, value: CName),
		GetArgumentVector(context: AIbehaviorScriptExecutionContext, entry: CName) => (Vector4),
		SetArgumentVector(context: AIbehaviorScriptExecutionContext, entry: CName, value: Vector4),
		GetArgumentObject(context: AIbehaviorScriptExecutionContext, entry: CName) => (whandle:gameObject),
		SetArgumentObject(context: AIbehaviorScriptExecutionContext, entry: CName, value: whandle:gameObject),
		GetArgumentScriptable(context: AIbehaviorScriptExecutionContext, entry: CName) => (whandle:IScriptable),
		SetArgumentScriptable(context: AIbehaviorScriptExecutionContext, entry: CName, value: whandle:IScriptable),
		GetArgumentNodeRef(context: AIbehaviorScriptExecutionContext, entry: CName) => (NodeRef),
		SetArgumentNodeRef(context: AIbehaviorScriptExecutionContext, entry: CName, value: NodeRef),
		GetArgumentGlobalNodeId(context: AIbehaviorScriptExecutionContext, entry: CName) => (worldGlobalNodeID),
		SetArgumentGlobalNodeId(context: AIbehaviorScriptExecutionContext, entry: CName, value: worldGlobalNodeID),
		GetMappingValue(context: AIbehaviorScriptExecutionContext, mapping: handle:AIArgumentMapping) => (Variant),
		GetScriptableMappingValue(context: AIbehaviorScriptExecutionContext, mapping: handle:AIArgumentMapping) => (handle:IScriptable),
		GetTweakDBIDMappingValue(context: script_ref:AIbehaviorScriptExecutionContext, mapping: handle:AIArgumentMapping) => (TweakDBID),
		SetMappingValue(context: AIbehaviorScriptExecutionContext, mapping: handle:AIArgumentMapping, value: Variant) => (Bool),
		SetEnumMappingValue(context: AIbehaviorScriptExecutionContext, mapping: handle:AIArgumentMapping, value: Int64) => (Bool),
		GetDelegate(context: AIbehaviorScriptExecutionContext) => (handle:AIbehaviorBehaviorDelegate),
		GetClosestDelegate(context: AIbehaviorScriptExecutionContext) => (handle:AIbehaviorBehaviorDelegate),
		CreateActionID(context: AIbehaviorScriptExecutionContext, actionStringName: String, actionPackageType: AIactionParamsPackageTypes) => (TweakDBID),
		CreateActionParamID(context: AIbehaviorScriptExecutionContext, actionStringName: String, paramName: String) => (TweakDBID),
		GetOverriddenNode(context: script_ref:AIbehaviorScriptExecutionContext, nodeId: TweakDBID, lookupDefault: Bool) => (Bool, result: handle:gamedataAIRecord_Record),
		PuppetRefToObject(context: AIbehaviorScriptExecutionContext, puppetRef: gameEntityReference) => (handle:gameObject),
		AddBehaviorCallback(context: AIbehaviorScriptExecutionContext, cbName: CName, callback: handle:IScriptable) => (Uint32),
		RemoveBehaviorCallback(context: AIbehaviorScriptExecutionContext, id: Uint32) => (Bool),
		InvokeBehaviorCallback(context: script_ref:AIbehaviorScriptExecutionContext, cbName: CName),
		GetLOD(context: script_ref:AIbehaviorScriptExecutionContext) => (Int32),
		GetTweakActionSystem(context: script_ref:AIbehaviorScriptExecutionContext) => (handle:AIbehaviortweakTweakActionSystem),
		DebugLog(context: AIbehaviorScriptExecutionContext, category: CName, message: String),
	},
	properties: {
	}
}