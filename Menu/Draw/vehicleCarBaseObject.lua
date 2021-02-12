function Inspector.DrawvehicleCarBaseObject(self, fixedPoint)
	ImGui.Indent()

	ImGui.Unindent()
end

function Inspector.DrawEditvehicleCarBaseObject(self, fixedPoint)
	ImGui.Indent()
    if ImGui.Button("ToggleOn") then entity:TurnOn(not entity:IsTurnedOn()) end
    if ImGui.Button("ToggleEngineOn") then entity:TurnEngineOn(not entity:IsEngineTurnedOn()) end
    if ImGui.Button("DetachAllParts") then entity:DetachAllParts() end
    if ImGui.Button("DestructionResetGrid") then entity:DestructionResetGrid() end
    if ImGui.Button("DestructionResetGlass") then entity:DestructionResetGlass() end
    if ImGui.Button("ResetTimesSentReactionEvent") then entity:ResetTimesSentReactionEvent() end
    if ImGui.Button("ResetReactionSequenceOfAllPassengers") then entity:ResetReactionSequenceOfAllPassengers() end
    if ImGui.Button("RestoreRevealState") then entity:RestoreRevealState() end
	ImGui.Unindent()
end