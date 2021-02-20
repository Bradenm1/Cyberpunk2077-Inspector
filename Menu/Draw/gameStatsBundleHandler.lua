local gameStatsBundleHandler = {}

function gameStatsBundleHandler:Draw(gameStatsBundleHandler)
	ImGui.Indent()

	BradenMenu.IGE.DisplayObjectArray("GetStatDetails", "gameStatDetailedData", gameStatsBundleHandler:GetStatDetails(),
		function(key, value) BradenMenu.gameStatDetailedData:Draw("gameStatDetailedData", value) end
	)
	
	ImGui.Unindent()
end

return gameStatsBundleHandler