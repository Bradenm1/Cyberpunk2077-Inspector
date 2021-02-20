local entEntityID = {}

function entEntityID:Draw(entEntityID)
	ImGui.Indent()

	-- Properties
	ImGui.Text("hash: " .. tostring(entEntityID.hash))

	ImGui.Unindent()
end

return entEntityID