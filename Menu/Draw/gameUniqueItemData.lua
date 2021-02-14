function Inspector.DrawgameUniqueItemData(self, gameUniqueItemData)
    ImGui.Indent()

    self:DrawWindowCName("GetName", gameUniqueItemData:GetName())
    self:ObjectToText("GetNameAsString" , gameUniqueItemData:GetNameAsString())
    self:ObjectToText("GetQuantity" , gameUniqueItemData:GetQuantity())
    self:ObjectToText("HasAttachmentSlot" , gameUniqueItemData:HasAttachmentSlot())
    self:ObjectToText("HasPlacementSlot" , gameUniqueItemData:HasPlacementSlot())
    self:ObjectToText("GetTimestamp" , gameUniqueItemData:GetTimestamp())
    self:ObjectToText("GetItemParts" , gameUniqueItemData:GetItemParts())
    --self:ObjectToText("GetTemporaryStatBundle" , gameUniqueItemData:GetTemporaryStatBundle())
    self:DisplayObjectArray("GetTemporaryStatBundle", "gameStatsBundleHandler", objects,
        function(key, value) self:DrawgameStatsBundleHandler(gameUniqueItemData:GetTemporaryStatBundle()) end
    )
    self:ObjectToText("GetItemType" , gameUniqueItemData:GetItemType())
    self:DrawWindowCName("GetLocalizedItemType" , gameUniqueItemData:GetLocalizedItemType())

	ImGui.Unindent()
end