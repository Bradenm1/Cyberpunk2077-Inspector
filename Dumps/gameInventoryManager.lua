{
	name: gameInventoryManager,
	functions: {
		AddToSlot(slotIdx: Uint8, itemID: gameItemID),
		ClearSlot(slotIdx: Uint8),
		AddEquipmentStateFlag(equipmentFlag: gameEEquipmentManagerState),
		RemoveEquipmentStateFlag(equipmentFlag: gameEEquipmentManagerState),
		HasEquipmentStateFlag(equipmentFlag: gameEEquipmentManagerState) => (Bool),
		CreateItemData(itemID: gameItemID, owner: whandle:gameObject) => (handle:gameItemData),
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