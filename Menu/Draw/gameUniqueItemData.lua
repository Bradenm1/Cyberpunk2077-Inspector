local gameUniqueItemData = {}

function gameUniqueItemData:Draw(gameUniqueItemData)
    ImGui.Indent()

    BradenMenu.CName:Draw("GetName", gameUniqueItemData:GetName())
    BradenMenu.IGE.ObjectToText("GetNameAsString" , gameUniqueItemData:GetNameAsString())
    BradenMenu.IGE.ObjectToText("GetQuantity" , gameUniqueItemData:GetQuantity())
    BradenMenu.IGE.ObjectToText("HasAttachmentSlot" , gameUniqueItemData:HasAttachmentSlot())
    BradenMenu.IGE.ObjectToText("HasPlacementSlot" , gameUniqueItemData:HasPlacementSlot())
    BradenMenu.IGE.ObjectToText("GetTimestamp" , gameUniqueItemData:GetTimestamp())
    BradenMenu.IGE.ObjectToText("GetItemParts" , gameUniqueItemData:GetItemParts())
    --BradenMenu.IGE.ObjectToText("GetTemporaryStatBundle" , gameUniqueItemData:GetTemporaryStatBundle())
    BradenMenu.IGE.DisplayObjectArray("GetTemporaryStatBundle", "gameStatsBundleHandler", objects,
        function(key, value) BradenMenu.gameStatsBundleHandler:Draw(gameUniqueItemData:GetTemporaryStatBundle()) end
    )
    BradenMenu.IGE.ObjectToText("GetItemType" , gameUniqueItemData:GetItemType())
    BradenMenu.CName:Draw("GetLocalizedItemType" , gameUniqueItemData:GetLocalizedItemType())

	ImGui.Unindent()
end

return gameUniqueItemData