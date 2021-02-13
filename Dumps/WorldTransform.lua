{
	name: WorldTransform,
	functions: {
	},
	staticFunctions: {
		SetIdentity(xform: WorldTransform),
		SetWorldPosition(xform: WorldTransform, value: WorldPosition),
		SetPosition(xform: WorldTransform, value: Vector4),
		SetOrientation(xform: WorldTransform, value: Quaternion),
		SetOrientationEuler(xform: WorldTransform, value: EulerAngles),
		SetOrientationFromDir(xform: WorldTransform, value: Vector4),
		TransformXForm(xform: WorldTransform, value: Transform) => (WorldTransform),
		TransformWorldXForm(xform: WorldTransform, value: WorldTransform) => (WorldTransform),
		TransformPoint(xform: WorldTransform, value: Vector4) => (WorldPosition),
		TransformWorldPosition(xform: WorldTransform, value: WorldPosition) => (WorldPosition),
		TransformInvWorldXForm(xform: WorldTransform, value: WorldTransform) => (Transform),
		TransformInvXForm(xform: WorldTransform, value: Transform) => (Transform),
		TransformInvPoint(xform: WorldTransform, value: Vector4) => (Vector4),
		TransformInvWorldPosition(xform: WorldTransform, value: WorldPosition) => (Vector4),
		GetWorldPosition(xform: WorldTransform) => (WorldPosition),
		GetOrientation(xform: WorldTransform) => (Quaternion),
		GetInverse(xform: WorldTransform) => (WorldTransform),
		GetForward(xform: WorldTransform) => (Vector4),
		GetRight(xform: WorldTransform) => (Vector4),
		GetUp(xform: WorldTransform) => (Vector4),
		ToMatrix(xform: WorldTransform) => (Matrix),
		_ToXForm(xform: WorldTransform) => (Transform),
	},
	properties: {
		Position: WorldPosition,
		Orientation: Quaternion,
	}
}