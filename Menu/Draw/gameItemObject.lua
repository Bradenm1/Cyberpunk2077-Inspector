function Inspector.DrawgameItemObject(slef, gameItemObject)
	ImGui.Indent()

	BradenMenu.IGE.ObjectToText("IsClientSideOnlyGadget" , gameItemObject:IsClientSideOnlyGadget())

	ImGui.Unindent()
end