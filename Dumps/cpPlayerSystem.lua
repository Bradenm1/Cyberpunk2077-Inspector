{
	name: cpPlayerSystem,
	functions: {
		GetLocalPlayerMainGameObject() => (handle:gameObject),
		GetLocalPlayerControlledGameObject() => (handle:gameObject),
		LocalPlayerControlExistingObject(entityID: entEntityID),
		RegisterPlayerPuppetAttachedCallback(object: handle:IScriptable, func: CName) => (Uint32),
		UnregisterPlayerPuppetAttachedCallback(callbackID: Uint32),
		RegisterPlayerPuppetDetachedCallback(object: handle:IScriptable, func: CName) => (Uint32),
		UnregisterPlayerPuppetDetachedCallback(callbackID: Uint32),
		IsInFreeCamera() => (Bool),
		SetFreeCameraTransform(newTransform: Transform),
		IsCPOControlSchemeForced() => (Bool),
		FindPlayerControlledObjects(position: Vector4, radius: Float, includeLocalPlayers: Bool, includeRemotePlayers: Bool) => (Uint32, outPlayerGameObjects: array:handle:gameObject),
		GetPossessedByJohnnyFactName() => (String),
		OnGameRestored(game: ScriptGameInstance) => (Bool),
		OnLocalPlayerChanged(controlledObject: whandle:gameObject) => (Bool),
		OnLocalPlayerPossesionChanged(playerPossesion: gamedataPlayerPossesion) => (Bool),
		PlayerEnteredCombat(playerEnteredCombat: Bool),
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