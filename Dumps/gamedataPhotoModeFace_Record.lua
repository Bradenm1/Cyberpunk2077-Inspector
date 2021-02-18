{
	name: gamedataPhotoModeFace_Record,
	functions: {
		FaceId() => (Int32),
		DisplayName() => (CName),
		Locked() => (Bool),
		GetID() => (TweakDBID),
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