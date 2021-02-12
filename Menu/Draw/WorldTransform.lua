function Inspector.DrawWorldTransform(self, worldTransform)
	ImGui.Indent()

	local worldSingleton = GetSingleton("WorldTransform")

	-- Static Functions
	self:DrawNodeTree("GetWorldPosition", "WorldPosition", worldSingleton:GetWorldPosition(worldTransform), 
		function(worldPosition)  self:DrawWorldTransformPosition(worldPosition) end
	)

	self:DrawNodeTree("GetInverse", "WorldTransform", worldSingleton:GetInverse(worldTransform), 
		function(worldTransform)  self:DrawWorldTransform(worldTransform) end
	)

	self:ObjectToText("GetOrientation: ", worldSingleton:GetOrientation(worldTransform))
	self:ObjectToText("GetForward", worldSingleton:GetForward(worldTransform))
	self:ObjectToText("GetRight", worldSingleton:GetRight(worldTransform))
	self:ObjectToText("GetUp", worldSingleton:GetUp(worldTransform))
	self:ObjectToText("ToMatrix", worldSingleton:ToMatrix(worldTransform))
	self:ObjectToText("_ToXForm", worldSingleton:_ToXForm(worldTransform))
	ImGui.Unindent()
end