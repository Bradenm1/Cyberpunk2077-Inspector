function Inspector.DrawmovePoliciesComponent(self, movePoliciesComponent)
	ImGui.Indent()

	-- Functons
	BradenMenu.IGE.DisplayVector4("GetDestination", movePoliciesComponent:GetDestination())
	BradenMenu.IGE.ObjectToText("GetDistanceToDestination", movePoliciesComponent:GetDistanceToDestination())
	BradenMenu.IGE.ObjectToText("GetInclineAngle", movePoliciesComponent:GetInclineAngle())
	BradenMenu.IGE.ObjectToText("IsPathfindingFailed", movePoliciesComponent:IsPathfindingFailed())
	BradenMenu.IGE.ObjectToText("IsConstrainedByRestrictedArea", movePoliciesComponent:IsConstrainedByRestrictedArea())
	BradenMenu.IGE.ObjectToText("HasLineOfSightFailed", movePoliciesComponent:HasLineOfSightFailed())
	BradenMenu.IGE.ObjectToText("IsInIdle", movePoliciesComponent:IsInIdle())
	BradenMenu.IGE.ObjectToText("IsOnOffMeshLink", movePoliciesComponent:IsOnOffMeshLink())
	BradenMenu.IGE.ObjectToText("IsOnStairs", movePoliciesComponent:IsOnStairs())
	BradenMenu.IGE.ObjectToText("GetExplorationOffMeshLinkType", movePoliciesComponent:GetExplorationOffMeshLinkType())
	BradenMenu.IGE.ObjectToText("IsPausedByDynamicCollision", movePoliciesComponent:IsPausedByDynamicCollision())
	BradenMenu.IGE.ObjectToText("IsTopPolicyEvaluated", movePoliciesComponent:IsTopPolicyEvaluated())
	BradenMenu.IGE.ObjectToText("IsDestinationCalculated", movePoliciesComponent:IsDestinationCalculated())
	BradenMenu.IGE.ObjectToText("IsDestinationChanged", movePoliciesComponent:IsDestinationChanged())
	self:DrawWindowCName("GetName", movePoliciesComponent:GetName())
	BradenMenu.IGE.ObjectToText("IsEnabled", movePoliciesComponent:IsEnabled())

	ImGui.Unindent()
end