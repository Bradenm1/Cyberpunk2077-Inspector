local gameStatDetailedData = {}

function gameStatDetailedData:Draw(gameStatDetailedData)
	ImGui.Indent()
    
    BradenMenu.IGE.ObjectToText("statType" , gameItemObject.statType)
    BradenMenu.IGE.ObjectToText("limitMin" , gameItemObject.limitMin)
    BradenMenu.IGE.ObjectToText("limitMax" , gameItemObject.limitMax)
    BradenMenu.IGE.ObjectToText("value" , gameItemObject.value)
    BradenMenu.IGE.ObjectToText("modifiers" , gameItemObject.modifiers)
    BradenMenu.IGE.ObjectToText("boolStatType" , gameItemObject.boolStatType)
    
	ImGui.Unindent()
end

return gameStatDetailedData