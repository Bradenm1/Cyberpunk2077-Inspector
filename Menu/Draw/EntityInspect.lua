local EntityInspect = {}

-- Draw the collapsing headers for the entity
function EntityInspect:Draw(entity, inspector)
	--[[if ImGui.CollapsingHeader("ConfigVar") then
		ImGui.Indent()
		BradenMenu.IGE.ObjectToText("HasRequestedValue", entity:HasRequestedValue())
		ImGui.Unindent()
	end]]

	-- Display information related to the Entity
	if ImGui.CollapsingHeader("Entity") then
		BradenMenu.entEntity:Draw(entity)
	end

	-- Display information related to the GameObject
	if ImGui.CollapsingHeader("GameObject") then 
		BradenMenu.gameObject:Draw(entity)
	end

	if entity:IsDevice() then 
		if ImGui.CollapsingHeader("FakeDoor") then 
			ImGui.Indent()
			BradenMenu.IGE.ObjectToText("DeterminGameplayRole", entity:DeterminGameplayRole())
			ImGui.Unindent()
		end
	end

	if entity:IsItem() then 
		if ImGui.CollapsingHeader("ItemObject") then 
			ImGui.Indent()
			BradenMenu.ItemObject:Draw(entity)
			ImGui.Unindent()
		end
	end

	-- Display information related to the vehicleCarBaseObject
	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject") then 
			BradenMenu.vehicleCarBaseObject:Draw(entity, inspector)
		end
	end

	-- Display information related to the gamePuppet
	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet") then 
			BradenMenu.gamePuppet:Draw(entity, inspector)
		end

		if ImGui.CollapsingHeader("TimeDilatable") then 
			ImGui.Indent()
			BradenMenu.IGE.ObjectToText("GetTimeDilationValue", entity:GetTimeDilationValue())
			BradenMenu.IGE.ObjectToText("IsIgnoringGlobalTimeDilation", entity:IsIgnoringGlobalTimeDilation())
			BradenMenu.IGE.ObjectToText("IsIgnoringTimeDilation", entity:IsIgnoringTimeDilation())
			ImGui.Unindent()
		end
	end

	-- Display information related to the ScriptedPuppet
	--[[if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet") then 
			self:DrawScriptedPuppet(entity)
		end
	end]]

	-- Display information related to a gameItemObject
	if entity:IsItem() then
		if ImGui.CollapsingHeader("gameItemObject") then 
			BradenMenu.gameItemObject:Draw(entity)
		end
	end
end

-- Draws all the edit functions
-- We pass the inspector in as we use that to save data
function EntityInspect:DrawEdit(entity, inspector)
	
	if ImGui.CollapsingHeader("Entity") then 
		BradenMenu.entEntity:DrawEdit(entity, inspector)
	end
	
	if ImGui.CollapsingHeader("gameObject") then 
		BradenMenu.gameObject:DrawEdit(entity)
	end

	if entity:IsVehicle() then 
		if ImGui.CollapsingHeader("vehicleCarBaseObject") then
			BradenMenu.vehicleCarBaseObject:DrawEdit(entity, inspector)
		end
	end

	if entity:IsNPC() or entity:IsPlayer() then 
		if ImGui.CollapsingHeader("gamePuppet") then 	
			BradenMenu.gamePuppet:DrawEdit(entity, inspector)
		end
	end

	if entity:IsPuppet() then
		if ImGui.CollapsingHeader("ScriptedPuppet") then 
			BradenMenu.ScriptedPuppet:DrawEdit(entity)
		end
	end

end

return EntityInspect