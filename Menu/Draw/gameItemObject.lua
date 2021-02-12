function Inspector.DrawgameItemObject(slef, gameItemObject)
	ImGui.Indent()

	self:ObjectToText("IsClientSideOnlyGadget" , gameItemObject:IsClientSideOnlyGadget())

	ImGui.Unindent()
end