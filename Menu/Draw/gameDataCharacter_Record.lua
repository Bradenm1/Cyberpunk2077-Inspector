function Inspector.DrawgameDataCharacter_Record(self, gamedataCharacter_Record)
	ImGui.Indent()

	-- Functions	
	self:ObjectToText("CpoCharacterBuild", gamedataCharacter_Record:CpoCharacterBuild())
	self:ObjectToText("DevNotes", gamedataCharacter_Record:DevNotes())
	self:ObjectToText("GetOnSpawnGLPsCount", gamedataCharacter_Record:GetOnSpawnGLPsCount())
	self:ObjectToText("GetGendersCount", gamedataCharacter_Record:GetGendersCount())
	self:ObjectToText("GetAbilitiesCount", gamedataCharacter_Record:GetAbilitiesCount())
	self:ObjectToText("Items", gamedataCharacter_Record:Items())
	self:ObjectToText("GetItemsCount", gamedataCharacter_Record:GetItemsCount())
	self:ObjectToText("GetCrowdAppearanceNamesCount", gamedataCharacter_Record:GetCrowdAppearanceNamesCount())
	self:ObjectToText("Savable", gamedataCharacter_Record:Savable())
	self:ObjectToText("Level", gamedataCharacter_Record:Level())
	self:ObjectToText("GetObjectActionsCount", gamedataCharacter_Record:GetObjectActionsCount())
	self:DrawWindowCName("SecuritySquad", gamedataCharacter_Record:SecuritySquad())
	--self:DrawWindowCName("GetQuickHackIndicatorSlotName", gamedataCharacter_Record:GetQuickHackIndicatorSlotName())
	self:DrawWindowCName("DisplayName", gamedataCharacter_Record:DisplayName())
	self:DrawWindowCName("LootBagEntity", gamedataCharacter_Record:LootBagEntity())
	self:DrawWindowCName("GlobalSquad", gamedataCharacter_Record:GlobalSquad())
	self:DrawWindowCName("ArchetypeName", gamedataCharacter_Record:ArchetypeName())
	self:DrawWindowCName("AudioResourceName", gamedataCharacter_Record:AudioResourceName())
	self:DrawWindowCName("CommunitySquad", gamedataCharacter_Record:CommunitySquad())
	self:DrawWindowCName("DisplayDescription", gamedataCharacter_Record:DisplayDescription())
	self:DrawWindowCName("AlternativeDisplayName", gamedataCharacter_Record:AlternativeDisplayName())
	self:DrawWindowCName("StateMachineName", gamedataCharacter_Record:StateMachineName())
	self:DrawWindowCName("BaseAttitudeGroup", gamedataCharacter_Record:BaseAttitudeGroup())
	self:DrawWindowCName("AlternativeFullDisplayName", gamedataCharacter_Record:AlternativeFullDisplayName())
	self:DrawWindowCName("AudioMeleeMaterial", gamedataCharacter_Record:AudioMeleeMaterial())
	self:DrawWindowCName("FullDisplayName", gamedataCharacter_Record:FullDisplayName())
	self:DrawWindowCName("CpoClassName", gamedataCharacter_Record:CpoClassName())
	self:DrawWindowCName("VoiceTag", gamedataCharacter_Record:AlternativeFullDisplayName())
	self:DrawWindowCName("PersistentName", gamedataCharacter_Record:PersistentName())
	self:DrawWindowCName("AppearanceName", gamedataCharacter_Record:AppearanceName())

	self:DrawNodeTree("Quest", "DrawWindowgamedataNPCType_Record", gamedataCharacter_Record:Quest(), 
		function(DrawWindowgamedataNPCType_Record) self:DrawgamedataNPCType_Record(DrawWindowgamedataNPCType_Record) end
	)

	self:DrawNodeTree("CharacterType", "DrawWindowgamedataNPCType_Record", gamedataCharacter_Record:CharacterType(), 
		function(DrawWindowgamedataNPCType_Record) self:DrawgamedataNPCType_Record(DrawWindowgamedataNPCType_Record) end
	)

	self:DisplayObjectArray("ObjectActions", "gamedataObjectAction_Record", gamedataCharacter_Record:ObjectActions(),
		function(key, value) self:DrawWindowCName("ActionName", value:ActionName())end
	)

	self:DisplayObjectArray("Abilities", "gamedataGameplayAbility_Record", gamedataCharacter_Record:Abilities(),
		function(key, value) self:DrawWindowCName("ActionName", value:Loc_key_name())end
	)

	self:DisplayObjectArray("Tags", "CName", gamedataCharacter_Record:Tags(),
		function(key, value) self:DrawWindowCName("Tag", value)end
	)

	self:DisplayObjectArray("VisualTags", "CName", gamedataCharacter_Record:VisualTags(),
		function(key, value) self:DrawWindowCName("Tag", value)end
	)

	self:DisplayObjectArray("CrowdAppearanceNames", "CName", gamedataCharacter_Record:CrowdAppearanceNames(),
		function(key, value) self:DrawWindowCName("Tag", value)end
	)

	ImGui.Unindent()
end