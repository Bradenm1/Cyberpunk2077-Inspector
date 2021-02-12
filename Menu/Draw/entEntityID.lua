function Inspector.DrawentEntityID(entEntityID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("hash: " .. tostring(entEntityID.hash))

	ImGui.Unindent()
end