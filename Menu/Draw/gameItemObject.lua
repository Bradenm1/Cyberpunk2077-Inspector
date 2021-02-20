local gameItemObject = {}

function gameItemObject:Draw(gameItemObject)
	ImGui.Indent()

	BradenMenu.IGE.ObjectToText("IsClientSideOnlyGadget" , gameItemObject:IsClientSideOnlyGadget())

	ImGui.Unindent()
end

return gameItemObject