function Inspector.DrawvehicleCarBaseObject(self, entity)
	ImGui.Indent()

	ImGui.Unindent()
end

function Inspector.DrawEditvehicleCarBaseObject(self, entity)
    ImGui.Indent()
    local vehController = entity:GetController()
    if ImGui.Button("Lights") then vehController:SetLightStrength(1, 10000000, 1) end
    if ImGui.Button("ToggleOn") then entity:TurnOn(not entity:IsTurnedOn()) end
    if ImGui.Button("ToggleEngineOn") then entity:TurnEngineOn(not entity:IsEngineTurnedOn()) end
    if ImGui.Button("DetachAllParts") then entity:DetachAllParts() end
    if ImGui.Button("DestructionResetGrid") then entity:DestructionResetGrid() end
    if ImGui.Button("DestructionResetGlass") then entity:DestructionResetGlass() end
    if ImGui.Button("ResetTimesSentReactionEvent") then entity:ResetTimesSentReactionEvent() end
    if ImGui.Button("ResetReactionSequenceOfAllPassengers") then entity:ResetReactionSequenceOfAllPassengers() end
    if ImGui.Button("RestoreRevealState") then entity:RestoreRevealState() end

    -- GetVehiclePS
    local vehiclePS = entity:GetVehiclePS()
    if ImGui.Button("OpenAllVehDoors") then vehiclePS:OpenAllVehDoors() end
    if ImGui.Button("OpenAllRegularVehDoors") then vehiclePS:OpenAllRegularVehDoors() end
    if ImGui.Button("CloseAllVehDoors") then vehiclePS:CloseAllVehDoors() end
    if ImGui.Button("LockAllVehDoors") then vehiclePS:LockAllVehDoors() end
    if ImGui.Button("UnlockAllVehDoors") then vehiclePS:UnlockAllVehDoors() end
    if ImGui.Button("OpenAllVehWindows") then vehiclePS:OpenAllVehWindows() end
    if ImGui.Button("CloseAllVehWindows") then vehiclePS:CloseAllVehWindows() end
    if ImGui.Button("DisableAllVehInteractions") then vehiclePS:DisableAllVehInteractions() end
    if ImGui.Button("ResetVehicleInteractionState") then vehiclePS:ResetVehicleInteractionState() end
    if ImGui.Button("ResetVehicle") then vehiclePS:ResetVehicle() end
    if ImGui.Button("QuestLockAllVehDoors") then vehiclePS:QuestLockAllVehDoors() end

    ImGui.Unindent()
end