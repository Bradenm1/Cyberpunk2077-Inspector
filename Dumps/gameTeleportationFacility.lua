{
	name: gameTeleportationFacility,
	functions: {
		Teleport(objectToTeleport: handle:gameObject, position: Vector4, orientation: EulerAngles),
		TeleportToNode(objectToTeleport: handle:gameObject, nodeRef: NodeRef),
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