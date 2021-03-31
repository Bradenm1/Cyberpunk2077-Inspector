local gameItemObject = {}

function gameItemObject:Draw(entity)
	ImGui.Indent()

	BradenMenu.IGE.ObjectToText("GetItemID", entity:GetItemID())
    BradenMenu.IGE.ObjectToText("GetItemData", entity:GetItemData())
    BradenMenu.IGE.ObjectToText("GetAnimationParameters", entity:GetAnimationParameters())
    BradenMenu.IGE.ObjectToText("IsClientSideOnlyGadget", entity:IsClientSideOnlyGadget())
    BradenMenu.IGE.ObjectToText("IsConnectedWithDrop", entity:IsConnectedWithDrop())
    BradenMenu.IGE.ObjectToText("IsContainer", entity:IsContainer())
    BradenMenu.IGE.ObjectToText("GetDefaultHighlight", entity:GetDefaultHighlight())
    BradenMenu.IGE.ObjectToText("GetCurrentOutline", entity:GetCurrentOutline())
    BradenMenu.IGE.ObjectToText("ShouldRegisterToHUD", entity:ShouldRegisterToHUD())
    BradenMenu.IGE.ObjectToText("IsQuest", entity:IsQuest())
    BradenMenu.IGE.ObjectToText("DeterminGameplayRole", entity:DeterminGameplayRole())
    BradenMenu.IGE.ObjectToText("GetIsIconic", entity:GetIsIconic())
    BradenMenu.IGE.ObjectToText("GetLootQuality", entity:GetLootQuality())

	ImGui.Unindent()
end

return gameItemObject