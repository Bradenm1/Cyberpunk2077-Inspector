{
	name: gamePersistencySystem,
	functions: {
		QueueEntityEvent(targetEntity: entEntityID, evt: handle:redEvent),
		QueuePSEvent(targetID: gamePersistentID, psClassName: CName, evt: handle:redEvent),
		GetConstAccessToPSObject(targetID: gamePersistentID, psClassName: CName) => (handle:gamePersistentState),
		ForgetObject(targetID: gamePersistentID, notifyEntity: Bool),
		QueuePSDeviceEvent(action: handle:gamedeviceAction),
		GetPersistentBool(targetEntity: gamePersistentID, psClassName: CName, varName: CName) => (Bool),
		GetPersistentInt(targetEntity: gamePersistentID, psClassName: CName, varName: CName) => (Int32),
		GetPersistentFloat(targetEntity: gamePersistentID, psClassName: CName, varName: CName) => (Float),
		SetPersistentBool(targetEntity: gamePersistentID, psClassName: CName, varName: CName, newValue: Bool),
		SetPersistentInt(targetEntity: gamePersistentID, psClassName: CName, varName: CName, newValue: Int32),
		SetPersistentFloat(targetEntity: gamePersistentID, psClassName: CName, varName: CName, newValue: Float),
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