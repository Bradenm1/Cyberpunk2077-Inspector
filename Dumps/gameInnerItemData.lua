{
	name: gameInnerItemData,
	functions: {
	},
	staticFunctions: {
		GetItemID(innerItemData: gameInnerItemData) => (gameItemID),
		GetSlotID(innerItemData: gameInnerItemData) => (TweakDBID),
		GetStaticData(innerItemData: gameInnerItemData) => (handle:gamedataItem_Record),
		HasStatData(innerItemData: gameInnerItemData, type: gamedataStatType) => (Bool),
		GetStatValueByType(innerItemData: gameInnerItemData, type: gamedataStatType) => (Float),
	},
	properties: {
	}
}