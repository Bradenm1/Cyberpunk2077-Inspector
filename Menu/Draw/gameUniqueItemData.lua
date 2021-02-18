function Inspector.DrawgameUniqueItemData(self, gameUniqueItemData)
    ImGui.Indent()

    self:DrawWindowCName("GetName", gameUniqueItemData:GetName())
    BradenMenu.IGE.ObjectToText("GetNameAsString" , gameUniqueItemData:GetNameAsString())
    BradenMenu.IGE.ObjectToText("GetQuantity" , gameUniqueItemData:GetQuantity())
    BradenMenu.IGE.ObjectToText("HasAttachmentSlot" , gameUniqueItemData:HasAttachmentSlot())
    BradenMenu.IGE.ObjectToText("HasPlacementSlot" , gameUniqueItemData:HasPlacementSlot())
    BradenMenu.IGE.ObjectToText("GetTimestamp" , gameUniqueItemData:GetTimestamp())
    BradenMenu.IGE.ObjectToText("GetItemParts" , gameUniqueItemData:GetItemParts())
    --BradenMenu.IGE.ObjectToText("GetTemporaryStatBundle" , gameUniqueItemData:GetTemporaryStatBundle())
    BradenMenu.IGE.DisplayObjectArray("GetTemporaryStatBundle", "gameStatsBundleHandler", objects,
        function(key, value) self:DrawgameStatsBundleHandler(gameUniqueItemData:GetTemporaryStatBundle()) end
    )
    BradenMenu.IGE.ObjectToText("GetItemType" , gameUniqueItemData:GetItemType())
    self:DrawWindowCName("GetLocalizedItemType" , gameUniqueItemData:GetLocalizedItemType())

	ImGui.Unindent()
end