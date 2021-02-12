function Inspector.DrawAILocationInformation(self, AILocationInformation)
	ImGui.Indent()

	-- Properties
	self:DisplayVector4("position", AILocationInformation.position) 
	self:DisplayVector4("direction", AILocationInformation.direction) 

	ImGui.Unindent()
end