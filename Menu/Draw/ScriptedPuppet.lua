local ScriptedPuppet = {}

function ScriptedPuppet:Draw(entity)
	ImGui.Indent()

	ImGui.Unindent()
end

function ScriptedPuppet:DrawEdit(entity)
	ImGui.Indent()
	if ImGui.Button("RevokeAllTickets") then entity:RevokeAllTickets() end
	if ImGui.Button("ResolveQualityRangeInteractionLayer") then entity:ResolveQualityRangeInteractionLayer() end
	if ImGui.Button("RemoveListeners") then entity:RemoveListeners() end
	if ImGui.Button("RegisterSubCharacter") then entity:RegisterSubCharacter() end
	if ImGui.Button("RefreshCachedReactionPresetData") then entity:RefreshCachedReactionPresetData() end
	if ImGui.Button("ProcessEnemyNetrunnerTutorialFact") then entity:ProcessEnemyNetrunnerTutorialFact() end
	if ImGui.Button("RemoveLink") then entity:RemoveLink() end
	if ImGui.Button("StartOxygenDecay") then entity:StartOxygenDecay() end
	if ImGui.Button("PlayerAttachedCallback") then Game.GetPlayer():PlayerAttachedCallback(entity) end
	if ImGui.Button("CanRevealRemoteActionsWheel") then entity:CanRevealRemoteActionsWheel() end
	if ImGui.Button("AwardsExperience") then entity:AwardsExperience() end
	ImGui.Unindent()
end

return ScriptedPuppet