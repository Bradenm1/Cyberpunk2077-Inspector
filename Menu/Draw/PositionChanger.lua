function Inspector.drawPositionChanger(self, entity)
	ImGui.Indent()

    ImGui.Text("World Position Adjuster")
    local teleportFacility = GetSingleton('gameTeleportationFacility')
    local worldPos = entity:GetWorldPosition()
	local angles = GetSingleton('Quaternion'):ToEulerAngles(entity:GetWorldOrientation())
	local eulerAngles = EulerAngles.new(angles.pitch, angles.yaw, angles.roll)

	local value, used = ImGui.DragFloat("X", worldPos.x, 0.01)
	if used then 
		local newVector4 = Vector4.new(value, worldPos.y, worldPos.z, worldPos.w)
		teleportFacility:Teleport(entity, newVector4, eulerAngles)
	end

	local value, used = ImGui.DragFloat("Y", worldPos.y, 0.01)
	if used then 
		local newVector4 = Vector4.new(worldPos.x, value, worldPos.z, worldPos.w)
		teleportFacility:Teleport(entity, newVector4, eulerAngles)
	end

	local value, used = ImGui.DragFloat("Z", worldPos.z, 0.01)
	if used then 
		local newVector4 = Vector4.new(worldPos.x, worldPos.y, value, worldPos.w)
		teleportFacility:Teleport(entity, newVector4, eulerAngles)
	end

	ImGui.Text("World Rotation Adjuster")
	local value, used = ImGui.DragFloat("Pitch", angles.pitch, 0.01)
	if used then 
		local newEulerAngles = EulerAngles.new(value, angles.yaw, angles.roll)
		teleportFacility:Teleport(entity, worldPos, newEulerAngles)
	end

	local value, used = ImGui.DragFloat("Yaw", angles.yaw, 0.01)
	if used then 
		local newEulerAngles = EulerAngles.new(angles.pitch, value, angles.roll)
		teleportFacility:Teleport(entity, worldPos, newEulerAngles)
	end

	local value, used = ImGui.DragFloat("roll", angles.roll, 0.01)
	if used then 
		local newEulerAngles = EulerAngles.new(angles.pitch, angles.yaw, value)
		teleportFacility:Teleport(entity, worldPos, newEulerAngles)
	end

	ImGui.Unindent()
end