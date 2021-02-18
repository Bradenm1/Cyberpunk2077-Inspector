function Inspector.DrawgameAttitudeAgent(self, gameAttitudeAgent)
	ImGui.Indent()

	-- Functions
	self:DrawWindowCName("GetAttitudeGroup", gameAttitudeAgent:GetAttitudeGroup())
	
	BradenMenu.IGE.DrawNodeTree("GetPS", "gameComponentPS", gameAttitudeAgent:GetPS(), 
		function(ps) self:DrawgameAttitudeAgentPS(ps) end
	)
	
	BradenMenu.IGE.DrawNodeTree("GetBasePS", "gameComponentPS", gameAttitudeAgent:GetBasePS(), 
		function(basePS) self:DrawgameAttitudeAgentPS(basePS) end
	)

	BradenMenu.IGE.DrawNodeTree("GetPersistentID", "gamePersistentID", gameAttitudeAgent:GetPersistentID(), 
		function(presistentID) self:DrawgamePersistentID(presistentID) end
	)

	BradenMenu.IGE.DrawNodeTree("GetEntity", "entEntity", gameAttitudeAgent:GetEntity(), 
		function(entity) self:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	self:DrawWindowCName("GetName", gameAttitudeAgent:GetName())
	self:DrawWindowCName("GetClassName", gameAttitudeAgent:GetClassName())

	-- Properties
	self:DrawWindowCName("baseAttitudeGroup", gameAttitudeAgent.baseAttitudeGroup)
	self:DrawWindowCName("name", gameAttitudeAgent.name)
	BradenMenu.IGE.ObjectToText("presistentState: ", gameAttitudeAgent.presistentState)
	BradenMenu.IGE.ObjectToText("isReplicable", gameAttitudeAgent.isReplicable)
	BradenMenu.IGE.ObjectToText("id", gameAttitudeAgent.id)
	BradenMenu.IGE.ObjectToText("ToString", gameAttitudeAgent.ToString)

	ImGui.Unindent()
end