local WorldTransform = {}

function WorldTransform:Draw(worldTransform)
	ImGui.Indent()

	local worldSingleton = GetSingleton("WorldTransform")

	-- Static Functions
	BradenMenu.IGE.DrawNodeTree("GetWorldPosition", "WorldPosition", worldSingleton:GetWorldPosition(worldTransform), 
		function(worldPosition) BradenMenu.WorldTransformPosition:Draw(worldPosition) end
	)

	BradenMenu.IGE.DrawNodeTree("GetInverse", "WorldTransform", worldSingleton:GetInverse(worldTransform), 
		function(worldTransform) BradenMenu.WorldTransform:Draw(worldTransform) end
	)

	BradenMenu.IGE.DisplayQuaternion("GetOrientation", worldSingleton:GetOrientation(worldTransform))
	BradenMenu.IGE.DisplayVector4("GetForward", worldSingleton:GetForward(worldTransform)) 
	BradenMenu.IGE.DisplayVector4("GetRight", worldSingleton:GetRight(worldTransform)) 
	BradenMenu.IGE.DisplayVector4("GetUp", worldSingleton:GetUp(worldTransform)) 
	BradenMenu.IGE.ObjectToText("ToMatrix", worldSingleton:ToMatrix(worldTransform))
	BradenMenu.IGE.ObjectToText("_ToXForm", worldSingleton:_ToXForm(worldTransform))
	ImGui.Unindent()
end

return WorldTransform