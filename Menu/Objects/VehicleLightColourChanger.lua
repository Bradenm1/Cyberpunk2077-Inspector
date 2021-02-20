VehicleLightColourChanger = {}

function VehicleLightColourChanger:new(entity)
	local o = {} 

	-- All inspectors share these vars
	o.Entity = entity
	o.ValueSpeed = 1
	o.LightStrength = 5
	o.SelectedVehicleELightType = 5
	o.DoAllLights = false
	o.Colour = NewObject('Color')
	o.Colour.Red = 1
	o.Colour.Green = 0
	o.Colour.Blue = 255
	o.Colour.Alpha = 1

	self.__index = self
   	return setmetatable(o, self)
end

function VehicleLightColourChanger:Draw()
	-- Return if positions are frozen
    ImGui.Text("Vehicle Light Colour Changer")

	local value, pressed = ImGui.Checkbox("Do All Lights", self.DoAllLights)
	if pressed then
		self.DoAllLights = value
	end

	local current_item, clicked = ImGui.Combo("Light Type", self.SelectedVehicleELightType - 1, BradenMenu.VehicleELightType, #BradenMenu.VehicleELightType)
	if clicked then
		self.SelectedVehicleELightType = current_item + 1
		self:SetLights()
	end

	local value, used = ImGui.DragInt("Value Changed Speed", self.ValueSpeed, 0.01, 0, 255)
	if used then 
		self.ValueSpeed = value
	end

	local value, used = ImGui.DragInt("Light Strength", self.LightStrength, self.ValueSpeed)
	if used then 
		self.LightStrength = value
		self:SetLights()
	end

	local value, used = ImGui.DragInt("Red", self.Colour.Red, self.ValueSpeed, 0, 255)
	if used then 
		self.Colour.Red = value
		self:SetLights()
	end

	local value, used = ImGui.DragInt("Green", self.Colour.Green, self.ValueSpeed, 0, 255)
	if used then 
		self.Colour.Green = value
		self:SetLights()
	end

	local value, used = ImGui.DragInt("Blue", self.Colour.Blue, self.ValueSpeed, 0, 255)
	if used then 
		self.Colour.Blue = value
		self:SetLights()
	end

	local value, used = ImGui.DragInt("Alpha", self.Colour.Alpha, self.ValueSpeed, 0, 255)
	if used then 
		self.Colour.Alpha = value
		self:SetLights()
	end
end

function VehicleLightColourChanger:SetLights() 
	local vehController = self.Entity:GetController()
	if vehController == nil then return end

	if self.DoAllLights then 
		for i, name in pairs(BradenMenu.VehicleELightType) do
			vehController:SetLightColor(i, self.Colour, 0) 
			vehController:SetLightStrength(i, self.LightStrength, 0)
		end
	else
		vehController:SetLightColor(self.SelectedVehicleELightType, self.Colour, 0) 
		vehController:SetLightStrength(self.SelectedVehicleELightType, self.LightStrength, 0)
	end
end


return VehicleLightColourChanger