function Inspector.DrawgamedataNPCType_Record(self, gamedataNPCType_Record)
	ImGui.Indent()

	-- Functons
	self:ObjectToText("EnumComment", gamedataNPCType_Record:EnumComment())
	self:DrawWindowCName("EnumName", gamedataNPCType_Record:EnumName())
	self:ObjectToText("Type", gamedataNPCType_Record:Type())
	self:ObjectToText("GetID", gamedataNPCType_Record:GetID())

	ImGui.Unindent()
end