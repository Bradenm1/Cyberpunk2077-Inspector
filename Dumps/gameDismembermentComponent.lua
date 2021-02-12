{
	name: gameDismembermentComponent,
	functions: {
		DoDismemberment(bodyPart: gameDismBodyPart, woundType: gameDismWoundType, strength: Float, isCritical: Bool, debrisPath: String, debrisStrength: Float),
		SpawnGutsFromLastHit(resourcePath: String, strength: Float),
		ReportExplosion(hitPosition: Vector4, strength: Float),
		GetDismemberedLimbCount() => (gameDismemberedLimbCount),
		OnDismemberment(evt: handle:DismembermentEvent) => (Bool),
		OnDismembermentExplosion(evt: handle:DismembermentExplosionEvent) => (Bool),
		OnDismembermentDebris(evt: handle:DismembermentDebrisEvent) => (Bool),
		GetEntity() => (whandle:entEntity),
		FindComponentByName(componentName: CName) => (whandle:entIComponent),
		GetName() => (CName),
		IsEnabled() => (Bool),
		Toggle(on: Bool),
		QueueEntityEvent(ev: handle:redEvent),
		RegisterRenderDebug(filterName: String, functionName: CName),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}