{
	name: gameVehicleSystem,
	functions: {
		SpawnPlayerVehicle(vehicleType: gamedataVehicleType),
		ToggleSummonMode(),
		DespawnPlayerVehicle(vehicleID: vehicleGarageVehicleID),
		EnablePlayerVehicle(vehicle: String, enable: Bool, despawnIfDisabling: Bool) => (Bool),
		EnableAllPlayerVehicles(),
		GetPlayerVehicles() => (vehicles: array:vehiclePlayerVehicle),
		GetPlayerUnlockedVehicles() => (unlockedVehicles: array:vehiclePlayerVehicle),
		TogglePlayerActiveVehicle(vehicleID: vehicleGarageVehicleID, vehicleType: gamedataVehicleType, enable: Bool),
		EnablePlayerVehicleCollision(enable: Bool),
		GetVehicleRestrictions() => (array:CName),
		OnVehicleSystemAttach(),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		restrictionTags: array:CName,
	}
}