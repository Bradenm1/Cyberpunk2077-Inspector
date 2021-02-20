local AITargetTrackerComponent = {}

function AITargetTrackerComponent:Draw(AITargetTrackerComponent)
	ImGui.Indent()

	BradenMenu.IGE.ObjectToText("ToString", AITargetTrackerComponent:ToString())

	BradenMenu.IGE.DisplayObjectArray("GetThreats", "AITrackedLocation", AITargetTrackerComponent:GetThreats(false),
		function(key, value) 
			if BradenMenu.IGE.TextToTreeNode("GetThreats - AITrackedLocation - " .. key) then 
				ImGui.Indent()
				BradenMenu.AITrackedLocation:Draw(value)
				ImGui.Unindent()
				ImGui.Unindent()
			end
		end
	)

	BradenMenu.IGE.DisplayObjectArray("GetHostileThreats", "AITrackedLocation", AITargetTrackerComponent:GetHostileThreats(false),
		function(key, value) 
			if BradenMenu.IGE.TextToTreeNode("GetHostileThreats - AITrackedLocation - " .. key) then 
				ImGui.Indent()
				BradenMenu.AITrackedLocation:Draw(value)
				ImGui.Unindent()
				ImGui.Unindent()
			end
		end
	)

	local bool, atTargetComp = AITargetTrackerComponent:GetTopHostileThreat(false)
	if atTargetComp ~= nil then 
		BradenMenu.AITrackedLocation:Draw(atTargetComp)
	else
		BradenMenu.IGE.ObjectToText("GetTopHostileThreat", atTargetComp)
	end

	ImGui.Unindent()
end

return AITargetTrackerComponent