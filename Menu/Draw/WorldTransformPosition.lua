function Inspector.DrawWorldTransformPosition(self, worldPosition)
	ImGui.Indent()

	-- Static Functions
	local worldPositionSingleton = GetSingleton("WorldPosition")

	self:ObjectToText("GetX", worldPositionSingleton:GetX(worldPosition))
	self:ObjectToText("GetY", worldPositionSingleton:GetY(worldPosition))
	self:ObjectToText("GetZ", worldPositionSingleton:GetZ(worldPosition))

	self:DisplayVector4("ToVector4", worldPositionSingleton:ToVector4(worldPosition)) 
	ImGui.Unindent()

	-- Properties
	self:DrawNodeTree("X", "FixedPoint", worldPosition.x, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)
	self:DrawNodeTree("Y", "FixedPoint", worldPosition.y, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)
	self:DrawNodeTree("Z", "FixedPoint", worldPosition.z, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)

	ImGui.Unindent()
end