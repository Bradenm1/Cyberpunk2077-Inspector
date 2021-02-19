function Inspector.DrawGamePuppet(self, entity)
	ImGui.Indent()

	-- Functions
	BradenMenu.IGE.ObjectToText("CanRagdoll" , entity:CanRagdoll())
	BradenMenu.IGE.ObjectToText("GetTweakDBDisplayName", entity:GetTweakDBDisplayName(false))
	BradenMenu.IGE.ObjectToText("GetTweakDBFullDisplayName", entity:GetTweakDBFullDisplayName(false))
	--[[BradenMenu.IGE.ObjectToText("GetTweakDBDisplayName FallBack", entity:GetTweakDBDisplayName(true))
	BradenMenu.IGE.ObjectToText("GetTweakDBFullDisplayName FallBack", entity:GetTweakDBFullDisplayName(true))]]
	BradenMenu.IGE.DrawNodeTree("GetAttitude", "gameAttitudeAgent", entity:GetAttitude(), 
		function(gameAttitudeAgent)  self:DrawgameAttitudeAgent(gameAttitudeAgent) end
	)

	BradenMenu.IGE.DrawNodeTree("GetRecord", "gameDataCharacter_Record", entity:GetRecord(), 
		function(gameDataCharacter_Record)  self:DrawgameDataCharacter_Record(gameDataCharacter_Record) end
	)

	BradenMenu.IGE.DrawNodeTree("GetMovePolicesComponent", "movePoliciesComponent", entity:GetMovePolicesComponent(), 
		function(movePoliciesComponent)  self:DrawmovePoliciesComponent(movePoliciesComponent) end
	)

	local someBool, objects = entity:GetCurrentlyEquippedItems()
	BradenMenu.IGE.DisplayObjectArray("GetCurrentlyEquippedItems", "gameItemObject", objects,
		function(key, value) self:DrawgameItemObject("gameItemObject", value)end
	)

	BradenMenu.IGE.DrawNodeTree("GetAnimationControllerComponent", "entAnimationControllerComponent", entity:GetAnimationControllerComponent(), 
		function(entAnimationControllerComponent)  self:DrawentAnimationControllerComponent(entAnimationControllerComponent) end
	)

	self:DrawWindowCName("GetGender", entity:GetGender())
	self:DrawWindowCName("GetBodyType", entity:GetBodyType())
	BradenMenu.IGE.DisplayVector4("GetLastValidNavmeshPoint", entity:GetLastValidNavmeshPoint()) 
	self:DrawWindowCName("GetResolvedGenderName", entity:GetResolvedGenderName())
	BradenMenu.IGE.DisplayVector4("GetVelocity", entity:GetVelocity()) 
	BradenMenu.IGE.ObjectToText("HasCPOMissionData" , entity:HasCPOMissionData())
	BradenMenu.IGE.ObjectToText("HasCrowdStaticLOD" , entity:HasCrowdStaticLOD())
	BradenMenu.IGE.ObjectToText("IsLooted" , entity:IsLooted())
	BradenMenu.IGE.ObjectToText("WasLootGenerated" , entity:WasLootGenerated())
	BradenMenu.IGE.ObjectToText("IsPlayerAround", entity:IsPlayerAround())
	BradenMenu.IGE.ObjectToText("GetICELevel", entity:GetICELevel())
	BradenMenu.IGE.ObjectToText("GetPingDuration", entity:GetPingDuration())

	ImGui.Unindent()
end

function Inspector.DrawEditGamePuppet(self, entity)
	ImGui.Indent()
	if ImGui.Button("SetForcedVisible") then Game.GetAnimationSystem():SetForcedVisible(entity:GetEntityID(), true) end
	if ImGui.Button("CacheLootForDroping") then entity:CacheLootForDroping() end
	if ImGui.Button("DropWeapons") then entity:DropWeapons() end
	if ImGui.Button("DropAmmo") then entity:DropAmmo() end
	if ImGui.Button("DropLootBag") then entity:DropLootBag() end
	if ImGui.Button("GenerateLoot") then entity:GenerateLoot() end
	if ImGui.Button("SendAIDeathSignal") then entity:SendAIDeathSignal() end
	--if ImGui.Button("SetIsDead") then entity:GetPuppetPS():SetIsDead(true) end
	if ImGui.Button("SetAttitudeGroup hostile") then entity:GetAttitude():SetAttitudeGroup("hostile") end
	if ImGui.Button("SetAttitudeGroup civilian") then entity:GetAttitude():SetAttitudeGroup("civilian") end
	if ImGui.Button("SetAttitudeGroup neutral") then entity:GetAttitude():SetAttitudeGroup("neutral") end
	if ImGui.Button("SetAttitudeGroup player") then entity:GetAttitude():SetAttitudeGroup("player") end
	if ImGui.Button("Toggle Move Policies") then entity:GetMovePolicesComponent():Toggle(not entity:GetMovePolicesComponent():IsEnabled()) end
	--if ImGui.Button("Toggle Dismemberment") then entity:GetDismembermentComponent():Toggle(not entity:GetDismembermentComponent():IsEnabled()) end
	ImGui.Unindent()
end