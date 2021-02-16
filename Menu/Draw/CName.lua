function Inspector.DrawWindowCName(self, funcName, CName)
	if CName ~= nil then 
		ImGui.Text(funcName .. ": " .. Game.NameToString(CName))
	else
		ImGui.Text(funcName .. " - nil")
	end
end