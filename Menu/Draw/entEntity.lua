local entEntity = {}

function entEntity:Draw(entity)
	ImGui.Indent()

	-- Functions
	BradenMenu.IGE.DrawNodeTree("GetEntityID", "entEntityID", entity:GetEntityID(), 
		function(entEntityID) BradenMenu.entEntityID:Draw(entEntityID) end
	)
	
	BradenMenu.IGE.ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	--ImGui.Text("CurrentAppearanceName: " .. tostring(entity:GetCurrentAppearanceName())::GetCNameName())
	BradenMenu.CName:Draw("GetCurrentAppearanceName", entity:GetCurrentAppearanceName())
	BradenMenu.CName:Draw("GetCurrentContext", entity:GetCurrentContext())
	BradenMenu.IGE.ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	BradenMenu.IGE.ObjectToText("GetWorldOrientation", entity:GetWorldOrientation())
	BradenMenu.IGE.DisplayVector4("GetWorldForward", entity:GetWorldForward())
	BradenMenu.IGE.DisplayVector4("GetWorldPosition", entity:GetWorldPosition())
	BradenMenu.IGE.DisplayVector4("GetWorldRight", entity:GetWorldRight())
	BradenMenu.IGE.DisplayVector4("GetWorldUp", entity:GetWorldUp())
	BradenMenu.IGE.ObjectToText("GetWorldYaw", entity:GetWorldYaw())

	BradenMenu.IGE.DrawNodeTree("GetWorldTransform", "WorldTransform", entity:GetWorldTransform(), 
		function(worldTransform) BradenMenu.WorldTransform:Draw(worldTransform) end
	)

	--self:AddConpoment(entity:GetWorldTransform())
	BradenMenu.IGE.ObjectToText("IsAttached", entity:IsAttached()) -- Good way to tell if object has been deleted!
	BradenMenu.IGE.ObjectToText("IsControlledByAnotherClient", entity:IsControlledByAnotherClient())
	BradenMenu.IGE.ObjectToText("IsControlledByAnyPeer", entity:IsControlledByAnyPeer())
	BradenMenu.IGE.ObjectToText("IsControlledByLocalPeer", entity:IsControlledByLocalPeer())
	BradenMenu.IGE.ObjectToText("ShouldEnableRemoteLayer", entity:ShouldEnableRemoteLayer())
	BradenMenu.IGE.ObjectToText("HasDirectActionsActive", entity:HasDirectActionsActive())
	BradenMenu.IGE.ObjectToText("CanRevealRemoteActionsWheel", entity:CanRevealRemoteActionsWheel())
	BradenMenu.IGE.ObjectToText("ShouldRegisterToHUD", entity:ShouldRegisterToHUD())
	BradenMenu.IGE.ObjectToText("GetIsIconic", entity:GetIsIconic())
	BradenMenu.IGE.ObjectToText("GetContentScale", entity:GetContentScale())
	BradenMenu.IGE.ObjectToText("IsExplosive", entity:IsExplosive())
	BradenMenu.IGE.ObjectToText("IsFastTravelPoint", entity:IsFastTravelPoint())
	BradenMenu.IGE.ObjectToText("HasAnySlaveDevices", entity:HasAnySlaveDevices())
	BradenMenu.IGE.ObjectToText("IsBodyDisposalPossible", entity:IsBodyDisposalPossible())
	BradenMenu.IGE.ObjectToText("IsReplicated", entity:IsReplicated())

	if entity:IsPlayer() then
		BradenMenu.IGE.DisplayObjectArray("GetPlayerCurrentWorkspotTags", "CName", entity:GetPlayerCurrentWorkspotTags(),
			function(key, value) BradenMenu.CName:Draw("Tag", value) end
		)
	end

	-- Variables
	
	
	if entity.statesComponent ~= nil then 
		BradenMenu.IGE.ObjectToText("regularRecordID", entity.statesComponent.regularRecordID)
		BradenMenu.IGE.ObjectToText("highLevelAnimFeatureName", entity.statesComponent.highLevelAnimFeatureName)
		BradenMenu.IGE.ObjectToText("upperBodyAnimFeatureName", entity.statesComponent.upperBodyAnimFeatureName)
		BradenMenu.IGE.ObjectToText("stanceAnimFeatureName", entity.statesComponent.stanceAnimFeatureName)
		BradenMenu.IGE.ObjectToText("name", entity.statesComponent.name)
	end

	ImGui.Unindent()
