{
	name: gamedataGenderEntity_Record,
	functions: {
		Gender() => (whandle:gamedataGender_Record),
		MultiplayerEntities() => (array:redResourceReferenceScriptToken),
		GetMultiplayerEntitiesCount() => (Int32),
		GetMultiplayerEntitiesItem(index: Int32) => (redResourceReferenceScriptToken),
		Entity() => (redResourceReferenceScriptToken),
		Initial() => (Bool),
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