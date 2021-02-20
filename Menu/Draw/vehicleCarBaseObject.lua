local vehicleCarBaseObject = {}

function vehicleCarBaseObject:Draw(entity)
	ImGui.Indent()

	ImGui.Unindent()
end

function vehicleCarBaseObject:DrawEdit(entity)
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

    ImGui.Text("GetVehiclePS")
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

    ImGui.Text("GetVehicleComponent")
    local vehicleComp = entity:GetVehicleComponent()
    if ImGui.Button("PlaySummonArrivalSFX") then vehicleComp:PlaySummonArrivalSFX() end
    if ImGui.Button("HonkAndFlash") then vehicleComp:HonkAndFlash() end
    if ImGui.Button("SetupAuxillary") then vehicleComp:SetupAuxillary() end
    if ImGui.Button("SetupWheels") then vehicleComp:SetupWheels() end
    if ImGui.Button("TryToKnockDownBike") then vehicleComp:TryToKnockDownBike() end
    if ImGui.Button("DestroyVehicle") then vehicleComp:DestroyVehicle() end
    if ImGui.Button("RepairVehicle") then vehicleComp:RepairVehicle() end
    if ImGui.Button("DisableRadio") then vehicleComp:DisableRadio() end
    if ImGui.Button("DestroyRandomWindow") then vehicleComp:DestroyRandomWindow() end
    if ImGui.Button("TutorialCarDamageFact") then vehicleComp:TutorialCarDamageFact() end
    if ImGui.Button("PlayCrystalDomeGlitchEffect") then vehicleComp:PlayCrystalDomeGlitchEffect() end
    if ImGui.Button("CreateMappin") then vehicleComp:CreateMappin() end
    if ImGui.Button("DestroyMappin") then vehicleComp:DestroyMappin() end
    if ImGui.Button("CleanUpRace") then vehicleComp:CleanUpRace() end
    if ImGui.Button("InitialVehcileSetup") then vehicleComp:InitialVehcileSetup() end
    if ImGui.Button("VehicleDefaultStateSetup") then vehicleComp:VehicleDefaultStateSetup() end
    if ImGui.Button("VehicleVisualDestructionSetup") then vehicleComp:VehicleVisualDestructionSetup() end
    if ImGui.Button("EvaluateInteractions") then vehicleComp:EvaluateInteractions() end
    if ImGui.Button("ToggleInitialVehDoorInteractions") then vehicleComp:ToggleInitialVehDoorInteractions() end
    if ImGui.Button("EvaluateTrunkAndHoodInteractions") then vehicleComp:EvaluateTrunkAndHoodInteractions() end
    if ImGui.Button("EvaluateTrunkInteractions") then vehicleComp:EvaluateTrunkInteractions() end
    if ImGui.Button("EvaluateHoodInteractions") then vehicleComp:EvaluateHoodInteractions() end
    if ImGui.Button("EvaluateDoorState") then vehicleComp:EvaluateDoorState() end
    if ImGui.Button("LoadExplodedState") then vehicleComp:LoadExplodedState() end
    if ImGui.Button("SetupThrusterFX") then vehicleComp:SetupThrusterFX() end
    if ImGui.Button("EnableTargetingComponents") then vehicleComp:EnableTargetingComponents() end
    if ImGui.Button("DisableTargetingComponents") then vehicleComp:DisableTargetingComponents() end
    if ImGui.Button("BroadcastEnvironmentalHazardStimuli") then vehicleComp:BroadcastEnvironmentalHazardStimuli() end
    if ImGui.Button("RemoveEnvironmentalHazardStimuli") then vehicleComp:RemoveEnvironmentalHazardStimuli() end
    if ImGui.Button("EvaluatePanzerInteractions") then vehicleComp:EvaluatePanzerInteractions() end
    if ImGui.Button("SetImmortalityMode") then vehicleComp:SetImmortalityMode() end
    if ImGui.Button("ClearImmortalityMode") then vehicleComp:ClearImmortalityMode() end
    if ImGui.Button("StealVehicle") then vehicleComp:StealVehicle() end
    if ImGui.Button("SetupCrystalDome") then vehicleComp:SetupCrystalDome() end
    if ImGui.Button("UnmountTrunkBody") then vehicleComp:UnmountTrunkBody() end

    ImGui.Unindent()
end

return vehicleCarBaseObject