function Inspector.DrawgameStatsBundleHandler(self, gameStatsBundleHandler)
	ImGui.Indent()

	self:DisplayObjectArray("GetStatDetails", "gameStatDetailedData", gameStatsBundleHandler:GetStatDetails(),
		function(key, value) self:DrawgameStatDetailedData("gameStatDetailedData", value) end
	)
	
	ImGui.Unindent()
end