{
	name: gamedataNPCEquipmentItem_Record,
	functions: {
		OnBodySlot() => (whandle:gamedataAttachmentSlot_Record),
		Item() => (whandle:gamedataItem_Record),
		EquipSlot() => (whandle:gamedataAttachmentSlot_Record),
		EquipCondition() => (outList: array:whandle:gamedataAIActionCondition_Record),
		GetEquipConditionCount() => (Int32),
		GetEquipConditionItem(index: Int32) => (whandle:gamedataAIActionCondition_Record),
		EquipConditionContains(item: whandle:gamedataAIActionCondition_Record) => (Bool),
		UnequipCondition() => (outList: array:whandle:gamedataAIActionCondition_Record),
		GetUnequipConditionCount() => (Int32),
		GetUnequipConditionItem(index: Int32) => (whandle:gamedataAIActionCondition_Record),
		UnequipConditionContains(item: whandle:gamedataAIActionCondition_Record) => (Bool),
		GetID() => (TweakDBID),
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