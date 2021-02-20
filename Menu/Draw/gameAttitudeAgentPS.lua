local gameAttitudeAgentPS = {}

function gameAttitudeAgentPS:Draw(gameAttitudeAgentPS)
	ImGui.Indent()

	-- Functons
	BradenMenu.IGE.DrawNodeTree("GetID", "PersistentID", gameAttitudeAgentPS:GetID(), 
		function(id) BradenMenu.gamePersistentID:Draw(id) end
	)

	BradenMenu.IGE.ObjectToText("GetPersistencySystem", gameAttitudeAgentPS:GetPersistencySystem()) -- handle:gamePersistencySystem
	BradenMenu.IGE.ObjectToText("GetGameInstance", gameAttitudeAgentPS:GetGameInstance()) -- ScriptGameInstance
	BradenMenu.IGE.ObjectToText("ToString", gameAttitudeAgentPS:ToString())
	BradenMenu.CName:Draw("GetClassName", gameAttitudeAgentPS:GetClassName())

	-- Properties
	BradenMenu.CName:Draw("currentAttitudeGroup", gameAttitudeAgentPS.currentAttitudeGroup)

	ImGui.Unindent()
end

return gameAttitudeAgentPS