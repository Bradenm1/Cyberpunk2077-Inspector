local CName = {}

function CName:Draw(funcName, CName)
	local name = Game.NameToString(CName)
	if BradenMenu.IGE.ContainsText(BradenMenu.FilterText, funcName .. ": " .. name) then 
		if CName ~= nil then 
			ImGui.Text(funcName .. ": " .. name)
		else
			ImGui.Text(funcName .. " - nil")
		end
	end
end

return CName