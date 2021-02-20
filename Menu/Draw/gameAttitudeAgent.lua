local gameAttitudeAgent = {}

function gameAttitudeAgent:Draw(gameAttitudeAgent)
	ImGui.Indent()

	-- Functions
	BradenMenu.CName:Draw("GetAttitudeGroup", gameAttitudeAgent:GetAttitudeGroup())
	BradenMenu.IGE.DrawNodeTree("GetPS", "gameComponentPS", gameAttitudeAgent:GetPS(), 
		function(ps) BradenMenu.gameAttitudeAgentPS:Draw(ps) end
	)
	
	BradenMenu.IGE.DrawNodeTree("GetBasePS", "gameComponentPS", gameAttitudeAgent:GetBasePS(), 
		function(basePS) BradenMenu.gameAttitudeAgentPS:Draw(basePS) end
	)

	BradenMenu.IGE.DrawNodeTree("GetPersistentID", "gamePersistentID", gameAttitudeAgent:GetPersistentID(), 
		function(presistentID) BradenMenu.gamePersistentID:Draw(presistentID) end
	)

	BradenMenu.IGE.DrawNodeTree("GetEntity", "entEntity", gameAttitudeAgent:GetEntity(), 
		function(entity) BradenMenu.EntityInspect:Draw(entity) end
	)

	BradenMenu.CName:Draw("GetName", gameAttitudeAgent:GetName())
	BradenMenu.CName:Draw("GetClassName", gameAttitudeAgent:GetClassName())

	-- Properties
	BradenMenu.CName:Draw("baseAttitudeGroup", gameAttitudeAgent.baseAttitudeGroup)
	BradenMenu.CName:Draw("name", gameAttitudeAgent.name)
	BradenMenu.IGE.ObjectToText("presistentState: ", gameAttitudeAgent.presistentState)
	BradenMenu.IGE.ObjectToText("isReplicable", gameAttitudeAgent.isReplicable)
	BradenMenu.IGE.ObjectToText("id", gameAttitudeAgent.id)
	BradenMenu.IGE.ObjectToText("ToString", gameAttitudeAgent.ToString)

	ImGui.Unindent()
end

return gameAttitudeAgent