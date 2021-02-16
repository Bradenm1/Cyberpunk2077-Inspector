{
	name: AnimationSystemForcedVisibilityManager,
	functions: {
		ClearEntity(id: entEntityID),
		ToggleForcedVisibilityInAnimSystem(entityID: entEntityID, sourceName: CName, isVisible: Bool, transitionTime: Float, forcedVisibleOnlyInFrustum: Bool),
		SendDelayedRequestForVisilityData(entityID: entEntityID, isVisible: Bool, transitionTime: Float, data: handle:ForcedVisibilityInAnimSystemData),
		CancelDelayedRequestForVisilityData(data: handle:ForcedVisibilityInAnimSystemData),
		ResovleVisibilityInAnimSystem(entityData: handle:AnimationSystemForcedVisibilityEntityData),
		GetEntityData(id: entEntityID) => (handle:AnimationSystemForcedVisibilityEntityData),
		IsEntityRegistered(id: entEntityID) => (Bool),
		OnToggleVisibilityInAnimSystemRequest(request: handle:ToggleVisibilityInAnimSystemRequest),
		OnClearVisibilityInAnimSystemRequest(request: handle:ClearVisibilityInAnimSystemRequest),
		OnHandleDelayedVisibilityInAnimSystemRequest(request: handle:DelayedVisibilityInAnimSystemRequest),
		HasVisibilityForced(id: entEntityID) => (Bool),
		QueueRequest(request: handle:gameScriptableSystemRequest),
		GetGameInstance() => (ScriptGameInstance),
		WasRestored() => (Bool),
		OnAttach(),
		OnDetach(),
		OnRestored(saveVersion: Int32, gameVersion: Int32),
		IsSavingLocked() => (Bool),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		entities: array:handle:AnimationSystemForcedVisibilityEntityData,
	}
}