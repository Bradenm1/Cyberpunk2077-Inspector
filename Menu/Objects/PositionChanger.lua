PositionChanger = {}

function PositionChanger:new(entity)
	local o = {} 

	-- All inspectors share these vars
	o.Entity = entity
	o.ValueSpeed = 0.01

	o.FreezePosition = false

	o.WorldPosition = Vector4.new(0,0,0,0)
	o.EulerAngles = EulerAngles.new(0,0,0)
	self.__index = self
   	return setmetatable(o, self)
end

function PositionChanger:RunAlways()
	if self.Entity == nil then self.FreezePosition = false return end
	if self.FreezePosition then self:SetPosition() end
end

function PositionChanger:SetData() 
	self.WorldPosition = self.Entity:GetWorldPosition()
	local angles = GetSingleton('Quaternion'):ToEulerAngles(self.Entity:GetWorldOrientation())
	self.EulerAngles = EulerAngles.new(angles.pitch, angles.yaw, angles.roll)
end

function PositionChanger:DrawPositionChanger()
	if self.FreezePosition == false then 
		self:SetData()
	end

	-- Return if positions are frozen
    ImGui.Text("World Position Adjuster")
	value, pressed = ImGui.Checkbox("Freeze Position", self.FreezePosition)
	if pressed then self.FreezePosition = value end

	local value, used = ImGui.DragFloat("Value Changed Speed", self.ValueSpeed, 0.01)
	if used then 
		self.ValueSpeed = value
	end

	local value, used = ImGui.DragFloat("X", self.WorldPosition.x, self.ValueSpeed)
	if used then 
		self.WorldPosition.x = value
		self:SetPosition()
	end

	local value, used = ImGui.DragFloat("Y", self.WorldPosition.y, self.ValueSpeed)
	if used then 
		self.WorldPosition.y = value
		self:SetPosition()
	end

	local value, used = ImGui.DragFloat("Z", self.WorldPosition.z, self.ValueSpeed)
	if used then 
		self.WorldPosition.z = value
		self:SetPosition()
	end

	ImGui.Text("World Rotation Adjuster")
	local value, used = ImGui.DragFloat("Pitch", self.EulerAngles.pitch, self.ValueSpeed)
	if used then 
		self.EulerAngles.pitch = value
		self:SetPosition()
	end

	local value, used = ImGui.DragFloat("Yaw", self.EulerAngles.yaw, self.ValueSpeed)
	if used then 
		self.EulerAngles.yaw = value
		self:SetPosition()
	end

	local value, used = ImGui.DragFloat("roll", self.EulerAngles.roll, self.ValueSpeed)
	if used then 
		self.EulerAngles.roll = value
		self:SetPosition()
	end
end

function PositionChanger:SetPosition()
	GetSingleton('gameTeleportationFacility'):Teleport(self.Entity, self.WorldPosition, self.EulerAngles)
end

return PositionChanger