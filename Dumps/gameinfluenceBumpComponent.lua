{
	name: gameinfluenceBumpComponent,
	functions: {
		SetBumpPolicy(policy: AIinfluenceEBumpPolicy),
		OnAttach(),
		ToggleComponentOn(),
		GetLocalToWorld() => (Matrix),
		GetInitialPosition() => (Vector4),
		GetInitialOrientation() => (Quaternion),
		GetInitialTransform() => (Matrix),
		GetLocalPosition() => (Vector4),
		GetLocalOrientation() => (Quaternion),
		GetLocalTransform() => (Matrix),
		SetLocalPosition(pos: Vector4),
		SetLocalOrientation(rot: Quaternion),
		SetLocalTransform(pos: Vector4, rot: Quaternion),
		GetTransformParent(),
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
		isPlayerControlled: Bool,
		movementSpreadDistance: Float,
		movementSpreadRadius: Float,
		distanceToReactBack: Float,
		distanceToReactFront: Float,
		reactionSettings: array:gameinfluenceBumpReactionSetting,
		autoPlayBumpAnimation: Bool,
		isEnabled: Bool,
		isBumpable: Bool,
		localTransform: WorldTransform,
		parentTransform: handle:entITransformBinding,
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}