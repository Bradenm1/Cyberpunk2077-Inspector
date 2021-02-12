function Inspector.DrawmovePoliciesComponent(self, movePoliciesComponent)
	ImGui.Indent()

	-- Functons
	self:DisplayVector4("GetDestination", movePoliciesComponent:GetDestination())
	self:ObjectToText("GetDistanceToDestination", movePoliciesComponent:GetDistanceToDestination())
	self:ObjectToText("GetInclineAngle", movePoliciesComponent:GetInclineAngle())
	self:ObjectToText("IsPathfindingFailed", movePoliciesComponent:IsPathfindingFailed())
	self:ObjectToText("IsConstrainedByRestrictedArea", movePoliciesComponent:IsConstrainedByRestrictedArea())
	self:ObjectToText("HasLineOfSightFailed", movePoliciesComponent:HasLineOfSightFailed())
	self:ObjectToText("IsInIdle", movePoliciesComponent:IsInIdle())
	self:ObjectToText("IsOnOffMeshLink", movePoliciesComponent:IsOnOffMeshLink())
	self:ObjectToText("IsOnStairs", movePoliciesComponent:IsOnStairs())
	self:ObjectToText("GetExplorationOffMeshLinkType", movePoliciesComponent:GetExplorationOffMeshLinkType())
	self:ObjectToText("IsPausedByDynamicCollision", movePoliciesComponent:IsPausedByDynamicCollision())
	self:ObjectToText("IsTopPolicyEvaluated", movePoliciesComponent:IsTopPolicyEvaluated())
	self:ObjectToText("IsDestinationCalculated", movePoliciesComponent:IsDestinationCalculated())
	self:ObjectToText("IsDestinationChanged", movePoliciesComponent:IsDestinationChanged())
	self:DrawWindowCName("GetName", movePoliciesComponent:GetName())
	self:ObjectToText("IsEnabled", movePoliciesComponent:IsEnabled())

	ImGui.Unindent()
end