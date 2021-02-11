{
	name: WorldPosition,
	functions: {
	},
	staticFunctions: {
		SetX(worldPosition: WorldPosition, value: Float),
		SetY(worldPosition: WorldPosition, value: Float),
		SetZ(worldPosition: WorldPosition, value: Float),
		SetXYZ(worldPosition: WorldPosition, x: Float, y: Float, z: Float),
		SetVector4(worldPosition: WorldPosition, value: Vector4),
		GetX(worldPosition: WorldPosition) => (Float),
		GetY(worldPosition: WorldPosition) => (Float),
		GetZ(worldPosition: WorldPosition) => (Float),
		ToVector4(worldPosition: WorldPosition) => (Vector4),
	},
	properties: {
		x: FixedPoint,
		y: FixedPoint,
		z: FixedPoint,
	}
}