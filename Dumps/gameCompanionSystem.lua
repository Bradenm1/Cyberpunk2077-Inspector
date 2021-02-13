{
	name: gameCompanionSystem,
	functions: {
		GetSpawnedEntities(recordID: TweakDBID) => (entities: array:whandle:entEntity),
		DespawnAll(),
		DespawnSubcharacter(recordID: TweakDBID),
		SpawnSubcharacter(recordID: TweakDBID, offset: Float, offsetDir: Vector3),
		SpawnSubcharacterOnPosition(recordID: TweakDBID, pos: Vector3),
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