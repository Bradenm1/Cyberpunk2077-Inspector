{
	name: worldNavigationScriptInterface,
	functions: {
		CalculatePath(startPoint: Vector4, endPoint: Vector4, agentSize: NavGenAgentSize, findPointTolerance: Float, costModCircle: handle:worldNavigationScriptCostModCircle) => (handle:worldNavigationScriptPath),
		AddObstacle(position: Vector4, radius: Float, height: Float, agentSize: NavGenAgentSize) => (handle:worldNavigationScriptObstacle),
		RemoveObstacle(obstacle: handle:worldNavigationScriptObstacle),
		FindWallInLine(startPoint: Vector4, endPoint: Vector4, agentSize: NavGenAgentSize, findPointTolerance: Float) => (handle:worldNavigationScriptFindWallResult),
		FindPointInSphere(center: Vector4, radius: Float, agentSize: NavGenAgentSize, heightDetail: Bool) => (worldNavigationScriptFindPointResult),
		FindPointInBox(center: Vector4, extents: Vector4, agentSize: NavGenAgentSize, heightDetail: Bool) => (worldNavigationScriptFindPointResult),
		FindPursuitPoint(pos: Vector4, dir: Vector4, radius: Float, navVisCheck: Bool, agentSize: NavGenAgentSize) => (Bool, destination: Vector4),
		FindPursuitPointRange(pos: Vector4, dir: Vector4, radiusMin: Float, radiusMax: Float, navVisCheck: Bool, agentSize: NavGenAgentSize) => (Bool, destination: Vector4),
		FindPursuitPointsRange(pos: Vector4, dir: Vector4, radiusMin: Float, radiusMax: Float, count: Int32, navVisCheck: Bool, agentSize: NavGenAgentSize) => (Bool, results: array:Vector4),
		FindNavmeshPointAwayFromReferencePoint(pos: Vector4, refPos: Vector4, distance: Float, agentSize: NavGenAgentSize, distanceTolerance: Float, angleTolerance: Float) => (Bool, destination: Vector4),
		IsPointOnNavmesh(point: Vector4, tolerance: Float) => (Bool),
		IsPointOnNavmesh(point: Vector4, tolerance: Vector4) => (Bool),
		IsPointOnNavmesh(point: Vector4, tolerance: Vector4) => (Bool, navmeshPoint: Vector4),
		GetNearestNavmeshPointBelow(origin: Vector4, querySphereRadius: Float, numberOfSpheres: Int32) => (Vector4),
		GetNearestNavmeshPointBehind(origin: whandle:entEntity, querySphereRadius: Float, numberOfSpheres: Int32, checkPathToOrigin: Bool) => (Bool, point: Vector4),
		GetFurthestNavmeshPointBehind(origin: whandle:entEntity, querySphereRadius: Float, numberOfSpheres: Int32, offsetFromOrigin: Vector4, checkPathToOrigin: Bool, ratioCurveName: CName) => (Bool, point: Vector4),
		TryToFindNavmeshPointAroundPoint(originPosition: Vector4, originOrientation: Quaternion, probeDimensions: Vector4, numberOfSpheres: Int32, sphereDistanceFromOrigin: Float, checkPathToOrigin: Bool) => (Bool, point: Vector4),
		HasPathForward(sourceObject: whandle:gameObject, distance: Float) => (Bool),
		IsOnGround(target: handle:gameObject, queryLength: Float) => (Bool),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
	}
}