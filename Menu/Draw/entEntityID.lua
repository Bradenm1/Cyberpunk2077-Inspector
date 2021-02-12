function Inspector.DrawentEntityID(self, entEntityID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("hash: " .. tostring(entEntityID.hash))

	ImGui.Unindent()
end