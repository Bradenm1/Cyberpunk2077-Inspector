function Inspector.DrawgameAttitudeAgent(self, gameAttitudeAgent)
	ImGui.Indent()

	-- Functions
	self:DrawWindowCName("GetAttitudeGroup", gameAttitudeAgent:GetAttitudeGroup())
	
	self:DrawNodeTree("GetPS", "gameComponentPS", gameAttitudeAgent:GetPS(), 
		function(ps) self:DrawgameAttitudeAgentPS(ps) end
	)
	
	self:DrawNodeTree("GetBasePS", "gameComponentPS", gameAttitudeAgent:GetBasePS(), 
		function(basePS) self:DrawgameAttitudeAgentPS(basePS) end
	)

	self:DrawNodeTree("GetPersistentID", "gamePersistentID", gameAttitudeAgent:GetPersistentID(), 
		function(presistentID) self:DrawgamePersistentID(presistentID) end
	)

	self:DrawNodeTree("GetEntity", "entEntity", gameAttitudeAgent:GetEntity(), 
		function(entity) self:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	self:DrawWindowCName("GetName", gameAttitudeAgent:GetName())
	self:DrawWindowCName("GetClassName", gameAttitudeAgent:GetClassName())

	-- Properties
	self:DrawWindowCName("baseAttitudeGroup", gameAttitudeAgent.baseAttitudeGroup)
	self:ObjectToText("presistentState: ", gameAttitudeAgent.presistentState)
	self:DrawWindowCName("name", gameAttitudeAgent.name)
	self:ObjectToText("isReplicable", gameAttitudeAgent.isReplicable)
	self:ObjectToText("id", gameAttitudeAgent.id)
	self:ObjectToText("ToString", gameAttitudeAgent.ToString)

	ImGui.Unindent()
end