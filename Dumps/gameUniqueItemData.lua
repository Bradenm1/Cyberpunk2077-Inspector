{
	name: gameUniqueItemData,
	functions: {
		GetID() => (gameItemID),
		GetName() => (CName),
		GetNameAsString() => (String),
		GetQuantity() => (Int32),
		HasAttachmentSlot(slotID: TweakDBID) => (Bool),
		HasPlacementSlot(slotID: TweakDBID) => (Bool),
		HasTag(tag: CName) => (Bool),
		SetDynamicTag(tag: CName) => (Bool),
		RemoveDynamicTag(tag: CName) => (Bool),
		GetTimestamp() => (GameTime),
		HasStatData(type: gamedataStatType) => (Bool),
		GetStatValueByType(type: gamedataStatType) => (Float),
		GetStatsObjectID() => (gameStatsObjectID),
		HasPartInSlot(slotID: TweakDBID) => (Bool),
		GetItemPart(slotId: TweakDBID) => (part: gameInnerItemData),
		GetItemParts() => (parts: array:gameInnerItemData),
		GetTemporaryStatBundle() => (handle:gameStatsBundleHandler),
		GetItemType() => (gamedataItemType),
		GetLocalizedItemType() => (CName),
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