function Inspector.DrawgameStatDetailedData(self, gameStatDetailedData)
	ImGui.Indent()
    
    self:ObjectToText("statType" , gameItemObject.statType)
    self:ObjectToText("limitMin" , gameItemObject.limitMin)
    self:ObjectToText("limitMax" , gameItemObject.limitMax)
    self:ObjectToText("value" , gameItemObject.value)
    self:ObjectToText("modifiers" , gameItemObject.modifiers)
    self:ObjectToText("boolStatType" , gameItemObject.boolStatType)
    
	ImGui.Unindent()
end