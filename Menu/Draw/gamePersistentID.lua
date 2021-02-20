local gamePersistentID = {}

function gamePersistentID:Draw(gamePersistentID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("entityHash: " .. tostring(gamePersistentID.entityHash))
	ImGui.Text("componentName: " .. tostring(gamePersistentID.componentName))

	ImGui.Unindent()
end

return gamePersistentID