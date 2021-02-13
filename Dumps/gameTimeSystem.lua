{
	name: gameTimeSystem,
	functions: {
		SetTimeDilation(reason: CName, dilation: Float, duration: Float, easeInCurve: CName, easeOutCurve: CName, listener: handle:tickScriptTimeDilationListener),
		UnsetTimeDilation(reason: CName, easeOutCurve: CName),
		SetIgnoreTimeDilationOnLocalPlayerZero(ignore: Bool),
		SetTimeDilationOnLocalPlayerZero(reason: CName, dilation: Float, duration: Float, easeInCurve: CName, easeOutCurve: CName, ignore: Bool),
		UnsetTimeDilationOnLocalPlayerZero(easeOutCurve: CName),
		IsTimeDilationActive(reason: CName) => (Bool),
		SetGameTimeBySeconds(seconds: Int32),
		SetGameTimeByHMS(hours: Int32, minutes: Int32, seconds: Int32),
		SetGameTime(),
		GetGameTime() => (GameTime),
		GetSimTime() => (EngineTime),
		GetGameTimeStamp() => (Float),
		SetPausedState(paused: Bool, source: CName),
		IsPausedState() => (Bool),
		RegisterListener(entity: whandle:entEntity, eventToDelay: handle:redEvent, expectedTime: GameTime, repeat: Int32, sendOldNoifications: Bool) => (Uint32),
		RegisterDelayedListener(entity: whandle:entEntity, eventToDelay: handle:redEvent, delay: GameTime, repeat: Int32, sendOldNoifications: Bool) => (Uint32),
		RegisterIntervalListener(entity: whandle:entEntity, eventToDelay: handle:redEvent, expectedHour: GameTime, timeout: GameTime, repeat: Int32) => (Uint32),
		UnregisterListener(listenerID: Uint32),
		RealTimeSecondsToGameTime(seconds: Float) => (GameTime),
		RegisterScriptableSystemIntervalListener(systemName: CName, requestToDelay: handle:gameScriptableSystemRequest, expectedHour: GameTime, timeout: GameTime, repeat: Int32) => (Uint32),
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