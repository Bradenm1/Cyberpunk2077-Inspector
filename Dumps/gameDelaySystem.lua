{
	name: gameDelaySystem,
	functions: {
		DelayEvent(entity: whandle:entEntity, eventToDelay: handle:redEvent, timeToDelay: Float, isAffectedByTimeDilation: Bool) => (gameDelayID),
		DelayCallback(delayCallback: handle:gameDelaySystemScriptedDelayCallbackWrapper, timeToDelay: Float, isAffectedByTimeDilation: Bool) => (gameDelayID),
		DelayPSEvent(psID: gamePersistentID, classType: CName, eventToDelay: handle:redEvent, timeToDelay: Float, isAffectedByTimeDilation: Bool) => (gameDelayID),
		DelayScriptableSystemRequest(systemName: CName, requestToDelay: handle:gameScriptableSystemRequest, timeToDelay: Float, isAffectedByTimeDilation: Bool) => (gameDelayID),
		CancelDelay(delayID: gameDelayID),
		CancelCallback(delayID: gameDelayID),
		DelayEventNextFrame(entity: whandle:entEntity, eventToDelay: handle:redEvent),
		DelayCallbackNextFrame(delayCallback: handle:gameDelaySystemScriptedDelayCallbackWrapper),
		DelayPSEventNextFrame(psID: gamePersistentID, classType: CName, eventToDelay: handle:redEvent),
		DelayScriptableSystemRequestNextFrame(systemName: CName, requestToDelay: handle:gameScriptableSystemRequest),
		TickOnEvent(entity: whandle:entEntity, eventToTick: handle:gameTickableEvent, duration: Float) => (gameDelayID),
		CancelTick(delayID: gameDelayID),
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