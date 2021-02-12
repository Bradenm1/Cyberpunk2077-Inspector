function Inspector.DrawentEntity(self, entity)
	ImGui.Indent()

	-- Functions
	self:DrawNodeTree("GetEntityID", "entEntityID", entity:GetEntityID(), 
		function(entEntityID)  self:DrawentEntityID(entEntityID) end
	)
	
	--ImGui.Text("CurrentAppearanceName: " .. tostring(entity:GetCurrentAppearanceName()):match("%[ (%g+) -"))
	self:DrawWindowCName("GetCurrentAppearanceName", entity:GetCurrentAppearanceName())
	self:DrawWindowCName("GetCurrentContext", entity:GetCurrentContext())
	self:ObjectToText("GetControllingPeerID", entity:GetControllingPeerID())
	self:ObjectToText("GetWorldOrientation", entity:GetWorldOrientation())
	self:DisplayVector4("GetWorldForward", entity:GetWorldForward())
	self:DisplayVector4("GetWorldPosition", entity:GetWorldPosition())
	self:DisplayVector4("GetWorldRight", entity:GetWorldPosition())
	self:DisplayVector4("GetWorldUp", entity:GetWorldUp())
	self:ObjectToText("GetWorldYaw", entity:GetWorldYaw())

	self:DrawNodeTree("GetWorldTransform", "WorldTransform", entity:GetWorldTransform(), 
		function(worldTransform)  self:DrawWindowWorldTransform(worldTransform) end
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
	if entity.statesComponent ~= nil then 
		self:ObjectToText("regularRecordID", entity.statesComponent.regularRecordID)
		self:ObjectToText("highLevelAnimFeatureName", entity.statesComponent.highLevelAnimFeatureName)
		self:ObjectToText("upperBodyAnimFeatureName", entity.statesComponent.upperBodyAnimFeatureName)
		self:ObjectToText("stanceAnimFeatureName", entity.statesComponent.stanceAnimFeatureName)
		self:ObjectToText("name", entity.statesComponent.name)
	end

	ImGui.Unindent()
end

function Inspector.DrawEditentEntity(self, entity)
	ImGui.Indent()
	if ImGui.Button("Kill") then entity:Kill(entity, false, false) end
	if ImGui.Button("Destroy") then entity:GetEntity():Destroy(entity:GetEntity()) end
	if ImGui.Button("UnbindTransform") then entity:GetEntity():UnbindTransform(entity:GetEntity()) end
	if ImGui.Button("CycleRandomAppearance") then entity:ScheduleAppearanceChange("") end
	if ImGui.Button("Follow Player") then 
		local follow = GetSingleton('AIFollowerRole')
		follow:SetFollowTarget(Game.GetPlayer())
		entity:GetAIControllerComponent():SetAIRole(follow)
	end
	if ImGui.Button("Teleport Player To Entity") then 
		entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(Game.GetPlayer(), entity:GetWorldPosition(), EulerAngles.new(0,0,0)) 
	end
	if ImGui.Button("Teleport To Player") then 
		entity:GetGame():GetTeleportationFacility(entity:GetGame()):Teleport(entity, Game.GetPlayer():GetWorldPosition(), EulerAngles.new(0,0,0))
	end
	ImGui.Unindent()
end