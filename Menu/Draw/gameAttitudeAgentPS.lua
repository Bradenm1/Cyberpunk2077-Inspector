function Inspector.DrawgameAttitudeAgentPS(self, gameAttitudeAgentPS)
	ImGui.Indent()

	-- Functons
	self:DrawNodeTree("GetID", "PersistentID", gameAttitudeAgentPS:GetID(), 
		function(id) self:DrawgamePersistentID(id) end
	)

	self:ObjectToText("GetPersistencySystem", gameAttitudeAgentPS:GetPersistencySystem()) -- handle:gamePersistencySystem
	self:ObjectToText("GetGameInstance", gameAttitudeAgentPS:GetGameInstance()) -- ScriptGameInstance
	self:ObjectToText("ToString", gameAttitudeAgentPS:ToString())
	self:DrawWindowCName("GetClassName", gameAttitudeAgentPS:GetClassName())

	-- Properties
	self:DrawWindowCName("currentAttitudeGroup", gameAttitudeAgentPS.currentAttitudeGroup)

	ImGui.Unindent()
end