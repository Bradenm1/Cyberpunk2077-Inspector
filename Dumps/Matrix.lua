{
	name: Matrix,
	functions: {
	},
	staticFunctions: {
		Identity() => (Matrix),
		BuiltTranslation(move: Vector4) => (Matrix),
		BuiltRotation(rot: EulerAngles) => (Matrix),
		BuiltScale(scale: Vector4) => (Matrix),
		BuiltPreScale(scale: Vector4) => (Matrix),
		BuiltTRS(translation: Vector4, rotation: EulerAngles, scale: Vector4) => (Matrix),
		BuiltRTS(rotation: EulerAngles, translation: Vector4, scale: Vector4) => (Matrix),
		BuildFromDirectionVector(dirVec: Vector4, upVec: Vector4) => (Matrix),
		GetTranslation(m: Matrix) => (Vector4),
		GetRotation(m: Matrix) => (EulerAngles),
		GetScale(m: Matrix) => (Vector4),
		GetAxisX(m: Matrix) => (Vector4),
		GetAxisY(m: Matrix) => (Vector4),
		GetAxisZ(m: Matrix) => (Vector4),
		GetDirectionVector(m: Matrix) => (Vector4),
		GetInverted(m: Matrix) => (Matrix),
		GetInvertedFull(m: Matrix) => (Matrix),
		ToQuat(m: Matrix) => (Quaternion),
		IsOk(m: Matrix) => (Bool),
	},
	properties: {
		X: Vector4,
		Y: Vector4,
		Z: Vector4,
		W: Vector4,
	}
}