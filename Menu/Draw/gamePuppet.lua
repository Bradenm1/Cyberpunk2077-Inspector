local gamePuppet = {}

function gamePuppet:Draw(entity, inspector)
	ImGui.Indent()

	-- Functions
	BradenMenu.IGE.ObjectToText("CanRagdoll" , entity:CanRagdoll())
	BradenMenu.IGE.ObjectToText("GetTweakDBDisplayName", entity:GetTweakDBDisplayName(false))
	BradenMenu.IGE.ObjectToText("GetTweakDBFullDisplayName", entity:GetTweakDBFullDisplayName(false))
	--[[BradenMenu.IGE.ObjectToText("GetTweakDBDisplayName FallBack", entity:GetTweakDBDisplayName(true))
	BradenMenu.IGE.ObjectToText("GetTweakDBFullDisplayName FallBack", entity:GetTweakDBFullDisplayName(true))]]
	BradenMenu.IGE.DrawNodeTree("GetAttitude", "gameAttitudeAgent", entity:GetAttitude(), 
		function(gameAttitudeAgent) BradenMenu.gameAttitudeAgent:Draw(gameAttitudeAgent) end
	)

	BradenMenu.IGE.DrawNodeTree("GetRecord", "gameDataCharacter_Record", entity:GetRecord(), 
		function(gameDataCharacter_Record) BradenMenu.gameDataCharacter_Record:Draw(gameDataCharacter_Record) end
	)

	BradenMenu.IGE.DrawNodeTree("GetMovePolicesComponent", "movePoliciesComponent", entity:GetMovePolicesComponent(), 
		function(movePoliciesComponent) BradenMenu.movePoliciesComponent:Draw(movePoliciesComponent) end
	)

	local someBool, objects = entity:GetCurrentlyEquippedItems()
	BradenMenu.IGE.DisplayObjectArray("GetCurrentlyEquippedItems", "gameItemObject", objects,
		function(key, value) BradenMenu.gameItemObject:Draw("gameItemObject", value)end
	)

	BradenMenu.IGE.DrawNodeTree("GetAnimationControllerComponent", "entAnimationControllerComponent", entity:GetAnimationControllerComponent(), 
		function(entAnimationControllerComponent)  BradenMenu.entAnimationControllerComponent:Draw(entAnimationControllerComponent) end
	)

	BradenMenu.CName:Draw("GetGender", entity:GetGender())
	BradenMenu.CName:Draw("GetBodyType", entity:GetBodyType())
	BradenMenu.IGE.DisplayVector4("GetLastValidNavmeshPoint", entity:GetLastValidNavmeshPoint()) 
	BradenMenu.CName:Draw("GetResolvedGenderName", entity:GetResolvedGenderName())
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

function gamePuppet:DrawEdit(entity, inspector)
	ImGui.Indent()
	if ImGui.Button("SetForcedVisible") then Game.GetAnimationSystem():SetForcedVisible(entity:GetEntityID(), true) end
	if ImGui.Button("CacheLootForDroping") then entity:CacheLootForDroping() end
	if ImGui.Button("DropWeapons") then entity:DropWeapons() end
	if ImGui.Button("DropAmmo") then entity:DropAmmo() end
	if ImGui.Button("DropLootBag") then entity:DropLootBag() end
	if ImGui.Button("GenerateLoot") then entity:GenerateLoot() end
	if ImGui.Button("SendAIDeathSignal") then entity:SendAIDeathSignal() end
	if ImGui.Button("Pop Head") then entity:GetDismembermentComponent():DoDismemberment(1, 1, 0, true, "", 0) end

	ImGui.Text("Some of these won't work. It just won't change if it fails...")
	local current_item, clicked = ImGui.Combo("SetAttitudeGroup", inspector.SelectedAttitudeGroup - 1, BradenMenu.AttitudeGroups, #BradenMenu.AttitudeGroups)
	if clicked then
		local lastSelected = inspector.SelectedAttitudeGroup
		inspector.SelectedAttitudeGroup = current_item + 1
		local selected = BradenMenu.SE.BMFirstToLower(BradenMenu.AttitudeGroups[inspector.SelectedAttitudeGroup])
		entity:GetAttitude():SetAttitudeGroup(selected)

		-- Test if it changed worked
		if Game.NameToString(entity:GetAttitude():GetAttitudeGroup()) ~= selected then
			entity:GetAttitude():SetAttitudeGroup(BradenMenu.SE.BMFirstToLower(BradenMenu.AttitudeGroups[lastSelected]))
			inspector.SelectedAttitudeGroup = lastSelected
		end
	end

	local current_item, clicked = ImGui.Combo("SetReactionPreset", inspector.SelectedReactionPreset - 1, BradenMenu.ReactionPresets, #BradenMenu.ReactionPresets)
	if clicked then
		if entity.reactionComponent == nil then
			entity.reactionComponent = NewObject('ReactionManagerComponent')
		end
		local gamedataTweakDBInterface = GetSingleton("gamedataTweakDBInterface")
		inspector.SelectedReactionPreset = current_item + 1
		local selected = (BradenMenu.ReactionPresets[inspector.SelectedReactionPreset])
		entity.reactionComponent:SetReactionPreset(gamedataTweakDBInterface:GetReactionPresetRecord(TweakDBID.new(selected)))
		--entity.reactionComponent:SetBaseReactionPreset(true)
		--entity.reactionComponent:ReevaluateReactionPreset(true)
	end

	if ImGui.Button("Toggle Move Policies") then entity:GetMovePolicesComponent():Toggle(not entity:GetMovePolicesComponent():IsEnabled()) end
	--if ImGui.Button("Toggle Dismemberment") then entity:GetDismembermentComponent():Toggle(not entity:GetDismembermentComponent():IsEnabled()) end
	ImGui.Unindent()
end

return gamePuppet