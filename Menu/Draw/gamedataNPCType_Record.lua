local gamedataNPCType_Record = {}

function gamedataNPCType_Record:Draw(gamedataNPCType_Record)
	ImGui.Indent()

	-- Functons
	BradenMenu.IGE.ObjectToText("EnumComment", gamedataNPCType_Record:EnumComment())
	BradenMenu.CName:Draw("EnumName", gamedataNPCType_Record:EnumName())
	BradenMenu.IGE.ObjectToText("Type", gamedataNPCType_Record:Type())
	BradenMenu.IGE.ObjectToText("GetID", gamedataNPCType_Record:GetID())

	ImGui.Unindent()
end

return gamedataNPCType_Record