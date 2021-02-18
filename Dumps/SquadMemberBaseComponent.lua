{
	name: SquadMemberBaseComponent,
	functions: {
		OnGameAttach(),
		OnSquadActionSignalReceived(signal: handle:SquadActionSignal),
		OnSquadActionEvent(evt: handle:SquadActionEvent) => (Bool),
		PerformSquadVerb(squadActionName: CName, squadVerb: EAISquadVerb),
		GetSquadInterface() => (Bool, interface: whandle:AISquadScriptInterface),
		GetTicketType(actionName: CName, entity: handle:entEntity, squadInterface: whandle:AISquadScriptInterface) => (Bool, ticketRecord: handle:gamedataAITicket_Record),
		GetSquadRecord(entity: whandle:entEntity, squadInterface: whandle:AISquadScriptInterface) => (Bool, squadRecord: whandle:gamedataAISquadParams_Record),
		MySquad(sqtype: AISquadType) => (handle:AISquadScriptInterface),
		MySquadName(sqtype: AISquadType) => (CName),
		MySquadNameCurrentOrRecent(sqtype: AISquadType) => (CName),
		MySquads() => (array:handle:AISquadScriptInterface),
		MySquadsNames() => (array:CName),
		MySquadsNamesCurrentOrRecent() => (array:CName),
		FindSquad(sqName: CName) => (handle:AISquadScriptInterface),
		GetGameTime() => (Float),
		GetPS() => (handle:gameComponentPS),
		GetBasePS() => (handle:gameComponentPS),
		GetPersistentID() => (gamePersistentID),
		GetEntity() => (whandle:entEntity),
		FindComponentByName(componentName: CName) => (whandle:entIComponent),
		GetName() => (CName),
		IsEnabled() => (Bool),
		Toggle(on: Bool),
		QueueEntityEvent(ev: handle:redEvent),
		RegisterRenderDebug(filterName: String, functionName: CName),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
		baseSquadRecord: whandle:gamedataAISquadParams_Record,
		persistentState: handle:gamePersistentState,
		name: CName,
		isReplicable: Bool,
		id: CRUID,
	}
}