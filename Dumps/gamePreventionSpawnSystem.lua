{
	name: gamePreventionSpawnSystem,
	functions: {
		RequestSpawn(recordID: TweakDBID, preventionLevel: Uint32, spawnTransform: WorldTransform) => (entEntityID),
		RequestDespawn(entityID: entEntityID),
		RequestDespawnPreventionLevel(preventionLevel: Uint32),
		GetNumberOfSpawnedPreventionUnits() => (Int32),
		SpawnCallback(spawnedObject: handle:gameObject),
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