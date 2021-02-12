function Inspector.DrawAITrackedLocation(self, AITrackedLocation)
	ImGui.Indent()

	-- Properties
	self:DrawNodeTree("lastKown", "AILocationInformation", AITrackedLocation.lastKown,
		function(lastKown) self:DrawAILocationInformation(lastKown) end
	)

	self:DrawNodeTree("location", "AILocationInformation", AITrackedLocation.location,
		function(location) self:DrawAILocationInformation(location) end
	)

	self:DrawNodeTree("sharedLocation", "AILocationInformation", AITrackedLocation.sharedLocation,
		function(sharedLocation) self:DrawAILocationInformation(sharedLocation) end
	)

	self:DrawNodeTree("sharedLastKnown", "AILocationInformation", AITrackedLocation.sharedLastKnown,
		function(sharedLastKnown) self:DrawAILocationInformation(sharedLastKnown) end
	)

	self:DrawNodeTree("entity", "entEntity", AITrackedLocation.entity,
		function(entity) self:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	self:ObjectToText("accuracy", AITrackedLocation.accuracy)
	self:ObjectToText("sharedAccuracy", AITrackedLocation.sharedAccuracy)
	self:ObjectToText("sharedTimeDelay", AITrackedLocation.sharedTimeDelay)
	self:ObjectToText("threat", AITrackedLocation.threat)
	self:DisplayVector4("speed", AITrackedLocation.speed)
	self:ObjectToText("visible", AITrackedLocation.visible)
	self:ObjectToText("invaildExpection", AITrackedLocation.invaildExpection)
	self:ObjectToText("status", AITrackedLocation.status)

	ImGui.Unindent()
end
