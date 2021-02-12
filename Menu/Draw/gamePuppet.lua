function Inspector.DrawGamePuppet(self, entity)
	ImGui.Indent()

	-- Functions
	self:ObjectToText("CanRagdoll" , entity:CanRagdoll())

	self:DrawNodeTree("GetAttitude", "gameAttitudeAgent", entity:GetAttitude(), 
		function(gameAttitudeAgent)  self:DrawgameAttitudeAgent(gameAttitudeAgent) end
	)

	self:DrawNodeTree("GetRecord", "gameDataCharacter_Record", entity:GetRecord(), 
		function(gameDataCharacter_Record)  self:DrawgameDataCharacter_Record(gameDataCharacter_Record) end
	)

	self:DrawNodeTree("GetMovePolicesComponent", "movePoliciesComponent", entity:GetMovePolicesComponent(), 
		function(movePoliciesComponent)  self:DrawmovePoliciesComponent(movePoliciesComponent) end
	)

	local someBool, objects = entity:GetCurrentlyEquippedItems()
	self:DisplayObjectArray("GetCurrentlyEquippedItems", "gameItemObject", objects,
		function(key, value) self:DrawgameItemObject("gameItemObject", value)end
	)

	self:DrawWindowCName("GetGender", entity:GetGender())

	self:DrawWindowCName("GetBodyType", entity:GetBodyType())
	self:DisplayVector4("GetLastValidNavmeshPoint", entity:GetLastValidNavmeshPoint()) 
	self:DrawWindowCName("GetResolvedGenderName", entity:GetResolvedGenderName())
	self:DisplayVector4("GetVelocity", entity:GetVelocity()) 
	self:ObjectToText("HasCPOMissionData" , entity:HasCPOMissionData())
	self:ObjectToText("HasCrowdStaticLOD" , entity:HasCrowdStaticLOD())
	self:ObjectToText("IsLooted" , entity:IsLooted())
	self:ObjectToText("WasLootGenerated" , entity:WasLootGenerated())

	ImGui.Unindent()
end

function Inspector.DrawEditGamePuppet(self, entity)
	ImGui.Indent()
	if ImGui.Button("CacheLootForDroping") then entity:CacheLootForDroping() end
	if ImGui.Button("DropAmmo") then entity:DropAmmo() end
	if ImGui.Button("DropLootBag") then entity:DropLootBag() end
	if ImGui.Button("DropWeapons") then entity:DropWeapons() end
	if ImGui.Button("GenerateLoot") then entity:GenerateLoot() end
	if ImGui.Button("SendAIDeathSignal") then entity:SendAIDeathSignal() end
	if ImGui.Button("SetIsDead") then entity:GetPuppetPS():SetIsDead(true) end
	if ImGui.Button("SetAttitudeGroup hostile") then entity:GetAttitude():SetAttitudeGroup("hostile") end
	if ImGui.Button("SetAttitudeGroup civilian") then entity:GetAttitude():SetAttitudeGroup("civilian") end
	if ImGui.Button("SetAttitudeGroup neutral") then entity:GetAttitude():SetAttitudeGroup("neutral") end
	if ImGui.Button("Toggle Move Policies") then entity:GetMovePolicesComponent():Toggle(not entity:GetMovePolicesComponent():IsEnabled()) end
	if ImGui.Button("Toggle Dismemberment") then entity:GetDismembermentComponent():Toggle(not entity:GetDismembermentComponent():IsEnabled()) end
	ImGui.Unindent()
end