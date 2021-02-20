local gameDataCharacter_Record = {}

function gameDataCharacter_Record:Draw(gamedataCharacter_Record)
	ImGui.Indent()

	-- Functions	
	BradenMenu.IGE.ObjectToText("CpoCharacterBuild", gamedataCharacter_Record:CpoCharacterBuild())
	BradenMenu.IGE.ObjectToText("DevNotes", gamedataCharacter_Record:DevNotes())
	BradenMenu.IGE.ObjectToText("GetOnSpawnGLPsCount", gamedataCharacter_Record:GetOnSpawnGLPsCount())
	BradenMenu.IGE.ObjectToText("GetGendersCount", gamedataCharacter_Record:GetGendersCount())
	BradenMenu.IGE.ObjectToText("GetAbilitiesCount", gamedataCharacter_Record:GetAbilitiesCount())
	BradenMenu.IGE.ObjectToText("Items", gamedataCharacter_Record:Items())
	BradenMenu.IGE.ObjectToText("GetItemsCount", gamedataCharacter_Record:GetItemsCount())
	BradenMenu.IGE.ObjectToText("GetCrowdAppearanceNamesCount", gamedataCharacter_Record:GetCrowdAppearanceNamesCount())
	BradenMenu.IGE.ObjectToText("Savable", gamedataCharacter_Record:Savable())
	BradenMenu.IGE.ObjectToText("Level", gamedataCharacter_Record:Level())
	BradenMenu.IGE.ObjectToText("GetObjectActionsCount", gamedataCharacter_Record:GetObjectActionsCount())
	BradenMenu.CName:Draw("SecuritySquad", gamedataCharacter_Record:SecuritySquad())
	--BradenMenu.CName:Draw("GetQuickHackIndicatorSlotName", gamedataCharacter_Record:GetQuickHackIndicatorSlotName())
	BradenMenu.CName:Draw("DisplayName", gamedataCharacter_Record:DisplayName())
	BradenMenu.CName:Draw("LootBagEntity", gamedataCharacter_Record:LootBagEntity())
	BradenMenu.CName:Draw("GlobalSquad", gamedataCharacter_Record:GlobalSquad())
	BradenMenu.CName:Draw("ArchetypeName", gamedataCharacter_Record:ArchetypeName())
	BradenMenu.CName:Draw("AudioResourceName", gamedataCharacter_Record:AudioResourceName())
	BradenMenu.CName:Draw("CommunitySquad", gamedataCharacter_Record:CommunitySquad())
	BradenMenu.CName:Draw("DisplayDescription", gamedataCharacter_Record:DisplayDescription())
	BradenMenu.CName:Draw("AlternativeDisplayName", gamedataCharacter_Record:AlternativeDisplayName())
	BradenMenu.CName:Draw("StateMachineName", gamedataCharacter_Record:StateMachineName())
	BradenMenu.CName:Draw("BaseAttitudeGroup", gamedataCharacter_Record:BaseAttitudeGroup())
	BradenMenu.CName:Draw("AlternativeFullDisplayName", gamedataCharacter_Record:AlternativeFullDisplayName())
	BradenMenu.CName:Draw("AudioMeleeMaterial", gamedataCharacter_Record:AudioMeleeMaterial())
	BradenMenu.CName:Draw("FullDisplayName", gamedataCharacter_Record:FullDisplayName())
	BradenMenu.CName:Draw("CpoClassName", gamedataCharacter_Record:CpoClassName())
	BradenMenu.CName:Draw("VoiceTag", gamedataCharacter_Record:AlternativeFullDisplayName())
	BradenMenu.CName:Draw("PersistentName", gamedataCharacter_Record:PersistentName())
	BradenMenu.CName:Draw("AppearanceName", gamedataCharacter_Record:AppearanceName())

	BradenMenu.IGE.DrawNodeTree("Quest", "DrawWindowgamedataNPCType_Record", gamedataCharacter_Record:Quest(), 
		function(DrawWindowgamedataNPCType_Record) BradenMenu.gamedataNPCType_Record:Draw(DrawWindowgamedataNPCType_Record) end
	)

	BradenMenu.IGE.DrawNodeTree("CharacterType", "DrawWindowgamedataNPCType_Record", gamedataCharacter_Record:CharacterType(), 
		function(DrawWindowgamedataNPCType_Record) BradenMenu.gamedataNPCType_Record:Draw(DrawWindowgamedataNPCType_Record) end
	)

	BradenMenu.IGE.DisplayObjectArray("ObjectActions", "gamedataObjectAction_Record", gamedataCharacter_Record:ObjectActions(),
		function(key, value) BradenMenu.CName:Draw("ActionName", value:ActionName())end
	)

	BradenMenu.IGE.DisplayObjectArray("Abilities", "gamedataGameplayAbility_Record", gamedataCharacter_Record:Abilities(),
		function(key, value) BradenMenu.CName:Draw("ActionName", value:Loc_key_name())end
	)

	BradenMenu.IGE.DisplayObjectArray("Tags", "CName", gamedataCharacter_Record:Tags(),
		function(key, value) BradenMenu.CName:Draw("Tag", value)end
	)

	BradenMenu.IGE.DisplayObjectArray("VisualTags", "CName", gamedataCharacter_Record:VisualTags(),
		function(key, value) BradenMenu.CName:Draw("Tag", value)end
	)

	BradenMenu.IGE.DisplayObjectArray("CrowdAppearanceNames", "CName", gamedataCharacter_Record:CrowdAppearanceNames(),
		function(key, value) BradenMenu.CName:Draw("Tag", value)end
	)

	ImGui.Unindent()
end

return gameDataCharacter_Record