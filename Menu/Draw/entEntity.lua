function Inspector.DrawentEntity(self, entity)
	ImGui.Indent()

	-- Functions
	self:DrawNodeTree("GetEntityID", "entEntityID", entity:GetEntityID(), 
		function(entEntityID)  self:DrawentEntityID(entEntityID) end
	)
	
	self:ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	--ImGui.Text("CurrentAppearanceName: " .. tostring(entity:GetCurrentAppearanceName())::GetCNameName())
	self:DrawWindowCName("GetCurrentAppearanceName", entity:GetCurrentAppearanceName())
	self:DrawWindowCName("GetCurrentContext", entity:GetCurrentContext())
	self:ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	self:ObjectToText("GetWorldOrientation", entity:GetWorldOrientation())
	self:DisplayVector4("GetWorldForward", entity:GetWorldForward())
	self:DisplayVector4("GetWorldPosition", entity:GetWorldPosition())
	self:DisplayVector4("GetWorldRight", entity:GetWorldRight())
	self:DisplayVector4("GetWorldUp", entity:GetWorldUp())
	self:ObjectToText("GetWorldYaw", entity:GetWorldYaw())

	self:DrawNodeTree("GetWorldTransform", "WorldTransform", entity:GetWorldTransform(), 
		function(worldTransform)  self:DrawWorldTransform(worldTransform) end
	)

	--self:AddConpoment(entity:GetWorldTransform())
	self:ObjectToText("IsAttached", entity:IsAttached()) -- Good way to tell if object has been deleted!
	self:ObjectToText("IsControlledByAnotherClient", entity:IsControlledByAnotherClient())
	self:ObjectToText("IsControlledByAnyPeer", entity:IsControlledByAnyPeer())
	self:ObjectToText("IsControlledByLocalPeer", entity:IsControlledByLocalPeer())
	self:ObjectToText("IsReplicated", entity:IsReplicated())

	if entity:IsPlayer() then
		self:DisplayObjectArray("GetPlayerCurrentWorkspotTags", "CName", entity:GetPlayerCurrentWorkspotTags(),
			function(key, value) self:DrawWindowCName("Tag", value)end
		)
	end

	-- Variables
	
	--[[
	if entity.statesComponent ~= nil then 
		self:ObjectToText("regularRecordID", entity.statesComponent.regularRecordID)
		self:ObjectToText("highLevelAnimFeatureName", entity.statesComponent.highLevelAnimFeatureName)
		self:ObjectToText("upperBodyAnimFeatureName", entity.statesComponent.upperBodyAnimFeatureName)
		self:ObjectToText("stanceAnimFeatureName", entity.statesComponent.stanceAnimFeatureName)
		self:ObjectToText("name", entity.statesComponent.name)
	end]]

	ImGui.Unindent()
end

function Inspector.DrawEditentEntity(self, entity)
	ImGui.Indent()
	local idLayer = -13
	local maxSpawn = 10

	-- lastSpwned seems to be buggy when cloing recordIDs
	if Game.GetPreventionSpawnSystem():GetNumberOfSpawnedPreventionUnits() >= maxSpawn then 
		if ImGui.Button("Delete Clones") then 
			Game.GetPreventionSpawnSystem():RequestDespawnPreventionLevel(idLayer)
		end`
	else
		if ImGui.Button("Spawn Clone") then 
			local lastSpawned = Game.GetPreventionSpawnSystem():RequestSpawn(entity:GetRecordID(), idLayer, Game.GetPlayer():GetWorldTransform()) 
			self.Parent.SavedEntites["Spawned Clone"] = require("Menu/Inspector"):new(self.Parent, Game.FindEntityByID(lastSpawned), "Spawned Clone")
			print(Game.GetPreventionSpawnSystem():GetNumberOfSpawnedPreventionUnits())
		end
	end
	ImGui.SameLine()
	ImGui.Text("This will conflict with things spawned on other mods.")
	ImGui.Text("Will spawn the clone inside the player, at the same orientation")
	ImGui.Spacing()

	if ImGui.Button("Kill") then entity:Kill(entity, false, false) end
	if ImGui.Button("Destroy") then entity:GetEntity():Destroy(entity:GetEntity()) end
	if ImGui.Button("CycleRandomAppearance") then entity:ScheduleAppearanceChange("") end
	local gameGodModeSystem = GetSingleton('gameGodModeSystem')

	-- Move somewhere else later
	local godModeTable = {
		{
			name = "Invulnerable",
			type = 0
		},
		{
			name = "Immortal",
			type = 1
		},
		{
			name = "Mortal",
			type = 3
		},
	}

	-- Loop through the table for the different godmodes
	for key, value in ipairs(godModeTable) do
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

	self.PositionChanger:DrawPositionChanger()
	
	ImGui.Unindent()
end