end

function entEntity:DrawEdit(entity, inspector)
	ImGui.Indent()
	local idLayer = -13
	local maxSpawn = 10

	-- lastSpwned seems to be buggy when cloing recordIDs
	if Game.GetPreventionSpawnSystem():GetNumberOfSpawnedPreventionUnits() >= maxSpawn then 
		if ImGui.Button("Delete Clones") then 
			Game.GetPreventionSpawnSystem():RequestDespawnPreventionLevel(idLayer)
		end
	else
		if ImGui.Button("Spawn Clone") then 
			local lastSpawned = Game.GetPreventionSpawnSystem():RequestSpawn(entity:GetRecordID(), idLayer, Game.GetPlayer():GetWorldTransform())
			inspector.Parent.SavedEntites["Spawned Clone"] = BradenMenu.InspectorModule:new(inspector.Parent, Game.FindEntityByID(lastSpawned), "Spawned Clone")
		end
	end
	ImGui.SameLine()
	ImGui.Text("This will conflict with things spawned on other mods.")
	ImGui.Text("Will spawn the clone inside the player, at the same orientation")
	ImGui.Text("Doing it with vehicles can cause major issues")
	ImGui.Spacing()


	--[[if ImGui.Button("ASDASD") then 
		entity:GetTakeOverControlSystem():RegisterAsCurrentObject(entity:GetEntityID()) 
		entity:GetTakeOverControlSystem():RegisterObjectHandle(entity:GetEntityID())
		entity:GetTakeOverControlSystem().controlledObject = entity
		entity:GetTakeOverControlSystem():EnablePlayerTPPRepresenation(true)
		entity:GetTakeOverControlSystem():ShowChainControls(true)
		entity:GetTakeOverControlSystem():RegisterSystemOnInput(true)
		entity:GetTakeOverControlSystem():EnablePlayerTPPRepresenation(true)
		entity:GetTakeOverControlSystem():ToggleToNextControlledDevice()
		entity:GetTakeOverControlSystem():EnablePlayerTPPRepresenation(true)
		entity:GetAIControllerComponent():GetActionAnimationScriptProxy():Bind(Game.GetPlayer())
	end]]
	if ImGui.Button("Kill") then entity:Kill(entity, false, false) end
	if ImGui.Button("Destroy") then entity:GetEntity():Destroy(entity:GetEntity()) end
	if ImGui.Button("CycleRandomAppearance") then entity:ScheduleAppearanceChange("") end
	local gameGodModeSystem = GetSingleton('gameGodModeSystem')

	-- Loop through the table for the different godmodes
	for key, value in ipairs(BradenMenu.GodModeData) do
		if (gameGodModeSystem:HasGodMode(entity:GetEntityID(), value.type)) then 
			if ImGui.Button("Remove " .. value.name) then gameGodModeSystem:RemoveGodMode(entity:GetEntityID(), value.type, "") end
		else
			if ImGui.Button("Add " .. value.name) then gameGodModeSystem:AddGodMode(entity:GetEntityID(), value.type, "") end
		end
	end

	local teleportFacility = GetSingleton('gameTeleportationFacility')
	if ImGui.Button("Teleport Player To Entity") then 
		teleportFacility:Teleport(Game.GetPlayer(), entity:GetWorldPosition(), EulerAngles.new(0,0,0)) 
	end
	if ImGui.Button("Teleport To Player") then 
		teleportFacility:Teleport(entity, Game.GetPlayer():GetWorldPosition(), EulerAngles.new(0,0,0))
		
		--[[local WorldTransform = GetSingleton('WorldTransform')
		local WorldPosition = GetSingleton('WorldPosition')
		WorldPosition:SetVector4(entity:GetWorldTransform():GetWorldPosition(), Game.GetPlayer():GetWorldPosition())
		WorldTransform:SetPosition(entity:GetWorldTransform(), Game.GetPlayer():GetWorldPosition())
		WorldTransform:SetWorldPosition(entity:GetWorldTransform(), Game.GetPlayer():GetWorldTransform():GetWorldPosition())
		WorldTransform:SetIdentity(Game.GetPlayer():GetWorldTransform())

		WorldTransform.Position = Game.GetPlayer():GetWorldTransform():GetWorldPosition()]]
	end

	inspector.PositionChanger:DrawPositionChanger()
	
	ImGui.Unindent()
end

return entEntity