{
	name: worldWeatherScriptInterface,
	functions: {
		RegisterWeatherListener(callback: handle:worldWeatherScriptListener) => (Uint32),
		UnregisterWeatherListener(callbackId: Uint32),
		GetRainMoisture() => (Float),
		GetRainPuddles() => (Float),
		GetRainIntensity() => (Float),
		GetRainIntensityType() => (worldRainIntensity),
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