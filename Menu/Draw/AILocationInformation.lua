function Inspector.DrawAILocationInformation(self, AILocationInformation)
	ImGui.Indent()

	-- Properties
	BradenMenu.IGE.DisplayVector4("position", AILocationInformation.position) 
	BradenMenu.IGE.DisplayVector4("direction", AILocationInformation.direction) 

	ImGui.Unindent()
end