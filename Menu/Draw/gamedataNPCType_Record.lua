function Inspector.DrawgamedataNPCType_Record(self, gamedataNPCType_Record)
	ImGui.Indent()

	-- Functons
	BradenMenu.IGE.ObjectToText("EnumComment", gamedataNPCType_Record:EnumComment())
	self:DrawWindowCName("EnumName", gamedataNPCType_Record:EnumName())
	BradenMenu.IGE.ObjectToText("Type", gamedataNPCType_Record:Type())
	BradenMenu.IGE.ObjectToText("GetID", gamedataNPCType_Record:GetID())

	ImGui.Unindent()
end