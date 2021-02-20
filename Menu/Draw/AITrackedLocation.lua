local AITrackedLocation = {}

function AITrackedLocation:Draw(AITrackedLocation)
	ImGui.Indent()

	-- Properties
	BradenMenu.IGE.DrawNodeTree("lastKown", "AILocationInformation", AITrackedLocation.lastKown,
		function(lastKown) BradenMenu.AILocationInformation:Draw(lastKown) end
	)

	BradenMenu.IGE.DrawNodeTree("location", "AILocationInformation", AITrackedLocation.location,
		function(location) BradenMenu.AILocationInformation:Draw(location) end
	)

	BradenMenu.IGE.DrawNodeTree("sharedLocation", "AILocationInformation", AITrackedLocation.sharedLocation,
		function(sharedLocation) BradenMenu.AILocationInformation:Draw(sharedLocation) end
	)

	BradenMenu.IGE.DrawNodeTree("sharedLastKnown", "AILocationInformation", AITrackedLocation.sharedLastKnown,
		function(sharedLastKnown) BradenMenu.AILocationInformation:Draw(sharedLastKnown) end
	)

	BradenMenu.IGE.DrawNodeTree("entity", "entEntity", AITrackedLocation.entity,
		function(entity) self:DrawWindowEntityInspecterViewHasEntity(entity) end
	)

	BradenMenu.IGE.ObjectToText("accuracy", AITrackedLocation.accuracy)
	BradenMenu.IGE.ObjectToText("sharedAccuracy", AITrackedLocation.sharedAccuracy)
	BradenMenu.IGE.ObjectToText("sharedTimeDelay", AITrackedLocation.sharedTimeDelay)
	BradenMenu.IGE.ObjectToText("threat", AITrackedLocation.threat)
	BradenMenu.IGE.DisplayVector4("speed", AITrackedLocation.speed)
	BradenMenu.IGE.ObjectToText("visible", AITrackedLocation.visible)
	BradenMenu.IGE.ObjectToText("invaildExpection", AITrackedLocation.invaildExpection)
	BradenMenu.IGE.ObjectToText("status", AITrackedLocation.status)

	ImGui.Unindent()
end

return AITrackedLocation