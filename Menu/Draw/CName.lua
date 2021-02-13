function Inspector.DrawWindowCName(self, funcName, CName)
	if CName ~= nil then 
		local name = tostring(CName):GetCNameName()
		if name == nil then name = "nil" end
		if self:TextToTreeNode(funcName .. " - CName - " .. name) then 
			ImGui.Indent()
			ImGui.Text("name: " .. name)
			ImGui.Text("hash_lo: " .. CName["hash_lo"])
			ImGui.Text("hash_hi: " .. CName["hash_hi"])
			ImGui.Separator()
			ImGui.Unindent()
			ImGui.Unindent()
		end
	else
		ImGui.Text(funcName .. " - nil")
	end
end