function Inspector.DrawWorldTransformPosition(self, worldPosition)
	ImGui.Indent()

	-- Static Functions
	local worldPositionSingleton = GetSingleton("WorldPosition")

	BradenMenu.IGE.ObjectToText("GetX", worldPositionSingleton:GetX(worldPosition))
	BradenMenu.IGE.ObjectToText("GetY", worldPositionSingleton:GetY(worldPosition))
	BradenMenu.IGE.ObjectToText("GetZ", worldPositionSingleton:GetZ(worldPosition))

	BradenMenu.IGE.DisplayVector4("ToVector4", worldPositionSingleton:ToVector4(worldPosition)) 
	ImGui.Unindent()

	-- Properties
	BradenMenu.IGE.DrawNodeTree("X", "FixedPoint", worldPosition.x, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)
	BradenMenu.IGE.DrawNodeTree("Y", "FixedPoint", worldPosition.y, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)
	BradenMenu.IGE.DrawNodeTree("Z", "FixedPoint", worldPosition.z, 
		function(fixedPoint) self:DrawFixedPoint(fixedPoint) end
	)

	ImGui.Unindent()
end