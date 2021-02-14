{
	name: gameItemID,
	functions: {
	},
	staticFunctions: {
		IsValid(itemID: gameItemID) => (Bool),
		None() => (gameItemID),
		FromTDBID(tdbID: TweakDBID) => (gameItemID),
		GetTDBID(itemID: gameItemID) => (TweakDBID),
		CreateQuery(tdbID: TweakDBID) => (gameItemID),
		IsOfTDBID(itemID: gameItemID, tdbID: TweakDBID) => (Bool),
		IsQuery(itemID: gameItemID) => (Bool),
		GetStructure(itemID: gameItemID) => (gamedataItemStructure),
	},
	properties: {
		id: TweakDBID,
		rngSeed: Uint32,
		uniqueCounter: Uint16,
	}
}