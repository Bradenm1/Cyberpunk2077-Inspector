-- The global game functions, simple buttons
function BradenMenu.DrawGlobalGameFunctionButtons(self)

	--[[if (ImGui.CollapsingHeader("Player")) then
		ImGui.Spacing()
		self.Inspector:drawPositionChanger(Game.GetPlayer())
		ImGui.EndTabItem()
	end
	if (ImGui.CollapsingHeader("Game Functions")) then
		ImGui.Spacing()
		ImGui.Indent()]]
		if ImGui.Button("Game.ForcedNPCDeath()") then Game.ForcedNPCDeath() end
		if ImGui.Button("Game.awacstest()") then Game.awacstest() end
		if ImGui.Button("Game.BreachNearestAP()") then Game.BreachNearestAP() end
		if ImGui.Button("Game.BreakEffectLoop()") then Game.BreakEffectLoop() end
		if ImGui.Button("Game.CGLP()") then Game.CGLP() end
		if ImGui.Button("Game.ChangeArea()") then Game.ChangeArea() end
		if ImGui.Button("Game.ChangeZoneIndicatorDanger()") then Game.ChangeZoneIndicatorDanger() end
		if ImGui.Button("Game.ChangeZoneIndicatorPublic()") then Game.ChangeZoneIndicatorPublic() end
		if ImGui.Button("Game.ChangeZoneIndicatorRestricted()") then Game.ChangeZoneIndicatorRestricted() end
		if ImGui.Button("Game.ChangeZoneIndicatorSafe()") then Game.ChangeZoneIndicatorSafe() end
		if ImGui.Button("Game.CheatExposeNPCQuickHacks()") then Game.CheatExposeNPCQuickHacks() end
		if ImGui.Button("Game.CLS_off()") then Game.CLS_off() end
		if ImGui.Button("Game.CLS_on()") then Game.CLS_on() end
		if ImGui.Button("Game.CLS_reset()") then Game.CLS_reset() end
		if ImGui.Button("Game.DbgBraindanceIsActive()") then Game.DbgBraindanceIsActive() end
		if ImGui.Button("Game.DbgBraindanceIsPaused()") then Game.DbgBraindanceIsPaused() end
		if ImGui.Button("Game.DbgBraindancePlayDirection()") then Game.DbgBraindancePlayDirection() end
		if ImGui.Button("Game.DbgBraindancePlaySpeed()") then Game.DbgBraindancePlaySpeed() end
		if ImGui.Button("Game.DbgBraindanceProgress()") then Game.DbgBraindanceProgress() end
		if ImGui.Button("Game.DbgBraindanceTimeInSec()") then Game.DbgBraindanceTimeInSec() end
		if ImGui.Button("Game.debug_AddLog()") then Game.debug_AddLog() end
		if ImGui.Button("Game.Debug_WeaponSpread_RandomCircular()") then Game.Debug_WeaponSpread_RandomCircular() end
		if ImGui.Button("Game.Debug_WeaponSpread_RandomGrid()") then Game.Debug_WeaponSpread_RandomGrid() end
		if ImGui.Button("Game.debug_AddLog()") then Game.debug_AddLog() end
		if ImGui.Button("Game.DecreaseGlobalTimeDilation()") then Game.DecreaseGlobalTimeDilation() end
		if ImGui.Button("Game.DecreasePlayerTimeDilation()") then Game.DecreasePlayerTimeDilation() end
		if ImGui.Button("Game.IncreaseGlobalTimeDilation()") then Game.IncreaseGlobalTimeDilation() end
		if ImGui.Button("Game.IncreasePlayerTimeDilation()") then Game.IncreasePlayerTimeDilation() end
		if ImGui.Button("Game.DemolitionUp()") then Game.DemolitionUp() end
		if ImGui.Button("Game.DespawnFlathead()") then Game.DespawnFlathead() end
		if ImGui.Button("Game.EnableAllPlayerVehicles()") then Game.EnableAllPlayerVehicles() end
		if ImGui.Button("Game.EnterBD()") then Game.EnterBD() end
		if ImGui.Button("Game.LeaveBD()") then Game.LeaveBD() end
		if ImGui.Button("Game.gebs()") then Game.gebs() end
		if ImGui.Button("Game.GetAllPerks()") then Game.GetAllPerks() end
		if ImGui.Button("Game.God1()") then Game.God1() end
		if ImGui.Button("Game.God2()") then Game.God2() end
		if ImGui.Button("Game.GodClearAll()") then Game.GodClearAll() end
		if ImGui.Button("Game.Hotkeys()") then Game.Hotkeys() end
		if ImGui.Button("Game.HotkeysNOW()") then Game.HotkeysNOW() end
		if ImGui.Button("Game.Kill()") then Game.Kill() end
		if ImGui.Button("Game.KillAll()") then Game.KillAll("1000") end
		if ImGui.Button("Game.KillEffect()") then Game.KillEffect() end
		if ImGui.Button("Game.LevelUp()") then Game.LevelUp() end
		if ImGui.Button("Game.mwtest()") then Game.mwtest() end
		if ImGui.Button("Game.NetrunnerTesting()") then Game.NetrunnerTesting() end
		if ImGui.Button("Game.Noslowmo()") then Game.Noslowmo() end
		if ImGui.Button("Game.PlayerSD()") then Game.PlayerSD() end
		if ImGui.Button("Game.PrevSys_active()") then Game.PrevSys_active() end
		if ImGui.Button("Game.PrevSys_off()") then Game.PrevSys_off() end
		if ImGui.Button("Game.PrevSys_on()") then Game.PrevSys_on() end
		if ImGui.Button("Game.PrevSys_safe()") then Game.PrevSys_safe() end
		if ImGui.Button("Game.Rev()") then Game.Rev() end
		if ImGui.Button("Game.SetActionContext()") then Game.SetActionContext() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.SetBreathingAll()") then Game.SetBreathingAll() end
		if ImGui.Button("Game.SetBreathingHeavy()") then Game.SetBreathingHeavy() end
		if ImGui.Button("Game.SetBreathingJohnny()") then Game.SetBreathingJohnny() end
		if ImGui.Button("Game.SetBreathingLow()") then Game.SetBreathingLow() end
		if ImGui.Button("Game.SetBreathingOff()") then Game.SetBreathingOff() end
		if ImGui.Button("Game.SetBreathingSick()") then Game.SetBreathingSick() end
		if ImGui.Button("Game.SetRpgContext()") then Game.SetRpgContext() end
		if ImGui.Button("Game.Slowmo()") then Game.Slowmo() end
		if ImGui.Button("Game.SM()") then Game.SM() end
		if ImGui.Button("Game.SpawnFlathead()") then Game.SpawnFlathead() end
		if ImGui.Button("Game.SpawnTestEffect()") then Game.SpawnTestEffect() end
		if ImGui.Button("Game.StreetCredUp()") then Game.StreetCredUp() end
		if ImGui.Button("Game.SwapItemPart()") then Game.SwapItemPart() end
		if ImGui.Button("Game.t1()") then Game.t1() end
		if ImGui.Button("Game.t2()") then Game.t2() end
		if ImGui.Button("Game.TestDrop()") then Game.TestDrop() end
		if ImGui.Button("Game.TestCustomQuestNotification()") then Game.TestCustomQuestNotification() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.cset()") then Game.cset() end
		if ImGui.Button("Game.ClearEquipment()") then Game.ClearEquipment() end
		--ImGui.Unindent()
	--end
end