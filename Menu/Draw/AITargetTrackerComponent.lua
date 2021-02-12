function Inspector.DrawAITargetTrackerComponent(self, AITargetTrackerComponent)
	ImGui.Indent()

	self:ObjectToText("ToString", AITargetTrackerComponent:ToString())

	self:DisplayObjectArray("GetThreats", "AITrackedLocation", AITargetTrackerComponent:GetThreats(false),
		function(key, value) 
			if self:TextToTreeNode("GetThreats - AITrackedLocation - " .. key) then 
				ImGui.Indent()
				self:DrawAITrackedLocation(value)
				ImGui.Unindent()
				ImGui.Unindent()
			end
		end
	)

	self:DisplayObjectArray("GetHostileThreats", "AITrackedLocation", AITargetTrackerComponent:GetHostileThreats(false),
		function(key, value) 
			if self:TextToTreeNode("GetHostileThreats - AITrackedLocation - " .. key) then 
				ImGui.Indent()
				self:DrawAITrackedLocation(value)
				ImGui.Unindent()
				ImGui.Unindent()
			end
		end
	)

	local bool, atTargetComp = AITargetTrackerComponent:GetTopHostileThreat(false)
	if atTargetComp ~= nil then 
		self:DrawAITrackedLocation(atTargetComp)
	else
		self:ObjectToText("GetTopHostileThreat", atTargetComp)
	end

	ImGui.Unindent()
end