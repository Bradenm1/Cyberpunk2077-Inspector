{
	name: WorldTransform,
	functions: {
	},
	staticFunctions: {
		SetIdentity(xform: WorldTransform) # Hash:(38457a11315647cd) / ShortName:(SetIdentity) Hash:(38457a11315647cd),
		SetWorldPosition(xform: WorldTransform, value: WorldPosition) # Hash:(f20ad32d074a5dde) / ShortName:(SetWorldPosition) Hash:(f20ad32d074a5dde),
		SetPosition(xform: WorldTransform, value: Vector4) # Hash:(e0c70502fff5e250) / ShortName:(SetPosition) Hash:(e0c70502fff5e250),
		SetOrientation(xform: WorldTransform, value: Quaternion) # Hash:(e76a461c82b12437) / ShortName:(SetOrientation) Hash:(e76a461c82b12437),
		SetOrientationEuler(xform: WorldTransform, value: EulerAngles) # Hash:(98b5cfb97de85384) / ShortName:(SetOrientationEuler) Hash:(98b5cfb97de85384),
		SetOrientationFromDir(xform: WorldTransform, value: Vector4) # Hash:(3774d3a46764b32a) / ShortName:(SetOrientationFromDir) Hash:(3774d3a46764b32a),
		TransformXForm(xform: WorldTransform, value: Transform) => (WorldTransform) # Hash:(b7c0633109df9503) / ShortName:(TransformXForm) Hash:(b7c0633109df9503),
		TransformWorldXForm(xform: WorldTransform, value: WorldTransform) => (WorldTransform) # Hash:(4737fa8a099e60b9) / ShortName:(TransformWorldXForm) Hash:(4737fa8a099e60b9),
		TransformPoint(xform: WorldTransform, value: Vector4) => (WorldPosition) # Hash:(99a018f542af34e3) / ShortName:(TransformPoint) Hash:(99a018f542af34e3),
		TransformWorldPosition(xform: WorldTransform, value: WorldPosition) => (WorldPosition) # Hash:(298b193a01f597d6) / ShortName:(TransformWorldPosition) Hash:(298b193a01f597d6),
		TransformInvWorldXForm(xform: WorldTransform, value: WorldTransform) => (Transform) # Hash:(77f8ba917d65b10c) / ShortName:(TransformInvWorldXForm) Hash:(77f8ba917d65b10c),
		TransformInvXForm(xform: WorldTransform, value: Transform) => (Transform) # Hash:(9310d4e418ce47b0) / ShortName:(TransformInvXForm) Hash:(9310d4e418ce47b0),
		TransformInvPoint(xform: WorldTransform, value: Vector4) => (Vector4) # Hash:(540c61f2b9dac68c) / ShortName:(TransformInvPoint) Hash:(540c61f2b9dac68c),
		TransformInvWorldPosition(xform: WorldTransform, value: WorldPosition) => (Vector4) # Hash:(ea62bc3f20afd4f1) / ShortName:(TransformInvWorldPosition) Hash:(ea62bc3f20afd4f1),
		GetWorldPosition(xform: WorldTransform) => (WorldPosition) # Hash:(ff79884a8bff0f4a) / ShortName:(GetWorldPosition) Hash:(ff79884a8bff0f4a),
		GetOrientation(xform: WorldTransform) => (Quaternion) # Hash:(9980e09cf470f8cb) / ShortName:(GetOrientation) Hash:(9980e09cf470f8cb),
		GetInverse(xform: WorldTransform) => (WorldTransform) # Hash:(47734018988dc751) / ShortName:(GetInverse) Hash:(47734018988dc751),
		GetForward(xform: WorldTransform) => (Vector4) # Hash:(690707c181eef964) / ShortName:(GetForward) Hash:(690707c181eef964),
		GetRight(xform: WorldTransform) => (Vector4) # Hash:(2077f48acb0842d3) / ShortName:(GetRight) Hash:(2077f48acb0842d3),
		GetUp(xform: WorldTransform) => (Vector4) # Hash:(b4955e00b3c7b462) / ShortName:(GetUp) Hash:(b4955e00b3c7b462),
		ToMatrix(xform: WorldTransform) => (Matrix) # Hash:(16f28396b17b873d) / ShortName:(ToMatrix) Hash:(16f28396b17b873d),
		_ToXForm(xform: WorldTransform) => (Transform) # Hash:(81658c35a49a5abb) / ShortName:(_ToXForm) Hash:(81658c35a49a5abb),
	},
	properties: {
		Position: WorldPosition,
		Orientation: Quaternion,
	}
}