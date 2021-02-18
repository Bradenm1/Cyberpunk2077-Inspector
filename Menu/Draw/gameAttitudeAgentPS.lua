function Inspector.DrawgameAttitudeAgentPS(self, gameAttitudeAgentPS)
	ImGui.Indent()

	-- Functons
	BradenMenu.IGE.DrawNodeTree("GetID", "PersistentID", gameAttitudeAgentPS:GetID(), 
		function(id) self:DrawgamePersistentID(id) end
	)

	BradenMenu.IGE.ObjectToText("GetPersistencySystem", gameAttitudeAgentPS:GetPersistencySystem()) -- handle:gamePersistencySystem
	BradenMenu.IGE.ObjectToText("GetGameInstance", gameAttitudeAgentPS:GetGameInstance()) -- ScriptGameInstance
	BradenMenu.IGE.ObjectToText("ToString", gameAttitudeAgentPS:ToString())
	self:DrawWindowCName("GetClassName", gameAttitudeAgentPS:GetClassName())

	-- Properties
	self:DrawWindowCName("currentAttitudeGroup", gameAttitudeAgentPS.currentAttitudeGroup)

	ImGui.Unindent()
end