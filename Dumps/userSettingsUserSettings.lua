{
	name: userSettingsUserSettings,
	functions: {
		HasGroup(groupPath: CName) => (Bool),
		HasVar(groupPath: CName, varName: CName) => (Bool),
		GetRootGroup() => (handle:userSettingsGroup),
		GetGroup(groupPath: CName) => (handle:userSettingsGroup),
		GetVar(groupPath: CName, varName: CName) => (handle:userSettingsVar),
		NeedsConfirmation() => (Bool),
		ConfirmChanges(),
		RejectChanges(),
		NeedsRestartToApply() => (Bool),
		NeedsLoadLastCheckpoint() => (Bool),
		WasModifiedSinceLastSave() => (Bool),
		RequestNeedsRestartDialog(),
		RequestConfirmationDialog(),
		RequestLoadLastCheckpointDialog(),
		RequestRestoreDefaultDialog(isPreGame: Bool, onlyVisible: Bool, groupPath: CName),
		GetUserSettingsLoadStatus() => (InGameConfigUserSettingsLoadStatus),
		RestoreVarToDefault(groupPath: CName, varName: CName),
		GetMenuIndex() => (Int32),
		SetMenuIndex(index: Int32),
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