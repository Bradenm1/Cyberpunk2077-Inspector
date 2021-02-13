{
	name: EulerAngles,
	functions: {
	},
	staticFunctions: {
		GetXAxis(rotation: EulerAngles) => (Vector4),
		GetYAxis(rotation: EulerAngles) => (Vector4),
		GetZAxis(rotation: EulerAngles) => (Vector4),
		GetForward(rotation: EulerAngles) => (Vector4),
		GetRight(rotation: EulerAngles) => (Vector4),
		GetUp(rotation: EulerAngles) => (Vector4),
		ToMatrix(rotation: EulerAngles) => (Matrix),
		ToQuat(rotation: EulerAngles) => (Quaternion),
		GetAxes(rotation: EulerAngles) => (forward: Vector4, right: Vector4, up: Vector4),
		Rand(min: Float, max: Float) => (EulerAngles),
		Dot(a: EulerAngles, b: EulerAngles) => (Float),
		AlmostEqual(a: EulerAngles, b: EulerAngles, epsilon: Float) => (Bool),
	},
	properties: {
		Pitch: Float,
		Yaw: Float,
		Roll: Float,
	}
}